<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,mypack.util.DBUtil" %>
	<%
		String username = request.getParameter("daijiance");
		System.out.println(username);
		new DBUtil();
		int info=1;
		Connection conn  = DBUtil.getConnection();
		String sql = "select * from user where num = ?";
		PreparedStatement ps = null;
		if(username==""||username.equals(null)||username==null||username.equals("")){
			info=-1;
		}
		ResultSet rs=null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs=ps.executeQuery();
			//System.out.println(sql);
			if(rs.next()){
				info=0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
		}
		System.out.println("info = "+info);
		out.println(info);
	//	out.close();
	%>