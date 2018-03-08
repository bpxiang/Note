# blpop 阻塞操作
>time: 2018-03-06 15:12:25

```
blpop key [key ...] timeout
blpop key [key ...] timeout
```

blpop 和 brpop 是 lpop 和 rpop 的阻塞版本，它们除了弹出方向不同，使用方法基本相同。

参数：
* key [key ...]: 多个列表的键。
* timeout: 阻塞时间（单位：秒）

1. 列表为空：如果 timeout=3，那么客户端要等到 3 秒后返回，如果 timeout=0，那么客户端一直阻塞等下去：
    ```127.0.0.1:6379> brpop list:test 3
    (nil)
    (3.04s)
    127.0.0.1:6379> brpop list:test 0
    ...阻塞...
    ```
    如果添加了数据，客户端立即返回：
    ```
    127.0.0.1:6379> lrange list:test 0 -1
    1) "a"
    2) "b"
    3) "c"
    4) "d"
    5) "e"
    6) "f"
    127.0.0.1:6379> brpop list:test 3
    1) "list:test"
    2) "f"
    ```
1. 列表不为空： 客户端会立即返回。
    ```
    127.0.0.1:6379> lrange list:test 0 -1
    1) "a"
    2) "b"
    3) "c"
    4) "d"
    5) "e"
    127.0.0.1:6379> brpop list:test 0
    1) "list:test"
    2) "e"
    ```

在使用 brpop 时，有两点需要注意：
1. 如果是多个键，那么 brpop 会从左至右遍历键，一旦有一个键能弹出元素，客户端立即返回。
    ```
    127.0.0.1:6379> lrange list:1 0 -1
    (empty list or set)
    127.0.0.1:6379> lrange list:2 0 -1
    (empty list or set)
    127.0.0.1:6379> lrange list:3 0 -1
    (empty list or set)
    127.0.0.1:6379> brpop list:1 list:2 list:3 0
    ...阻塞...

    127.0.0.1:6379> lpush list:2 element2
    (integer) 1
    127.0.0.1:6379> lpush list:3 element3
    (integer) 1
    127.0.0.1:6379> brpop list:1 list:2 list:3 0
    1) "list:2"
    2) "element2"
    ```
1. 如果多个客户端对同一个键执行 brpop，那么最先执行 brpop 命令的客户端可以获取到弹出的值。