/* create by zwb 2016-3-2*/

$(function () {
    var width = $(window).width();
    var height = $(window).height();
    $('.header').after('<div class="loading" style="height: ' + height + 'px;background-color:#FFCC66"><img src="../resources/img/loading.gif" style="vertical-align:middle" width="' + width + 'px"><div>')

    var isNullOrder = $('.nullOrder').length;
    if (isNullOrder > 0) {
        setTimeout("$('.loading').fadeOut();$('.loading').remove();", 1000);
        setTimeout("$('.orderPanel').css('display', 'block');", 1000);
        return;
    }

    $.ajax({
        url: '../order/ajaxGetHistoryOrderItem',
        method: 'GET',
        data: {},
        success: function (data) {
            setTimeout("$('.loading').fadeOut();$('.loading').remove();", 1000);
            setTimeout("$('.orderPanel').css('display', 'block');", 1000);

            $.each($.parseJSON(data.data), function (i, item) {
                $('.' + item.orderId).prepend('<tr><td width="50%">' + item.foodName + '</td><td width="25%">×' + item.quantity + '</td><td width="25%">' + item.price + '元</td> </tr>');
            });

            $.each($.parseJSON(data.comment), function (i, item) {
                if ($('.' + item.orderId).parent().next().find('.toComment').length > 0) {
                    $('.' + item.orderId).parent().next().find('.toComment').attr('data-commentId', item.id);
                }

                if (item.reply != null) {
                    $('.' + item.orderId).next().after('<blockquote class="reply">商家回复：' + item.reply + '</blockquote>');
                }
                if (item.comment != null) {
                    $('.' + item.orderId).next().after('<blockquote style="margin: 5px;">你 :<span class="myComment">' + item.comment + '</span></blockquote>');
                }
            });
        },
        error: function () {
            alert('ur oh! 获取商品明细出现了问题');
        }
    });
});

$('.zhan').click(function () {
    var left = parseInt($(this).offset().left) + 10, top = parseInt($(this).offset().top) - 10, obj = $(this);
    $(this).append('<div id="zhan"><b>+1</b></div>');
    $('#zhan').css({
        'position': 'absolute',
        'z-index': '1',
        'color': '#C30',
        'left': left + 'px',
        'top': top + 'px'
    }).animate({top: top - 10, left: left + 10}, 'slow', function () {
        $(this).fadeIn('fast').remove();
        var Num = parseInt(obj.find('span').text());
        Num++;
        obj.find('span').text(Num);
    });

    return false;
});

$('#toPay').on('click', function (e) {
    e.preventDefault();
    var orderId = $(this).attr("data-id");
    var amount = $(this).attr("data-total");
    window.location.href = "../pay/makeNewPay?orderId=" + orderId + "&amount=" + amount;
})

$('.toComment').on('click', function (e) {
    e.preventDefault();
    var orderNo = $(this).attr('data-orderNo');
    var orderId = $(this).attr('data-id');
    var commentId = $(this).attr('data-commentId');
    $('.commentNo').html('订单号：' + orderNo + '');
    $('#orderId').val(orderId);
    $('#commentId').val(commentId);
    $('#comment').val("");
    $('.comment').removeClass('onFocusCommentPanel');
    $('.comment').addClass('commentPanel');
    $('.comment').addClass('am-animation-slide-bottom');
    $('.comment').show();
    $.fn.raty.defaults.path = '../resources/raty/lib/img';
    $('#star').raty({ score: 1 });
});

$('.back').on('click', function (e) {
    e.preventDefault();
    $('.comment').removeClass('am-animation-slide-bottom');
    $('.comment').hide();
    $('.comment').removeClass('onFocusCommentPanel');
    $('.comment').addClass('commentPanel');
});

$('#comment').focus(function () {
    $('.comment').removeClass('am-animation-slide-bottom');
    $('.comment').addClass('onFocusCommentPanel');
    $('.comment').removeClass('commentPanel');
});

$('.saveComment').on('click', function (e) {
    e.preventDefault();
    var grade = $('#star').raty('getScore');
    $('#grade').val(grade);

    $.ajax({
        url: '../user/saveComment',
        type: "POST",
        data: $('#commentForm').serialize(),
        success: function () {
            var orderId = $('#orderId').val();
            var comment = $('#comment').val();
            $('.' + orderId).parent().find('.myComment').text(comment);
            $('.comment').hide();
            $('.alert').click();
        },
        error: function () {
            alert('ur oh! 评论出现问题，请联系管理员');
        }
    });
});