@Component 注解
>time: 2018-7-30 14:39:18

@Component 代表 Spring IoC 会把这个类扫描生成 Bean 实例，而其中的 value 属性代表这个类在 Spring 中的 id，相当于 XML 方式定义的 Bean 的 id，也可以简写成 @Component("role")。直接写成 @Component，Spring IoC 容器就默认类名，以首字母小写的形式作为 id，为其生成对象，配置到容器中。

@Component 只能注解在类上，不能注解到方法上。

```java
@Component(value = "role")
public class Role {
    @Value("1")
    private Long id;
    @Value("role_name_1")
    private String roleName;
    @Value("role_note_1")
    private String note;
    
    
    public String toString() {
        return String.format("%s[id=%d, roleName=%s, note=%s]", 
                this.getClass().getName(),
                this.id,
                this.roleName,
                this.note);
    }
}
```

```java
@ComponentScan
public class PojoConfig {
}
```

```java
public class Test {
    public static void main(String[] args) {
        // AnnotationConfigApplicationContext 去生成 IoC 容器
        ApplicationContext context = new AnnotationConfigApplicationContext(PojoConfig.class);
        Role role = context.getBean(Role.class);
        System.err.println(role);
    }
}
```

#### 输出
```
top.bupuxiang.spring.pojo.Role[id=1, roleName=role_name_1, note=role_note_1]
```