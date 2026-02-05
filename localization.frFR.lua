local _, addonTable = ...;

if GetLocale() == "frFR" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "Cela a l'air délicieux !"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "C'est délicieux !"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "Compliments au Chef"
    addonTable.locStrTable[addonTable.strKey_title] = "Que dire..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "en mangeant:"
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "quand on est bien nourri:"
    addonTable.locStrTable[addonTable.strKey_save] = "Enregistrer"
    addonTable.locStrTable[addonTable.strKey_revert] = "Annuler"


    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "Nourriture"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "Personnage bien nourri"
end