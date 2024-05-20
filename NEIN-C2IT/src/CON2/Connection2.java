package CON2;
import java.sql.Connection;

import java.sql.DriverManager;
import java.util.ResourceBundle;
public class Connection2 {
	public Connection getConnection2()
	{
	Connection conn = null;
    /*String url = "jdbc:mysql://localhost:3306/";
    //jdbc:mysql://localhost/
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";*/
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
	
	//System.out.println("DBServer Connection2.java .C2IT...................................");
	
	
 try {
      Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
      } catch (Exception e) {
      e.printStackTrace();
    }
  
	return conn;	
}
}
