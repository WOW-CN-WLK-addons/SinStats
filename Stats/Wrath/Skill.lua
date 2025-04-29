local AddName, Ns = ...
local L = Ns.L

local f = CreateFrame("Frame")

f:RegisterEvent("PLAYER_ENTERING_WORLD")

f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        local isInitialLogin, isReloadingUi = ...
        if not isInitialLogin and not isReloadingUi then
            return
        end
        for skillIndex = 1, GetNumSkillLines() do
            local skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier,
            skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType,
            skillDescription = GetSkillLineInfo(skillIndex)
            if ((skillName ~= nil) and (not isHeader) and (skillMaxRank > 1) and (string.find(skillName, _G["LANGUAGE"]) ~= 1)) then
                tinsert(Ns.DefaultOrder, { stat=skillName, events={ CHAT_MSG_SKILL = true, SKILL_LINES_CHANGED = true }, spellclass="Skill", widget={ type="CheckBox" }, options={ Show=true }, subgroup=true, activeonload=true })
                L[skillName.."Menu"] = skillName
                L[skillName.."Abrev"] = skillName
                L[skillName.."Description"] = skillDescription or ""
                Ns.FunctionList[skillName] = function (HUD, data, options, ...)
                    local skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier,
                    skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType,
                    skillDescription = GetSkillLineInfo(skillIndex)
                    local returnText = skillRank.." / "..skillMaxRank
                    HUD:UpdateText(data, returnText)
                end
            end
        end
        Ns:InitialiseProfile(Ns.Profile)
        Ns:CheckForStats(Ns.Profile, Ns.Class)
    end
end)