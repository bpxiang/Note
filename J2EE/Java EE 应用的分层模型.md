# Java EE 应用的分层模型
>time: 2018-06-27 11:40:44
1. Domain Object (领域对象) 层
    >此层由一系列的 POJO (Plain Old Java Object，普通的、传统的 Java 对象) 组成，这些对象是该系统的 Domain Object，往往包含了各自所需实现的业务逻辑方法。
1. DAO (Data Access Object，数据访问对象) 层
    >此层有一系列的 DAO 组件组成，这些 DAO 实现了对数据库的创建、查询、更新和删除 (CRUD) 等原子操作。

    >在经典 Java EE 应用中，DAO 层也被称为 EAO 层，EAO 层组件的作用与 DAO 层组件的作用基本相似。只是 EAO 层主要完成对实体 (Entity) 的 CRUD 操作，因此简称为 EAO 层。

    >DAO 层在 MyBatis 中也被称为 Mapper 层，其通过 SQL 语句映射完成 CRUD 操作。
1. Service (业务逻辑) 层
    >此层由一系列的业务逻辑对象组成，这些业务逻辑对象实现了系统所需要的业务逻辑方法。这些业务逻辑方法可能仅仅用于暴露 Domain Object 对象所实现的业务逻辑方法，也可能是依赖 DAO 组件实现的业务逻辑方法。
1. Controller (控制层) 层
    >此层由一系列控制器组成，这些控制器用于拦截用户请求，并调用业务逻辑组件的业务逻辑方法，处理用户请求，并根据处理向不同的表现层转发。
1. View (表现) 层
    >此层由一系列的 JSP 页面、Velocity 页面、PDF 文档试图组件组成，负责收集用户请求，并显示处理结果。