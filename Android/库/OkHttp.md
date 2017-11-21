# OkHttp
>key: 2017-11-20 16:05:58  
>keyword: OkHttp, android library  
>OkHttp 是 Square 公司的开源网络通信库。OkHttp 不仅在接口封装上做得简单易用，在底层实现上也是自成一派。

[OkHttp GitHub 主页](https://github.com/square/okhttp)

## app/build.gradle
```
dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    compile 'com.android.support:appcompat-v7:26.+'
    testCompile 'junit:junit:4.12'
    compile 'com.squareup.okhttp3:okhttp:3.9.1'
}
```
添加上述依赖会自动下载两个库，OkHttp 库，Okio库。 Okio 库是 OkHttp 库的通信基础。

```java
// 创建 OkHttpClient 对象
OkHttpClient  client = new OkHttpClient();
// 创建 Request 对象
Request request = new Request.Build.build();
// 发送请求
Response response = client.newCall(request).execute();
```

### 实例
```java
private void sendRequestWithOkHttp() {
    new Thread(new Runnable() {
        @Override
        public void run() {
            try {
                // 创建 OkHttpClient 对象
                OkHttpClient client = new OkHttpClient();

                // 创建 RequestBody 对象
                RequestBody requestBody = new FormBody.Builder()
                        .add("username", "admin")
                        .add("password", "123456")
                        .build();

                // 创建 Request 对象
                Request request = new Request.Builder()
                        .url("url")
                        .post(requestBody)
                        .build();

                Response response = client.newCall(request)
                        .execute();

                String responseData = response.body().string();
                Log.d(TAG, responseData);
            }catch(IOException e) {
                e.printStackTrace();
            }
        }
    }).start();

}
```