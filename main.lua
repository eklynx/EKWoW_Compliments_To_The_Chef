
-- addon-level variables
local _, addonTable = ...;

-- **** Constants ****

if not chefText_Eating then
	chefText_Eating = addonTable.locStrTable[addonTable.strKey_defaultEating]
end 

if not chefText_Fed then
	chefText_Fed = addonTable.locStrTable[addonTable.strKey_defaultWellFed]
end




-- **** Helper Methods ****
local function sayTheThing(message)
	if IsInInstance() then
		SendChatMessage(message, "SAY")
	else
		print(message)
	end -- if IsInInstance
end -- function sayTheTing



-- **** State ****

local wellFedId
local eatingId

local function handleAuraChanged(unit, info)
	if not addonTable or not addonTable.locStrTable then
		return
	end
	local spellName_eating = addonTable.locStrTable[addonTable.strKey_spellNameEating]
	local spellName_well_fed = addonTable.locStrTable[addonTable.strKey_spellNameWellFed]

	if unit == "player" then
		if not InCombatLockdown() and info.addedAuras then
			for _, aura in pairs(info.addedAuras) do
				if canaccessvalue(aura.name) then
					local auraName = aura.name
					if auraName == spellName_eating then
						if chefText_Eating then sayTheThing(chefText_Eating) end
						eatingId = aura.auraInstanceID
						wellFedId = nil
					elseif not wellFedId and eatingId and auraName == spellName_well_fed then
						if chefText_Fed then sayTheThing(chefText_Fed) end
						wellFedId = aura.auraInstanceID
					end -- check aura names
				end -- end canaccessvalue(aura.name)
			end -- for aura in auras
		end -- info addedAuras
		
		if info.updatedAuraInstanceIDs then
			for _, auraId in pairs(info.updatedAuraInstanceIDs) do
				aura = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraId)
				if not InCombatLockdown() and aura and canaccessvalue(aura.name) then 
					if eatingId and aura.name == spellName_well_fed and wellFedId ~= auraId then
						if chefText_Fed then sayTheThing(chefText_Fed) end
						wellFedId = auraId
					end -- check aura names
				end -- end canaccessvalue(aura.name)
			end -- for aura in updatedAuraInstanceIDs
		end -- if info.updatedAuraInstanceIDs
			
		if info.removedAuraInstanceIDs then
			for _, auraId in pairs(info.removedAuraInstanceIDs) do
				if not eatingId and auraId == eatingId then
					wellFedId = nil
					eatingId = nil
				end -- check aura id
			end -- for aura in removedAuraInstanceIDs
		end -- if info.removedAuraInstanceIDs
	end -- if unit == player
end -- handleAuraChanged




local function OnEvent(_, event, unit, info)
  if event == "UNIT_AURA" or event == "PLAYER_ENTERING_WORLD" then
  	handleAuraChanged(unit, info)
  end -- "UNIT_AURA"
end


local name_Frame = "FDT_FRAME"
local frame = CreateFrame( "Frame", name_Frame, UIParent)
frame:Hide()
frame:RegisterEvent("UNIT_AURA")
frame:SetScript("OnEvent", OnEvent)


