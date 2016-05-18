---
title: 在容器中懒加载图片
prev: background.html
next: fadein.html
---

# 在容器中懒加载图片
---

容器中不可见区域的图片将不会加载，只有在滚动到可视区域时才加载。

```js
$('img.lazy').lazyload({
  effect : 'fadeIn',
  container: $('#container');
});
```

```css
#container {
  height: 600px;
  overflow: scroll;
}
```

```html
<div id="container">
  <p><img class="lazy am-img-thumbnail" data-original="img/bmw_m1_hood.jpg"
          width="765" height="574" alt="BMW M1 Hood"></p>
  <!--这里放更多图片-->
</div>
```

<style type="text/css">
  #container {
    height: 600px;
    overflow: scroll;
  }

  #container .am-img-thumbnail {
    width: 100%;
    display: block;
    height: auto;
  }
</style>

<div id="container">
  <p><img class="lazy am-img-thumbnail" data-original="img/bmw_m1_hood.jpg"
          width="765" height="574" alt="BMW M1 Hood"></p>

  <p><img class="lazy am-img-thumbnail" data-original="img/bmw_m1_side.jpg"
          width="765" height="574" alt="BMW M1 Side"></p>

  <p><img class="lazy am-img-thumbnail" data-original="img/viper_1.jpg"
          width="765" height="574" alt="Viper 1"></p>

  <p><img class="lazy am-img-thumbnail" data-original="img/viper_corner.jpg"
          width="765" height="574" alt="Viper Corner"></p>

  <p><img class="lazy am-img-thumbnail" data-original="img/bmw_m3_gt.jpg" width="765" height="574" alt="BMW M3 GT"></p>

  <p><img class="lazy am-img-thumbnail"
          data-original="img/corvette_pitstop.jpg" width="765" height="574" alt="Corvette Pitstop"></p>
</div>

<script src="../amazeui.lazyload.js"></script>
<script>
  $(function() {
    $("img.lazy").lazyload({effect: "fadeIn", container: $("#container")});
  });
</script>
