#!/usr/bin/lua

-- lua可以高效地处理字符串，几KB或者几MB的长字符串也不会对效率造成影响，可以放心地使用字符串存储大块的数据
-- 定义

--字符串里面单引号和双引号都可以，字符串里也允许使用转义符
--
print('openresty')
print("it's ok")
print("lua\tnginx")

--lua 使用"[[.....]]"的形式支持 raw string,括号内的字符不会转义，在写正则表达式或者字符串里有引号，斜线的时候非常方便

print([[raw string \r\n]])
print([[^\d+.]d+$]])
print([["",'',""]])

--与多行注释类似，“[[...]]”支持在括号中间插入“= ”，而且如果“[[”后面是一个换行符，那么lua会自动忽略这个换行，在书写大量文字时候是个非常方便的特性
--
x=[=[
[[no \r\n,just one line]]
]=]
print(x)
y=[=[
[[no \r\n,just one line]] 
]=]
print(y)
