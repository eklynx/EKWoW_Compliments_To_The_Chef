local _, addonTable = ...;

if GetLocale() == "zhTW" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "看起來很好吃！"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "真是太滿足了！"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "向大廚致敬"
    addonTable.locStrTable[addonTable.strKey_title] = "說什麼..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "進食時："
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "吃飽時："
    addonTable.locStrTable[addonTable.strKey_save] = "儲存"
    addonTable.locStrTable[addonTable.strKey_revert] = "還原"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "食物"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "充分進食"
end