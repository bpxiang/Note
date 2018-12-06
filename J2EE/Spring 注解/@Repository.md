# @Repository

@Repository: 声明此类是一个数据库或者其他 NoSQL 访问类。

```java
@Repository
public class UserDao implements CrudDao<User, String> {

}
```