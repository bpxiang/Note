# 创建 Maven 的 Java 工程

```bash
mvn -B archetype:generate \
    -DarchetypeGroupId=org.apache.maven.archetypes \
    -DgroupdId=com.mycompany.app \
    -DartifactId=my-app
```

groupId 是 `com.mycompany.app`，项目的标识是 `my-app`，archetypeGroupId 是生成 Maven 项目的模板，Maven 提供了很多模板用来生成不同应用的 Maven 项目。