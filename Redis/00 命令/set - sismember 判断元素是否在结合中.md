# sismember 判断元素是否在结合中
>time: 2018-03-08 15:50:15

如果给定元素 element 在结合内返回 1，反之返回 0，例如：
```
127.0.0.1:6379> smembers myset
1) "c"
2) "d"
127.0.0.1:6379> sismember myset c
(integer) 1
```