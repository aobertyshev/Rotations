Rotations = Rotations or {}
Rotations.name = "Rotations"
Rotations.Timers = {}

Rotations.AdditionalSkillDurations = {
    --	concealed weapon
    [25267] = 0,

    --	barbed trap (reapply every 16 sec due to 2 sec arming)
    [40382] = 16,

    --siphoning attacks
    --[36935] = 55,
}

function Rotations.OnUpdate(self, time)
	--todo rework
	for i = 3, 7 do
		local abilityId = GetSlotBoundId(i)
		if Rotations.Timers[abilityId] == nil then
			Rotations.Timers[abilityId] = 0
		end
	end
	local abilityToCastNext = -1
	for k, v in pairs(Rotations.Target) do
		if Rotations.Timers[v] ~= nil and Rotations.Timers[v] < time then
			abilityToCastNext = v
			break
		end
	end
	RotationsQueueControlAlert:SetTexture(GetAbilityIcon(abilityToCastNext))
end

function Rotations.GetCorrectSkillSlot(slotNum)
    return (GetActiveWeaponPairInfo() == 2) and (slotNum + 5) or slotNum
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
    Rotations.Timers[abilityId] = (GetGameTimeMilliseconds() / 1000) + duration
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
