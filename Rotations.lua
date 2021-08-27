--[[
todo:
custom rotations & LAM
add more skills & classes
show queue
gcd tracker on an icon like https://www.esoui.com/downloads/info2627-GlobalCooldownMonitor.html
show key more evidently
]]

Rotations = Rotations or {}
Rotations.name = "Rotations"
Rotations.AbilityTimers = {}
Rotations.AbilityKeyMap = {}
Rotations.AbilityBars = {}

Rotations.AdditionalSkillDurations = {
    --	barbed trap (reapply every 16 sec due to 2 sec arming)
    [40382] = 16,
}

function Rotations.OnUpdate(self, time)
	--todo rework
	local activeBar = GetActiveWeaponPairInfo()
	for i = 3, 7 do
		local abilityId = GetSlotBoundId(i)
		Rotations.AbilityKeyMap[abilityId] = i - 2
		Rotations.AbilityTimers[abilityId] = Rotations.AbilityTimers[abilityId] or 0
		Rotations.AbilityBars[abilityId] = activeBar
	end
	
	Rotations.ActivePlayerBuffs = {}
    local numberOfPlayerBuffs = GetNumBuffs("player")
    for i = 0, numberOfPlayerBuffs do
        local buffName, _, _, _, stackCount, _, _, _, _, _, abilityId, _ = GetUnitBuffInfo("player", i)
        if abilityId == 61920 then
            --Merciless Resolve stack
            if stackCount >= 4 then
				Rotations.ActivePlayerBuffs[abilityId] = true
            end
        else
            Rotations.ActivePlayerBuffs[abilityId] = true
        end
    end
	
	--merciless resolve proc
	if Rotations.ActivePlayerBuffs[61920] == nil then
		Rotations.AbilityTimers[61930] = nil
	else
		Rotations.AbilityTimers[61930] = 0
	end

	local abilityIdToCastNext = -1
	for k, v in pairs(Rotations.Target) do
		if (Rotations.AbilityTimers[v] ~= nil) and (Rotations.AbilityTimers[v] < time) and Rotations.ShouldCastThisAbility(v) then
			abilityIdToCastNext = v
			break
		end
	end
	
	--no dots left to cast
	if abilityIdToCastNext == -1 then
		for k, v in pairs(Rotations.Spammables) do
			if Rotations.ShouldCastThisAbility(v) then
				abilityIdToCastNext = v
				break
			end
		end
	end
	
	local abilityToCastIsOnDifferentBar = Rotations.AbilityBars[abilityIdToCastNext] ~= activeBar
	RotationsQueueControlKey:SetText(Rotations.AbilityKeyMap[abilityIdToCastNext])
	RotationsQueueControlAlert:SetTexture(GetAbilityIcon(abilityIdToCastNext))
	RotationsQueueControlBarSwap:SetAlpha(abilityToCastIsOnDifferentBar and 0.75 or 0)
end

function Rotations.ShouldCastThisAbility(abilityId)
	local hpPercentToDropAbility = Rotations.SkillsToDropAtHpPercent[abilityId]
	if hpPercentToDropAbility == nil then
		return true
	end
	local currentEnemyHealth, maxEnemyHealth, _ = GetUnitPower("reticleover", POWERTYPE_HEALTH)
	return hpPercentToDropAbility < (currentEnemyHealth / maxEnemyHealth)
end

function Rotations.OnActionSlotAbilityUsed(eventCode, slotNum)
    if (slotNum == 1) or (slotNum == 2) then
        return
    end
    local abilityId = GetSlotBoundId(slotNum)
    local duration = GetAbilityDuration(abilityId) / 1000
    if Rotations.AdditionalSkillDurations[abilityId] ~= nil then
        duration = Rotations.AdditionalSkillDurations[abilityId]
    end
    Rotations.AbilityTimers[abilityId] = (GetGameTimeMilliseconds() / 1000) + duration
end

function Rotations:Initialize()
    EVENT_MANAGER:RegisterForEvent(self.name, EVENT_ACTION_SLOT_ABILITY_USED, self.OnActionSlotAbilityUsed)
    EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_ADD_ON_LOADED)
end

function Rotations.OnAddOnLoaded(_, addonName)
    if addonName == Rotations.name then
        Rotations:Initialize()
    end
end

EVENT_MANAGER:RegisterForEvent(Rotations.name, EVENT_ADD_ON_LOADED, Rotations.OnAddOnLoaded)
