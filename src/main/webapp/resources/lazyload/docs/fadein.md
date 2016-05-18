---
title: 淡入效果
prev: container.html
next: timeout.html
---

# 淡入效果
---

使用了 jQuery [fadeIn](http://docs.jquery.com/Effects/fadeIn) 方法。


```js
$('img.lazy').lazyload({
  effect : 'fadeIn'
});
```

```html
<p><img class="lazy am-img-thumbnail" data-original="img/bmw_m1_hood.jpg"
        width="765" height="574" alt="BMW M1 Hood"></p>
```

<style>
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

  <p><img class="lazy am-img-thumbnail" data-original="img/bmw_m3_gt.jpg"
          width="765" height="574" alt="BMW M3 GT"></p>

  <p><img class="lazy am-img-thumbnail"
          data-original="img/corvette_pitstop.jpg" width="765" height="574"
          alt="Corvette Pitstop"></p>
</div>

<script src="../amazeui.lazyload.js"></script>
<script>
  $(function() {
    $("img.lazy").lazyload({
      effect: "fadeIn"
    });

  });
</script>
