# @RequestMapping 注解
>time: 2018-07-02 22:10:12

`org.springframework.web.bind.annotation.ReqeustMapping` 注解类型指示 Spring 用哪一个类或方法来处理请求动作，该注解可用于类或方法。

***
**提示**：@RequestMapping 虽然也在 `org.springframework.web.bind.annotation` 下面，但是严格来说，它并不属于参数绑定注解。
***

@RequestMapping 可以用来注解一个控制器类，所有方法都将映射为相对于类级别的请求，表示该控制器处理的所有请求都被映射到 value 属性所指示的路径下。

### @RequestMapping 注解支持的属性
| 属性 | 类型  | 是否必要 | 说明 |
|---|---|---|---|
| value | String[] | 否 | 用于将指定请求的实际地址映射到方法上 |
| name | String | 否 | 给映射地址指定一个别名 |
| method | RequestMethod | 否 | 映射指定请求的方法类型，包括 GET、POST、HEAD、OPTION、PUT、PATCH、DELETE、TRACE |
| consumes | String[] | 否 | 指定处理请求的提交内容类型（Content-Type），例如，application/json、text/html 等。 |
| produces | String[] | 否 | 指定返回的内容类型，返回的内容类型必须是 request 请求头（Accept）中所包含的类型 |
| params | String[] | 否 | 指定 request 中必须包含某些参数值时，才让该方法处理 |
| heads | String[] | 否 | 指定 request 中必须包含某些指定的 header 值，才让该方法处理 |
| Path | String[] | 否 | 在 Servlet 环境中只有 :uri 路径映射（例如“/myPhah.do”）。也支持如 ant 的基于路径模式（例如“/myPath/*,”）。在方法层面上，支持相对路径（例如“edit.do”） |

1. value 属性
    >RequestMapping 用来映射一个请求和一种方法。可以使用 @ReqeustMapping 注释一个方法或类。

    >由于 value 属性是 @RequesMapping 注释的默认属性，因此，如果只有唯一的属性，则可以省略属性名。下面两个标注含义相同。

    ```java
    @RequestMapping(value="hello")
    @RequestMapping("hello")
    ```

    如果有超过一个属性，就必须写 vlaue 属性名称。

    value 属性的值也可以是一个空字符串，此时该方法被映射到如下请求 URL：`http://localhost:8080/projectname`

1. method 属性
    >该属性用来指示该方法仅仅处理哪些 HTTP 请求方式。

    ```java
    @RequestMapping(value="/hello",method=RequestMethod.POST)
    ```
    可以同时支持多个 HTTP 请求方式。
    ```java
    @ReqeustMapping(value="hello",
            method={RequestMethod.POST,RequestMethod.GET})
    ```
    如果没有指定 method 属性值，则请求处理方法可以处理任意的 HTTP 请求方式。

1. consumes 属性
    >该属性指定处理请求的提交内容类型（Content-type）。

    ```java
    @RequestMapping(value="/hello",
            mothed=RequestMethod.Post, consumes="application/json")
    ```
    表示该方法近处理 request Content-Type 为 “application/json” 类型的请求。
1. produces 属性
    >该属性指定返回的内容类型，返回的内容类型必须是 request 请求头 (Accept) 中所包含的类型。

    ```java
    @RequestMapping(value="/hello",
            mothed=RequestMethod.Post, produces="application/json")
    ```
    方法近处理 request 请求中 Accept 头中包含了 “application/json” 的请求，同时指明了返回的内容类型为 application/json。

1. params 属性
    >该属性指定 request 中必须包含某些参数值时，才让该方法处理。

    ```java
    @RequestMapping(value="/hello",method=RequestMethod.POST,
            params="myParam=myValue")
    ```
    方法仅处理名为“myParam”、值为“myValue”的请求。

1. headers 属性
    >该属性指定 request 中必须包含某些指定的 header 值，才能让该方法处理请求。

    ```java
    @RequestMapping(values="/hello",method=RequestMethod.POST,
            headers="Referer=http://www.bpx.com/")
    ```
    该方法仅处理 Request 的 Header 中包含了指定 “Referer” 请求头和对应值为“http://www.bpx.com/”的请求。
