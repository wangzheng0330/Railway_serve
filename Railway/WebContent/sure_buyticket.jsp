<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="buyticket" class="mypack.bean.Buy_ticketBeanzhunbeishan"></jsp:useBean>
<jsp:useBean id="userDao" class="mypack.Dao.UserDao"></jsp:useBean>
<jsp:setProperty property="*" name="buyticket"/>
<%@ page import="java.sql.Time,mypack.util.*,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,java.util.ArrayList,java.util.Date" %>
<!DOCTYPE html>
<html>
<link href="css/buyticket.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<title>王铮铁路客户服务中心</title>
<script type="text/javascript">
 function smpanduan(){
	var selectStatus=document.getElementById('xy');
	if(selectStatus.checked==false){
		alert("请选择乘车人");
		return false;
	}
	return true;
 }
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<section>
	
	<% double two_p=0,one_p=0,b_p=0; %>
	<% Time g_t=null,a_t=null; %>
	<% String truename=null,tel=null,pass_id=null; %>
	
	<%
		new DBUtil();
		Connection conn  = DBUtil.getConnection();
		String sql = "select * from train where train_num like '"+request.getParameter("TrainId")+"'";
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()){
				two_p = rs.getDouble("two_price");
				one_p = rs.getDouble("one_price");
				b_p = rs.getDouble("business_price");
				g_t = rs.getTime("start_time");
				a_t = rs.getTime("end_time");
				int hour = g_t.getHours();
				g_t.setHours(hour-8);
				int hours = a_t.getHours();
				a_t.setHours(hours-8);
			}
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.closeConnection(conn, ps, rs);
		}
	%>
	
	<%
		new DBUtil();
		Connection con  = DBUtil.getConnection();
		String sqll = "select * from user where username like '"+request.getParameter("username")+"'";
		System.out.println(sqll);
		PreparedStatement pss = null;
		ResultSet rss=null;
		try {
			pss = con.prepareStatement(sqll);
			rss = pss.executeQuery();
			if(rss.next()){
				truename = rss.getString("name");
				tel = rss.getString("tel");
				pass_id = rss.getString("num");
			}
			new DBUtil();
			DBUtil.closeConnection(con, pss, rss);
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.closeConnection(con, pss, rss);
		}
	%>
	<div style="height:30px;"></div>
	<div class="layout t-info"><div class="lay-hd">列车信息<span class="small">（以下余票信息仅供参考）</span></div>
	<div class="lay-bd"><p class="t-tit" id="ticket_tit_id">
	<strong class="mr5"><%=request.getParameter("gotime") %></strong>
	<strong class="ml5"><%=request.getParameter("TrainId") %></strong>次
	<strong class="ml5"><%=request.getParameter("chufadi") %></strong>
	<strong>（<%=g_t %>开）—<%=request.getParameter("mudidi") %></strong>（<%=a_t %>到）
<p class="t-con" id="ticket_con_id">
<span id="ticket_status_id" class="s1">商务座（<span class="colorA">￥<%=b_p %></span>）有票</span>
<span id="ticket_status_id" class="s1">一等座（<span class="colorA">￥<%=one_p %></span>）有票</span>
<span id="ticket_status_id" class="s1">二等座（<span class="colorA">￥<%=two_p %></span>）有票</span>
</p>
<p style="color: #3177BF;">*显示的票价均为实时票价，供您参考。具体票价以您确认支付时实际购买的铺别票价为准。</p>
</div>
</div>
<form action="payticket.jsp" name="hehe" method="post" onsubmit="return smpanduan()">
<input type="hidden" name="gotime" value="<%= request.getParameter("gotime")%>">
<input type="hidden" name="shenfenzheng" value="<%=pass_id %>">

<input type="hidden" name="train___id" value="<%=request.getParameter("TrainId") %>">
	<input type="hidden" name="tel" value="<%=tel %>">
	<div style="height:10px;"></div>
	<div class="layout person">
		<div class="lay-hd">乘客信息<span class="small" id="psInfo">（填写说明）</span></div>
		<div class="lay-bd">
			<div class="per-sel">
				<div class="item clearfix">
<ul id="normal_passenger_id">
<li><span><strong>乘车人：</strong></span>
<input type="checkbox" class="check" name="denlen" id="xy">
<label for="normalPassenger_0" style="cursor: pointer"><%=truename %></label>
</li>
</ul>
					<div class="btn-all" style="display: none;" id="btnAll">
					</div>
				</div>
			</div>
<table class="per-ticket">
<tr style="font-size:14px; height: 30px; align:center; background-color: rgb(247,247,247);"><th width="28" rowspan="1" colspan="1">序号</th>
<th rowspan="1" colspan="1">票种</th>
<th rowspan="1" colspan="1">席别 </th>
<th rowspan="1" colspan="1">姓名</th>
<th rowspan="1" colspan="1">证件类型</th>
<th rowspan="1" colspan="1">证件号码</th>
<th rowspan="1" colspan="1">手机号码</th>
<th width="70" rowspan="1" colspan="1"></th>
<th width="30" rowspan="1" colspan="1"></th>
</tr>
<tr id="tr_id_1">
	<td align="center">1</td>
	<td>
	    <select id="ticketType_1" name="confirmTicketType">
			<option id="ticket_type_option" value="1" selected="selected">成人票</option>
			<option value="2">学生票 </option>
		</select>
             </td>
                        
			<td><select name="seat_type" id="seatType_1">
				<option value="business" selected="selected">
                   商务座（￥<%=b_p %>）
                </option>
                <option value="one" >
                   一等座（￥<%=one_p %>）
                </option>
                <option value="two" >
                   二等座（￥<%=two_p %>）
                </option>
             </select>
             <input type="hidden" name="b_p" value="<%=b_p %>">
             <input type="hidden" name="o_p" value="<%=one_p %>">
             <input type="hidden" name="t_p" value="<%=two_p %>">
             </td>
						<td>
						<div class="pos-rel"><input name="passenger_name_1" class="inptxt w110" value="<%=truename %>" size="12" maxlength="20" disabled="disabled" style="color:#999999" title="不允许修改乘车人信息">
						<div class="w110-focus" id="passenger_name_1_notice"></div></div></td>
						<td><select name="passenger_id_type_1" disabled="disabled" style="color:#999999" title="不允许修改乘车人信息">
				 <option value="1" selected="selected">     中国居民身份证     </option>
        </select>
             </td>
<td><div class="pos-rel"><input name="passenger_id_no_1" class="inptxt w160" value="<%=pass_id %>" size="20" maxlength="35" disabled="disabled" style="color:#999999" title="不允许修改乘车人信息"><div class="w160-focus" id="passenger_id_no_1_notice"></div></div></td>
	<td>
	<div class="pos-rel">
	
	<input name="phone_no_1" class="inptxt w110" value="<%=tel %>" size="11" maxlength="20" disabled="disabled" style="color:#999999" title="不允许修改乘车人信息">
	<div class="w160-focus" id="phone_no_1_notice"></div></div></td>
	<td style="width:40;"></td>
</tr>
</table>
<div style="height:10px;"></div>
<div><img src="image/ins_ad2.png" alt=""></div>
</div>
</div>

<div style="text-align:center; height:40px; margin: 5px; padding: 10px;">
	
	<table style="margin:auto"><tr style="border:0px;"><td style="border:0px;" colspan="2" align="center">
	<input type="image" name="submit" src="image/register_submit.png" onclick="document.formName.submit()">
	</td></tr></table></div></form>

<div class="tips-txt"><h2>温馨提示：</h2>
<p>1. 一张有效身份证件同一乘车日期同一车次只能购买一张车票，高铁动卧列车除外。</p>
<p>2. 购票时可使用的有效身份证件包括：中华人民共和国居民身份证、港澳居民来往内地通行证、台湾居民来往大陆通行证和按规定可使用的有效护照。</p>
<p>3. 购买儿童票时，乘车儿童有有效身份证件的，请填写本人有效身份证件信息。乘车儿童没有有效身份证件的，应使用同行成年人的有效身份证件信息；购票时不受第一条限制，但购票后、开车前须办理换票手续方可进站乘车。</p>
<p>
				4. 购买学生票时，须在我的常用联系人
中登记乘车人的学生详细信息。学生票乘车时间限为每年的暑假6月1日至9月30日、寒假12月1日至3月31日。购票后、开车前，须办理换票手续方可进站乘车。换票时，新生凭录取通知书，毕业生凭学校书面证明，其他凭学生优惠卡。

			</p>
<p>5.
				购买残疾军人（伤残警察）优待票的，须在购票后、开车前办理换票手续方可进站乘车。换票时，不符合规定的减价优待条件，没有有效"中华人民共和国残疾军人证"或"中华人民共和国伤残人民警察证"的，不予换票，所购车票按规定办理退票手续。</p>
<p><strong>6.购买铁路乘意险的注册用户年龄须在18周岁以上，使用非中国居民身份证注册的用户如购买铁路乘意险，须在我的12306——个人信息
如实填写“出生日期”。</strong>
</p>
<p><strong>7.父母为未成年子女投保，须在我的常用联系人
登记未成年子女的有效身份证件信息。</strong>
</p>
</div>
	</section>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>