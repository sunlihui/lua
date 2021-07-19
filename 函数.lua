---
--- Created by sunlihui.
--- DateTime: 2021/7/16 17:29
---

--[[
1、定义函数
定义函数需要使用关键字function，形式是：

[local] function func_name(arguments)   -- 定义一个函数
    ...                                 -- 函数体，有多个语句
end

这种形式实际上是函数变量声明的简化形式，相当于：
[local] func_name = function(arguments)  -- 定义一个函数
    ...                                  -- 函数体，有多个语句
end
--]]
-- 2、参数和返回值
-- print[[string]]

local function f1(a)
    a = 'sliver'
    print("var is ",a)
end

-- f1{1,2,3}               -- 参数是列表，调用时候忽略了"()"
local x = 'golden'
f1(x,'heart')
assert(x == 'golden', "x被修改了") -- 外部变量没有被修改；补充：实例中assert首先检查第一个参数，若没问题，assert不做任何事情；否则，assert以第二个参数作为错误信息抛出。

local function f2(a,b,c)
    print(a .. (b or '') .. (c or '') )
end

f2('crzay','Dimamod')

local function f3(a,b)
    return a+b, a*b
end

--local x, y = f3(10,20)  -- 使用赋值语句接受返回的多个结果
print(f3(1,2))