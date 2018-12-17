<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="mypack.bean.*,mypack.Dao.*,mypack.util.*,java.util.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="users" class="mypack.bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="users"/>
<!DOCTYPE html>
<html>
<link href="css/init_css.css" rel="stylesheet" />
<link href="css/ticketlist_css.css" rel="stylesheet" />
<head>
	<meta charset="UTF-8">
	
	<title>王铮铁路客户服务中心</title>
</head>
<body>

	<jsp:include page="header.jsp" flush="true"></jsp:include>
	
	<%
		 String str="start_station='"+request.getParameter("chufadi")+"' and end_station='"+request.getParameter("mudidi")+"'";
    	System.out.println(str);
    %>
	<%request.setAttribute("where", str); %>
	
	<section>
	<div class="content" style="min-height: 550px;">
			<div class="crumbs">
			    	您现在的位置：<a href="init.jsp" shape="rect">客运首页</a>
			&nbsp;>&nbsp;<a href="buy_ticket.jsp" shape="rect">查询车次</a>
			</div>
<script type="text/javascript">
	function Serch(){
		document.frmSerch.where.value = "train_num like '%"+document.frmSerch.serchContent.value+"%'";
		alert(document.frmSerch.where.value);
		document.frmSerch.submit();
	}
</script>
<%
	//String currentPage = request.getParameter("currentPage");
	int iCurrentPage = 2;
	/* try{
		iCurrentPage = Integer.parseInt(currentPage);
	}
	catch(Exception ex){} */
	
	String where = request.getAttribute("where")==null?"":(String)request.getAttribute("where");
	if(where==null||where==""){
		out.println("<script>alert('error!');</script>");
	}
	PageBean<TrainBean> userPageBean = new UserDao().getUserPageBean(where, iCurrentPage, 100, "");
	if(userPageBean.getPageData()==null){
		%>
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
    padding-top: 5px;">很抱歉，按您的查询条件，当前未找到从<span id="no_filter_ticket_fromstation"><%=request.getParameter("chufadi") %></span>
		到<span id="no_filter_ticket_tostation"><%=request.getParameter("mudidi") %></span>
		的列车。您可以<a style="color:#07f" href="init.jsp">重新选择</a>
		，重新查询您需要的列车余票情况。</p>
		</div>
		<% 
	}else{
%>
<form action="sure_buyticket.jsp" method="post" name="frmContent" onsubmit="return supanduan()">
	<input type="hidden" name="username" value="<%= session.getAttribute("now_username")%>">
	<input type="hidden" name="chufadi" value="<%= request.getParameter("chufadi")%>">
	<input type="hidden" name="mudidi" value="<%= request.getParameter("mudidi")%>">
	<input type="hidden" name="gotime" value="<%= request.getParameter("gotime")%>">
	<div class="ticketlist">
	<table class="ticketlist">
		<tr class="shou-th">
			<td>预定</td>
			<td>车次</td>
			<td>始发站</td>
			<td>终到站</td>
			<td>发车时间</td>
			<td>到达时间</td>
			<td>二等座价格</td>
			<td>一等座价格</td>
			<td>商务座价格</td>
			<td>二等座余票</td>
			<td>一等座余票</td>
			<td>商务座余票</td>
		</tr>
<%
	if(userPageBean.getPageData()!=null){
		for(TrainBean train : userPageBean.getPageData())	{
%>
		<tr class="info-ticket">
			<td><input type="radio" name="TrainId" value="<%=train.getTrain_num() %>"></td>
			<td><strong><%= train.getTrain_num() %></strong></td>
			<td><%=train.getStart_station() %></td>
			<td><%=train.getEnd_station() %></td>
			<td><%=train.getStart_time() %></td>
			<td><%=train.getEnd_time() %></td>
			<td>¥&nbsp;<%= train.getTwo_price() %></td>
			<td>¥&nbsp;<%= train.getOne_price() %></td>
			<td>¥&nbsp;<%= train.getBusiness_price() %></td>
			<td><%= train.getTwo_seat_num() %></td>
			<td><%= train.getOne_seat_num() %></td>
			<td><%= train.getBusiness_seat_num() %></td>
		</tr>
	<%}}%>
	</table>
	<div style="text-align:center; height:40px; margin: 5px; padding: 10px;">
		<input type="image" name="submit" src="image/xiayibu.png" onclick="document.formName.submit()">
	</div>
	</div>
</form>
<script type="text/javascript">
	function SelectALL(currentChk){
		var listUser = document.getElementsByName("chkUserName");
		for(var i=0;i<listUser.length;i++){
			listUser[i].checked = currentChk.checked;
		}
	}
	function supanduan(){
		var s = document.frmContent.TrainId.value;
		if(s == null || s == ""){
			alert("请选择票!");
			return false;
		}
		return true;
	}
</script>
</div>
<%} %>
	</section>
	
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>