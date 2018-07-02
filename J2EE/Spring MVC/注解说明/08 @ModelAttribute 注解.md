# @ModelAttribute 注解
>time: 2018-07-02 22:22:41

`org.springframework.web.bind.annotation.ModelAtrribute` 注解类型将请求参数绑定到 Model 对象。

@ModelAttribute 注解只支持一个属性 value，类型为 String，表示绑定的属性名称。

***
**提示**：被 @ModelAttribute 注解的方法会在 Controller 每个方法执行前被执行，因此在一个 Controller 映射到多个 URL 时，要谨慎使用。
***