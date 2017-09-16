# @Controller  注解

`org.springframework.stereotype.Controller` 注解类型用于指示 Spring 类的实例是一个控制器，使用 @Controller 注解的类不需要继承特定的接口，相对之前的版本实现 Controller 接口变得更加简单。而且 Controller 接口的实现类只能处理一个单一请求动作，而 @Controller 注解的控制器可以支持同时处理多个请求动作，更加灵活。

@Controller 用于标记一个类，使用它标记的类就是一个 SpringMVC Controller 对象，即一个控制器类。Spring 使用扫描机制查找应用程序中所有基于注解的控制器类。分发处理器会扫描使用了该注解的类的方法，并检测该方法是否使用了 @RequestMapping 注解，而使用 @RequestMapping 注解的方法才是真正处理请求的处理器。为了保证 Spring 控制器，需要完成两件事：
1. 在 Spring MVC 的配置文件的头文件中引入 spring-context。
2. 使用 `<context:component-scan/>`元素，启动包扫描功能


```java
/**
 * HelloController 是一个基于注解的控制器
 * 可以同时处理多个请求动作，并且无须实现任何接口
 * org.springframework.stereotype.Controller 注解用于指示该类是一个控制器
 */
@Controller
@RequestMapping(value="/test/hello")
public class HelloController {
    private static final Log logger = LogFactory
            .getLog(HelloController.class);
    /**
     * org.springframework.web.bind.annotation.RequestMapping 注解
     * 用来映射请求的 URL 和请求的方法等。本例用来映射 “/hello”
     * hello 指示一个普通方法
     * 该方法返回一个包含视图名或视图名和模型的 ModelAndView 对象。
     * http://127.0.0.1/test/hello/hello
     */
    @RequestMapping(value="/hello")
    public ModelAndView hello() {
        logger.info("hello 方法 被调用");
        // 创建准备返回的 ModelAndView 对象，该对象通常包含了返回视图名、模型名称以及模型对象
        ModelAndView mv = new ModelAndView();
        // 添加模型数据，可以是任何 POJO 对象
        mv.addObject("message", "Hello Word !");
        // 设计逻辑视图名，视图解析器会根据改名字解析到具体的视图页面
        mv.setViewName("/WEB-INF/content/hello.jsp");
        return mv;
    }

}
```
