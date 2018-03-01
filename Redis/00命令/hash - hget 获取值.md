# hget 获取值
>time: 2018-02-28 17:44:54

如果键或 field 不存在，会返回 nil。

```
hget key field
```
#### 例：
```
127.0.0.1:6379> hget user:1 name
"tom"
127.0.0.1:6379> hget user:1 age
(nil)
```