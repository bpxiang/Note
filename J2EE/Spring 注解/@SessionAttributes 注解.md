# @SessionAttributes 注解
>time: 2018-07-02 22:15:10

`org.springframework.web.bind.annotation.SessionAttributes` 注解允许我们有选择地指定 Model 中哪些属性需要转存到 HttpSession 对象当中。

| 属性 | 类型 | 是否必要 | 说明 |
|---|---|---|---|
| names | String[] | 否 | Model 中属性的名称，即存储在 HttpSession 当中的属性名称 |
| value | String[] | 否 | names 属性的别名 |
| types | Class<?>[] | 否 | 指示参数是否必须绑定 |

@SessionAttributes 只能声明在类上，而不是声明在方法上。
```java
@SessionAttributes(types={User.class}, value="user")
// 设置多个对象
@SessionAttributes(types={User.class, Dept.class}, value={"user", "dept"})
```

```java
@Controller
// 将 Model 中的属性名为 user 的属性放入 HttpSession 对象当中
@SessionAttributes("user")
public class SessionAtrributesController() {
    // ....
}
```
