# 转换 JSON 数据
>time: 2018-07-05 21:26:08

Spring 提供处理 JSON 格式请求/响应的 HttpMessageConverter:  
**MappingJackson2HttpMessageConberter**: 利用 Jackson 开源类包处理 JSON 格式的请求或响应消息。

在 Spring Web 容器中为 RequestMappingHandlerAdapter 装配处理 JSON 的 HttpMessageConverter，并在交互过程中通过请求的 Accept 指定 MIME 类型，Spring MVC 就可以使用服务端的处理方法和客户端 JSON 格式的消息进行通信了，开发者几乎无需关心通信层数据格式的问题。

`org.springframework.web.bind.annotation.RequestBody` 注解用于读取 Request 请求的 body 部分数据，使用系统默认配置的 HttpMessageConverter 进行解析，然后把响应的数据绑定到 Controller 中方法的参数上。

当前台页面使用了 GET 或 POST 方式提交数据时，数据编码格式由的请求头的 ContentType 指定。可以分为以下几种情况：
* application/x-www-form-urlecoded:
    >这种情况的数据 @RequestParam、@ModelAttribute 也可以处理，并且很方便，当然 @RequestBody 也能处理。
* multipart/form-data
    >@RequestBody 不能处理这种格式的数据。
* application/json、aplication/xml 等格式
    >必须使用 @RequestBody 来处理

Spring MVC 默认使用 MappingJackson2HttpMessageConverter 转换 JSON 格式的数据，Jackson 开源包可以非常轻松地将 Java 对象转换成 json 对象和 xml 文档，同样也可以将 json 对象、xml 文档转换成 Java 对象。