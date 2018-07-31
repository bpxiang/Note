@ImportResource @Import
>time: 2018-7-31 15:29:43

@ImportResource 中配置的内容是一个数组，也就是可以配置多个 XML 配置文件，这样就可以引入多个 XML 所定义的 Bean 了。

@Import({ApplicationConfig2.class, ApplicationConfig3.class}) 引入多个配置文件

有多个 XML 文件，而你希望通过其中的一个 XML 文件去引入其他的 XML 文件，假设目前有了 spring-bean.xml，需要引入 spring-datasource.xml，那么就可以在 spring-bean.xml 使用 import 元素来加载它  
`<import resource="spring-datasource.mxl />`

#### ApplicationConfig.java
```java
@ComponentScan(basePackageClasses = {Role.class, RoleServiceImpl.class, IndexController.class})
@ImportResource({"classpath:spring-data.xml"})
//@Import({ApplicationConfig2.class, ApplicationConfig3.class})
public class ApplicationConfig {

}
```

#### spring-data.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
        
        
        <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
            <property name="driverClassName" value="com.mysql.jdbc.Driver"></property>
            <property name="url" value="jdbc:mysql://127.0.0.1:3310/info"></property>
            <property name="username" value="root"></property>
            <property name="password" value="bhxz"></property>
        </bean>
</beans>
```