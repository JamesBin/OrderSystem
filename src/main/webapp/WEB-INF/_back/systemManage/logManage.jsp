<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js">
<head>
    <title>日志管理</title>
</head>

<body>
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">错误日志</strong> / <small>Error Log</small></div>
        </div>
        <hr/>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核
                        </button>
                        <a class="am-btn am-btn-default delAll"><span class="am-icon-trash-o"></span> 删除所选项</a>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-form-group">
                    <div class="am-form-group">
                        <jsp:include page="/WEB-INF/common/dateTime.jsp">
                            <jsp:param name="selected" value="choose"/>
                            <jsp:param name="lastSelected" value=""/>
                            <jsp:param name="start_dataTime" value="start_createTime"/>
                            <jsp:param name="end_dataTime" value="end_createTime"/>
                            <jsp:param name="start_dataTime_value" value=""/>
                            <jsp:param name="end_dataTime_value" value=""/>
                        </jsp:include>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3" style="padding-left: 40px;height: 33px">
                <div class="am-input-group am-input-group-sm">
                    <select data-am-selected="{btnSize: 'sm',btnWidth: '80%'}" >
                        <option value="-1">选择日志类型</option>
                        <option value="option1">Debug</option>
                        <option value="option2">Info</option>
                        <option value="option3">Error</option>
                    </select>
                <span class="am-input-group-btn">
                      <button type="submit" class="am-btn am-btn-default" type="button"><span class="am-icon-search">&nbsp;</span>搜索</button>
                </span>
                </div>
            </div>
        </div>

        <div class="am-g error-log">
            <div class="am-u-sm-12 am-u-sm-centered">
                <pre class="am-pre-scrollable">
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                    <span class="am-text-success">[Tue Jan 11 17:32:52 2013]</span> <span class="am-text-danger">[error]</span> [google 123.124.2.2] client denied by server: /export/home/macadmin/testdoc - no such file
                </pre>
            </div>
        </div>
    </div>
</div>

    <content tag="script">
        <script src="${ctx}/resources/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
        <script src="${ctx}/resources/select2/select2.min.js" type="text/javascript"></script>
        <script src="${ctx}/resources/select2/select2_locale_zh-CN.js" type="text/javascript"></script>
        <script src="${ctx}/resources/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        <script src="${ctx}/resources/js/back/batchOperation.js" type="text/javascript"></script>
        <script src="${ctx}/resources/js/common/customDateTime.js" type="text/javascript"></script>
        <script>
            $(function () {
                BatchOperation.init("items", "item");
                CustomDateTime.init();
            });
        </script>
    </content>

 <%--   <!--[if lt IE 9]>
    &lt;%&ndash;<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>&ndash;%&gt;
    &lt;%&ndash;<script src="/js/amazeui.ie8polyfill.min.js"></script>&ndash;%&gt;
    &lt;%&ndash;<![endif]-->&ndash;%&gt;

    &lt;%&ndash;<!--[if (gte IE 9)|!(IE)]><!-->&ndash;%&gt;
    &lt;%&ndash;<!--<![endif]-->&ndash;%&gt;
    &lt;%&ndash;<script src="/js/amazeui.min.js"></script>&ndash;%&gt;
    &lt;%&ndash;<script src="/js/app.js"></script>&ndash;%&gt;--%>

</body>
</html>
