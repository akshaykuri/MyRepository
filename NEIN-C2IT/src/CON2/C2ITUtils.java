package CON2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import CON2.Connection2;


public class C2ITUtils {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String mrStringDate=null;
	String name = null,desgg=null,pendingOrNot=null;
	String status= null;
	
	public String getAuthorizedName(String form1_no,String sesName,String desg,String empid) {
		try{
			//  System.out.println("in the method   ");
		Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,status,empid,levelno from form1_it_clearance_item where form1_no=? and id in" +
						"(select max(id) from form1_it_clearance_item where form1_no=?) ");
				
				pst.setString(1, form1_no);
				pst.setString(2, form1_no);
				
				rs = pst.executeQuery();
				
				String empid1="";
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 pendingOrNot = rs.getString("status");
					 empid1 = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if((name.equalsIgnoreCase(sesName) && desgg.equalsIgnoreCase(desg)) ||(empid1.equalsIgnoreCase(empid)) && (pendingOrNot.equals("Pending")))
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
	
	public String getAuthorizedNameAPPForm(String form2_no,String sesName,String desg,String emp_no) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from neinapplicationform_item where form2_no=? and item_id in" +
						"(select max(item_id) from neinapplicationform_item where form2_no=?) ");
				
				pst.setString(1, form2_no);
				pst.setString(2, form2_no);
				
				rs = pst.executeQuery();
				String empid=null;
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg))) || (empid.equalsIgnoreCase(emp_no)))
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

	public String getAuthorizedNameNExAS(String form2_no,String sesName,String desg,String emp_no) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form12_nexas_item where form_no=? and id in" +
						"(select max(id) from form12_nexas_item where form_no=?) ");
				
				pst.setString(1, form2_no);
				pst.setString(2, form2_no);
				
				rs = pst.executeQuery();
				String emp_id="";
				
				while(rs.next()){
					//System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 emp_id = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					//System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					//System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||( emp_id.equalsIgnoreCase(emp_no) ))
				{
					status = "true";
				}
				else
				{
					status = "false";
				}
				
				//System.out.println("wat is the status  "+status);
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
		return status;
		
	}
	
	
	
	
	
	public String getAuthorizedNameDomain(String form2_no,String sesName,String desg,String emp_no) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form2_domain_item where form2_no=? and id in" +
						"(select max(id) from form2_domain_item where form2_no=?) ");
				
				pst.setString(1, form2_no);
				pst.setString(2, form2_no);
				
				rs = pst.executeQuery();
				String empid=null;
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg))) || (empid.equalsIgnoreCase(emp_no)))
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
	public String getAuthorizedNameDSC(String form11_no,String sesName,String desg) {
		try{
			
			
		      //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg from form11_dsc_item where form11_no=? and id in" +
						"(select max(id) from form11_dsc_item where form11_no=?) ");
				
				pst.setString(1, form11_no);
				pst.setString(2, form11_no);
				
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
				
				if((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))
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
	
	
	public String getAuthorizedNameLotus(String form3_no,String sesName,String desg,String empno) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form3_lotus_item where form3_no=? and id in" +
						"(select max(id) from form3_lotus_item where form3_no=?) ");
				
				pst.setString(1, form3_no);
				pst.setString(2, form3_no);
				
				rs = pst.executeQuery();
				
				String empid=null;
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					//System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					//System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(  (name.equalsIgnoreCase(sesName) && desgg.equalsIgnoreCase(desg))    ||(empid.equalsIgnoreCase(empno)))
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
	public String getAuthorizedNameLotusTraveler(String form8_no,String sesName,String desg,String empno) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				String empid=null;
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from  form8_lotus_traveler_item where form8_no=? and id in" +
						"(select max(id) from  form8_lotus_traveler_item where form8_no=?) ");
				
				pst.setString(1, form8_no);
				pst.setString(2, form8_no);
				
				rs = pst.executeQuery();
				
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid= rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg))) ||(empid.equalsIgnoreCase(empno)))
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
	
	
	public String getAuthorizedNameAccessCard(String form4_no,String sesName,String desg,String empno) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				String empid=null;
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form4_accesscard_item where form4_no=? and id in" +
						"(select max(id) from form4_accesscard_item where form4_no=?) ");
				
				pst.setString(1, form4_no);
				pst.setString(2, form4_no);
				
				rs = pst.executeQuery();
				
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid=rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||(empid.equalsIgnoreCase(empno)))
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
	public String getAuthorizedNameFolder(String form5_no,String sesName,String desg,String empno) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				String empid=null;
				pst = conn.prepareStatement("select emp,desg,empid from form5_folder_item where form5_no=? and id in" +
						"(select max(id) from form5_folder_item where form5_no=?) ");
				
				pst.setString(1, form5_no);
				pst.setString(2, form5_no);
				
				rs = pst.executeQuery();
				
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||(empid.equalsIgnoreCase(empno)))
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
	public String getAuthorizedNameInternet(String form6_no,String sesName,String desg,String empno) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				String empid=null;
				pst = conn.prepareStatement("select emp,desg,empid from form6_internet_item where form6_no=? and id in" +
						"(select max(id) from form6_internet_item where form6_no=?) ");
				
				pst.setString(1, form6_no);
				pst.setString(2, form6_no);
				
				rs = pst.executeQuery();
				
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||(empid.equalsIgnoreCase(empno)))
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
	public String getAuthorizedNameGSNET(String form2_no,String sesName,String desg,String emp_no) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form15_gsnet_item where form_no=? and id in " +
						"(select max(id) from form15_gsnet_item where form_no=?) ");
				
				pst.setString(1, form2_no);
				pst.setString(2, form2_no);
				
				rs = pst.executeQuery();
				String emp_id="";
				
				while(rs.next()){
					//System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 emp_id = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					//System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					//System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||( emp_id.equalsIgnoreCase(emp_no) ))
				{
					status = "true";
				}
				else
				{
					status = "false";
				}
				
				//System.out.println("wat is the status  "+status);
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
		return status;
		
	}
	public String getAuthorizedNameTMSUSER(String form2_no,String sesName,String desg,String emp_no) {
		try{
			
			
		   System.out.println("in the method  2222 ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form16_tmsuser_item where form_no=? and id in " +
						"(select max(id) from form16_tmsuser_item where form_no=?) ");
				
				pst.setString(1, form2_no);
				pst.setString(2, form2_no);
				
				rs = pst.executeQuery();
				String emp_id="";
				
				while(rs.next()){
					//System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 emp_id = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					//System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					//System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||( emp_id.equalsIgnoreCase(emp_no) ))
				{
					status = "true";
				}
				else
				{
					status = "false";
				}
				
				//System.out.println("wat is the status  "+status);
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
		return status;
		
	}
	public String getAuthorizedNameCCDRegistration(String form10_no,String sesName,String desg,String empid) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from  form14_ccdregistration_item where form10_no=? and id in" +
						"(select max(id) from  form14_ccdregistration_item where form10_no=?) ");
				
				pst.setString(1, form10_no);
				pst.setString(2, form10_no);
				
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
				
				if((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)) || (empid.equals(empid)))
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
	public String getAuthorizedNameUSB(String form10_no,String sesName,String desg,String empid) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from  form17_usb_access_item where form10_no=? and id in" +
						"(select max(id) from  form17_usb_access_item where form10_no=?) ");
				
				pst.setString(1, form10_no);
				pst.setString(2, form10_no);
				
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
				
				if((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)) || (empid.equals(empid)))
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
	public String getAuthorizedNameCCDREport(String form2_no,String sesName,String desg,String emp_no) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from form13_ccdreport_item where form_no=? and id in" +
						"(select max(id) from form13_ccdreport_item where form_no=?) ");
				
				pst.setString(1, form2_no);
				pst.setString(2, form2_no);
				
				rs = pst.executeQuery();
				String emp_id="";
				
				while(rs.next()){
					//System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 emp_id = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					//System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					//System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))||( emp_id.equalsIgnoreCase(emp_no) ))
				{
					status = "true";
				}
				else
				{
					status = "false";
				}
				
				//System.out.println("wat is the status  "+status);
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
		return status;
		
	}
	
	
	
	
	public String getAuthorizedNameIncident(String form9_no,String sesName,String desg) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg from form9_incident_log_item where form9_no=? and id in" +
						"(select max(id) from form9_incident_log_item where form9_no=?) ");
				
				pst.setString(1, form9_no);
				pst.setString(2, form9_no);
				
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
				
				if((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))
				{
					status = "true";
				}
				else
				{
					status = "false";
				}
				
				System.out.println("wat is the status Incident FORM "+status);
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally{
				DbUtil.closeDBResources(rs,pst,conn);
				
			}
		return status;
		
	}
	public String getAuthorizedNameNewins(String form7_no,String sesName,String desg) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg from form7_newins_item where form7_no=? and id in" +
						"(select max(id) from form7_newins_item where form7_no=?) ");
				
				pst.setString(1, form7_no);
				pst.setString(2, form7_no);
				
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
				
				if((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)))
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
	
	public String getAuthorizedNameRegistration(String form10_no,String sesName,String desg ,String empno) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from  form10_registration_item where form10_no=? and id in" +
						"(select max(id) from  form10_registration_item where form10_no=?) ");
				
				pst.setString(1, form10_no);
				pst.setString(2, form10_no);
				
				rs = pst.executeQuery();
				String empid=null;
				
				while(rs.next()){
					System.out.println("Inside while ");
				   	name = rs.getString("emp");
					 desgg = rs.getString("desg");
					 empid = rs.getString("empid");
					// System.out.println("Name  for Match 1?" +sesName );
					System.out.println("Name  for Match ?" +name+"WIth This Name"+sesName);	
					//mrDate = rs.getDate(1);
					
					System.out.println("Des For Match "  +desgg+"With This Desg"+desg );	
					
				}
				
				if(((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg))) || empid.equals(empno))
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
	public String getAuthorizedNameAudit(String form10_no,String sesName,String desg,String empid) {
		try{
			
			
		     //  System.out.println("in the method   ");
				Connection2 dbConn = new Connection2();
				
				conn = dbConn.getConnection2();
				
				pst = conn.prepareStatement("select emp,desg,empid from  auditform_item where form_no=? and id in" +
						"(select max(id) from  auditform_item where form_no=?) ");
				
				pst.setString(1, form10_no);
				pst.setString(2, form10_no);
				
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
				
				if((name.equalsIgnoreCase(sesName)) && (desgg.equalsIgnoreCase(desg)) || (empid.equals(empid)))
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
	
}
