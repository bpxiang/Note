# @RequestParam  注解

`org.springframework.web.bind.annotation.RequestParam` 注解类型用于将指定的请求参数赋值给方法中的形参。

| 属性 | 类型 | 是否必要 | 说明 |
|---|---|---|---|
| name | String | no | 指定请求头绑定的名称 |
| value | String | no | name 属性的别名 |
| required | boolean | no | 指示参数是否必要绑定 |
| defaultValue | String | no | 如果没有传递参数而使用的默认值 |

请求处理方法参数的可选类型为 Java 基本数据类型和 String。
```java
@RequestMapping(value="/login")
public ModelAndView login(
        @RequestParam("loginname") String loginname,
        @RequestParam("password") String password) {
    return ......;
}
```
假设请如下：
`http://localhost:8080/context/loginname=jack&password=123456`
以上代码会将请求中的 loginname 参数的值 “jack”赋给 loginname  变量，password 参数的值 “123456” 赋给 password 变量。

@RequestParam 还有如下写法：
@RequestParam(value="loginname", required=true, defaultValue="admin")
其中 required 参数不是必须的，默认值为 true。
