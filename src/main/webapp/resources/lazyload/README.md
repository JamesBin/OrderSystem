# Lazy Load

Forked from [Lazy Load Plugin for jQuery](https://github.com/tuupola/jquery_lazyload/)

## 使用方法

首先，在页面中引入 jQuery 和 `jquery.lazyload.js`。

```html
<script src="jquery.js"></script>
<script src="amazeui.lazyload.js></script>
```

然后，修改 `<img>`，将图片实际地址写在 `data-original` 上。为方便选择，建议在要使用 Lazy Load 的图片上加统一的 class；为防止页面抖动，图片上应该添加 `width` 和 `height` 属性。

```html
<img class="lazy" data-original="img/example.jpg" width="640" height="480">
```

完成 HTML 设置以后，调用 Lazy Load 插件：

```js
$("img.lazy").lazyload();
```

**更多演示：**

- [基本演示](http://amazeui.github.io/lazyload/examples/enabled.html)
- [淡入效果](http://amazeui.github.io/lazyload/examples/fadein.html)
- [Ajax 载入内容](http://amazeui.github.io/lazyload/examples/ajax.html)
- [设置背景图片](http://amazeui.github.io/lazyload/examples/background.html)
- [容器中懒加载](http://amazeui.github.io/lazyload/examples/container.html)
- [设置触发机制](http://amazeui.github.io/lazyload/examples/timeout.html)

## 获取插件

### 直接下载

<a href="https://github.com/amazeui/lazyload/archive/master.zip" class="am-btn am-btn-primary">下载 Lazy Load</a>

### 使用 NPM

```
npm install amazeui-lazyload
```

### 使用 Bower

```
bower install jquery.lazyload
```
## License

All code licensed under the "MIT License":http://www.opensource.org/licenses/mit-license.php. All images licensed under "Creative Commons Attribution 3.0 Unported License":http://creativecommons.org/licenses/by/3.0/deed.en_US. In other words you are basically free to do whatever you want. Just don't remove my name from the source.
