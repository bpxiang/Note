# object encoding 查看内部编码
>time: 2018-02-26 15:08:26  

object encoding 命令查询内部编码：
```bash
127.0.0.1:6379> type hello
string
127.0.0.1:6379> type mylist
list
127.0.0.1:6379> object encoding hello
"embstr"
127.0.0.1:6379> object encoding mylist
"quicklist"
```