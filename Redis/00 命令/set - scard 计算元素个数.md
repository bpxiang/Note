# scard 计算元素个数
>time: 2018-03-08 15:46:56

```
scard key
```

scard 的时间复杂度为 `O(1)`，它不会遍历集合所有元素，而是直接用 Redis 内部的变量，例如：
```
127.0.0.1:6379> smembers myset
1) "c"
2) "d"
127.0.0.1:6379> scard myset
(integer) 2
```