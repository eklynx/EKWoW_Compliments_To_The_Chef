local _, addonTable = ...;

if GetLocale() == "ruRU" then
    -- Default Values
    addonTable.locStrTable[addonTable.strKey_defaultEating] = "Выглядит аппетитно!"
    addonTable.locStrTable[addonTable.strKey_defaultWellFed] = "Пальчики оближешь!"

    -- Settings screen
    addonTable.locStrTable[addonTable.strKey_addonName] = "Комплименты шеф-повару"
    addonTable.locStrTable[addonTable.strKey_title] = "Что сказать..."
    addonTable.locStrTable[addonTable.strKey_labelEating] = "Во время еды:"
    addonTable.locStrTable[addonTable.strKey_labelWellFed] = "Когда наелся:"
    addonTable.locStrTable[addonTable.strKey_save] = "Сохранить"
    addonTable.locStrTable[addonTable.strKey_revert] = "Отменить"

    -- Spell names
    addonTable.locStrTable[addonTable.strKey_spellNameEating] = "Еда"
    addonTable.locStrTable[addonTable.strKey_spellNameWellFed] = "Сытость"
end