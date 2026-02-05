
local _, addonTable = ...;

-- Default Values
addonTable.strKey_defaultEating = "That looks tasty!"
addonTable.strKey_defaultWellFed = "That's really hitting the spot!"

-- Settings screen
addonTable.strKey_addonName = "Compliments to the Chef"
addonTable.strKey_title = "What to Say..."
addonTable.strKey_labelEating = "When eating:"
addonTable.strKey_labelWellFed = "When well fed:"
addonTable.strKey_save = "Save"
addonTable.strKey_revert = "Revert"

-- Spell names
addonTable.strKey_spellNameEating = "Food"
addonTable.strKey_spellNameWellFed = "Well Fed"
addonTable.locStrTable = {}


-- taken from https://wowpedia.fandom.com/wiki/Localizing_an_addon
local function defaultFunc(_, key)
 -- If this function was called, we have no localization for this key.
 -- We could complain loudly to allow localizers to see the error of their ways, 
 -- but, for now, just return the key as its own localization. This allows you to 
 -- avoid writing the default localization out explicitly.
 return key;
end

setmetatable(addonTable.locStrTable, {__index=defaultFunc});