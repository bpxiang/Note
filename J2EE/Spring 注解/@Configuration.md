# @Configuration

@Configuration: 声明此类是一个配置类，通常与注解 @Bean 配合使用。

```java
@Configuration
public class DataSourceConfig {
    @Bean(name = "dataSource")
    public DataSource datasource(Environment evn) {
        ...
    }
}
```