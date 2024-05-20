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
import java.util.*;

import java.util.Iterator;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import CON2.Connection2;

import com.itextpdf.text.log.SysoLogger;
import com.mysql.jdbc.Statement;
public class Asset_Warant_Expairy_Remainder_Job implements Job {
	
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
	
		System.out.println("============== Reminder For Asset Waranty Expairy ===================");
		try {
			ReminderForAssetWaranty();
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

	private void ReminderForAssetWaranty() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
	
		Connection con = null;
			Connection2 dbConn = new Connection2();
			con = dbConn.getConnection2();
		
		    Statement st=null;
		    ResultSet rs=null;
			
			String query1=" SELECT distinct l.Nname, l.Nmail,i.`Inventory_No`, i.`Asset_No`, i.`AssetType`, i.`assetname`,i.`WarExpDate` from asset_item i " +
					" Inner join `asset_inventory` ai on ai.`Inventory_No` = i.`Inventory_No` " +
					" Inner join `login` l on l.Nname = ai.`InventoryDoneBy` "; 
			st = (Statement) con.createStatement();
			rs = st.executeQuery(query1);
			
			try {
					PreparedStatement statement = con.prepareStatement(query1);
					rs = statement.executeQuery();
					while(rs.next())
					{
						SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy") ;
		               	try{
			               	Calendar cal = Calendar.getInstance();
			                int days=cal.get(Calendar.DATE);
			                int month=cal.get(Calendar.MONTH)+1;
			                int year=cal.get(Calendar.YEAR);
			                System.out.println("Current DAte: Days:"+days+" month:"+month+" year :"+year);
			                String d= rs.getString("WarExpDate");
			              	DateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
				            Date d11=formatter1.parse(d);
				            Calendar cal1 =new GregorianCalendar();
				            cal1.setTime(d11);
				            int days1=cal1.get(Calendar.DATE);
					        int month1=cal1.get(Calendar.MONTH)+1;
					        int year1=cal1.get(Calendar.YEAR);
					        System.out.println("Exp Date: Days:"+days1+" month:"+month1+" year :"+year1);
		
			                if((year1-year)==0)
			                {
			                	if((month1-month)==0)
			                	{
		                			if((days1-days)==0 || (days1-days)==1 || (days1-days)==2)
		                			{
		                				try{
		                					System.out.println("Asset Details Asset Name : "+rs.getString("assetname")+" : " +rs.getString("AssetType")+":" +rs.getString("Asset_No")+" : "+rs.getString("Inventory_No")+"\n Expairy Date :"+rs.getString("WarExpDate"));
		                					String body ="<html><body>" +
		            					        "<p>Dear Sir" +
		            							"<p>Its Gentel Remainder , The following asset waranty will expair Soon .</p> " +
		            							"<br> Find Asset Details.<br>" +
		            							"<br>Asset Name :" +rs.getString("AssetType")+
		            							"<br> Asset Expairy Date :"+rs.getString("WarExpDate")+
		            							"<br>Asset No :" +rs.getString("Inventory_No")+
		            							"<br>Inventory No :" +rs.getString("Asset_No")+
		            						    "<h4 style='color:red;'>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h4><br>" +
		            						    " (OR)" +
		            						    "<h4 style='color:red;'>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h4>" +
		            							"<br></body></html>";
		                					String CCList = "prasanna.v@nittsu.co.in,prasanna.shetty@nittsu.co.in";
		                					//String hoit="prasanna.v@nittsu.co.in,prasanna.shetty@nittsu.co.in";
		                					new NormalMail().sendMail("C2IT",rs.getString("Nmail"),CCList,body , "Asset Waranty Expairy Date Remainder");
		                				} catch (SQLException e) {
		                					// TODO Auto-generated catch block
		                					e.printStackTrace();
		                				}	
		                			}//if inside
		                		}//second if
		                	}
			            }	
		                catch(IllegalArgumentException e )
							{
								System.out.println("error:"+ e);
								System.out.println("Date formar error : in Expiry date Remainder ");
							}
		                catch(Exception e )
						{
							System.out.println("error:"+ e);
							System.out.println("Date formar error : in Expiry date Remainder ");
						}
	                
						}// while
			}//outer try
			catch(SQLException e) {	e.printStackTrace();}	
	}
}
	
