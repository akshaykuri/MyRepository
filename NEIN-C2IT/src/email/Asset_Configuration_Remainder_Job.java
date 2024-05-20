package email;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import CON2.Connection2;

import com.mysql.jdbc.Statement;

public class Asset_Configuration_Remainder_Job implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		System.out.println("============== Reminder For Pending Asset Configuration ===================");
		try {
			ReminderForAssetConfig();
		       } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		     } catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		     } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

private void ReminderForAssetConfig() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
	
	Connection con = null;
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();

    Statement st=null;
    ResultSet rs=null;
	
	String query1=" SELECT distinct l.Nname, l.Nmail, i.`Inventory_No`, i.`Asset_No`, i.`AssetType`, i.`ConfigAddStatus` from asset_item i " +
				" Inner join `asset_inventory` ai on ai.`Inventory_No` = i.`Inventory_No` " +
				" Inner join `login` l on l.Nname = ai.`InventoryDoneBy` where i.`ConfigAddStatus` = '0' ";
     st = (Statement) con.createStatement();
	rs = st.executeQuery(query1);
	try {
				PreparedStatement statement = con.prepareStatement(query1);
				rs = statement.executeQuery();
				while(rs.next())
				{
					System.out.println("Mail Details :"+rs.getString("Nname")+"  :  "+rs.getString("Nmail")+" : "+rs.getString("Inventory_No"));
					
					String body ="<html><body>" +
					        "<p>Dear Sir" +
							"<p> Please update the Asset Configuration Details.</p> " +
							"<br> Find Asset Details." +
							"<br>Asset Name :" +rs.getString("AssetType")+
							"<br>Asset No :" +rs.getString("Inventory_No")+
							"<br>Inventory No :" +rs.getString("Asset_No")+
						    "<h4 style='color:red;'>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
						    " (OR)" +
						    "<h4 style='color:red;'>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h4>" +
							"<br></body></html>";
											
				
					String CCList = "vijay.kumar@nittsu.co.in";
					
					//String hoit="prasanna.v@nittsu.co.in,prasanna.shetty@nittsu.co.in";
			    	new NormalMail().sendMail("C2IT",rs.getString("Nmail"),CCList,body , "Asset Configuration Pending");
			    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
}
	}
	
