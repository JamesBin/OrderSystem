<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String selected = request.getParameter("selected");
    String lastSelected = request.getParameter("lastSelected");
    if (lastSelected != null && !"".equals(lastSelected)) {
        selected = lastSelected;
    }
    String format = request.getParameter("format");
    String momentFormat;
    if (format == null) {
        format = "yyyy-MM-dd HH:mm:ss";
        momentFormat = "YYYY-MM-DD HH:mm:ss";
    } else if (format.startsWith("yyyy-MM-dd")) {
        momentFormat = "YYYY-MM-DD" + format.substring(10);
    } else if (format.startsWith("yyyy-MM")) {
        momentFormat = "YYYY-MM" + format.substring(7);
    } else if (format.startsWith("yyyy")) {
        momentFormat = "YYYY" + format.substring(4);
    } else {
        momentFormat = format;
    }

    String start_dataTime = request.getParameter("start_dataTime");
    String end_dataTime = request.getParameter("end_dataTime");

    String start_dataTime_value = request.getParameter("start_dataTime_value");
    String end_dataTime_value = request.getParameter("end_dataTime_value");
%>

<div class="am-g">
    <div class="am-u-md-7 paddingZero">
        <select id="dateSelect" name="dateSelect" style="font-size:14px;height: 33px;width:150px;padding: 5px 25px;"  data-format="<%=momentFormat%>">
            <option <%="choose".equals(selected)?"selected":""%> value="choose">请选择日期</option>
            <option <%="today".equals(selected)?"selected":""%> value="today">今天</option>
            <option <%="yesterday".equals(selected)?"selected":""%> value="yesterday">昨天</option>
            <option <%="recentlyThreeDay".equals(selected)?"selected":""%> value="recentlyThreeDay">最近三天</option>
            <option <%="recentlyOneWeek".equals(selected)?"selected":""%> value="recentlyOneWeek">最近一周</option>
            <option <%="recentlyOneMonth".equals(selected)?"selected":""%> value="recentlyOneMonth">最近一个月</option>
            <option <%="currentMonth".equals(selected)?"selected":""%> value="currentMonth">本月</option>
            <option <%="lastMonth".equals(selected)?"selected":""%> value="lastMonth">上个月</option>
            <option <%="custom".equals(selected)?"selected":""%> value="custom">自定义</option>
        </select>
    </div>

    <div class="am-u-md-5 paddingZero">
        <div class="input-group Wdate-group">
            <div class="am-input-group am-input-group-sm">
                <input id="startTime" class="am-form-field" name="<%=start_dataTime%>" style="width: 192px;text-align: center" type="text" placeholder="起始日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',autoPickDate:true, dateFmt: '<%=format%>', isShowClear:false, readOnly:true})" value="<%=start_dataTime_value%>"/>
                <span class="am-input-group-label" style="height: 33px !important;">至</span>
                <input id="endTime" class="am-form-field" name="<%=end_dataTime%>"  style="width: 192px;text-align: center" type="text" placeholder="结束日期" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}', autoPickDate:true, dateFmt: '<%=format%>', isShowClear:false, readOnly:true})" value="<%=end_dataTime_value%>"/>
            </div>
        </div>
    </div>


</div>
