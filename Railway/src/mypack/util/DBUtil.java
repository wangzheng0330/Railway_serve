package mypack.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;;



public class DBUtil {
	
	//=======数据库连接信息========   
	static String url = "jdbc:mysql://localhost:3306/final?userSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT";
    static String username = "root";
    static String password = "980330wz";
    static String driverClassName = "com.mysql.cj.jdbc.Driver";
	
	
	public DBUtil() {	}
	
    /*获取数据库连接
     * 
     */
    public static Connection getConnection(){
        
        Connection connection = null;
        
        try {
            //加载驱动
            Class.forName(driverClassName);
            
            //获取连接
            connection = DriverManager.getConnection(url,username,password);
            
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return connection;
    }
    
    /*
     * 释放连接
     * 
     * 
     * */
    public static void closeConnection(Connection connection,PreparedStatement st,ResultSet rs){
        try {
            if(connection!= null){
                connection.close();
            }
            if(st!= null){
                st.close();
            }
            if(rs!= null){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
