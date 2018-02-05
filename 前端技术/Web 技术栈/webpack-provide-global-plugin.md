# webpack-provide-global-plugin
>time: 2018-01-31 16:40:59  

```bash
$ npm install --save-dev webpack-provide-global-plugin
```

```json
plugins: [
    new WebpackProvideGlobalPlugin({
        "es6-promise": "Promise",
        "whatwg-fetch": "fetch"
    })
]
```

