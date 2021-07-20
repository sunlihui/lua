#!/usr/bin/lua

--算术运算
--取模运算使用“% ”，幂运算使用“^ ”
print(1+1,",",5-3)
print(2*4,",",1/3)
print(5%2,",",3^3)
--lua不提供 a++ 类似这样的递增和递减操作符（可能是“-- ”用来做注释的原因）
count=10
count=count+1

--关系运算
print(3.14>2.1)
print(1/3==  2/6)
print('10' ~= 10) --不等于

--注意，在执行大于或小于比较操作时lua会检查变量的类型，如果类型不同会报错，列如：
--print(1>'0') --类型不一样，直接报错
-- 但 “== ”和“~= ”不一样，，如果类型不一样直接返回false,如上面的3

--实际情况经常遇到比较字符串形式的数字，为了避免意外，必须用函数转换
--
print(1>tonumber('0')) --大于比较
print('10' == 10)
print(tonumber('10')==10)

--逻辑运算
--nil和false认为是假，其他都是真，包括数字0
--x and y,如果x是真，返回y,否则返回x
--x or y,与and操作正好相反，如果x是真，返回x，否则返回y
--not x,只返回true/false,对x取反
print('逻辑运算')
print(0 and 'abc')
print(x or 100)
print(not x)
--利用lua逻辑运算的特性可以实现非常灵活的赋值功能
local x=count or 100
local y=a and b or c

--************************************************************
--字符串运算
--lua对字符串连续操作提供了一个特别的运算符“.. ”
print('字符串运算')
print('hello'..' '..'world') --连接多个字符串
--连接运算还可以自动把数字转换为字符串，无须显示调用tostring()函数：
print("room number is "..123)
--计算字符串长度 
print(#'kevin')
--字符串的比较，基于字符序（列如最常用的ASCII码表）逐个检查，但相等比较是直接计算内部保存的散列值，速度很快
print('a'<'b')
print('zero'>'0')
print('abc' == 'cba')

--注意事项
--在运算时候nil的情况，很多时候nil运算都会导致错误
--[[
x=nil
print(1+x)
print("msg is "..x)
]]
--可以使用or运算给他一个默认值
x=nil
print(1 + (x or 2))
print("msg is "..(x or"-"))
