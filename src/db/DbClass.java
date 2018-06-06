package db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DbClass {
	 public Connection getConn()throws Exception{
		 Connection conn;
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8", "root", "LJF32237822");
		   return conn;
	  }
}
