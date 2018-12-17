<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.sql.Time,mypack.util.*,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,java.util.ArrayList,java.util.Date" %>
<link href="css/myinfo.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<title>王铮铁路客户服务中心</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		new DBUtil();
		Connection conn  = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs=null;
		String username = (String)session.getAttribute("now_username");
		String sql = "select name,num,email,tel from user where username='"+username+"';";
		String truename = null,id_pass=null,email=null,tel=null;
		int sex=0;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()){
			truename=rs.getString(1);
			id_pass=rs.getString(2);
			email = rs.getString(3);
			tel = rs.getString(4);
		}
		new DBUtil();
		DBUtil.closeConnection(conn, ps, rs);
		sex = ((id_pass.charAt(16))-'0')%2;
	%>
	
	<section>
    <div class="wrapper content" style="min-height: 675px;">
    	<div class="breadcrumb">当前位置：<a href="tieluchangxing.jsp">会员服务</a></div>
    <div class="center-box">
<ul class="center-menu">

	<li class="menu-item" id="gerenzhongxin">
		<h2 class="menu-tit active">
			<a href="myinformation.jsp">个人中心</a>
		</h2>
	</li>
	
	<li class="menu-item">
		<h2 class="menu-tit">订单中心<i class="icon icon-switch"></i></h2>
		<ul class="menu-sub">
			<li id="chepiaodingdan"><a href="./train_order.jsp">火车票订单</a></li>
		</ul>
	</li>
	
	<li class="menu-item">
		<h2 class="menu-tit">个人信息<i class="icon icon-switch"></i></h2>
		<ul class="menu-sub">
			<li id="gerenxinxi"><a href="tieluchangxing.jsp">查看个人信息</a></li>
		</ul>
	</li>
	
	<li class="menu-item">
		<h2 class="menu-tit">友情链接<i class="icon icon-switch"></i></h2>
		<ul class="menu-sub">
			<li ><a href="#">友情链接1</a></li>
			<li ><a href="#">友情链接2</a></li>
			<li ><a href="#">友情链接3</a></li>
		</ul>
	</li>
	
	<li class="menu-item">
		<h2 class="menu-tit">投诉和建议<i class="icon icon-switch"></i></h2>
		<ul class="menu-sub">
			<li id="J-advice_complaintInfo"><a href="#" onclick="tousu()">投诉</a></li>
			<li id="J-advice_adviceInfo"><a href="#" onclick="jianyi()">建议</a></li>
		</ul>
	</li>
</ul>

<div class="center-main" style="min-height: 500px;">
        <div class="center-welcome" id="js-minHeight" style="min-height: 500px;">
          <div class="welcome_data"><div class="welcome-tit"><img src="image/noticepic.png" alt="" class="welcome-notice"><strong class="welcome-name"><%=truename %></strong><span><%if(sex==0){%>女士<%}else{%>先生<%} %>,下午好！</span></div>
          <div class="welcome-con">
          <br>
          <div style="padding-left: 50px;">
          <table style="padding-bottom: 10px;">
          <tr><td><span style="color: red;">用户名：</span></td><td><span><%=username %></span></td></tr>
          <tr style="height: 10px;"></tr>
          <tr><td><span style="color:red;">身份证号：</span></td><td><span><%=id_pass %></span></td></tr>
          <tr style="height: 10px;"></tr>
          <tr><td><span style="color:red;">性别：</span></td><td><span><%if(sex==1){ %>男<%}else{ %>女<%} %></span></td></tr>
          <tr style="height: 10px;"></tr>
          <tr><td><span style="color:red;">姓名：</span></td><td><span><%=truename %></span></td></tr>
          <tr style="height: 10px;"></tr>
          <tr><td><span style="color:red;">邮箱：</span></td><td><span><%=email %></span></td></tr>
          <tr style="height: 10px;"></tr>
          <tr><td><span style="color:red;">电话：</span></td><td><span><%=tel %></span></td></tr>
          <tr style="height: 10px;"></tr>
          </table>
          </div>
          </div>
          </div>
        </div>

      </div>
  </div>
  </div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		function tousu(){
			alert("对不起！本网站不接受投诉！");
		}
		function jianyi(){
			alert("如果您有建议可以关注公众号进行反馈！");
		}
	</script>
</body>
</html>