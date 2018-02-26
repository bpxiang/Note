# 键总数
>time: 2018-02-26 14:21:15  

```bash
127.0.0.1:6379> keys *
1) "key"
2) "hello"
3) "python"
4) "foo"
5) "java"
127.0.0.1:6379> dbsize
(integer) 5
```

dbsize 命令在计算键总数时不会遍历所有键，而是直接获取 Redis 内置的键总数变量，所以dbsize命令的时间复杂度是 O（1）。而 keys 命令会遍历所有键，所以它的时间复杂度是 O（n），当 Redis 保存了大量键时，线上环境禁止使用。