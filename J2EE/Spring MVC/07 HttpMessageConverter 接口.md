# HttpMessageConverter<T> 接口
>time: 2018-07-04 15:11:33

`HttpMessageConverter<T>` 是 Spring 3.0 之后新增的一个重要接口，它负责将请求信息转换为一个对象（类型为 T），并将对象（类型为 T）绑定到请求方法的参数中或输出为响应信息。

DispatcherServlet 默认已经装配了 RequestMappingHandlerAdapter 作为 HandlerAdapter 组件的实现类，即 HttpMessageConverter 由 RequestMappingHandlerAdapter 使用，将请求信息转换为对象，或将对象转换为响应信息。

#### `HttpMessageConverter<T>` 接口中定义了以下几个方法：
* `boolean canRead(Class<?> clazz, MediaType mediaType)`
    >该方法指定转换器可以读取的对象类型，即转换器可将请求信息转换为 clazz 类型的对象，同时指定支持的 MIME类型（text/html、application/json 等）。MIME 媒体类型在 RFC2616 中定义。
* `boolean canWrite(Class<?> clazz, MediaType mediaType)`
    >改方法指定转换器可以将 clazz 类型的对象写到响应流当中，响应流支持的媒体类型在 mediaType 中定义。
* `List<MediaType> getSupportedMediaTypes()`
    >该方法返回当前转换器支持的媒体类型。
* `T read(Class<? extends T> clazz, HttpInputMessage inputMessage)`
    >该方法将请求信息转换为 T 类型的对象。
* `void write<T t, MediaType contentType, HttpOutputMessage outputMessage)`
    >该方法将 T 类型的对象写到响应流当中，同时指向响应的媒体类型为 contentType。

Spring 为 `HttpMessageConverter<T>` 提供了多个实现类，这些实现类组成了一个功能强大、用途广泛的信息转换家族。
* StringHttpMessageConverter
    >将请求信息转换为字符串。泛型 T 为 String 类型，可以读取所有媒体类型（`*/*`）的请求信息，可通过设置 supportMediaTypes 属性指定媒体类型。响应信息的媒体类型为 text/plain （即 Content-Type 的值）
* FormHttpMessageConverter
    >将表单数据读取到 MultiValueMap 中，泛型 T 为 `org.springframework.util.MultiValueMap<String, ?>`类型，支持读取 `application/x-www-form-urlencoded` 的类型，但不支持读取 `multipart/form-data` 的类型。可以写 `application/x-www-form-urlencoded` 及 `multipart/form-data` 类型的响应信息。
* XmlAwareFormHttpMessageConverter
    >继承自 formHttpMessageConverter，如果部分表单属性是 XML 数据，则可用改转换器进行转换。
* ResourceHttpMessageConverter
    >读写 `org.springframework.core.io.Resource` 对象。泛型 T 为 `org.springframework.core.io.Resource` 对象，可以读取所有媒体类型（`*/*`）的请求信息。如果类路径下提供了 JAF（Java Activation Framework），则根据 Resource 的类型指定响应的类型，否则响应的类型为 `application/octet-stream`。
* BufferedImageHttpMessageConverter
    >读写 BufferedImage 对象。泛型 T 为 BufferedImage 对象，可以读取所有类型（`*/*`）的请求信息，返回 BufferedImage 响应的类型，也可以通过 contentType 显示指定。
* ByteArrayHttpMessageConverter
    >读写二进制数据，泛型 T 为 `byte[]` 类型，可以读取所有类型（`*/*`）的请求信息，可以通过设置 supportMediaTypes 属性指定类型，响应信息的媒体类型为 `application/octet-stream`。
* SourceHttpMessageConverter
    >读写 `javax.xml.transform.Source` 类型的数据。泛型 T 为 `javax.xml.transform.Source` 类型及其扩展类，包括 `javax.xml.transform.dom.DOMSource`、`javax.xml.transform.sax.SAXSource` 及 `javax.xml.transform.stream.StreamSource`，可以读取 `text/xml` 和 `application/xml` 类型请求，响应信息的类型为 `text/xml` 和 `application/xml`。
* MarshllingHttpMessageConverter
    >通过 Spring 的 `org.springframework.oxm.Marshalling` （将 Java 对象转换成 XML）和 Unmarshaller（将 XML 解析为 Java 对象）读写 XML 消息。泛型 T 为 Object 类型，可以读取 `text/xml` 和 `aplication/xml`。
* Jaxb2RootElementHttpMessageConverter
    >通过 JAXB2 读写 XML 消息，将请求消息转换到注解 XmlRootElement 和 XmlType 作用的类中，泛型 T 为 Object 类型，可以读取 `text/xml` 和 `application/xml` 类型请求，响应信息为类型为 `text/xml` 和 `application/xml`。
* MappingJackson2HttpMessageConverter
    >利用 Jackson 开源类包读写 JSON 数据。泛型 T 为 Object 类型，可以读取 `application/json` 类型的数据，响应信息的类型为 `application/json`。
* RssChannelHttpMessageConverter
    >能够读写 RSS 种子消息。泛型 T 为 `com.sun.sundication.feed.rss.Channel` 类型，可以读取 `application/rss+xml` 消息的数据，响应信息的类型为 `application/rss+xml`。
* AtomFeedHttpMessageConverter
    >能够读写 RSS 种子消息。泛型 T 为 `com.sun.syndication.feed.atom.Feed` 类型，可以读取 `application/atom+xml` 类型的数据，响应信息的类型为 `application/atom+xml`。

RequestMappingHandlerAdapter 默认已经装配了一下的 HTTPMessageConverter：
1. StringHttpMessageConverter
2. ByteArrayHttpMessageConverter
3. SourceHttpMessageConverter
4. XmlAwareFormHttpMessageConverter

```xml
<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter">
    <property name="messageConverters">
        <list>
            <bean class="org.springframework.http.converter.StringHttpMessageConverter" />
            <bean class="org.springframework.http.comverter.xml.XmlAwareFormHttpMessageConverter"/>
            <bean class="org.springframework.http.converter.ByteArrayFormHttpMessageConverter" />
            <bean class="org.springframework.http.converter.BufferedImageHttpMessageConverter" />
        </list>
    </property>
</bean>
```

***
**提示**：如果在 Spring Web 容器中显式定义了一个 RequestMappingHandlerAdapter，则 Spring MVC 的 RequestMappingHandlerAdapter 默认装配的 HttpMessageConverter 将不再起作用。
***
