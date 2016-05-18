<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js">
<head>
    <title>门店销售额年报表</title>
</head>

<body>
<div class="admin-content">
    <div id="container"></div>
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
                    url: '../back/ajaxYearSaleData',
                    success: function (result) {
                        printLineChart(result.data, result.year);
                        printBarChart(result.data, result.year)
                    },
                    error: function () {
                        alert('获取年销售报表的请求出现问题');
                    }
                });
            });


            function printLineChart(data, year) {
                var data = $.parseJSON(data);
                var year = $.parseJSON(year);
                $('#container').highcharts({
                    title: {
                        text: '各门店销售额年报表',
                        x: -20 //center
                    },
                    subtitle: {
                        text: '仅供盈利趋势分析',
                        x: -20
                    },
                    xAxis: {
                        categories: year
                    },
                    yAxis: {
                        title: {
                            text: '年销售额 (/元)'
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

            function printBarChart(data, year) {
                var data = $.parseJSON(data);
                var year = $.parseJSON(year);
                $('#container2').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '各门店销售额年报表'
                    },
                    subtitle: {
                        text: '仅供年销售额对比分析'
                    },
                    xAxis: {
                        categories: year,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '年销售额 (/元)'
                        }
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
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
