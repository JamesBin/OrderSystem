var CountMenuList = function () {
    var setContentHeight = function () {
        var height = $(window).height() - 100 + 'px';
        $('.typeContainer, .foodContainer, .orderInfo').css('height', height)
    };
    var scrollToFood = function (elements) {
        var pos = 0;
        if (elements !== "" && $(elements).length > 0) {
            var top = $(".top").val();
            pos = $(elements).offset().top;
            if (pos < top) {
                pos = parseInt(pos) + parseInt(top) - 60
            }
            $('.top').val(pos);
            $('.foodContainer').animate({scrollTop: pos - 60}, 1000)
        }
    };
    return {
        init: function () {
            $('.tips').html(' 尊敬的顾客，系统默认按照最近门店配送哦^_^');
            $('.orderInfoNullAlert').click()

            $('img.lazy').lazyload({effect: 'fadeIn', container: $('.foodContainer')});
            $('.userFunction').html('<a href="#" class="car"><span class="am-icon-shopping-cart am-icon-sm" style="display: inline">&nbsp;</span> 放入购物车</a>');
            setContentHeight();

            $('.login').on('click', function () {
                $('.tips').html('尊敬的顾客，您已授权登录，可以尽情选购！');
                $('.orderInfoNullAlert').click()
            });
            $('.cancel').on('click', function (e) {
                e.preventDefault();
                $('.am-dimmer').click()
            });
            $('.am-selected').on('click', function () {
                $('.orderInfo').animate({scrollTop: $(document).height()}, 1000)
            });
            $('.typeName').on('click', function (e) {
                e.preventDefault();
                var id = $(this).attr('data-id');
                scrollToFood(id)
            });
            $('.plus').on('click', function () {
                if ($(this).prev().length > 0) {
                    var num = $(this).prev().text();
                    $(this).prev().text(parseInt(num) + 1);
                    $(this).next().val(parseInt(num) + 1)
                } else {
                    $(this).before("<div class='am-badge am-badge-warning am-round am-text-default am-fl am-u-sm-4 delete' style='cursor:pointer' >-</div><div class='am-u-sm-4' style='display:inline-block;padding:0px !important;text-align: center'>1</div>");
                    $(this).next().val(1)
                }
            });
            $(".amount").on("click", ".delete", function () {
                var num = $(this).next().text();
                if (num > 1) {
                    $(this).next().text(parseInt(num - 1));
                    $(this).nextAll('input').val(parseInt(num - 1))
                } else {
                    $(this).nextAll('input').val(parseInt(num - 1));
                    $(this).next().remove();
                    $(this).remove()
                }
            });
            $('.typeName').on('click', function () {
                $('.typeName').css('background', 'white');
                $(this).css('background', '#CCFFCC')
            });
            $('.car_link').on('click', function () {
                $('.car').click()
            });
            $('.back').on('click', function () {
                $('.orderInfo').hide();
                $('.chooseMenu').fadeIn('slow');
                $('.userFunction').html('<a href="#" class="car"><span class="am-icon-shopping-cart am-icon-sm" style="display: inline">&nbsp;</span> 放入购物车</a>');
                $('.countTotal').siblings().remove()
            });
            $('.userFunction').on('click', '.finishOrder', function () {
                if ($('#phone').val() == "" || $('#address').val() == "") {
                    $('.tips').html(' 尊敬的顾客，下单前请填写好相关的配送信息哦^_^');
                    $('.orderInfoNullAlert').click();
                    return
                }
                var partten = /^1[3,5,8]\d{9}$/;
                if (!partten.test($('#phone').val())) {
                    $('.tips').html(' 请输入合法的手机号码');
                    $('.orderInfoNullAlert').click();
                    return
                }
                var require = $('#message').val();
                $('#orderRequire').val(require);
                $('#menuForm').submit()
            });
            $('.userFunction').on('click', '.car', function (e) {
                e.preventDefault();
                if ($(".chooseMenu").is(":hidden")) {
                    return
                }
                var size = $('[name = "size"]').val();
                var total = 0;
                for (var i = 1; i <= size; i++) {
                    var num = $('[name = "saleOrderItem_' + i + '.quantity"]').val();
                    if (num == 0) {
                        continue
                    }
                    var price = $('[name = "saleOrderItem_' + i + '.price"]').val();
                    var foodName = $('.foodName_' + i).text();
                    $('.menuList').append("<tr><td> " + $.trim(foodName) + "</td><td>×" + num + "</td><td>" + price + "</td></tr>");
                    total = total + parseInt(num) * parseFloat(price)
                }
                if (total == 0) {
                    $('.alert').click();
                    return
                }
                $('#total').val(total);
                $('.totalMoney').html("￥" + total);
                $('.chooseMenu').hide();
                $('.orderInfo').fadeIn("slow");
                $('.userFunction').html('<a href="#" class="finishOrder"> <span class="am-icon-truck am-icon-sm" style="display: inline">&nbsp;</span> 确认下单 </a>')
            })
        }
    }
}();