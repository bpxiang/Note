# hdel 删除 field
>time: 2018-02-28 17:48:26

hdel 会删除一个或多个 field，返回结果为成功删除 field 的个数。
```
hdel key field [field ...]
```
#### 例：
```
127.0.0.1:6379> hdel user:1 name
(integer) 1
127.0.0.1:6379> hdel user:1 age
(integer) 0
```