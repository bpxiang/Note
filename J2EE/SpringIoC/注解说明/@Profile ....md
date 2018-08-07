@Profile
>time: 2018-7-31 15:42:09

## 1. 注解配置

#### jdbc.properties
```
dev.driver=com.mysql.jdbc.Driver
dev.url=jdbc:mysql://127.0.0.1:3310/mybatis?useSSL=false&useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&serverTimezone=PRC
dev.username=root
dev.password=bhxz

test.driver=com.mysql.jdbc.Driver
test.url=jdbc:mysql://127.0.0.1:3310/mybatis?useSSL=false&useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&serverTimezone=PRC
test.username=root
test.password=bhxz
```

#### ProfileDataSource.java
```java
@Component
public class ProfileDataSource {
    
    @Value("${dev.driver}")
    private String devDriver = null;
    @Value("${dev.url}")
    private String devUrl = null;
    @Value("${dev.username}")
    private String devUsername = null;
    @Value("${dev.password}")
    private String devPassword = null;
    
    @Value("${test.driver}")
    private String testDriver = null;
    @Value("${test.url}")
    private String testUurl = null;
    @Value("${test.username}")
    private String testUsername = null;
    @Value("${test.password}")
    private String testPassword = null;
    
    @Bean(name = "devDataSource")
    @Profile("dev")
    public DataSource getDevDataSource() {
        
        
        Properties props = new Properties();
        props.setProperty("driver", this.devDriver);
        props.setProperty("url", this.devUrl);
        props.setProperty("username", this.devUsername);
        props.setProperty("password", this.devPassword);
        DataSource dataSource = null;
        try {
            dataSource = BasicDataSourceFactory.createDataSource(props);
        } catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("dev");
        return dataSource;
    }
    
    @Bean(name = "testDataSource")
    @Profile("test")
    public DataSource getTestDataSource() {
        Properties props = new Properties();
        props.setProperty("driver", this.testDriver);
        props.setProperty("url", this.testUurl);
        props.setProperty("username", this.testUsername);
        props.setProperty("password", this.testPassword);
        DataSource dataSource = null;
        try {
            dataSource = BasicDataSourceFactory.createDataSource(props);
        } catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("test");
        return dataSource;
    }
}
```

#### profileConfig.java
```java
@ComponentScan(basePackageClasses = {ProfileDataSource.class})
@PropertySource(value= {"classpath:jdbc.properties"}, ignoreResourceNotFound=true)
public class profileConfig {
    /**
     * 为了让 Spring 能够解析属性占位符
     * @return
     */
    @Bean
    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}
```

#### ProfileTest.java
```java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=profileConfig.class)
@ActiveProfiles("test")
public class ProfileTest {
    @Autowired
    private DataSource dataSource;
    
    @Test
    public void test() {
        dataSource.hashCode();
        System.out.println(dataSource);
    }
}
```

#### 输出：
```
test
org.apache.commons.dbcp.BasicDataSource@419c5f1a
```