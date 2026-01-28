-- ## Forward Variable declarations
local wellFedBox
local eatingBox

-- #### Helpers
-- Function to load settings into the UI
local function LoadSettings()
    eatingBox:SetText(chefText_Eating or "NIL")
	wellFedBox:SetText(chefText_Fed or "NIL")
--    activeCheckbox:SetChecked(MyAddonDB.active or false)
end


-- #### UI 

-- Create the settings panel
local SettingsPanel = CreateFrame("Frame", "Compliments to the Chef", UIParent)
SettingsPanel.name = "Compliments to the Chef"

-- Title
local title = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("What to Say:")

-- Eating label
local eatingLabel = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
eatingLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -20)
eatingLabel:SetText("Eating...")

-- Eating text box
eatingBox = CreateFrame("EditBox", "CttCEatingBox", SettingsPanel, "InputBoxTemplate")
eatingBox:SetSize(500, 20)
eatingBox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 90, -15)
eatingBox:SetAutoFocus(false)
eatingBox:SetMaxLetters(250)

-- Well Fed label
local wellFedLabel = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
wellFedLabel:SetPoint("TOPLEFT", eatingLabel, "BOTTOMLEFT", 0, -20)
wellFedLabel:SetText("Well Fed...")

-- Well Fed text box
wellFedBox = CreateFrame("EditBox", "CttCWellFedBox", SettingsPanel, "InputBoxTemplate")
wellFedBox:SetSize(500, 20)
wellFedBox:SetPoint("TOPLEFT", eatingLabel, "BOTTOMLEFT", 90, -15)
wellFedBox:SetAutoFocus(false)
wellFedBox:SetMaxLetters(820)


---- Active checkbox
--local activeCheckbox = CreateFrame("CheckButton", "MyAddonActiveCheckbox", SettingsPanel, "UICheckButtonTemplate")
--activeCheckbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -20)
--activeCheckbox.text = activeCheckbox:CreateFontString(nil, "ARTWORK", "GameFontNormal")
--activeCheckbox.text:SetPoint("LEFT", activeCheckbox, "RIGHT", 5, 0)
--activeCheckbox.text:SetText("Active")


-- Save button
local saveButton = CreateFrame("Button", nil, SettingsPanel, "UIPanelButtonTemplate")
saveButton:SetSize(100, 22)
saveButton:SetPoint("TOPLEFT", wellFedLabel, "BOTTOMLEFT", 0, -20)
saveButton:SetText("Save")
saveButton:SetScript("OnClick", function()
    -- Save the values (you'll need to implement your own SavedVariables)
    chefText_Eating = eatingBox:GetText()
    chefText_Fed = wellFedBox:GetText()
    print("CttC: Settings saved!")
end)


-- Revert button
local revertButton = CreateFrame("Button", nil, SettingsPanel, "UIPanelButtonTemplate")
revertButton:SetSize(100, 22)
revertButton:SetPoint("LEFT", saveButton, "RIGHT", 10, 0)
revertButton:SetText("Revert")
revertButton:SetScript("OnClick", function()
    LoadSettings()
    print("CttC: Settings reverted!")
end)


-- Load saved settings when panel is shown
SettingsPanel:SetScript("OnShow", LoadSettings)

-- Register the panel with the Interface Options
if Settings and Settings.RegisterCanvasLayoutCategory then
    -- Dragonflight and later
    local category = Settings.RegisterCanvasLayoutCategory(SettingsPanel, SettingsPanel.name)
    Settings.RegisterAddOnCategory(category)
else
    -- Classic and earlier expansions
    InterfaceOptions_AddCategory(SettingsPanel)
end



