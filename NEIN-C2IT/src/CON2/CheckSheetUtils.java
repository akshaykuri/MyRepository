package CON2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import CON2.Connection2;

public class CheckSheetUtils {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String mrStringDate=null;
	String name = null,desgg=null;
	String status= null; 
	public String getDateOfMaterialReq(String mrId)
	{
	
		try{
			
			
	       System.out.println("in the method   ");
			Connection2 dbConn = new Connection2();
			
			conn = dbConn.getConnection2();
			
			pst = conn.prepareStatement("select date_format(mr_date,'%d/%m/%Y') from mr_master where mr_id=? ");
			
			pst.setString(1, mrId);
			
			rs = pst.executeQuery();
			
			
			while(rs.next()){
				System.out.println("Inside while ");
				mrStringDate = rs.getString(1);
				System.out.println("getting  String date  from util "  +mrStringDate );	
				//mrDate = rs.getDate(1);
				
				//System.out.println("getting date  from util "  +mrDate );	
			}
			
				
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		finally{
			DbUtil.closeDBResources(rs,pst,conn);
			
		}
		return mrStringDate;
	}
	
	
	
	public String getAuthorizedName(String mrId,String sesName,String desg) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg from mr_master where mr_id=? and id in" +
						"(select max(id) from mr_master where mr_id=?) ");
				
				pst.setString(1, mrId);
				pst.setString(2, mrId);
				
				rs = pst.executeQuery();
				
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if((name.equals(sesName)) && (desgg.equals(desg)))
				{
					status = "true";
				}
				else
				{
					status = "false";
				}
				
				System.out.println("wat is the status  "+status);
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
		return status;
		
	}
	
	public String getPaymentDeliveryDetails(String mrId)
	{
		
		try{
			
			
		      // System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				//select mr_item.mr_itemName,mr_item.mr_asset,mr_item.mr_itemQuantity,mr_item.mr_itemRate,mr_item.mr_abbreviation,mr_item.mr_itemAmount,mr_master.totalcon,mr_master.e_name,mr_master.e_designation,mr_master.mr_date,mr_master.mail,mr_item.mr_DateByRegd from mr_item,mr_master where mr_item.transid=mr_master.transid and status='normal'and mr_item.mr_id = ?");
				pst = conn.prepareStatement("select mr_item.mr_itemName,mr_item.mr_asset,mr_item.mr_itemQuantity,mr_item.mr_itemRate,mr_item.mr_abbreviation,mr_item.mr_itemAmount,mr_master.totalcon,mr_master.e_name,mr_master.e_designation,mr_master.mr_date,mr_master.mail,mr_item.mr_DateByRegd from mr_item,mr_master where mr_item.transid=mr_master.transid and status='normal'and mr_item.mr_id = ? ");
				
				pst.setString(1, mrId);
				
				rs = pst.executeQuery();
				
				
				while(rs.next()){
					System.out.println("Inside while ");
					mrStringDate = rs.getString(1);
					System.out.println("getting  String date  from util "  +mrStringDate );	
					//mrDate = rs.getDate(1);
					
					//System.out.println("getting date  from util "  +mrDate );	
				}
				
					
			}
			catch (Exception e) {
				// TODO: handle exception
			}finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
			return mrStringDate;
	}

}
