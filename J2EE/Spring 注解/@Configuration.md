# @Configuration

@Configuration: 声明此类是一个配置类，通常与注解 @Bean 配合使用。

```java
@Configuration
public class DataSourceConfig {
    @Value("${spring.datasource.url}")
    private String dataSourceUrl;

    @Value("${spring.datasource.username}")
    private String user;

    @Value("${spring.datasource.password}")
    private String password;
    
    @Value("${spring.datasource.driver-class-name}")
    private String driverClassName;
    
    @Bean(name="dataSource")
    public DataSource datasource(Environment evn) {
        HikariConfig config = new HikariConfig();
        //数据源
        config.setJdbcUrl(dataSourceUrl);
        //用户名
        config.setUsername(user);
        //密码
        config.setPassword(password);
        config.setDriverClassName(driverClassName);
        //是否自定义配置，为true时下面两个参数才生效
        config.addDataSourceProperty("cachePrepStmts", "true");
        //连接池大小默认25，官方推荐250-500
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        //单条语句最大长度默认256，官方推荐2048
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        //新版本MySQL支持服务器端准备，开启能够得到显著性能提升
        config.addDataSourceProperty("useServerPrepStmts", "true"); 
        config.addDataSourceProperty("useLocalSessionState", "true");
        config.addDataSourceProperty("useLocalTransactionState", "true");
        config.addDataSourceProperty("rewriteBatchedStatements", "true");
        config.addDataSourceProperty("cacheResultSetMetadata", "true");
        config.addDataSourceProperty("cacheServerConfiguration", "true");
        config.addDataSourceProperty("elideSetAutoCommits", "true");
        config.addDataSourceProperty("maintainTimeStats", "false");
        
        HikariDataSource dataSource = new HikariDataSource(config);
        //dataSource.setJdbcUrl(evn.getProperty("spring.datasource.url"));
        return dataSource;
	}
}
```