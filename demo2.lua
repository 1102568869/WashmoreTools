-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大值函数 table_maxn
local ex = require("modules/extension");

-- 两表相加操作
mytable = ex.addmeta({ 1, 2, 3 }, "__add");
--mytable = setmetatable({ 1, 2, 3 }, {
--    __add = function(mytable, newtable)
--        for i = 1, ex.table_maxn(newtable) do
--            table.insert(mytable, ex.table_maxn(mytable) + 1, newtable[i])
--        end
--        return mytable
--    end
--})

secondtable = { 4, 5, 6 }

mytable = mytable + secondtable
for k, v in ipairs(mytable) do
    print(k, v)
end


