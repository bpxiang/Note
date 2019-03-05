# @Service

@Service 声明此类是一个业务处理类，通常与 @Transactional 一起配合使用。

```java
@Service
@Transactional
public Class UserServiceImpl implements UserService {
    ...
}
```