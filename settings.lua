-- ## Addon level variables
local _, addonTable = ...;

-- ## Forward Variable declarations
local eatingBox, eatingLabel
local wellFedBox, wellFedLabel



local rightPadding = 16
local minBoxWidth = 200
local padding = 10
local function UpdateLabelLayout()
    local maxWidth = math.max(eatingLabel:GetStringWidth(), wellFedLabel:GetStringWidth())
    local panelWidth = SettingsPanel:GetWidth()

    eatingLabel:SetWidth(maxWidth)
    wellFedLabel:SetWidth(maxWidth)
    eatingLabel:SetJustifyH("RIGHT")
    wellFedLabel:SetJustifyH("RIGHT")

    eatingBox:ClearAllPoints()
    eatingBox:SetPoint("TOPLEFT", eatingLabel, "TOPRIGHT", padding, 5)

    wellFedBox:ClearAllPoints()
    wellFedBox:SetPoint("TOPLEFT", wellFedLabel, "TOPRIGHT", padding, 5)

    if panelWidth and panelWidth > 0 then
        local panelLeft = SettingsPanel:GetLeft() or 0
        local labelLeft = eatingLabel:GetLeft() or (panelLeft + 16)
        local leftInset = labelLeft - panelLeft
        local availableWidth = panelWidth - leftInset - maxWidth - padding - rightPadding

        if availableWidth < minBoxWidth then
            availableWidth = minBoxWidth
        end

        eatingBox:SetWidth(availableWidth)
        wellFedBox:SetWidth(availableWidth)
    end
end


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
SettingsPanel.name = addonTable.locStrTable[addonTable.strKey_addonName]

-- Title
local title = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(addonTable.locStrTable[addonTable.strKey_title])

-- Eating label
eatingLabel = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
eatingLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -20)
eatingLabel:SetText(addonTable.locStrTable[addonTable.strKey_labelEating])

-- Eating text box
eatingBox = CreateFrame("EditBox", "CttCEatingBox", SettingsPanel, "InputBoxTemplate")
eatingBox:SetSize(500, 20)
eatingBox:SetAutoFocus(false)
eatingBox:SetMaxLetters(250)

-- Well Fed label
wellFedLabel = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
wellFedLabel:SetPoint("TOPLEFT", eatingLabel, "BOTTOMLEFT", 0, -20)
wellFedLabel:SetText(addonTable.locStrTable[addonTable.strKey_labelWellFed])

-- Well Fed text box
wellFedBox = CreateFrame("EditBox", "CttCWellFedBox", SettingsPanel, "InputBoxTemplate")
wellFedBox:SetSize(500, 20)
wellFedBox:SetAutoFocus(false)
wellFedBox:SetMaxLetters(820)

UpdateLabelLayout()


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
saveButton:SetText(addonTable.locStrTable[addonTable.strKey_save])
saveButton:SetScript("OnClick", function()
    -- Save the values (you'll need to implement your own SavedVariables)
    chefText_Eating = eatingBox:GetText()
    chefText_Fed = wellFedBox:GetText()
    --print("CttC: Settings saved!")
end)


-- Revert button
local revertButton = CreateFrame("Button", nil, SettingsPanel, "UIPanelButtonTemplate")
revertButton:SetSize(100, 22)
revertButton:SetPoint("LEFT", saveButton, "RIGHT", 10, 0)
revertButton:SetText(addonTable.locStrTable[addonTable.strKey_revert])
revertButton:SetScript("OnClick", function()
    LoadSettings()
    --print("CttC: Settings reverted!")
end)



-- Copyright String
local githubLabel = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
githubLabel:SetPoint("BOTTOMRIGHT", 0, 20)
githubLabel:SetText("https://github.com/eklynx/EKWoW_Compliments_To_The_Chef")

local creditsLabel = SettingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
creditsLabel:SetPoint("BOTTOMRIGHT", githubLabel, "TOPRIGHT", 0, 15)
creditsLabel:SetText("'Compliments to the Chef' created by Edgars \"EKLynx\" Klepers. Based on a WeakAura, requested by guild.")


-- Load saved settings when panel is shown
SettingsPanel:SetScript("OnShow", function()
    LoadSettings()
    UpdateLabelLayout(SettingsPanel, eatingLabel, wellFedLabel, eatingBox, wellFedBox)
end)

SettingsPanel:SetScript("OnSizeChanged", function()
    UpdateLabelLayout(SettingsPanel, eatingLabel, wellFedLabel, eatingBox, wellFedBox)
end)

-- Register the panel with the Interface Options
if Settings and Settings.RegisterCanvasLayoutCategory then
    -- Dragonflight and later
    local category = Settings.RegisterCanvasLayoutCategory(SettingsPanel, SettingsPanel.name)
    Settings.RegisterAddOnCategory(category)
else
    -- Classic and earlier expansions
    InterfaceOptions_AddCategory(SettingsPanel)
end
