PropertySourcesPlaceholderConfigurer 解析属性占位符
>time: 2018-7-31 16:04:59

#### jdbc.properties
```
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://127.0.0.1:3310/mybatis?useSSL=false&useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&serverTimezone=PRC
username=root
password=bhxz
```

#### ApplicationConfig.java
```java
@ComponentScan(basePackageClasses = {Role.class, RoleServiceImpl.class, IndexController.class})
@PropertySource(value= {"classpath:jdbc.properties"}, ignoreResourceNotFound=true)
public class ApplicationConfig {
    /**
     * 为了让 Spring 能够解析属性占位符
     * @return
     */
    @Bean
    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    
```

```java
@Component
public class DataSourceBean {
    @Value("${driver}")
    private String driver = null;
    @Value("${url}")
    private String url = null;
    @Value("${username}")
    private String username = null;
    @Value("${password}")
    private String password = null;
    
    @Bean(name="dataSource")
    public DataSource getDataSource() {
        Properties props = new Properties();
        props.setProperty("driver", driver);
        props.setProperty("url", url);
        props.setProperty("username", username);
        props.setProperty("password", password);

        DataSource dataSource = null;
        try {
            dataSource = BasicDataSourceFactory.createDataSource(props);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataSource;
    }
}
```

