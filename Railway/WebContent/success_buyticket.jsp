<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import="mypack.bean.*,mypack.Dao.*,mypack.util.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>王铮铁路客户服务中心e</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section >
	<!-- INSERT INTO `tickets` (`buy_date`, `buy_time`, `train_num`, `passenger_idcard`, `price`, `passenger_seat_type`) VALUES -->
	<%	
		String sql="call buyticket('"; 
		sql = sql + request.getParameter("gotime") + "','";
		sql = sql + new java.sql.Time(System.currentTimeMillis()) + "','";
		sql = sql + request.getParameter("train_id") + "','";
		sql = sql + request.getParameter("id_card") + "','";
		sql = sql + request.getParameter("price") + "','";
		sql = sql + request.getParameter("seat_type") +"');";
		System.out.println(sql);
		new DBUtil();
		Connection conn  = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.executeUpdate();
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
		}
	%>
	
	<div style="padding: 5px;text-align: center;margin: 20% 0px 5% 0px;">
		<div style="float: left; text-align: right;  width: 30%;">
			<img alt="" src="image/loading.gif">
		</div>
		<div style="margin-left: 30%; height:300px; width: 45%;">
			<p style="font-size: 26px;"><strong>正在处理支付数据，请稍后...</strong></p>
			<div style="height: 20px;"></div>
			<p style="font-size: 16px;"><strong><span style="font-size: 22px;" id="sp">5</span>秒后，此页面将自动关闭！</strong></p>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	onload=function(){
		setInterval(go, 1000);
	};
	var x=5; //利用了全局变量来执行
	function go(){
	x--;
		if(x>0){
		document.getElementById("sp").innerHTML=x;  //每次设置的x的值都不一样了。
		}else{
		location.href='myinformation.jsp';
		}
	}
</script>
</body>
</html>