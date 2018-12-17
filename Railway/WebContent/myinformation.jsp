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
		String sql = "select name,num from user where username='"+username+"';";
		String truename = null,id_pass=null;
		int sex=0;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()){
			truename=rs.getString(1);
			id_pass=rs.getString(2);
		}
		new DBUtil();
		DBUtil.closeConnection(conn, ps, rs);
		sex = ((id_pass.charAt(16))-'0')%2;
	%>
	
	<section>
    <div class="wrapper content" style="min-height: 675px;">
    	<div class="breadcrumb">当前位置：<a href="myinformation.jsp">个人中心</a></div>
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
          <div class="welcome_data"><div class="welcome-tit"><img src="image/noticepic.png" alt="" class="welcome-notice"><strong class="welcome-name"><%=truename %></strong><span><%if(sex==0){%>女士<%}else{%>先生<%} %>,下午好！</span></div><div class="welcome-con"><p>欢迎您登录王铮铁路客户服务中心网站。<br><span style="color: red;">如果您的密码在其他网站也使用，建议您修改本网站密码。</span><br><span style="color:red;">完成手机双向核验，即可使用手机号码直接登录的新服务，解除您遗忘用户名的烦恼。</span><br></p></div></div>
          <ul class="welcome-code">
            <li id="weixinImg"><div class="code-pic"><img src="image/gzh.jpg"></div><div class="code-txt">使用微信扫一扫，可通过<br>微信公众号接收本系统行程通知</div></li>
            <li id="aliImg">
              
            </li>
          </ul>
          <div class="tips-box" style="">
            <h2>温馨提示：</h2>
            <p>1.关注“我真的好困”公众号并完成微信绑定或支付宝绑定后，购票、改签、退票的通知消息，将会通过“我真的好困”微信公众号或支付宝通知<br>提醒发送给您；手机号码核验、通过手机号码找回密码、列车运行调整的通知仍然通过短信发送给您。</p>
            <p>2.您可通过“账号安全”中的<a class="index_notice" href="#" style="color: #0077FF">“通知设置”</a>修改您接收信息服务的方式。</p>
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