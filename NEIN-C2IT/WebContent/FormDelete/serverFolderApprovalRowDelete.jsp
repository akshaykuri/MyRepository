 <%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 System.out.println("SHARED FOLDER DELETE "+id);
 String deleteBy = request.getParameter("deleteBy");//deleting person name
 String deleteDesig = request.getParameter("deleteDesig");//deleting person designation
 String deleteMail = request.getParameter("deleteMail");//deleting person designation
 String Nno=null,FormNo=null;
 String msg=null;
 Connection con=null;
 Statement st=null,st2=null,st3=null,st4=null,st5=null,st6=null;
 ResultSet rs=null,rs2=null,rs5=null;
 String message = null;
 String Approval_empp=null,Approval_desgg=null;//replacing this approver
 String Approval_emp=null,Approval_desg=null;//deleting this approver
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	  st=con.createStatement();  
	  st2=con.createStatement();
	  st3=con.createStatement();
	  st4=con.createStatement();
	  st5=con.createStatement();
	  st6=con.createStatement();
	 
	  rs5 = st5.executeQuery("SELECT id,form5_no FROM  form5_folder_item WHERE id='"+id+"'");
		 if(rs5.next()){
			 FormNo = rs5.getString("form5_no");
			 System.out.println("FORM NO :--------------------------- "+FormNo);
		            }
	
	 rs = st2.executeQuery("SELECT id,form5_no,Approval_empp,Approval_desgg,Approval_emp,Approval_desg FROM  form5_folder WHERE form5_no='"+FormNo+"'");
	 if(rs.next()){
		 String id2 = rs.getString("id");
		// FormNo = rs.getString("form5_no");
		 Approval_empp=rs.getString("Approval_empp");//PRASANNA
		 Approval_desgg =rs.getString("Approval_desgg");//IT MANGER
		 Approval_emp=rs.getString("Approval_emp");//C B SUDHEER  this will be changed to Prasanna
		 Approval_desg=rs.getString("Approval_desg");//VICE PRESIDENT this will be changed to IT maanager
		 //Replacing CB SHUDHEER to IT MANAGER
		 System.out.println("FORM NO :--------------------------- "+FormNo);
	            }
	 String mail_id=null,name_id=null;
/* 	 rs2 = st4.executeQuery("SELECT id,emp,form1_no,mail FROM form1_it_clearance_item WHERE form1_no="+FormNo+" ");
	 if(rs2.next()){
		 name_id = rs2.getString("emp");
		 FormNo = rs2.getString("mail");
		 
	            } */
	            
	         /*    PreparedStatement psmt1=null;
	            int iddd=0;

	            psmt1 = con.prepareStatement("SELECT id,emp,form1_no,mail FROM form1_it_clearance_item WHERE form1_no=?");
	            psmt1.setString(1,FormNo);
	            rs2 = psmt1.executeQuery();
	            while (rs2.next()) {
	            	iddd = rs2.getInt(iddd);
	            	mail_id = rs2.getString("mail");
	            	name_id = rs2.getString("emp");
	            	} */
	                int i=st.executeUpdate("UPDATE form5_folder SET Approval_status='Pending',Approval_sttatuss='Pending',Approval_emp='"+Approval_empp+"',Approval_desg='"+Approval_desgg+"' where form5_no='"+FormNo+"'");
	            	System.out.println("I is executed "+i);
	            	int j=st3.executeUpdate("DELETE FROM form5_folder_item WHERE form5_no='"+FormNo+"' AND emp='"+Approval_emp+"' AND desg='"+Approval_desg+"'");
	            	System.out.println("J is executed "+j);
	            	int k=st4.executeUpdate("UPDATE form5_folder_item SET status='Pending',remarks='Pending',presence='now' WHERE form5_no='"+FormNo+"' AND emp='"+Approval_empp+"' AND desg='"+Approval_desgg+"' ");
	            	System.out.println("K is executed "+k);
	 
	 
/* 	 deleteBy.trim();
	 for(int u=0;u<iddd ;u++)
	 {
	// postMail.postMail(deleteMail,deleteBy,"pass1234",mail_id," IT CLEARANCE FORM :  " +FormNo+ " ",deleteBy+  " "+  "Deleted IT CLEARANCE FORM :     "+FormNo+"");              
	 System.out.println("FORM NO deleteMail "+deleteMail);
	 System.out.println("FORM NO deleteBy "+deleteBy);
	 System.out.println("FORM NO mail_id "+mail_id);
	 System.out.println("FORM NO FormNo "+FormNo);
	 }
	 message = null; */

	 
	 postMail.postMail(deleteMail,deleteBy,"pass1234",mail_id," SHARED FOLDER FORM , your approval deleted for  :  " +FormNo+ " ",deleteBy+  " "+  "Deleted your approval routine for Shared Folder : "+FormNo+"<br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
	 
	 msg="FORM__NO__'"+FormNo+"'__is__deleted__successfully__and__replaced__with__last__Second__appprover__'"+Approval_empp+"'";
	 response.sendRedirect("serverFolder.jsp?msg="+msg);
	 }
	 catch (Exception e) {
		 System.out.println(e);
		}
		finally{
			DbUtil.closeDBResources(rs,st,con);
			DbUtil.closeDBResources(null,st2,null);
			DbUtil.closeDBResources(null,st3,null);
			DbUtil.closeDBResources(null,st4,null);
			DbUtil.closeDBResources(null,st5,null);
			DbUtil.closeDBResources(null,st6,null);

			
			
		}
 %>