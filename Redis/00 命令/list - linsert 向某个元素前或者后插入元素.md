# linsert 向某个元素前或者后插入元素
>time: 2018-03-01 14:03:44

```
linsert key before|after pivot value 
```
linsert 命令会从列表中找到等于 pivo t的元素，在其前（before）或者后（after）插入一个新的元素 value，例如下面操作会在会在列表的元素  前插入 java：

```
127.0.0.1:6379> lrange listkey 0 -1
1) "c"
2) "b"
3) "a"
127.0.0.1:6379> linsert listkey before e java
(integer) -1
127.0.0.1:6379> lrange list 0 -1
(empty list or set)
127.0.0.1:6379> lrange listkey 0 -1
1) "c"
2) "b"
3) "a"
127.0.0.1:6379> linsert listkey before b java
(integer) 4
127.0.0.1:6379> lrange listkey 0 -1
1) "c"
2) "java"
3) "b"
4) "a"
```