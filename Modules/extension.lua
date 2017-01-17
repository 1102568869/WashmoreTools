--
-- Created by IntelliJ IDEA.
-- User: Washmore
-- Date: 2017/1/12
-- Time: 17:15
-- To change this template use File | Settings | File Templates.
--
extension = {}

extension.table_maxn = function(t)
    local mn = 0;
    for k, v in pairs(t) do
        if mn < k then
            mn = k;
        end
    end
    return mn;
end

extension.addmeta = function(_table, _type, _func)
    if (_type == nil) then
        return setmetatable(_table, extension.defaultmeta);
    end

    _metatable = getmetatable(_table);
    if (_metatable == nil) then
        _metatable = {}
    end

    if (type(_type) == "string" and type(_func) == "function") then
        _metatable[_type] = _func;
    else
        _metatable[_type] = extension.defaultmeta[_type];
        if (_metatable[_type] == nil) then
            for k, v in pairs(extension.defaultmeta) do
                if (string.find(k, _type) ~= nil) then
                    _metatable[k] = extension.defaultmeta[k];
                    break;
                end
            end
        end
    end

    return setmetatable(_table, _metatable);
end

extension.defaultmeta = {
    __add = function(mytable, newtable)
        for i = 1, extension.table_maxn(newtable) do
            table.insert(mytable, extension.table_maxn(mytable) + 1, newtable[i])
        end
        return mytable
    end
}

return extension;

--[[
模式	描述
__add	对应的运算符 '+'.
__sub	对应的运算符 '-'.
__mul	对应的运算符 '*'.
__div	对应的运算符 '/'.
__mod	对应的运算符 '%'.
__unm	对应的运算符 '-'.
__concat	对应的运算符 '..'.
__eq	对应的运算符 '=='.
__lt	对应的运算符 '<'.
__le	对应的运算符 '<='.
]]
