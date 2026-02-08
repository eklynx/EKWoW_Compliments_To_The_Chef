local _, addonTable = ...;

if GetLocale() == "ptBR" or GetLocale() == "ptPT" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "Isso parece delicioso!"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "Caiu super bem!"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "Elogios ao Chef"
    addonTable.locStrTable[addonTable.strKey_title] = "O que dizer..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "Ao comer:"
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "Quando bem alimentado:"
    addonTable.locStrTable[addonTable.strKey_save] = "Salvar"
    addonTable.locStrTable[addonTable.strKey_revert] = "Reverter"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "Comida"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "Bem Alimentado"
end