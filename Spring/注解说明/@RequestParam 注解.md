# @Controller  注解

`org.springframework.web.bind.annotation.RequestParam` 注解类型用于将指定的请求参数赋值给方法中的形参。

| 属性 | 类型 | 是否必要 | 说明 |
|---|---|---|---|
| name | String | no | 指定请求头绑定的名称 |
| value | String | no | name 属性的别名 |
| required | boolean | no | 指示参数是否必要绑定 |
| defaultValue | String | no | 如果没有传递参数而使用的默认值 |

```java
@Controller
@RequestMapping(value="/test")
public class HelloController {
    private static final Log logger = LogFactory
            .getLog(HelloController.class);

    @RequestMapping(value="/login")
    public ModelAndView login(
            @RequestParam(value="loginname", defaultValue="admin") String loginname,
            @RequestParam(value="password", defaultValue="123456") String password) {
        User user = new User();
        user.setLoginname(loginname);
        user.setPassword(password);
        user.setUsername("测试");

        logger.info(user.toString());

        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        logger.info("login 方法 被调用");
        return mv;
    }
}
```
