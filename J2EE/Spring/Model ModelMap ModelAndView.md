# Model ModelMap ModelAndView

## 1. Model 和 ModelMap
Spring MVC 在内部使用了一个 org.springframework.ui.Modle 接口存储模型数据，它的功能类似 java.util.Map 接口，但是比 Map 易于使用。org.springframework.ui.ModelMap 接口实现了 Map 接口

Spring MVC 在调用处理方法之前会创建一个隐含的模型对象，作为模型数据的存储容器。如果处理方法的参数为 Model 或 ModelMap 类型，则 Spring MVC 会将隐含模型的引用传递给这些参数。在处理方法内部，开发者可以通过这个参数对象访问模型中的所有数据，也可以向模型中添加新的属性数据。

在处理方法中，Model 和 ModelMap 对象都可以使用如下方法添加模型数据：
```java
addObject(String attribute, Object attributeValue);
```
## 1.1 Model

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
## 1.2 ModelMap
```java
@Controller
public class UserController {
    pvivate static final Log logger =
            LogFactory.getLog(UserController.class);

    // @ModelAttribute 修饰的方法会先于 login 调用，该方法用于接收前台传入的参数
    @ModelAttribute
    public void userModel(String loginname, String password,
            ModelMap modelMap) {
        logger.info("userModel");
        // 创建 User 对象存储 jsp 页面传入的参数
        User user = new User();
        user.setLoginname(loginname);
        user.setPassword(password);
        // 将 User 对象添加到 ModelMap 当中
        modelMap.addAttribute("user", user);
    }

    @RequestMapping(value="/login")
    public String login(ModelMap modelMap) {
        logger.info("login");
        // 从 ModelMap 当中取出之前的名为 user 的对象
        User user = (User)modelMap.get("user");
        logger.info(user.getLoginname());
        logger.info(user.getPassword());
        // 设置 user 对象的 username 属性
        user.setUsername("测试");
        logger.info(user.toString());
        return "login";
    }
}
```
# 2. ModelAndView
控制器处理方的返回值如果是 ModelAndView，则其既包含模型数据信息，也包含视图信息，这样 Spring MVC 将使用 Spring MVC 将使用包含的视图对模型数据进行渲染。可以简单地将模型数据看成一个 `Map<String attributeName, Object attributeValue>`

向 ModelAndView 对象中添加模型数据：
```java
addObject(String attributeName, Object attributeValue);
setViewName(String viewName);
```

```java
/**
 * HelloController 是一个基于注解的控制器
 * 可以同时处理多个请求动作，并且无须实现任何接口
 * org.springframework.stereotype.Controller 注解用于指示该类是一个控制器
 */
@Controller
@RequestMapping(value="/test")
public class HelloController {
    private static final Log logger = LogFactory
            .getLog(HelloController.class);

    // @ModelAttribute 修饰的方法会先于 login 调用，该方法用于接收前台传入的参数
    @ModelAttribute
    public void userModel(String loginname, String password,
            ModelAndView mv) {
        logger.info("userModel");
        // 创建 User 对象存储 jsp 页面传入的参数
        User user = new User();
        user.setLoginname(loginname);
        user.setPassword(password);
        // 将 User 对象添加到 ModelMap 当中
        mv.addObject("user", user);
    }

    @RequestMapping(value="/login")
    public ModelAndView login(ModelAndView mv) {
        logger.info("login");
        // 从 ModelMap 当中取出之前的名为 user 的对象
        User user = (User)mv.getModel().get("user");
        logger.info(user.getLoginname());
        logger.info(user.getPassword());
        // 设置 user 对象的 username 属性
        user.setUsername("测试");
        logger.info(user.toString());
        mv.setViewName("login");
        return mv;
    }
}
```
