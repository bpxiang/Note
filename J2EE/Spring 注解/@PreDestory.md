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

由于传统原因，Spring 还提供了其他 Bean 声明周期的回调方式，制定初始化和销毁方法，以及可以用实现 InitializingBean 接口和 afterPropertiesSet() 来初始化 Bean 和实现 DisposableBean 的 destroy() 方法来销毁 Bean。