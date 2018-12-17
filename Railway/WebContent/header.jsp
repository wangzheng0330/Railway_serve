<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"  %>
<%@ page import="java.sql.Time,mypack.util.*,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,java.util.ArrayList,java.util.Date" %>

<!DOCTYPE html>
<html>

<link href="css/init_css.css" rel="stylesheet" />
<link href="css/cityselect.css" rel="stylesheet" />
<%request.setCharacterEncoding("UTF-8"); %>
<head>
<script type="text/javascript" src="js/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div style="z-index: 2000" class="header-bd">
			<h1 class="logo">王铮铁路客户服务中心-客运中心</h1>
			<div class="login-info">
				<div class="menu">
					<a href="myinformation.jsp" class="menu-bd" id="js-my">我的账号</a>
				</div>
				<span class="login-txt" style="color: #666666">
					<span>意见反馈:<a class="cursor colorA" href="mailto:6937671@qq.com">6937671@qq.com</a>
					<%if(session.getAttribute("now_username")!=null){ %>
						
						您好，<a class="menu-bd" href="myinformation.jsp"><%=session.getAttribute("now_username") %></a>
						<a href="exit.jsp" target="_top">退出</a>
					<%}else{ %>
				          您好，请
				     </span>
						<a id="login_user" href="login.jsp" class="colorA" style="margin-left:-0.5px;">登录</a>
						|<a id="regist_out" href="register.jsp">注册</a>
						<%} %>
				</span>
			</div>
			<div class="nav">
				<ul>
					<li><a href="init.jsp">客运首页</a></li>
					<li id="selectYuding"><a href="ticket_reserve.jsp">车票预订</a></li>
					<li><a href="forget_pwd.jsp">忘记密码</a></li>
					<li><a href="tieluchangxing.jsp" >铁路畅行</a></li>
					<li><a href="canyin.jsp" >餐饮•特产</a></li>
					<li><a href="#">出行向导</a></li>
					<li id="selectHelp"><a href="myinformation.jsp">信息服务</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>