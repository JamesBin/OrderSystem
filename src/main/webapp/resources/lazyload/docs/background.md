---
title: 设置背景和淡入效果
prev: ajax.html
next: container.html
---

# 设置为背景图和淡入效果
---

使用 CSS 设置容器背景，并开启淡入效果。**注意这种方式图片载入完成以后会被设置为容器的背景图片**。

```html
<div class="lazy" data-original="img/bmw_m1_hood.jpg" style="width: 765px; height: 574px;"></div>
```

```css
.lazy {
 margin: 10px auto;
 background: url(img/loading.gif) no-repeat center center;
}
```

```js
$('div.lazy').lazyload({
  effect : 'fadeIn'
});
```

<style>
  .lazy {
    margin: 10px auto;
    background: url(img/loading.gif) no-repeat center center;
  }
</style>

<div class="lazy" data-original="img/bmw_m1_hood.jpg"
     style="width: 765px; height: 574px;"></div>
<div class="lazy" data-original="img/bmw_m1_side.jpg"
     style="width: 765px; height: 574px;"></div>
<div class="lazy" data-original="img/viper_1.jpg"
     style="width: 765px; height: 574px;"></div>
<div class="lazy" data-original="img/viper_corner.jpg"
     style="width: 765px; height: 574px;"></div>
<div class="lazy" data-original="img/bmw_m3_gt.jpg"
     style="width: 765px; height: 574px;"></div>
<div class="lazy" data-original="img/corvette_pitstop.jpg"
     style="width: 765px; height: 574px;"></div>
<div class="lazy" data-original="https://farm8.staticflickr.com/7576/16276428075_b3dbfdb402_k.jpg"
     style="width: 765px; height: 574px;"></div>

<script src="../amazeui.lazyload.js"></script>
<script>
  $(function() {
    $("div.lazy").lazyload({
      effect: "fadeIn"
    });
  });
</script>
