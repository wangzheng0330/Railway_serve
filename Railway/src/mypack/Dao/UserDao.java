package mypack.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import mypack.bean.UserBean;
import mypack.bean.PageBean;
import mypack.bean.TrainBean;

import mypack.util.DBUtil;

public class UserDao {
	public boolean userLogin(UserBean user){
		String username = user.getUsername();
		String password = user.getPassword();
		new DBUtil();
		Connection conn  = DBUtil.getConnection();
		String sql = "select * from user where username = ? and password = ?";
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			
			System.out.println(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				new DBUtil();
				DBUtil.closeConnection(conn, ps, rs);
				return true;
			}else {
				new DBUtil();
				DBUtil.closeConnection(conn, ps, rs);
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
			return false;
		}
	}
	public boolean userRegister(UserBean user) {
		String num = user.getNum();
		String username = user.getUsername();
		String password = user.getPassword();
		String email = user.getEmail();
		String tel = user.getTel();
		String zj_type = user.getZj_type();
		String truename = user.getName();
		new DBUtil();
		Connection conn  = DBUtil.getConnection();
		String sql = "call register('"+num+"','"+username+"','"+password+"','"+email+"','"+tel+"','"+zj_type+"','"+truename+"');";
		//System.out.println(sql);
		
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate(sql);
			System.out.println(sql);
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			new DBUtil();
			DBUtil.closeConnection(conn, ps, rs);
		}
	}
	@SuppressWarnings("resource")
	public PageBean<TrainBean> getUserPageBean(String where,int currentPage,int pageCount,String orderby){
		Connection conn  = DBUtil.getConnection();
		PreparedStatement stm = null;
	    ResultSet rs = null;
		conn = DBUtil.getConnection();
		PageBean<TrainBean> pageBean = new PageBean<TrainBean>();
		if(currentPage<=0){
			currentPage = 1;
		}
		pageBean.setCurrentPage(currentPage);
		if(pageCount<=0){
			pageCount = 1;
		}
		pageBean.setPageCount(pageCount);
		List<TrainBean> trains = new ArrayList<TrainBean>();
		String sql = null;
		try {
			if(where!=null && where.equals("")==false){
				sql = "select count(*) as totalCount from train where " + where ;
			}
			else{
				sql = "select count(*) as totalCount from train";
			}
			if(orderby!=null && orderby.equals("")==false)
			{
				sql = sql + " order by " + orderby;
			}
			
			System.out.println(sql);
			
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			if(rs.next()) {
				int totalCount = rs.getInt("totalCount");
            	pageBean.setTotalCount(totalCount);       	
            	if (totalCount % pageCount == 0) {
            		pageBean.setTotalPage ( totalCount / pageCount);
        		} else {
        			pageBean.setTotalPage ( totalCount / pageCount + 1);
        		} 	
            	
            	if(currentPage>pageBean.getTotalPage())
            	{
            		pageBean.setCurrentPage(pageBean.getTotalPage());
            	}
            }
			
			if(where!=null && where.equals("")==false){
				if(orderby!=null && orderby.equals("")==false)
				{
					sql = "select * from train"
						+ " where train_num not in( select T.train_num from (select train_num from train where " + where + " order by " + orderby + " limit " + (pageBean.getCurrentPage()-1)*pageBean.getPageCount() +")) as T)"
						+ " and " + where 
						+ " order by " + orderby 
						+ " limit " + pageBean.getPageCount();
				}
				else{
					sql = "select * from train"
						+ " where train_num not in( select T.train_num from (select train_num from train where " + where + " limit " + (pageBean.getCurrentPage()-1)*pageBean.getPageCount() +") as T)"
						+ " and " + where 
						+ " limit " + pageBean.getPageCount();
				}
			}
			else{
				if(orderby!=null && orderby.equals("")==false)
				{
					sql = "select * from train"
						+ " where train_num not in( select T.train_num from ( select train_num from train order by " + orderby + " limit " + (pageBean.getCurrentPage()-1)*pageBean.getPageCount() +") as T)" 
						+ " order by " + orderby 
						+ " limit " + pageBean.getPageCount();
				}
				else{
					sql = "select * from train"
							+ " where train_num not in( select T.train_num from ( select train_num from train limit " + (pageBean.getCurrentPage()-1)*pageBean.getPageCount() +") as T)"
							+ " limit " + pageBean.getPageCount();
				}
			}
			

			System.out.println(sql);
			
			
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()) {
				TrainBean t=new TrainBean();
				t.setTrain_num(rs.getString("train_num"));
				t.setStart_station(rs.getString("start_station"));
				t.setEnd_station(rs.getString("end_station"));
				t.setStart_time(rs.getTime("start_time"));
				t.setEnd_time(rs.getTime("end_time"));
				t.setTwo_price(rs.getDouble("two_price"));
				t.setOne_price(rs.getDouble("one_price"));
				t.setBusiness_price(rs.getDouble("business_price"));
				t.setTwo_seat_num(rs.getInt("two_seat_num"));
				t.setOne_seat_num(rs.getInt("one_seat_num"));
				t.setBusiness_seat_num(rs.getInt("business_seat_num"));
	
				trains.add(t);
            }
			pageBean.setPageData(trains);
			
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
         //   e.printStackTrace();    有坑！！！
        }finally{
            //释放连接
        	DBUtil.closeConnection(conn, stm, rs);
        }
		return  pageBean;
		
		
	}
	public boolean userBuyticket(Date gotime,String train_num,String pass_id,String seat_type,String price) {
		
		
		return false;
	}
}

	