local _, addonTable = ...;

if GetLocale() == "esES" or GetLocale() == "esMX" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "¡Eso se ve delicioso!"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "¡Qué bien me ha sentado!" -- ?

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "Felicitaciones al Chef"
    addonTable.locStrTable[addonTable.strKey_title] = "Qué decir..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "Al comer:"
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "Al estar bien alimentado:"
    addonTable.locStrTable[addonTable.strKey_save] = "Guardar"
    addonTable.locStrTable[addonTable.strKey_revert] = "Revertir"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "Comida"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "Bien alimentado"
end