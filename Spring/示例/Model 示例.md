# Model 示例

```java
@Controller
public class UserController {
    pvivate static final Log logger =
            LogFactory.getLog(UserController.class);

    // @ModelAttribute 修饰的方法会先于 login 调用，该方法用于接收前台传入的参数
    @ModelAttribute
    public void userModel(String loginname, String password,
            Model model) {
        logger.info("userModel");
        // 创建 User 对象存储 jsp 页面传入的参数
        User user = new User();
        user.setLoginname(loginname);
        user.setPassword(password);
        // 将 User 对象添加到 Model 当中
        model.addAttribute("user", user);
    }

    @RequestMapping(value="/login")
    public String login(Model model) {
        logger.info("login");
        // 从 Model 当中取出之前的名为 user 的对象
        User user = (User)model.asMap().get("user");
        logger.info(user.getLoginname());
        logger.info(user.getPassword());
        // 设置 user 对象的 username 属性
        user.setUsername("测试");
        logger.info(user.toString());
        return "login";
    }
}
```
