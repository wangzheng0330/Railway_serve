<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mypack.bean.*,mypack.Dao.*,mypack.util.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<link href="css/trainorder.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<title>王铮铁路客户服务中心</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<div class="wrapper content" style="min-height: 275px;">
    	<div class="breadcrumb">当前位置：<a href="myinformation.jsp">个人中心</a></div>
    <div class="center-box" style="overflow:hidden">
<ul class="center-menu">

	<li class="menu-item" id="gerenzhongxin">
		<h2 class="menu-tit">
			<a href="myinformation.jsp">个人中心</a>
		</h2>
	</li>
	
	<li class="menu-item">
		<h2 class="menu-tit">订单中心<i class="icon icon-switch"></i></h2>
		<ul class="menu-sub">
			<li id="chepiaodingdan"><a style="color:#fff;background: #3B99FC;position: relative;" href="./train_order.jsp">
			火车票订单</a></li>
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
<!-- 信息获取开始 -->
<%
	String nowusername=(String)session.getAttribute("now_username");
	String idcard=null,chufadi=null,mudidi=null,checi=null,zuoxi=null,name=null;
	double price=-1;
%>
<%
	new DBUtil();
	Connection conn  = DBUtil.getConnection();
	PreparedStatement ps = null;
	ResultSet rs=null;
	String sql="select * from user where username like '"+nowusername+"'";
	try {
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			idcard=rs.getString(1);
			name=rs.getString(7);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		new DBUtil();
		DBUtil.closeConnection(conn, ps, rs);
	}
	sql = "select * from tickets where passenger_idcard like '"+idcard+"'";
%>
<%
int allinfo_sum = 0;
new DBUtil();
Object info[][] = null;
Connection conn1  = DBUtil.getConnection();
PreparedStatement ps1 = null;
ResultSet rs1=null;
try {
	ps1 = conn1.prepareStatement(sql);
	rs1=ps1.executeQuery();
	rs1.last();
	java.sql.Date buydata1=null;
	Time buytim = null;
	info = new Object[rs1.getRow()][10];
	rs1.beforeFirst();
	while(rs1.next()){
		checi=rs1.getString(4);
		zuoxi=rs1.getString(7);
		price=rs1.getDouble(6);
		buydata1=rs1.getDate(2);
		buytim=rs1.getTime(3);
		info[allinfo_sum][8] = rs1.getInt(1);
		info[allinfo_sum][9] = rs1.getInt(8);
		int h = buytim.getHours();
		buytim.setHours(h-8);
		new DBUtil();
		info[allinfo_sum][0] = checi;
		info[allinfo_sum][1] = zuoxi;
		info[allinfo_sum][2] = price;
		info[allinfo_sum][3] = buydata1;
		info[allinfo_sum][4] = buytim;
		Connection conn2  = DBUtil.getConnection();
		PreparedStatement ps2 = null;
		ResultSet rs2=null;
		sql = "select * from train where train_num like '"+checi+"'";
		Time kaiche = null;
		try {
			ps2 = conn2.prepareStatement(sql);
			rs2=ps2.executeQuery();
			if(rs2.next()){
				chufadi=rs2.getString(3);
				mudidi=rs2.getString(4);
				kaiche=rs2.getTime(5);
				int hh = kaiche.getHours();
				kaiche.setHours(hh-8);
				info[allinfo_sum][5] = chufadi;
				info[allinfo_sum][6] = mudidi;
				info[allinfo_sum][7] = kaiche;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			new DBUtil();
			DBUtil.closeConnection(conn2, ps2, rs2);
		}
		allinfo_sum++;
	}
} catch (SQLException e) {
	e.printStackTrace();
}finally{
	new DBUtil();
	DBUtil.closeConnection(conn1, ps1, rs1);
}
java.util.Date todaydate = new java.util.Date();
System.out.println(todaydate);
%>
<!-- 信息获取结束 -->
<div class="center-main" style="min-height: 200px;">
<%!int dingdanhao__ = 508500001; %>
       <div id="ticketinfo_all" class="tab-item" style="min-height: 200px; display: block;">
									<div class="order-filter">
										<a href="javascript:;" id="btn1" class="active">全部</a>
										<a href="javascript:;" id="btn2">已出行</a>
										<a href="javascript:;" id="btn3">未出行</a>
										<a href="javascript:;" id="btn4">已退票</a>
									</div>
									<!-- 订单-订单列表头部 -->
									<table class="order-panel-head title-text" style="display: table;">
										<colgroup>
											<col class="col-train">
											<col class="col-passenger">
											<col class="col-seat">
											<col class="col-price">
											<col class="col-state">
											<col>
										</colgroup>
										<tr>
											<th>车次信息</th>
											<th style="width: 200px">旅客信息</th>
											<th>席位信息</th>
											<th>票价</th>
											<th>车票状态</th>
											<!-- <th>总金额</th> -->
										</tr>
									</table>
<div id="all_ticket" style="display: block;">
<!-- 这里插入第二条记录 -->	
<%for(int i = 0;i<allinfo_sum;i++){
	if((int)info[i][9]==0){
		continue;
	}
%>
 <div class="order-item">
    <div class="order-item-hd">
      <div class="order-hd-info"><span class="txt-light">订票日期：</span><span class="dingqiaoDate" data-date="2018-11-13 16:47:13"><%=info[i][4] %></span></div>
      <div class="order-hd-info"><span class="txt-light">订单号：</span>E<%=dingdanhao__ %></div>
    </div>
    <div class="order-item-bd">
      <table class="order-item-table" id="query_order_form_E508509831">
        <colgroup>
          <col class="col-train">
          <col class="col-passenger">
          <col class="col-seat">
          <col class="col-price">
          <col class="col-state">
          <col>
		</colgroup>
		<tr>
			<td style="width: 220px;">
			<div class="train-juti">
			<p><span><strong><%=info[i][5] %>--><%=info[i][6] %></strong></span>
			&nbsp;&nbsp;&nbsp;
			<span><%=info[i][0] %></span></p>
			<p><span><%=info[i][3] %></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=info[i][7] %></span>开</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 170px;">
			<div class="train-juti">
			<p><%=name %></p>
			<p>中国居民身份证</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 150px;">
			<div class="train-juti">
			<p>
			<%
			String denlen = null;
			if(info[i][1].equals("one")){
				denlen = "一等座";
			}else if(info[i][1].equals("business")){
				denlen = "商务座";
			}else if(info[i][1].equals("two")){
				denlen = "二等座";
			}
			%>
			<%=denlen %>
			</p>
			<p><%=(int)(1+Math.random()*(10-1+1)) %>车<%=(int)(1+Math.random()*(120-1+1)) %>号</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 160px;">
			<div class="train-juti">
			<p>成人票</p>
			<p><span class="colorA">¥&nbsp;<%=info[i][2] %></span></p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 140px;">
			<div class="train-juti">
			<p>已出票</p>
			
			</div>
			</td>
			
		</tr>
		<tr style="height:20px;"></tr>
    </table>
  </div>
</div>
<!-- 这里插入第二条记录 -->
<% dingdanhao__++;}%>
</div>

<!-- ***********分割线(已出行下面)************** -->

									
<div id="yichuxing_ticket" style="display: none;">
<!-- 这里插入第二条记录 -->	
<%for(int i = 0;i<allinfo_sum;i++){ 
	if(((java.util.Date)(info[i][3])).after(todaydate)||(int)info[i][9]==0){
		//System.out.println(info[i][3]);
		continue;
	}
%>
 <div class="order-item">
    <div class="order-item-hd">
      <div class="order-hd-info"><span class="txt-light">订票日期：</span><span class="dingqiaoDate" data-date="2018-11-13 16:47:13"><%=info[i][4] %></span></div>
      <div class="order-hd-info"><span class="txt-light">订单号：</span>E<%=dingdanhao__ %></div>
    </div>
    <div class="order-item-bd">
      <table class="order-item-table" id="query_order_form_E508509831">
        <colgroup>
          <col class="col-train">
          <col class="col-passenger">
          <col class="col-seat">
          <col class="col-price">
          <col class="col-state">
          <col>
		</colgroup>
		<tr>
			<td style="width: 220px;">
			<div class="train-juti">
			<p><span><strong><%=info[i][5] %>--><%=info[i][6] %></strong></span>
			&nbsp;&nbsp;&nbsp;
			<span><%=info[i][0] %></span></p>
			<p><span><%=info[i][3] %></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=info[i][7] %></span>开</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 170px;">
			<div class="train-juti">
			<p><%=name %></p>
			<p>中国居民身份证</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 150px;">
			<div class="train-juti">
			<p>
			<%
			String denlen = null;
			if(info[i][1].equals("one")){
				denlen = "一等座";
			}else if(info[i][1].equals("business")){
				denlen = "商务座";
			}else if(info[i][1].equals("two")){
				denlen = "二等座";
			}
			%>
			<%=denlen %>
			</p>
			<p><%=(int)(1+Math.random()*(10-1+1)) %>车<%=(int)(1+Math.random()*(120-1+1)) %>号</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 160px;">
			<div class="train-juti">
			<p>成人票</p>
			<p><span class="colorA">¥&nbsp;<%=info[i][2] %></span></p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 140px;">
			<div class="train-juti">
			<p>已出票</p>
			
			</div>
			</td>
			
		</tr>
		<tr style="height:20px;"></tr>
    </table>
  </div>
</div>
<!-- 这里插入第二条记录 -->
<% dingdanhao__++;}%>
</div>
<!-- ***********分割线************** -->


<!-- ***********分割线(未出行下面)************** -->
<div id="weichuxing_ticket" style="display: none;">
<!-- 这里插入第二条记录 -->	
<%for(int i = 0;i<allinfo_sum;i++){ 
	if(((java.util.Date)(info[i][3])).before(todaydate)||(int)info[i][9]==0){
		System.out.println(info[i][3]);
		continue;
	}
%>
 <div class="order-item">
    <div class="order-item-hd">
      <div class="order-hd-info"><span class="txt-light">订票日期：</span><span class="dingqiaoDate" data-date="2018-11-13 16:47:13"><%=info[i][4] %></span></div>
      <div class="order-hd-info"><span class="txt-light">订单号：</span>E<%=dingdanhao__ %></div>
    </div>
    <div class="order-item-bd">
      <table class="order-item-table" id="query_order_form_E508509831">
        <colgroup>
          <col class="col-train">
          <col class="col-passenger">
          <col class="col-seat">
          <col class="col-price">
          <col class="col-state">
          <col>
		</colgroup>
		<tr>
			<td style="width: 220px;">
			<div class="train-juti">
			<p><span><strong><%=info[i][5] %>--><%=info[i][6] %></strong></span>
			&nbsp;&nbsp;&nbsp;
			<span><%=info[i][0] %></span></p>
			<p><span><%=info[i][3] %></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=info[i][7] %></span>开</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 170px;">
			<div class="train-juti">
			<p><%=name %></p>
			<p>中国居民身份证</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 150px;">
			<div class="train-juti">
			<p>
			<%
			String denlen = null;
			if(info[i][1].equals("one")){
				denlen = "一等座";
			}else if(info[i][1].equals("business")){
				denlen = "商务座";
			}else if(info[i][1].equals("two")){
				denlen = "二等座";
			}
			%>
			<%=denlen %>
			</p>
			<p><%=(int)(1+Math.random()*(10-1+1)) %>车<%=(int)(1+Math.random()*(120-1+1)) %>号</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 160px;">
			<div class="train-juti">
			<p>成人票</p>
			<p><span class="colorA">¥&nbsp;<%=info[i][2] %></span></p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 140px;">
			<div class="train-juti">
			<form action="do_tuiticket.jsp" method="post">
			<input type="hidden" name="tui_trainid" value="<%=(int)info[i][8] %>">
			<p><input type="submit" value="退票" id="tui_ticket"></p>
			</form>
			</div>
			</td>
			
		</tr>
		<tr style="height:20px;"></tr>
    </table>
  </div>
</div>
<!-- 这里插入第二条记录 -->
<% dingdanhao__++;}%>
</div>
<!-- ***********分割线************** -->

<!-- ***********分割线(以退票下面)************** -->
<div id="tuipiao_ticket" style="display: none;">
<!-- 这里插入第二条记录 -->	
<%for(int i = 0;i<allinfo_sum;i++){ 
	if((int)info[i][9]==1){
		continue;
	}
%>
 <div class="order-item">
    <div class="order-item-hd">
      <div class="order-hd-info"><span class="txt-light">订票日期：</span><span class="dingqiaoDate" data-date="2018-11-13 16:47:13"><%=info[i][4] %></span></div>
      <div class="order-hd-info"><span class="txt-light">订单号：</span>E<%=dingdanhao__ %></div>
    </div>
    <div class="order-item-bd">
      <table class="order-item-table" id="query_order_form_E508509831">
        <colgroup>
          <col class="col-train">
          <col class="col-passenger">
          <col class="col-seat">
          <col class="col-price">
          <col class="col-state">
          <col>
		</colgroup>
		<tr>
			<td style="width: 220px;">
			<div class="train-juti">
			<p><span><strong><%=info[i][5] %>--><%=info[i][6] %></strong></span>
			&nbsp;&nbsp;&nbsp;
			<span><%=info[i][0] %></span></p>
			<p><span><%=info[i][3] %></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=info[i][7] %></span>开</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 170px;">
			<div class="train-juti">
			<p><%=name %></p>
			<p>中国居民身份证</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 150px;">
			<div class="train-juti">
			<p>
			<%
			String denlen = null;
			if(info[i][1].equals("one")){
				denlen = "一等座";
			}else if(info[i][1].equals("business")){
				denlen = "商务座";
			}else if(info[i][1].equals("two")){
				denlen = "二等座";
			}
			%>
			<%=denlen %>
			</p>
			<p><%=(int)(1+Math.random()*(10-1+1)) %>车<%=(int)(1+Math.random()*(120-1+1)) %>号</p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 160px;">
			<div class="train-juti">
			<p>成人票</p>
			<p><span class="colorA">¥&nbsp;<%=info[i][2] %></span></p>
			</div>
			</td>
			
			<td class="infoxinxi" style="width: 140px;">
			<div class="train-juti">
			<p>已退票</p>
			
			</div>
			</td>
			
		</tr>
		<tr style="height:20px;"></tr>
    </table>
  </div>
</div>
<!-- 这里插入第二条记录 -->
<% dingdanhao__++;}%>
</div>
<!-- ***********分割线************** -->

</div>
<div style="height: 30px;"></div>
		<div class="tips-box mt-lg duo-tips" style="">
			<h4 class="tips-tit ">温馨提示</h4>
			<p>1.订单信息在本网站保存期限为30日。</p>
			<p>2.在本网站购票后，没有换取纸质车票的，可不晚于开车前30分钟在本网站办理退票业务，或不晚于开车前48小时在本网站办理“变更到站”业务。</p>
			<p>3.在本网站办理退票，只能逐次单张办理。</p>
			<p>4. 车票改签、变更到站均只能办理一次。已经改签或变更到站的车票不再办理改签；对已改签车票、团体票暂不提供“变更到站”服务。</p>
			<p>5.退票、改签、变更到站后，如有应退票款，按购票时所使用的在线支付工具相关规定，将在规定时间内退还至原在线支付工具账户，请及时查询。如有疑问，请微信公众号留言。</p>
			<p>6.如需取消或查看车票快递状态，请点击“快递详情”。</p>
			<p>7.投保、退保或查看电子保单状态，请点击“我的保险”或“购/赠/退保险”。</p>
		</div>
		
</div>




</div>
</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/trainorder.js"></script>
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