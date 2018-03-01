# hgetall 获取所有的 field-value
>time: 2018-03-01 10:01:46

```
hgetall key
```

```
127.0.0.1:6379> hgetall user:1
1) "name"
2) "tom"
3) "age"
4) "23"
5) "city"
6) "tianjin"
```

在使用 hgetall 时，如果哈希元素个数较多，会存在阻塞 Redis 的可能。如果开发人员只需要获取部分 field，可以使用 hmget，如果一定要获取全部 field-valu，可以使用 hscan 命令，该命令会渐进式遍历哈希类型。