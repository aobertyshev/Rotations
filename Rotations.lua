Rotations = Rotations or {}
Rotations.name = "Rotations"

function Rotations.OnUpdate(self, time)

end

function Rotations:Initialize()
    EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_ADD_ON_LOADED)
end

function Rotations.OnAddOnLoaded(_, addonName)
    if addonName == Rotations.name then
        Rotations:Initialize()
    end
end

EVENT_MANAGER:RegisterForEvent(Rotations.name, EVENT_ADD_ON_LOADED, Rotations.OnAddOnLoaded)
