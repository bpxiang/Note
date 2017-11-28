# GSON
>key: 2017-11-22 17:01:25  
>keyword: GSON, android library  
>GSON 是 Google 提供解析 JSON 数据的开源库。

[GSON GitHub 主页](https://github.com/google/gson)

## app/build.gradle
```
dependencies {
    compile 'com.google.code.gson:gson:2.8.2'
}
```


```java
Gson gson = new Gson();
Person person = gson.fromJson(jsonData, Person.class);
```

如果需要解析的是一段 JSON 数组会稍微麻烦一点，需要借助 TypeToken 将期望解析成的数据类型传入到 fromJson() 方法中
```java
List<Person> people = gson.fromJson(jsonData, new TypeToken<List<Person>>(){}.getType());
```

### 实例
```java
private void parseJSONWithGSON(String jsonData) {
        Gson gson = new Gson();
        List<Person> persons = gson.fromJson(jsonData, new TypeToken<List<Person>>(){}.getType());
        for (Person person : persons) {
            Log.d(TAG, "parseJSONWithGSON: " + person.getName());
        }

    }
```