@Autowired 自动装配
>time: 2018-7-30 15:44:14

@Autowired 注解，表示在 Spring IoC 定位所有的 Bean 后，这个字段需要按类型注入，这样 IoC 容器就会寻找资源，然后将其注入。

IoC 容器有时候会寻找失败，在默认的情况下寻找失败它就会抛出异常，也就是说默认情况下，Spring IoC 容器会认为一定要找到对应的 Bean 来注入这个字段，有些时候这并不是一个真实的需要，比如日志，有时候我们会觉得这是可有可无的，这个时候可以通过 @Autowired 的配置项 required 来改变它，比如 `@Autowired(required = false)`。

required 的默认值为 true。当把配置修改为了 false 时，就告诉 Spring IoC 容器，假如在已经定义好的 Bean 中找不到对应的类型，允许不注入，这样也就没有了异常抛出，只是这样这个字段可能为空，读者要自行校验，以避免发生空指针异常。

```java
public interface RoleService {

    public void printRoleInfo();
}
```

```java
@Component
public class RoleServiceImpl implements RoleService {
    
    @Autowired
    private Role role = null;
    
    @Override
    public void printRoleInfo() {
        System.out.println(role.getId());
        System.out.println(role.getRoleName());
        System.out.println(role.getNote());
    }

}
```

```java
@ComponentScan(basePackageClasses = {Role.class, RoleServiceImpl.class})
public class ApplicationConfig {

}
```

```java
public class Test {

    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
        Role role = context.getBean(Role.class);
        RoleService roleService = context.getBean(RoleService.class);
        roleService.printRoleInfo();
    }
}
```