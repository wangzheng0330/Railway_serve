<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,mypack.util.DBUtil" %>
	<%
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		System.out.println(username);
		new DBUtil();
		//int info=1;
		Connection conn  = DBUtil.getConnection();
		String sql = "UPDATE user SET password = ? WHERE username = ?";
		System.out.println(sql);
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, username);
			ps.execute();
			//System.out.println(sql);
			/* if(rs.next()){
				info=0;
			} */
			out.println("<script>alert('修改成功');window.location.href = 'login.jsp';</script>");
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<script>alert('修改失败');history.back(-1);</script>");
		}finally{
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
		}
		//System.out.println("info = "+info);
		
	//	out.close();
	%>