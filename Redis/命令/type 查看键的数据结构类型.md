# 查看键的数据结构类型
>time: 2018-02-26 14:43:39  
```bash
type key
```

```bash
127.0.0.1:6379> set hello world
OK
127.0.0.1:6379> type hello
string
```