---
title: 设置图片加载时机
prev: fadein.html
---

# 设置加载时机
---

下面的示例中，页面加载完成 5 秒以后触发 `sporty` 事件时才会执行图片懒加载。

```js
$(function() {
  $('img.lazy').lazyload({
    event : 'sporty'
  });
});

$(window).bind('load', function() {
  var timeout = setTimeout(function() {
    $('img.lazy').trigger('sporty');
  }, 5000);
});
```

```html
<p><img class="lazy am-img-thumbnail" data-original="img/bmw_m1_hood.jpg"
        width="765" height="574" alt="BMW M1 Hood"></p>
```

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
    $("img.lazy").lazyload({
      event: "sporty"
    });
  });
  $(window).on("load", function() {
    var timeout = setTimeout(function() {
      $("img.lazy").trigger("sporty");
    }, 5000);
  });
</script>
