<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>王铮铁路客户服务中心</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<section>
	<div style="margin-top:30px;height:50px;text-align:center;"><p style="font-size:30px;"><strong>请为您的订单付款</strong></p></div>
		<table style="margin-left: 100px;">
			<tr>
			<td><input style="height:150%; width:150%;" type="image" name="submit" src="image/alipay.jpeg"></td>
			<td style="width:200px;"></td>
			<td><input style="height:150%; width:150%;" type="image" name="submit" src="image/wechat.jpeg"></td>
			</tr>
		</table>
		<form method="post" action="success_buyticket.jsp">
		<input type="hidden" value="<%=request.getParameter("train___id") %>" name="train_id" >
		<input type="hidden" value="<%=request.getParameter("seat_type") %>" name="seat_type">
		<input type="hidden" value="<%=request.getParameter("gotime") %>" name= "gotime">
		<input type="hidden" value="<%=request.getParameter("shenfenzheng") %>" name="id_card">
		<%if(request.getParameter("seat_type").equals("business")||request.getParameter("seat_type")=="business" ){%>
			<input type="hidden" value="<%=request.getParameter("b_p") %>" name="price">
		<%} else if(request.getParameter("seat_type")=="two"||request.getParameter("seat_type").equals("two")){%>
			<input type="hidden" value="<%=request.getParameter("t_p") %>" name="price">
		<%}else{ %>
			<input type="hidden" value="<%=request.getParameter("o_p") %>" name="price">
		<%} %>
		<div style="height: 50px;text-align:center;padding:10px 0px 5px 0px;">
		<input type="image" name="submit" src="image/xiayibu.png" onclick="document.formName.submit()">
		</div>
		</form>
	</section>
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>