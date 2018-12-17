<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,mypack.util.DBUtil" %>
<%
	String id=request.getParameter("tui_trainid");
	String sql = "UPDATE tickets SET tui = 0 where buy_ticket_id = ?";
	//System.out.print(sql);
	new DBUtil();
	int info=1;
	Connection conn  = DBUtil.getConnection();
	PreparedStatement ps = null;
	ResultSet rs=null;
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		out.println("<script>alert('退票成功!');window.history.back();</script>");
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		new DBUtil();
		DBUtil.closeConnection(conn, ps, rs);
	}
%>