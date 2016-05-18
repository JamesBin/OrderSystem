<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/_front/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no"/>
    <title>订单评论</title>
    <link rel="stylesheet" href="${ctx}/resources/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/decorator.css"/>
    <link rel="stylesheet" href="${ctx}/resources/emojiRatings/css/normalize.css" />
    <link rel="stylesheet" href="${ctx}/resources/emojiRatings/css/default.css">
    <script src="${ctx}/resources/assets/js/jquery.min.js"></script>
    <!--[if IE]>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->

</head>

<body>
<header data-am-widget="header"
        class="am-header am-header-default" style="background-color: #5ABA5C !important;">
    <div class="am-header-left am-header-nav">
        <a href="${ctx}/store" class="">
            <i class="am-header-icon am-icon-home"></i>
        </a>
        <a href="#phone-link" class=""
           data-am-modal="{target: '#phone-modal', closeViaDimmer: 0, width: 300, height: 130}">
            <i class="am-header-icon am-icon-phone"></i>
        </a>
    </div>
    <h1 class="am-header-title"><span class="titleTips">订单评价</span>
    </h1>

<div><button class="am-btn am-btn-warning am-animation-fade am-btn-block reply">您有一条订单还未评论哦，点击评论</button></div>

<div class="am-g">
    <div class="am-u-sm-12">

        <article class="am-comment" style="padding-top: 10px;"><a href="#link-to-user-home">
            <img src="${headimgurl}" alt=""
                 class="am-comment-avatar"
                 width="48" height="48"></a>

            <div class="am-comment-main">
                <header class="am-comment-hd">
                    <div class="am-comment-meta">
                        <a href="#link-to-user" class="am-comment-author">某人</a>
                        评论于
                        <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12
                            15:30
                        </time>
                    </div>

                </header>

                <div class="am-comment-bd">
                    <p>配送的速度太、太、太慢了，味道还是可以的，其余的就是。无言了。。。</p>
                    <blockquote style="color: #F37B1D">商家回复：非常抱歉，我们会改进这个配送速度的，感谢您的光顾。</blockquote>
                </div>

                <footer class="am-comment-footer">
                    <div class="am-comment-actions">
                        <a href=""><i class="am-icon-thumbs-up"></i></a>
                        <a href=""><i class="am-icon-thumbs-down"></i></a>
                        <a href=""><i class="am-icon-reply"></i></a>
                    </div>
                </footer>
            </div>
        </article>
    </div>

    <div class="am-u-sm-12">

        <article class="am-comment" style="padding-top: 10px;"><a href="#link-to-user-home">
            <img src="${headimgurl}" alt=""
                 class="am-comment-avatar"
                 width="48" height="48"></a>

            <div class="am-comment-main">
                <header class="am-comment-hd">
                    <div class="am-comment-meta">
                        <a href="#link-to-user" class="am-comment-author">某人</a>
                        评论于
                        <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12
                            15:30
                        </time>
                    </div>

                </header>

                <div class="am-comment-bd">
                    <p>配送的速度太、太、太慢了，味道还是可以的，其余的就是。无言了。。。</p>
                    <blockquote style="color: #F37B1D">商家回复：非常抱歉，我们会改进这个配送速度的，感谢您的光顾。</blockquote>
                </div>

                <footer class="am-comment-footer">
                    <div class="am-comment-actions">
                        <a href=""><i class="am-icon-thumbs-up"></i></a>
                        <a href=""><i class="am-icon-thumbs-down"></i></a>
                        <a href=""><i class="am-icon-reply"></i></a>
                    </div>
                </footer>
            </div>
        </article>
    </div>

    <div class="am-u-sm-12">

        <article class="am-comment" style="padding-top: 10px;"><a href="#link-to-user-home">
            <img src="${headimgurl}" alt=""
                 class="am-comment-avatar"
                 width="48" height="48"></a>

            <div class="am-comment-main">
                <header class="am-comment-hd">
                    <div class="am-comment-meta">
                        <a href="#link-to-user" class="am-comment-author">某人</a>
                        评论于
                        <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12
                            15:30
                        </time>
                    </div>

                </header>

                <div class="am-comment-bd">
                    <p>配送的速度太、太、太慢了，味道还是可以的，其余的就是。无言了。。。</p>
                    <blockquote style="color: #F37B1D">商家回复：非常抱歉，我们会改进这个配送速度的，感谢您的光顾。</blockquote>
                </div>

                <footer class="am-comment-footer">
                    <div class="am-comment-actions">
                        <a href="#"><i class="am-icon-thumbs-up"></i></a>
                        <a href="#"><i class="am-icon-thumbs-down"></i></a>
                        <a href="#"><i class="am-icon-reply"></i></a>
                    </div>
                </footer>
            </div>
        </article>
    </div>
</div>

<div class="am-g comment" style="position: fixed;bottom: 40px;z-index: 10;background-color: white">
    <div class="am-u-sm-12">
        <form class="am-form" method="post" action="#">
            <div class="am-form-group">
                <textarea rows="5" placeholder="请输入您的评价"></textarea>
            </div>

            <div class="am-form-group">
                <label for="score">服务评分:</label>
                <span id="score" class="emoji2" style="color:red"></span>
            </div>

            <div class="am-form-group">
                <button class="am-btn am-btn-success">提交</button>
                <button class="am-btn am-btn-default back">返回</button>
            </div>
        </form>
    </div>
</div>


<jsp:include page="/WEB-INF/_front/common/footer.jsp"/>

<content tag="script">
    <script type="text/javascript" src="${ctx}/resources/emojiRatings/src/jquery.emojiRatings.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#score").emojiRating({
                emoji: 'U+2764',
                fontSize: 30,
                count: 5,
                inputName: 'score'
            });

            $('.comment').hide();
        });

        $('.reply').on('click', function (e) {
            e.preventDefault();
            $('.comment').addClass('am-animation-slide-bottom');
            $('.comment').show();
            $('.reply').hide();
        });

        $('.back').on('click', function (e) {
            e.preventDefault();
            $('.reply').show();
            $('.comment').removeClass('am-animation-slide-bottom');
            $('.comment').fadeOut();
        });
    </script>
</content>
</body>
</html>