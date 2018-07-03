# @ModelAttribute 注解
>time: 2018-07-02 22:22:41

`org.springframework.web.bind.annotation.ModelAtrribute` 注解类型将请求参数绑定到 Model 对象。

@ModelAttribute 注解只支持一个属性 value，类型为 String，表示绑定的属性名称。

***
**提示**：被 @ModelAttribute 注解的方法会在 Controller 每个方法执行前被执行，因此在一个 Controller 映射到多个 URL 时，要谨慎使用。
***

## 1. @ModelAttribute 注解返回具体类的方法
```java
@Controller
public class ModelAttributelController {
    /**
     * 使用 @ModelAttribute 注释的 value 属性，
     * 来指定 model属性的名称，
     * model 属性的值就是方法的返回值
     */
    @ModelAttribute("loginname")
    public String userModel1(
            @RequestParam("loginname") String loginname) {
        System.out.println(loginname);
        return loginname;
    }
    @RequestMapping(value="login1")
    @ResponseBody
    public String login1(Model model) {
        return "OK";
    }
}
```
@ModelAttribute 注解默认的 value 值为 “loginname”，用来指定 model 属性的名称，而 model 属性的是就是 userModel1 方法的返回值。被 @ModelAttribute 注解的 userModel 方式会先于 login1 调用，它把请求参数 loginname 的值赋给 loginname 变量，并设置了一个属性 loginname 到 Model 当中，而属性的值就是 loginname 的变量的值。

## 2. @ModelAttribute 注释 void 返回值的方法
```java
@Controller
public class ModelAttributelController {
    /**
     * model 属性名和值由 model.addAtrribute() 实现，
     * 前提是要在方法中加入一个 Model 类型的参数
     */
    @ModelAttribute
    public void userMode (
            @RequestParam("loginname") String loginname,
            @RequestParam("password") String password,
            Model model) {
        model.addAttribute("loginname", loginname);
        model.addAttribute("password", password);
    }
    @RequestMapping(value="login")
    @ResponseBody
    public String login (Model model) {
        return "OK";
    }
}
```

## 3. ModelAttribute 注释返回具体类的方法