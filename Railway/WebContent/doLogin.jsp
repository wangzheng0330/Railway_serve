<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginUser" class="mypack.bean.UserBean"></jsp:useBean>
<jsp:useBean id="userDao" class="mypack.Dao.UserDao"></jsp:useBean>
<jsp:setProperty property="*" name="loginUser"/>
<%@page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>使用userbean创建实例</title>
</head>
<body>
	<%
		String info = "";
        if(userDao.userLogin(loginUser)){
        	String value2=(String)session.getAttribute("checkcode");
        	String value1=request.getParameter("code");
        	if(value2.equalsIgnoreCase(value1)){
            	session.setAttribute("now_username", loginUser.getUsername());
            	request.setAttribute("username", loginUser.getUsername());
            	//System.out.println(session.getAttribute("now_username"));
            	request.getRequestDispatcher("init.jsp").forward(request, response);
        	}else{
        		out.println("<script>alert('验证码错误!');window.location.href='login.jsp';</script>");
              //  response.sendRedirect("login.html");
        	}
        }else{
        	out.println("<script>alert('用户名或密码错误!');window.location.href='login.jsp';</script>");
           // response.sendRedirect("login.html");
        }
    %>
</body>
</html>