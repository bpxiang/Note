# 删除键
>time: 2018-02-26 14:27:17  

```bash
del key [key ...]
```
del 是一个通用命令，无论值是什么数据结构类型，del 命令都可以将其删除。返回结果为成功删除键的个数，假设删除一个不存在的键，就会返回 0。
```bash
127.0.0.1:6379> del java
(integer) 1
127.0.0.1:6379> exists java
(integer) 0
127.0.0.1:6379> del java
(integer) 0
```