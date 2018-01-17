# 详解 DispatcherServlet

`org/springframework/web/servlet/DispatcherServlet`

```java
protected void initStrategies(ApplicationContext context) {
    // 初始化上传文件解析器
    initMultipartResolver(context);
    // 初始化本地化解析起
    initLocaleResolver(context);
    // 初始化主题解析起
    initThemeResolver(context);
    // 初始化处理器映射器，将请求映射到处理器
    initHandlerMappings(context);
    // 初始化处理器适配器
    initHandlerAdapters(context);
    // 初始化处理器异常解析器，如果执行过程中遇到异常将交给 HandlerExceptionResolver 来解析
    initHandlerExceptionResolvers(context);
    // 初始化请求到视图名称解释器
    initRequestToViewNameTranslator(context);
    // 初始化视图解释器，通过 ViewResolver 解析逻辑视图名到具体视图实现
    initViewResolvers(context);
    // 初始化 flash 映射管理器
    initFlashMapManager(context);
}
```

initStrategies 方法将在 WebApplicationContext 初始化后自动执行，自动扫描上下文的 Bean，根据名称或类型匹配的机制查找自定义的组件，如果没有找到则会装配一套 Spring 的默认组件。在 org.springframework.web.servlet 路径下有一个 DispatcherServlet.properties 配置文件，该文件指定了 DispatcherServlet 所使用的默认组件。

```
# Default implementation classes for DispatcherServlet's strategy interfaces.
# Used as fallback when no matching beans are found in the DispatcherServlet context.
# Not meant to be customized by application developers.

# 本地化解析器
org.springframework.web.servlet.LocaleResolver=org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver

# 主题解析器
org.springframework.web.servlet.ThemeResolver=org.springframework.web.servlet.theme.FixedThemeResolver

# 处理器映射器（共 2 个）
org.springframework.web.servlet.HandlerMapping=org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping,\
	org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping

# 处理器适配器（共 3 个）
org.springframework.web.servlet.HandlerAdapter=org.springframework.web.servlet.mvc.HttpRequestHandlerAdapter,\
	org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter,\
	org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter

# 异常处理器（共 3 个）
org.springframework.web.servlet.HandlerExceptionResolver=org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerExceptionResolver,\
	org.springframework.web.servlet.mvc.annotation.ResponseStatusExceptionResolver,\
	org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver

# 视图名称解析器
org.springframework.web.servlet.RequestToViewNameTranslator=org.springframework.web.servlet.view.DefaultRequestToViewNameTranslator

# 视图解析器
org.springframework.web.servlet.ViewResolver=org.springframework.web.servlet.view.InternalResourceViewResolver

# FlashMap 映射管理器
org.springframework.web.servlet.FlashMapManager=org.springframework.web.servlet.support.SessionFlashMapManager
```

如果开发者希望使用自定义类型的组件，则只需要在 Spring 配置文件中配置自定义的 Bean 组件即可。Spring MVC 如果发现上下文中有用户自定义的组件，就不会使用默认组建。

以下是 DispatcherServlet 装配每种组件的细节。
* 本地化解析器。只允许一个实例。
    >1. 查找名为 localResolver、类型为 .LocaleResolver 的 Bean 作为该类型组件。
    >2. 如果没有找到，则使用默认的实现类 AcceptHeaderLocaleResolver 作为该类型组件。
* 主题解析器，只允许一个实例
    > 1. 查找名为 themeResolver、类型为 ThemeResolver 的 Bean 作为该类型组建。
    >2. 如果没有找到，则使用默认实现类 FixedThemeResolver 作为该类组件。
* 处理器适配器。允许多个实例
	>1. 如果 detectAllHandlerAdapters 的属性为 true （默认为 true），则根据类型匹配机制查找上下文以及 Spring 容器中所有类型为 HandlerAdapter 的 Bean，将它们作为该类型组件。
	>2. 如果 detectAllHandlerAdapters 的属性为 false，则查找名为 handlerAdapter、类型为 HandlerAdapter 的 Bean 作为该类型组件。
	>3. 如果通过以上两种方式都没有找到，则使用 DispatcherServlet.properties 配置文件中指定的三个实现类分别创建一个适配器，并将其添加到适配器列表中。
* 处理器异常解释器。允许多个实例
	>1. 如果 detectAllHandlerExceptionResolvers 的属性为 true（默认为 true），则根据类型匹配机制查找上下文以及 Spring 容器中所有类型为 HandlerExceptionResolver 的 Bean，将它们作为该类型组件。
	>2. 如果 detectAllHandlerExceptionResolvers 的属性为 false，则查找名为 handlerExceptionResolver、类型为 HandlerExceptionResolver 的 Bean 作为该类型组件。
	>3. 如果通过以上两种方式都没有找到，则查找 DispatchServlet.properties 配置文件中定义的默认实现类，注意，该文件中没有对应处理异常解析器的默认实现类，用户可以自定义处理异常解析器的实现类，将之添加到 DispatcherServlet.properties 配置文件当中。
* 视图名称解析器。只允许一个实例
	>1. 查找名为 viewNameTranslator、类型为 RequestToViewNameTranslator 的 Bean 作为该类型组件。
	>2. 如果没有找到，则使用默认的实现类 DefaultRequestToViewNameTranslator 作为该类型的组件
* 视图解析器。允许多个实例
	>1. 如果 detectAllViewResolvers 的属性为 true（默认为 true），则根据类型匹配机制查找上下文以及 Spring 容器中所有类型为 ViewResolver 的 Bean，将 它们作为该类型组件。
	>2. 如果 detectAllViewResolvers 的属性为 false，则查找名为 viewResolvers、类型为 ViewResolver 的 Bean 作为该类型组件。
	>3. 如果通过以上两种方式都没有找到，则查找 DispatcherServlet.properties 配置文件中定义的默认实现类 InternalResourceViewResolver 作为该类型的组件。
* 文件上传解析器。只允许一个实例
	>1. 查找名为 muliipartResolver、类型为 MuliipartResolver 的 Bean 作为该类型组件。
	>2. 如果用户没有在上下文中显式定义 MuliipartResolver 类型的组件，则 DispatcherServlet 将不会加载该类型的组件。
* FlashMap 映射管理器。
	>1. 查找名为 FlashMapManager、类型为 SessionFlashMapManager 的 Bean 作为该类型组件，用于管理 FlashMap，即数据默认存储在 HttpSession 中。
