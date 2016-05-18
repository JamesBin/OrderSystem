<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js">
<head>
    <title>门店月销售额报表</title>
</head>

<body>
<div class="admin-content">
    <div id="container" style="padding-top: 10px;"></div>
    <div id="container2" style="min-width:400px;height:400px"></div>
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<content tag="script">
    <script src="${ctx}/resources/Highcharts-4.2.3/js/highcharts.js"></script>
    <script src="${ctx}/resources/Highcharts-4.2.3/js/modules/exporting.js"></script>
    <script>
        $(function () {
            $.ajax({
                type: 'get',
                url: '../back/ajaxMonthSaleData',
                success: function (result) {
                    printLineChart(result.data);
                    printBarChart(result.data)
                    console.log(result.data);
                },
                error: function () {
                    alert('获取月销售报表的请求出现问题');
                }
            });
        });

        function printLineChart(data) {
            var data = $.parseJSON(data);
            $('#container').highcharts({
                title: {
                    text: '各门店销售额月报表',
                    x: -20 //center
                },
                subtitle: {
                    text: '仅供盈利趋势分析',
                    x: -20
                },
                xAxis: {
                    categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                },
                yAxis: {
                    title: {
                        text: '月销售额 (/元)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '元'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: data
            });
        }


        function printBarChart(data) {
            var data = $.parseJSON(data);
            $('#container2').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '各门店销售额月报表'
                },
                subtitle: {
                    text: '仅供门店销售额对比分析'
                },
                xAxis: {
                    categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '月销售额 (/元)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: data
            });
        }
    </script>

</content>

</body>
</html>
