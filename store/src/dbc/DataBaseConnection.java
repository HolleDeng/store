package dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
		public static final String DBDRIVER="com.mysql.jdbc.Driver";
		public static final String DBURL="jdbc:mysql://192.168.213.134:3306/store";
		public static final String DBUSER="root";
		public static final String DBPASS="123456";
		private Connection conn=null;
		
		public DataBaseConnection() throws Exception{
			try{
					Class.forName(DBDRIVER);
					this.conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			}catch(Exception e){
				throw e;
			}
		}
		public Connection getConnection(){
				return this.conn;
		}
		public void close(){
			try{
				conn.close();
			}catch(SQLException e){
					e.printStackTrace();
			}
		}
}
