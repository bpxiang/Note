# @PreDestory

@PreDestory: 在容器被销毁之前，调用被 @PreDestory 注解的方法。

```java
@Service
public class ExampleBean {
    @PreDestory
    public void cleanup() {
        
    }
}
```