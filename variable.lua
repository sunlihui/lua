#!/usr/bin/lua

--lua语言里的变量有作用域的概念，分为局部变量和全局变量，名字区分大小写
--局部变量用"local"声明，作用域仅限本代码块（文件内或语句块内），没有关键字"local"声明的变量都是全局变量，而且不需要声明就可以直接使用
--
x=1
local str ='local value'

do
   local pi=3.14
   print(pi)
end

print(type(pi))

--建议多实用局部变量，防止冲突，让计算更快
