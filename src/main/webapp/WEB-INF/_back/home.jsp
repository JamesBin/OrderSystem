<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html ng-app>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <content tag="css">
        <link rel="stylesheet" type="text/css" href="${ctx}/resources/datatables/css/jquery.dataTables.css">
    </content>
</head>
<body>

  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>系统基本信息</small></div>
    </div>

    <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
      <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>新增用户<br/>10</a></li>
      <li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>58</a></li>
      <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>昨日访问<br/>25</a></li>
      <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>22</a></li>
    </ul>

    <div class="am-g">
      <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>ID</th><th>系统模块</th><th>状态</th><th>数据交互数</th><th>管理</th>
          </tr>
          </thead>
          <tbody>
          <tr><td>1</td><td>首页</td><td><a href="#">正常使用</a></td> <td><span class="am-badge am-badge-success">+20</span></td>
            <td>
              <div class="am-dropdown" data-am-dropdown>

                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="am-dropdown-content">
                    <li><a href="#">编辑</a></li>
                    <li><a href="#">删除</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>2</td><td>系统管理</td><td><a href="#">正常使用</a> </td><td><span class="am-badge am-badge-danger">+2</span></td>
            <td>
              <div class="am-dropdown" data-am-dropdown>
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="am-dropdown-content">
                    <li><a href="#">编辑</a></li>
                    <li><a href="#">删除</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>3</td><td>订单管理</td><td><a href="#">正常使用</a></td><td><span class="am-badge am-badge-warning">+10</span></td>
            <td>
              <div class="am-dropdown" data-am-dropdown>
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="am-dropdown-content">
                    <li><a href="#">编辑</a></li>
                    <li><a href="#">删除</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>4</td><td>报表统计</td><td><a href="#">正常使用</a></td><td><span class="am-badge am-badge-secondary">+50</span></td>
            <td>
              <div class="am-dropdown" data-am-dropdown>
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="am-dropdown-content">
                  <li><a href="#">编辑</a></li>
                  <li><a href="#">删除</a></li>
                </ul>
              </div>
            </td>
          </tr>

          </tbody>
        </table>
      </div>
    </div>

    <div class="am-g">
      <div class="am-u-md-6">
        <div class="am-panel am-panel-default">
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">系统状态<span class="am-icon-chevron-down am-fr" ></span></div>
          <div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
            <ul class="am-list admin-content-file">
              <li>
                <strong><span class="am-icon-upload"></span> 可用空间：250MB</strong>
                <p>上传速率：1MB/Sec</p>
                <div class="am-progress am-progress-striped am-progress-sm am-active">
                  <div class="am-progress-bar am-progress-bar-success" style="width: 82%">82%</div>
                </div>
              </li>
              <li>
                <strong><span class="am-icon-check"></span> CPU占用率：82%</strong>
                  <p>CPU使用量较大时，可清除部分浏览器缓存，关闭部分冗余后台任务</p>
              </li>
              <li>
                <strong><span class="am-icon-check"></span>当前使用时间：10分钟</strong>
                <p>长时间不操作系统，需要再次进行登录认证</p>
              </li>
            </ul>
          </div>
        </div>
        <div class="am-panel am-panel-default">
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-2'}">浏览器统计<span class="am-icon-chevron-down am-fr" ></span></div>
          <div id="collapse-panel-2" class="am-in">
            <table class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover">
              <tbody>
              <tr>
                <th class="am-text-center">#</th>
                <th>浏览器</th>
                <th>访问量</th>
              </tr>
              <tr>
                <%--<td class="am-text-center">--%>
                    <%--<img src="#" alt=""></td>--%>
                <td>Google Chrome</td>
                <td>3,005</td>
                <td>120</td>
              </tr>
              <tr>
                <%--<td class="am-text-center">--%>
                    <%--<img src="#" alt=""></td>--%>
                <td>Mozilla Firefox</td>
                <td>2,505</td>
                <td>67</td>
              </tr>
              <tr>
                <%--<td class="am-text-center">--%>
                    <%--<img src="#" alt=""></td>--%>
                <td>Internet Explorer</td>
                <td>1,405</td>
                <td>22</td>
              </tr>
              <tr>
                <%--<td class="am-text-center"><img src="#" alt=""></td>--%>
                <td>Opera</td>
                <td>4,005</td>
                <td>87</td>
              </tr>
              <tr>
                <%--<td class="am-text-center"><img src="#" alt=""></td>--%>
                <td>Safari</td>
                <td>505</td>
                <td>90</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="am-u-md-6">
        <div class="am-panel am-panel-default">
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">黄小吉 背景
              <span class="am-icon-chevron-down am-fr" ></span>
          </div>
          <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
            <ul class="am-list admin-content-task">
              <li>
                <div class="admin-task-meta"> Posted on 25/1/2120 by John Clark</div>
                <div class="admin-task-bd">
                    黄小吉是由华农、华工大学生创业团队开办的互联网餐饮公司，我们将互联网思维应用到餐厅的运营管理，为地球人提供健康美味的快餐与快速的送餐服务，一句话来说就是：健康最重要，小吉马上到。
                </div>
                <div class="am-cf">
                  <div class="am-btn-toolbar am-fl">
                    <div class="am-btn-group am-btn-group-xs">
                      <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button>
                      <button type="button" class="am-btn am-btn-default"><span class="am-icon-pencil"></span></button>
                      <button type="button" class="am-btn am-btn-default"><span class="am-icon-times"></span></button>
                    </div>
                  </div>
                  <div class="am-fr">
                    <button type="button" class="am-btn am-btn-default am-btn-xs">删除</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="admin-task-meta"> Posted on 25/1/2120 by 呵呵呵</div>
                <div class="admin-task-bd">
                    一年前，华农软件工程专业的曾少龙在实习时认识了毕业多年的华工师兄郭光鸿和另外两个伙伴，在郭光鸿的带领下，曾少龙和伙伴们以互联网创业餐厅黄小吉为起点，在大学生创业的道路上越走越远，现在的他们已经拥有黄小吉、拾光清吧和归客驿站三个创业项目。
                </div>
                <div class="am-cf">
                  <div class="am-btn-toolbar am-fl">
                    <div class="am-btn-group am-btn-group-xs">
                      <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button>
                      <button type="button" class="am-btn am-btn-default"><span class="am-icon-pencil"></span></button>
                      <button type="button" class="am-btn am-btn-default"><span class="am-icon-times"></span></button>
                    </div>
                  </div>
                  <div class="am-fr">
                    <button type="button" class="am-btn am-btn-default am-btn-xs">删除</button>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>

        <div class="am-panel am-panel-default">
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">最近留言
              <span class="am-icon-chevron-down am-fr" ></span>
          </div>
          <div class="am-panel-bd am-collapse am-in am-cf" id="collapse-panel-3">
            <ul class="am-comments-list admin-content-comment">
              <li class="am-comment">
                <a href="#">
                    <%--<img src="#" alt="" class="am-comment-avatar" width="48" height="48">--%>
                </a>
                <div class="am-comment-main">
                  <header class="am-comment-hd">
                    <div class="am-comment-meta">
                        <a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-12 15:30</time></div>
                  </header>
                  <div class="am-comment-bd"><p>地址: 广州市天河区天河区长福路198号 </p>
                  </div>
                </div>
              </li>

              <li class="am-comment">
                <%--<a href="#">--%>
                    <%--<img src="#" alt="" class="am-comment-avatar" width="48" height="48">--%>
                <%--</a>--%>
                <div class="am-comment-main">
                  <header class="am-comment-hd">
                    <div class="am-comment-meta">
                        <a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-12 15:30</time></div>
                  </header>
                  <div class="am-comment-bd">
                      <p> 日均销量超过300份的“黄焖鸡米饭”</p>
                  </div>
                </div>
              </li>

            </ul>
            <ul class="am-pagination am-fr admin-content-pagination">
              <li class="am-disabled"><a href="#">&laquo;</a></li>
              <li class="am-active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">&raquo;</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

  </div>

    <a href="#" class="am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}">
      <span class="am-icon-btn am-icon-th-list"></span>
    </a>



  <content tag="script">
      <script src="${ctx}/resources/datatables/js/jquery.dataTables.min.js" type="text/javascript"></script>
      <script>
          $(document).ready( function () {


              function Employee ( name, position, salary, office ) {
                  this.name = name;
                  this.position = position;
                  this.salary = salary;
                  this._office = office;
                  this.office = function () {
                      return this._office;
                  }
              };

              // 默认禁用搜索和排序
              $.extend( $.fn.dataTable.defaults, {
                  searching: false,
                  ordering:  false
              });

              $('#table_id').DataTable( {
                  data: [
                      new Employee( "Tiger Nixon", "System Architect", "$3,120", "Edinburgh" ),
                      new Employee( "Garrett Winters", "Director", "$5,300", "Edinburgh" )
                  ],
                  columns: [
                      { data: 'name' },
                      { data: 'salary' },
                      { data: 'office()' },
                      { data: 'position' }
                  ],

                  dom: '<"float_left"f>r<"float_right"l>tip',
                  ordering: true,
                  language: {
                          'emptyTable': '没有数据',
                          'loadingRecords': '加载中...',
                          'processing': '查询中...',
                          'search': '检索:',
                          'lengthMenu': '每页 _MENU_ 条记录',
                          'zeroRecords': '没有数据',
                          'paginate': {
                              "first":      "首页",
                              "last":       "尾页",
                              "next":       "下一页",
                              "previous":   "上一页"
                          },
                          'info': '第 _PAGE_ 页 / 总 _PAGES_ 页',
                          'infoEmpty': '没有数据',
                          'infoFiltered': '(过滤总件数 _MAX_ 条)'
                  }
              });
          });
      </script>
  </content>

</body>
</html>
