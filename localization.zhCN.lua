local _, addonTable = ...;

if GetLocale() == "zhCN" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "看起来很好吃！"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "真是太满足了！"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "向大厨致敬"
    addonTable.locStrTable[addonTable.strKey_title] = "说什么..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "进食时："
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "吃饱时："
    addonTable.locStrTable[addonTable.strKey_save] = "保存"
    addonTable.locStrTable[addonTable.strKey_revert] = "还原"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "进食"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "进食充分"
end