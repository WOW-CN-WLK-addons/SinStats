local AddName, Ns = ...
local L = Ns.L

---------------------
-- Options Equates --
---------------------
local Both, Heroism, Valor, StoneKeeper, Marks, Honor, Arena = 3, 1, 2, 1, 2, 1, 2

-- Money
function Ns.FunctionList.Money(HUD, data, options, ...)

	local money = GetMoney()
	local formattedMoney = (GetCoinTextureString(money))

	HUD:UpdateText(data, formattedMoney)
end
------------------------------------------------

-- WoW Token
function Ns.FunctionList.WowToken(HUD, data, options, ...)

	C_WowTokenPublic.UpdateMarketPrice()
	local token = C_WowTokenPublic.GetCurrentMarketPrice() or 0
	token = floor(token / 10000)
	token = BreakUpLargeNumbers(token)

	if options.Display_Short then
		token = C_WowTokenPublic.GetCurrentMarketPrice() or 0
		token = floor(token / 10000)
		token = Ns.ShortNumbers(token, 1)
	end

	local formattedToken = token .. "|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0|t"

	HUD:UpdateText(data, formattedToken)
end
------------------------------------------------

-- Emblem of Frost
function Ns.FunctionList.FrostEmblem(HUD, data, options, ...)

	local frost = GetCurrencyInfo(341).quantity

	HUD:UpdateText(data, frost)
end
------------------------------------------------

-- Defiler's Scourgestone
function Ns.FunctionList.ScourgeStone(HUD, data, options, ...)

	local stone = GetCurrencyInfo(2711).quantity

	HUD:UpdateText(data, stone)
end
------------------------------------------------

-- Primordial Saronite
function Ns.FunctionList.Saronite(HUD, data, options, ...)

	local countTotal = GetItemCount(49908, true)

	HUD:UpdateText(data, (countTotal))
end
------------------------------------------------

-- Heroism & Valor
function Ns.FunctionList.Emblems(HUD, data, options, ...)

	local EB = options.Heroism_Valor
	local heroism = GetCurrencyInfo(101).quantity
	local valor = GetCurrencyInfo(102).quantity
	local returnText

	if Ns.Band(EB, Heroism) then returnText = heroism end
	if Ns.Band(EB, Valor) then returnText = valor end
	if Ns.Band(EB, Both) then returnText = heroism .. "/" .. valor end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- Sidereal Essence
function Ns.FunctionList.Sidereal(HUD, data, options, ...)

	local sidereal  =  GetCurrencyInfo(2589).quantity

	HUD:UpdateText(data, sidereal)
end
------------------------------------------------

-- Emblem of Triumph
function Ns.FunctionList.Triumph(HUD, data, options, ...)

	local triumph = GetCurrencyInfo(301).quantity

	HUD:UpdateText(data, triumph)
end
------------------------------------------------

-- Emblem of Conquest
function Ns.FunctionList.Conquest(HUD, data, options, ...)

	local conquest = GetCurrencyInfo(221).quantity

	HUD:UpdateText(data, conquest)
end
------------------------------------------------

-- Wintergrasp currency
function Ns.FunctionList.StoneShard(HUD, data, options, ...)

	local EB = options.Shards_Marks
	local shards = GetCurrencyInfo(161).quantity
	local marks = GetCurrencyInfo(126).quantity
	local returnText

	if Ns.Band(EB, StoneKeeper) then returnText = shards end
	if Ns.Band(EB, Marks) then returnText = marks end
	if Ns.Band(EB, Both) then returnText = shards .. "/" .. marks end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------

-- PvP Points
function Ns.FunctionList.PvP(HUD, data, options, ...)

	local EB = options.Honor_Arena
	local honor = GetCurrencyInfo(1901).quantity
	local arena = GetCurrencyInfo(103).quantity
	local returnText

	if Ns.Band(EB, Honor) then returnText = honor end
	if Ns.Band(EB, Arena) then returnText = arena end
	if Ns.Band(EB, Both) then returnText = honor .. "/" .. arena end

	HUD:UpdateText(data, returnText)
end
------------------------------------------------