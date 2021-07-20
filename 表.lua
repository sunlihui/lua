---
--- Created by sunlihui.
--- DateTime: 2021/7/19 12:10
---

--[[
表是 Lua 里唯一的数据结构，可以近似地理解为其他编程语言里的字典、关联数组或者 key-value映射。

1.定义表
Lua 表里作为索引的key 可以是任何非 nil 值，所以当key类型是整数时表就相当于数组，key类型是字符串时，表就相当于字典或关联数组。Lua表对 value 的类型没有任何限制，
当然也可以是另外一个表，从而实现多个表的嵌套。
Lua里定义表使用 花括号 "{ }"
直接使用 "{}" 就是一个空表，在里面简单地列出表内的元素就声明了一个数组形式的表，使用"key=value"的形式就可以声明字典形式的表
--]]

local a = {3,5,7}       -- 声明一个数组形式的表
local d = {one=1, ['two']=2}    --声明一个字典形式的表
local t = {red=9, [3]=3,['a']={}} --混合了数组和字典形式的表，最好不要这么做

-- 注意在使用 "key =value" 的形式时，key不需要使用单引号或双引号，如果必须要用（如key里有空格或者其他特殊符号）则要使用 "【key】=value"的形式

-- 2. 操作表
-- Lua的表是动态的数据结构，不仅可以访问已有的元素，也可以随时向表里添加或删除元素，非常自由。
-- 操作表里的元素要使用 方括号 "[]"

assert(a[1] == 3 and a[2] == 5) --使用[]访问数组里的元素，整数key
a[1] = 100                          --修改第一个元素的值
print(a[1])

assert(d['one'] == 1)
d['three'] = 3                      -- 添加一个元素

--要特别留意的是：当表最为数组来使用时候，整数下标索引必须从1开始计数。

--如果key是字符串我们也可以使用点号，"."来操作，如下：
local x = {}
x['name'] = 'samus'
x.job = 'hunter'
print(x.name, ': ', x['job'])      -- "." 和"[]"方式可以随意切换

-- 为表添加一个函数变量，相当于成员函数，输出一个字符串
x.mission = function(dst)
    print('fly to', dst)
end

x.mission('zebes')

-- 运算符 "#" 可以计算形式表里的数组元素数量，配合 for 循环可以实现遍历数组：

assert(#a == 3)  -- 计算表里的数组元素数量，输出3

for i=1, #a do
    print(a[i], ', ')
end

--对于字典形式的表，暂时没有办法能够直接获取元素的数量，使用 "#" 会返回0
x['key'] = 1
print(#x)

--[[
3.范围循环
for循环语句的第二种形式-- 范围循环主要用于遍历表里的元素，但需要两个标准库函数的配合：
ipairs() 和 pairs()
这两个函数起到迭代器的作用，逐个返回表里的 key/value。前者只适合数组形式的表，并且遍历到nil值就结束；而后者可以支持任意形式的表，并且遍历
表里的所有元素，但速度没有 iparis快
--]]

-- iparis()只能遍历数组形式的表
for i,v in ipairs(a) do
    print(a[i], ', ')
end
-- pairs() 可以遍历任意的表
for k,v in pairs(x) do
    print(k, ' => ',v)
end

-- 4，作为函数的参数
-- 因为表通常都很大，所以当表作为函数的参数时不是传值的方式，而是传引用的方式，也就是说没有拷贝，直接传递表的"引用"，函数体内可以直接修改表的元素，列如
local function f(v)
    v.name = v.name .. ' aran'
end
f(x)
print(x.name)

--[[
模块
Lua 语言基于表实现了与C++的namespace,Java的package类似的机制，用户可以用模块来管理组织代码结构，Openresty里的很多功能也都使用了这种方式。
模块是一个函数的集合，通常表现为一个Lua表，里面有模块作者提供的各种功能函数，使用"."点号 即可访问
使用 require 函数可以加载模块，参数是模块所在的文件名（省略后缀），通常我们需要变量来报错 require 函数的返回结果，列如：

-- 加载Openresty的cjson模块，local化
local cjson = require "cjson"

-- 调用模块里的函数，JSON编码
local str = cjson.encode({a=1,b=2})
print(str)
--]]

-- 编写自己的 Lua 模块
local proto = {
    version = '1.0'
}
local data =0

function proto.run()
    print("run in mod")
end

--return proto.run()
print(proto.version)