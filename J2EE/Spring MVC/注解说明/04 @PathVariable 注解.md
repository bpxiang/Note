# @PathVariable 注解
>time: 2018-07-02 22:14:52

`org.springframework.web.bind.annotation.PathVariable` 注解类型可以非常方便地获得请求 URL 中的动态参数。@PathVariable 注解支持一个属性 value，类型为 String，表示绑定的名称，如果省略则默认绑定同名参数。

```java
@RequestMapping(value="/pathVariableTest/{userId}")
public void pathVariableTest(@PathVariable Integer userId)
```

加入请求的 URL 为 “http://localhost:8080/Spring/Test/pathVariableTest/1”，则自动将 URL 中模版变量 {userId} 绑定到通过 @PathVariable 注解的同名参数上，即 userId 变量将被赋值为 1。
