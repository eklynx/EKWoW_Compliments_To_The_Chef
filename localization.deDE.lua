local _, addonTable = ...;

if GetLocale() == "deDE" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "Das sieht köstlich aus!"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "Das hat fantastisch geschmeckt!"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "Komplimente an den Koch"
    addonTable.locStrTable[addonTable.strKey_title] = "Was man sagt..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "beim Essen:"
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "wenn man satt ist:"
    addonTable.locStrTable[addonTable.strKey_save] = "Speichern"
    addonTable.locStrTable[addonTable.strKey_revert] = "Zurücksetzen"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "Essen"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "Satt"
end