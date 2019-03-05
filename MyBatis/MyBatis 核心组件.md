# MyBatis 核心组件

* SqlSessionFactoryBuilder(构造器)：根据配置或者代码来生成 SqlSessionFactory，采用的是分步构建 Builder 模式。
* SqlSessionFactory(工厂接口)：依靠它来生成 SqlSession，使用的是工厂模式。
* SqlSession(会话)：一个既可以发送 SQL 执行返回结果，也可以获取 Mapper 的接口。在现有的技术中，一般我们会让其在业务逻辑中“消失”，而使用得是 MyBatis 提供的 SQL Mapper 接口编程技术，它能提高代码的可读性和可维护性。
* SQM Mapper(映射器)：MyBatis 新设计存在的组件，它有一个 Java 接口和 XML 文件（注解）构成，需要给出对应的 SQL 和映射规则。它负责发送 SQL 去执行，并返回结果。