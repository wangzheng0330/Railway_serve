<%@page import="mypack.util.SmsDemo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String code = null;
String phone = request.getParameter("phone");
code = new SmsDemo().yzm_main(phone,"SMS_151670524");
out.println(code);
System.out.println("code = "+code);
%>