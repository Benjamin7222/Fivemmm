_Server = {} or {}
_Server.Function = {} or {}
_Server.Function.Locales = Traduction.Locales[KaizoMasques.Utils.Language];
_Server.Function.Distance = 5

_Server.Function.getPos = function(pos)
    for k, v in pairs(KaizoMasques.Position) do
        if (not (v.pos ~= pos)) then
            return true
        end
    end
    return false
end
