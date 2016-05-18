<%@ tag import="com.jfinal.plugin.activerecord.Page" %>
<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="com.jfinal.plugin.activerecord.Page" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Page pageList = (Page) request.getAttribute("pageList");
    if (pageList == null) {
        return;
    }

    int num = pageList.getPageNumber();
    int total = pageList.getTotalRow();
    int length = pageList.getList().size();
    int pageSize = pageList.getPageSize();
    int totalPages = pageList.getTotalPage();
    Boolean hasPrevious = true;
    Boolean hasNext = true;
    if (num == 1) {hasPrevious = false;}
    if (num == totalPages) {hasNext = false;}
    request.setAttribute("num", num);
    request.setAttribute("total", total);
    request.setAttribute("hasNext", hasNext);
    request.setAttribute("length", length);
    request.setAttribute("hasPrevious", hasPrevious);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totalPages", totalPages);
%>

<input type="hidden" name="pageNo" value="${num}">
<input type="hidden" name="pageSize" value="${pageSize}">

<div class="am-g">
    <div class="am-u-sm-5 paddingRightZero" style="padding-top: 15px;">
        <c:choose>
            <c:when test="${length == 0}">
                显示0项,共0项，
                页码：[ 1 / 1 ]，
            </c:when>
            <c:otherwise>
                显示${(num - 1 ) * pageSize + 1} - ${(num - 1) * pageSize + length }项，共${total}项，
                页码：[ ${num} / ${totalPages} ]，
            </c:otherwise>
        </c:choose>

        每页
        <select id="pageSelect" style="display:inline-block;width: 60px;">
            <option <c:if test="${pageSize == 5}">selected="true"</c:if> >5</option>
            <option <c:if test="${pageSize == 10}">selected="true"</c:if> >10</option>
            <option <c:if test="${pageSize == 20}">selected="true"</c:if>>20</option>
        </select>
        <input type="hidden" name="total" value="${total}">
        条
    </div>

    <div class="am-u-sm-7">
        <ul class="am-pagination am-fr" style="padding: 0px;">
            <c:choose>
                <c:when test="${totalPages == 1 or hasPrevious == false }">
                    <li class="am-disabled"><a href="#">首页</a></li>
                    <li class="am-disabled"><a href="#"><span aria-hidden="true">上一页</span></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="javascript:pageChange(1)" aria-label="Previous">首页</a></li>
                    <li><a href="javascript:pageChange(${num - 1})" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>
                </c:otherwise>
            </c:choose>
            <%
                int currentPage = pageList.getPageNumber();
                int totalPage = pageList.getTotalPage();
                if(totalPage < 5){
                    for(int j = 1; j <= totalPage; j++) {
                        if(currentPage == j) {
                            out.print("<li class='am-active'><a href='#'>" + j + "</a></li>");
                        }else{
                            out.print("<li><a href='javascript:pageChange("+ j +")'>" + j + "</a></li>");
                        }
                    }
                }
                else{
                    if(currentPage == 1) {
                        out.print("<li class='am-active'><a href='#'>" + currentPage + "</a></li>");
                        for(int j = 2; j <= 5; j++) {
                            out.print("<li><a href='javascript:pageChange("+ j +")'>" + j + "</a></li>");
                        }
                    }
                    if(currentPage == 2) {
                        out.print("<li><a href='javascript:pageChange(1)'>1</a></li>");
                        out.print("<li class='am-active'><a href='#'>" + currentPage + "</a></li>");
                        for(int j = 3; j <= 5; j++) {
                            out.print("<li><a href='javascript:pageChange("+ j +")'>" + j + "</a></li>");
                        }
                    }

                    if(currentPage >= 3 && currentPage <= totalPage - 2) {
                        for (int i = currentPage - 2; i <= currentPage + 2; i++) {
                            if (i == currentPage) {
                                out.print("<li class='am-active'><a href='#'>" + i + "</a></li>");
                            }
                            else {
                                out.print("<li><a href='javascript:pageChange("+ i +")'>" + i +"</a></li>");
                            }
                        }
                    }

                    if(currentPage == (totalPage - 1)) {
                        for(int j = totalPage - 4; j < totalPage - 1; j++) {
                            out.print("<li><a href='javascript:pageChange("+ j +")'>" + j + "</a></li>");
                        }
                        out.print("<li class='am-active'><a href='#'>" + currentPage  + "</a></li>");
                        out.print("<li><a href='javascript:pageChange("+ totalPage +")'>" + totalPage + "</a></li>");
                    }

                    if(currentPage == totalPage) {
                        for(int j = totalPage - 4; j < totalPage; j++) {
                            out.print("<li><a href='javascript:pageChange("+ j +")'>" + j + "</a></li>");
                        }
                        out.print("<li class='am-active'><a href='#'>" + totalPage  + "</a></li>");
                    }
                }
            %>

            <c:choose>
                <c:when test="${totalPages == 1 or hasNext == false or length == 0}">
                    <li class = "am-disabled"><a href="#" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>
                    <li class="am-disabled"><a href="#" aria-label="Previous">尾页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="javascript:pageChange(${num + 1})" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>
                    <li><a href="javascript:pageChange(${totalPages})" aria-label="Previous">尾页</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>

<content tag="pageScript">
    <script>
        $(function() {
            var pageSize = $('[name = "pageSize"]').val();
            if(pageSize == "") {
                $('[name = "pageSize"]').val(5);
            }

            $('[type = "submit"]').on('click', function() {
                $('[name = "pageNo"]').val(1);
            });

            $('#pageSelect').on('change', function() {
                var pageSize = $('#pageSelect option:selected').val();
                if(pageSize == "全部") {
                    $('[name="pageSize"]').val(-1);
                } else{
                    $('[name="pageSize"]').val(pageSize);
                }
                $('[name="pageNo"]').val(1);
                $('#listForm').submit();
            });
        });
        function pageChange(num) {
            $('[name="pageNo"]').val(num);
            $('#listForm').submit();
        }
    </script>
</content>

