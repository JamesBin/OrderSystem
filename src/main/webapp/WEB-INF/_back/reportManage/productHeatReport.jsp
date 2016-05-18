<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js">
<head>
    <title>商品热度报表</title>
</head>

<body>
<div class="admin-content">
    <div id="container2" style="min-width:400px;height:400px"></div>
    <div id="container" style="min-width:700px;height:400px"></div>
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<content tag="script">
    <script src="${ctx}/resources/Highcharts-4.2.3/js/highcharts.js"></script>
    <script src="${ctx}/resources/Highcharts-4.2.3/js/modules/exporting.js"></script>
    <script src="${ctx}/resources/Highcharts-4.2.3/js/highcharts-3d.js"></script>
    <script >
        $(function () {
            $.ajax({
                type: 'get',
                url: '../back/ajaxProductHeatData',
                success: function (result) {
                    printPieChart(result.data);
                    printBarChart(result.num, result.name);
                },
                error: function () {
                    alert('获取商品销售热度报表的请求出现问题');
                }
            });
        });

            function printPieChart(data) {
            var data = $.parseJSON(data);
            $('#container').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    }
                },
                title: {
                    text: '各商品销售情况比例'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '比例',
                    data: data
                }]
            });
        }

        function printBarChart(num, name) {
            var num = $.parseJSON(num);
            var name = $.parseJSON(name);
            $('#container2').highcharts({
                chart: {
                    type: 'column',
                    margin: 75,
                    options3d: {
                        enabled: true,
                        alpha: 0,
                        beta: 25,
                        depth: 70
                    }
                },
                title: {
                    text: '各商品销售热度报表'
                },
                subtitle: {
                    text: '仅供热销商品分析'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    categories: name
                },
                yAxis: {
                    opposite: true
                },
                series: [{
                    name: '销售量',
                    data: num
                }]
            });
        }

    </script>

</content>

</body>
</html>
