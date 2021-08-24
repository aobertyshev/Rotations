--[[local LAM = LibAddonMenu2
local panelName = "RotationsSettingsPanel"
 
local panelData = {
    type = "panel",
    name = "Rotations",
    author = "@helixanon",
}
local optionsData = {
    {
        type = "checkbox",
        name = "Skip dialogues",
        getFunc = function() return QuestSkipper.SavedVariables.SkipDialogues end,
        setFunc = function(value) QuestSkipper.SavedVariables.SkipDialogues = value end
    },
    {
        type = "checkbox",
        name = "Skip stable training",
        getFunc = function() return QuestSkipper.SavedVariables.SkipStableTraining end,
        setFunc = function(value) QuestSkipper.SavedVariables.SkipStableTraining = value end
    },
    {
      type        = "editbox",
      name        = "Riding skills order",
      getFunc     = function() return QuestSkipper.SavedVariables.HorseSkillsOrder end,
      setFunc     = function(value) QuestSkipper.SavedVariables.HorseSkillsOrder = value end,
      isMultiline = true,
      textType    = TEXT_TYPE_ALL,
      width       = "full"
    }
}]]--

Rotations = {}
Rotations.name = "Rotations"

function Rotations:Initialize()
    EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_ADD_ON_LOADED)
    
    --[[LAM:RegisterAddonPanel(panelName, panelData)
    LAM:RegisterOptionControls(panelName, optionsData)]]--
end

function Rotations.OnAddOnLoaded(event, addonName)
    if addonName == Rotations.name then
        Rotations:Initialize()
    end
end

EVENT_MANAGER:RegisterForEvent(Rotations.name, EVENT_ADD_ON_LOADED, Rotations.OnAddOnLoaded)
