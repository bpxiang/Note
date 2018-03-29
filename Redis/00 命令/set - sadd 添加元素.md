# sadd 添加元素
>time: 2018-03-08 15:40:30

```
sadd key element [element ...]
```
#### 例：
```
127.0.0.1:6379> exists myset
(integer) 0
127.0.0.1:6379> sadd myset a b c
(integer) 3
127.0.0.1:6379> sadd myset a b
(integer) 0
127.0.0.1:6379> sadd myset c d
(integer) 1
127.0.0.1:6379> smembers myset
1) "c"
2) "d"
3) "b"
4) "a"
```