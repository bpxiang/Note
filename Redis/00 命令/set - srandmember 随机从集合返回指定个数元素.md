# srandmember 随机从集合返回指定个数元素
>time: 2018-03-08 15:54:36

```
srandmember key [count]
```
`[count]`是可选参数，如果不写默认为 1，例如：
```
127.0.0.1:6379> srandmember myset 2
1) "g"
2) "e"
127.0.0.1:6379> srandmember myset
"e"
```