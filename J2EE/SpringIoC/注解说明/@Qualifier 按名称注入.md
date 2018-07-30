@Qualifier 按名称注入
>time: 2018-7-30 16:33:08

通过名称从 IoC 容器中获取对象进行注入。

```java
@Component("roleService3")
public class RoleServiceImpl3 implements RoleService {
	
	@Autowired
	private Role role = null;
	
	...
}
```

```java
@Component
public class IndexController {
	@Autowired
	@Qualifier("roleService3")
	private RoleService roleService = null;
	
	public void printRole() {
		roleService.printRoleInfo();
	}
}
```