# srem 删除元素
>time: 2018-03-08 15:44:34

```
srem key element [element ...]
```
#### 例：
```
127.0.0.1:6379> srem myset a b
(integer) 2
127.0.0.1:6379> srem mysqt hello
(integer) 0
```