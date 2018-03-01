# hmget 批量获取 field-value
>time: 2018-02-28 17:58:01

```
hmget key field value [field value ...]
```
#### 例：
```
127.0.0.1:6379> hset user:2 name mike age 12 city tianjing
(integer) 3
127.0.0.1:6379> hmget user:2 name age city
1) "mike"
2) "12"
3) "tianjing"
```