@Primaty 优先使用
>time: 2018年7月30日16:02:06

@Primary 代表首要的，当 Spring IoC 通过一个接口或者抽象类注入对象的时候，由于存在多个实现类或者具体类，就会犯糊涂，不知道采用那个类注入。注解 @Primary 则是告诉 Spring IoC 容器，请优先使用该类注入。

@Primary 只能解决首要性的问题，而不能解决选择性的问题。
```java
@Component
@Primary
public class RoleServiceImpl2 implements RoleService {
    
    @Autowired
    private Role role = null;
    
    @Override
    public void printRoleInfo() {
        System.out.println(this.getClass().getName());
        System.out.println(role.getId());
        System.out.println(role.getRoleName());
        System.out.println(role.getNote());
    }
}
```