# HelloController
```java
package com.bpx.controller;


import java.lang.annotation.Annotation;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;å

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 * HelloController 是一个实现 Controller 接口的控制器，
 * 可以处理一个单一的请求动作
 */
public class HelloController implements Controller{
    private static final Log logger = LogFactory.getLog(HelloController.class);

    /**
     * handleRequest 是 Controller 接口必须实现的方法
     * 该方法的参数是对应请求的 HttpServletRequest 和 HttpServletResponse
     * 该方法必须返回一个包含视图名或视图名和模型的 ModelAndView 对象。
     *
     */
    @Override
    public ModelAndView handleRequest(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        logger.info("HelloController handleRequest 被调用");
        // 创建准备返回的 ModelAndView 对象，该对象通常包含了返回视图名、模型名以及模型对象
        ModelAndView mv = new ModelAndView();
        // 添加模型数据，可以是任意的 POJO 对象
        mv.addObject("message", "Hello World !");
        // 设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
        mv.setViewName("/WEB-INF/content/hello.jsp");
        // 返回 ModelAndView 对象。
        return mv;
    }    
}


```
