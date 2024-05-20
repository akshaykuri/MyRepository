 <%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 System.out.println("INCIDENT DELETE "+id);
 String deleteBy = request.getParameter("deleteBy");//deleting person name
 String deleteDesig = request.getParameter("deleteDesig");//deleting person designation
 String deleteMail = request.getParameter("deleteMail");//deleting person designation
 String Nno=null,FormNo=null;
 String msg=null;
 Connection con=null;
 Statement st=null,st2=null,st3=null,st4=null,st5=null,st6=null;
 ResultSet rs=null,rs2=null;
 String message = null;
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
	 
	
	 rs = st2.executeQuery("SELECT id,form9_no FROM  form9_incident_log WHERE id="+id+"");
	 if(rs.next()){
		 String id2 = rs.getString("id");
		 FormNo = rs.getString("form9_no");
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
	                /* int i=st.executeUpdate("delete FROM form9_incident_log where id="+id+"");    
	            	int j=st3.executeUpdate("delete FROM form9_incident_log_item WHERE form9_no='"+FormNo+"'");
	            	int k=st3.executeUpdate("delete FROM form9_incident_item WHERE form9_no='"+FormNo+"'"); */
	    
	            	int i=st.executeUpdate("UPDATE form9_incident_log SET deleted='yes' where id="+id+"");  
	 
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

	 
	 
	 
	 msg="FORM__NO__'"+FormNo+"'__is__deleted__successfully";
	 response.sendRedirect("incident.jsp?msg="+msg);
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