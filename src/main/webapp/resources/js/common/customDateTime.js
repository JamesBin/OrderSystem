var CustomDateTime=function(){var initMy97DatePicker=function(){$("#startTime, #endTime").focus(function(){$("#dateSelect").val("custom").trigger("change")});var dateSelect=function(){var format=$('#dateSelect').attr('data-format');if(!format){format="YYYY-MM-DD HH:mm:ss"}switch($("#dateSelect").val()){case"choose":$("#startTime").val("");$("#endTime").val("");break;case"yesterday":$("#startTime").val(moment().add(-1,'day').startOf("day").format(format));$("#endTime").val(moment().add(-1,'day').endOf("day").format(format));break;case"today":$("#startTime").val(moment().startOf("day").format(format));$("#endTime").val(moment().endOf("day").format(format));break;case"recentlyThreeDay":$("#startTime").val(moment().add(-2,'day').startOf("day").format(format));$("#endTime").val(moment().endOf("day").format(format));break;case"recentlyOneWeek":$("#startTime").val(moment().add(-6,'day').startOf("day").format(format));$("#endTime").val(moment().endOf("day").format(format));break;case"recentlyOneMonth":$("#startTime").val(moment().add(-1,'month').startOf("day").format(format));$("#endTime").val(moment().endOf("day").format(format));break;case"currentMonth":$("#startTime").val(moment().startOf("month").startOf("day").format(format));$("#endTime").val(moment().endOf("month").endOf("day").format(format));break;case"lastMonth":$("#startTime").val(moment().add(-1,'month').startOf("month").startOf("day").format(format));$("#endTime").val(moment().add(-1,'month').endOf("month").endOf("day").format(format));break;case"custom":default:}};$("#dateSelect").bind("change",function(e){dateSelect()});if($("#startTime").val()!=undefined&&$("#startTime").val()!=""&&$("#endTime").val()!=undefined&&$("#endTime").val()!=""){return}dateSelect()};return{init:function(){initMy97DatePicker()}}}();