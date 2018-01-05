# 代码分离 - CSS

为了用 webpack 对 CSS 文件进行打包，你可以像其它模块一样将 CSS 引入到你的 JavaScript 代码中，同时用 ```css-loader``` (像 JS 模块一样输出 CSS)，也可以选择使用 ```ExtractTextWebpackPlugin``` (将打好包的 CSS 提出出来并输出成 CSS 文件)。

## 引入 CSS

像 JavaScript 模块一样引入 CSS 文件。例如在 ```vendor.js```中：

```javascript
import 'bootstrap/dist/css/bootstrap.css';
```
## 使用 ```css-loader``` 和 ```style-loader```

安装 ```css-loader``` 和 ```style-loader```

```
npm install --save-dev css-loader style-loader
```

这样，CSS 会跟你的 JavaScript 打包在一起，并且在初始加载后，通过一个 ```<style>``` 标签注入样式，然后作用于页面。

这里有一个缺点就是，你无法使用浏览器的能力，去异步且并行去加载 CSS。取而代之的是，你的页面需要等待整个 JavaScript 文件加载完，才能进行样式渲染。

```webpack``` 能够用 ```ExtractTextWebpackPlugin``` 帮助你将 CSS 单独打包，以解决以上问题。

## 使用 ```ExtractTextWebpackPlugin```

安装 ExtractTextWebpackPlugin 如下

```
npm install --save-dev extract-text-webpack-plugin
```
为了使用这个插件，它需要通过三步被配置到 ```webpack.config.js``` 文件中。

```javascript
+var ExtractTextPlugin = require('extract-text-webpack-plugin');
module.exports = {
    module: {
         rules: [{
             test: /\.css$/,
-            use: [ 'style-loader', 'css-loader' ]
+            use: ExtractTextPlugin.extract({
+                use: 'css-loader'
+            })
         }]
     },
+    plugins: [
+        new ExtractTextPlugin('styles.css'),
+    ]
}
```

通过以上两步，你可以将所有的 CSS 模块生成一个新的文件，同时你可以将它作为一个单独标签添加到 ```index.html```中。
