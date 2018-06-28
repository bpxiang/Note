# @RequestHeader 注解
`org.springframework.web.bind.annotation.RequestHeader` 注解类型用于将请求的头信息区数据映射到功能处理方法的参数上。

| 属性 | 类型 | 是否必要 | 说明 |
|---|---|---|---|
| name | String | 否 | 指定请求头绑定的名称 |
| value | String | 否 | name 属性的别名 |
| required | boolean | 否 | 指示参数是否必须绑定 |
| defaultValue | String | 否 | 如果没有传递参数而使用的默认值 |

```java
@RequestMapping(value="/requestHeaderTest")
public void RequestHeaderTest(
        @RequestHeader("User-Agent") String userAgent,
        @RequestHeader(value="Accept") String accept)
```

以上配置自动将请求头 “User-Agent” 的值赋到 userAgent 变量上，并将 “Accept” 请求头的赋到 accept 参数上。
