# spop 从集合随机弹出元素
>time: 2018-03-08 15:57:22

```
spop key [count]
```
spop 操作可以从集合中随机弹出一个元素，例：
```
127.0.0.1:6379> smembers myset
1) "c"
2) "b"
3) "a"
127.0.0.1:6379> spop myset
"b"
127.0.0.1:6379> smembers myset
1) "c"
2) "a"
```

srandmemeber 和 spop 都是随机从集合中选出元素，两者不同的是 spop 命令执行后，元素会从结合中删除，而 srandmember 不会。