# @PostConstruct

当 Bean 被容器初始化后，会调用 @PostConstruct 注解的方法。

```java
@Component
public class ExampleBean {
    @PostConstruct
    public void init() {
        
    }
}
```