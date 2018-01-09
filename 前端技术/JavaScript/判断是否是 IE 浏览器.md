# 判断是否是 IE 浏览器
>time: 2018-01-09 17:08:57

## HTML
```html
<!--[if IE]>
    <p>Work in IE browser</p>
<![endif]>
```

## JavaScript
```javascript
{
    (!!window.ActiveXObject || 'ActiveXObject' in window) ? 
    <p>Work in IE browser</p> : ''
}
```