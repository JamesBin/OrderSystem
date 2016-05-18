---
title: Ajax 载入以后再执行 Lazy Load
prev: enabled.html
next: background.html
---

# Ajax 载入以后再执行 Lazy Load
---

使用 Ajax 载入图片，图片结构载入以后再调用 `$().lazyload()` 方法。

```html
<div id="container">
  <button type="button" class="am-btn am-btn-danger">点击载入图片</button>
</div>
```

```js
$('#container').one('click', function() {
  $('#container').load('images.html', function(response, status, xhr) {
    $('img.lazy').lazyload();
  });
});
```

`images.html` 中的图片标记：

```html
<img class="lazy" data-original="img/example.jpg" width="765" height="574">
```
<style>
  #container .am-img-thumbnail {
    width: 100%;
    display: block;
    height: auto;
  }
</style>

<div id="container">
  <button type="button" class="am-btn am-btn-danger am-btn-block">点击载入图片</button>
</div>

<script src="../amazeui.lazyload.js"></script>
<script>
  $(function() {
    $("#container").one("click", function() {
      $("#container").load("enabled.html #container", function(response, status, xhr) {
        $("img.lazy").lazyload();
      });
    });
  });
</script>
