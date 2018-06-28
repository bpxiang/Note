# HelloController
```java
package com.bpx.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * HelloController 是一个基于注解的控制器
 * 可以同时处理多个请求动作，并且无须实现任何接口
 * org.springframework.stereotype.Controller 注解用于指示该类是一个控制器
 */
@Controller
public class HelloController {

    private static final Log logger = LogFactory
            .getLog(HelloController.class);
    /**
     * org.springframework.web.bind.annotation.RequestMapping 注解
     * 用来映射请求的 URL 和请求的方法等。本例用来映射 “/hello”
     * hello 指示一个普通方法
     * 该方法返回一个包含视图名或视图名和模型的 ModelAndView 对象。
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
