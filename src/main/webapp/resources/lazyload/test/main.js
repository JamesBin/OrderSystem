'use strict';

var $ = require('jquery');
require('../jquery.lazyload');

// global.jQuery = $;

$(function() {
  $('.lazy').lazyload({
    effect : 'fadeIn'
  });
});
