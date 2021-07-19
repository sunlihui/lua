---
--- Created by sunlihui.
--- DateTime: 2021/7/14 12:06
---

--[[
Lua里的语句包括：赋值语句，分支语句，循环语句
Lua语句的格式非常自由，不强制要求缩进。语句末尾可以使用";"表示结束，但不是必需的，实际编写代码时通常都忽略

1 语句块
使用 "do...end" 的形式就声明了一个语句（代码）块，里面可以包含任意多条语句，相当于 c/java里的花括号复合语句，例如：
--]]

do
    local x = 10        -- 一个局部变量。仅本块内有效
    print("x= ", x)     -- 输出变量的值
end

-- 注意：在语句块里声明的 local 变量仅在语句块内有效

--[[
2 赋值语句
lua 使用 "=" 在变量里存储一个确定类型的值。
lua 还允许使用逗号分隔，在一个语句里声明或赋值多个变量，这是个非常便利的特性
--]]

local data,err
local a,b = 1,'lua'
local x,y =a,b,'not_used'
local m,n = "only this"
print(a,b,x,y,m,n)


-- 3 分支语句
if x then
    print("x is not nil")
else
    print("x is nil")
end


-- 多重分支需要使用 "elseif"
--[[
if conditions then
    ...
elseif conditions then
    ...
else
    ...
end
--]]

--[[
4 循环语句
lua语言的循环语句有 while、repeat-until、for 三种
4.1 while
while conditions do  --循环语句开始，条件成立时执行循环体
    ...              --执行循环体
end                  --循环结束

4.2 repeat-until
repeat-until循环与while 条件判断完全相反，当条件成立时退出循环，形式是：

repeat              --循环开始
    ...             --执行语句
until conditions    -- 循环结束，条件成立时退出循环体

4.3 for
Lua的for循环语句有两种形式：数值循环和范围循环，这里先介绍前者

for var=m,n,step do     -- for循环语句开始
    ...                 -- 执行语句
end                     -- 循环结束
语句的含义是：变量var 从 m 前进（或后退）到 n，执行循环体里的语句，参数step是用于控制 var 前进或后退的步长，可以省略，默认是1
for循环里的变量 var 会自动声明为局部变量（虽然没有local 关键字），而且仅在for语句有效，例如：
--]]
print("")
print("4.3 for例子：")
for i=1,5 do
    print("for: ", i)
end
assert(not i)   -- for里的i是局部变量，循环外自动失效

print("步长为2")
for i=1,10,2 do
    print("for ： ",i)
end

--[[
5 break/return
在while、repeat-until 和for 循环语句里可以用 break 或者 return 直接跳出循环，用法与其他语言相同，但必须在语句块的最后--也就是后面
紧跟 end/until 关键字。
--]]
print("break return 列子：")
for i=10,1,-1 do
    if i<7 then
        print("countdown ok")
        break
    end
end

--补充
-- lua语言不提供其他语言常用的 continue，但openresty使用的 LuaJIT扩展支持goto，可以变通实现 continue，将在后面介绍