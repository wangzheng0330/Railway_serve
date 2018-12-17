<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="registerUser" class="mypack.bean.UserBean"></jsp:useBean>
<jsp:useBean id="userDao" class="mypack.Dao.UserDao"></jsp:useBean>
<jsp:setProperty property="*" name="registerUser"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>王铮铁路客户服务中心</title>
</head>
<body>
	<%
		if(userDao.userRegister(registerUser)){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			out.println("<script>alert('注册失败！请重新注册!');window.history.back();</script>");
		}
	%>
</body>
</html>