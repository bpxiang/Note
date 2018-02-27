# 检查键是否存在
>time: 2018-02-26 14:24:16  

```bash
exists key [key ...]
```

```bash
127.0.0.1:6379> exists java foo
(integer) 2
127.0.0.1:6379> exists not_exist_key
(integer) 0
```