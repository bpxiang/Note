@PeopertySource 加载文件属性
>time: 2018-7-31 15:46:19

#### 配置项
* name： 字符串，配置这次属性配置的名称
* value： 字符串数组，可以配置多个属性文件
* ignoreResourceNotFound: boolean 值，默认  false，其含义为如果找不到对应的属性文件是否进行忽略处理，由于默认值为 false，所以在默认情况下找不到对应的配置文件会抛出异常。
* encoding: 编码，默认 ""

通过环境来获得对应的配置属性，在 Spring 中是没有解析占位符的能力，Spring 推荐使用一个属性文件解析类进行处理——PropertySourcesPlaceholderConfigurer。

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

}
```

```java
public class Test { 
    public static void main(String[] args) {
        Logger logger = Logger.getLogger("Test-Main");
        ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
        String url = context.getEnvironment().getProperty("url");
        logger.info(url);
    }
}
```
