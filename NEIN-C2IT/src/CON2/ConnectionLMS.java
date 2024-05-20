package CON2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;
public class ConnectionLMS {
	public Connection getConnectionlms()
	{
    Connection connlms = null;
   
    
    ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	String driverl = dbPropertiesl.getString("leavemanagement.driverName");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
    
	//System.out.println("DBServer ConnectionLMS.java .C2IT...................................");
    
 try {
      Class.forName(driverl).newInstance();
      connlms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
      } catch (Exception e) {
      e.printStackTrace();
    }
   
	return connlms;
	
}
}
