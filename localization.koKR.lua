local _, addonTable = ...;

if GetLocale() == "koKR" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "맛있어 보이네요!"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "정말 만족스러워요!"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "요리사에게 칭찬을"
    addonTable.locStrTable[addonTable.strKey_title] = "할 말..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "식사 중:"
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "포만감:"
    addonTable.locStrTable[addonTable.strKey_save] = "저장"
    addonTable.locStrTable[addonTable.strKey_revert] = "되돌리기"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "음식"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "포만감"
end