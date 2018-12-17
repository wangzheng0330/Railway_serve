<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>铁路服务|车票预订</title>
<style type="text/css">
.breadcrumb {
    height: 32px;
    line-height: 32px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="min-height: 515px;">
<div class="breadcrumb">您现在的位置：<a href="init.jsp">客运首页</a>&nbsp;>&nbsp;<a href="ticket_reserve.jsp">车票预定</a></div>
<div class="no-ticket" style="width: 500px;
    margin: 120px 240px 120px 240px;
    height: 66px;
    line-height: 33px;
     display: block;
    float: left;
    margin-right: 10px;" ><span class="i-no" style="display: block;
        background: url(image/bg02.png) repeat-x;
    float: left;
    margin-right: 10px;
   
    display: block;
    width: 66px;
    height: 66px;
    background-position: -60px 0;"></span>
		<p style="line-height: 30px;
    font-size: 16px;
    color: #aaa;
    font-weight: 700;
    padding-top: 5px;">很抱歉，此页面预计于<span style="color: red;">2019年1月1日</span>开放，如您想在此日期之前购买车票。您可以点击<a style="color:#07f" href="init.jsp">客运首页</a>
		，重新查询您需要的列车余票情况。</p>
		</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>