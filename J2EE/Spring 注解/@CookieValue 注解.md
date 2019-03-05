# @CookieValue 注解
>time: 2018-07-02 22:09:08

`org.springframework.web.bind.annotation.CookieValue` 用于将请求的 Cookie 数据映射到功能处理方法的参数上。

| 属性 | 类型 | 是否必要 | 说明 |
|---|---|---|---|
| name | String | 否 | 指定请求头绑定的名称 |
| value | String | 否 | name 属性的别名 |
| required | boolean | 否 | 指示参数是否必须绑定 |
| defaultValue | String | 否 | 如果没有传递参数而使用的默认值 |

```java
@RequestMapping(value="/cookieValueTest")
public void cookieValueTest(
        @CookieValue(value="JSESSIONID", defaultValue="") String sessionId)
```

以上配置会自动将 JSESSIONID 值设置到 sessionId 参数上，defaultValue 表示 Cookie 中没有 JSESSIONID 时默认为空。
