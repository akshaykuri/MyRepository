 <%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String Nno=null,Nname=null,post=null,Nmail=null;
 String msg=null;
 Connection con=null;
 Statement st=null,st2=null,st3=null,st4=null,st5=null,st6=null;
 ResultSet rs=null;
 
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
 try
 {          
	 Class.forName(driver).newInstance();
     con = DriverManager.getConnection(url+dbName,userName,password); 
	  st=con.createStatement();  
	  st2=con.createStatement();
	  st3=con.createStatement();
	  st4=con.createStatement();
	  st5=con.createStatement();
	  st6=con.createStatement();
	 
	
	 rs = st2.executeQuery("SELECT id,Nno,Nname,Nmail,post FROM login WHERE id="+id+"");
	 if(rs.next()){
		 String id2 = rs.getString("id");
		  Nno = rs.getString("Nno");
		  Nname = rs.getString("Nname");
		  Nmail = rs.getString("Nmail");
		  post = rs.getString("post");
	            }
	 int i=st.executeUpdate("delete from login where id="+id+"");    
	 int j=st3.executeUpdate("delete FROM emp WHERE EMP_NO='"+Nno+"' AND EMP_NAME='"+Nname+"' AND DESIGNATION='"+post+"' AND MAIL_ID='"+Nmail+"'"); 
	 int k=st4.executeUpdate("delete FROM nentryho WHERE  Nname='"+Nname+"' AND Npost='"+post+"' AND Nmail='"+Nmail+"'");
	 int l = st5.executeUpdate("delete FROM formUser_master WHERE  Nname='"+Nname+"' AND Npost='"+post+"' AND Nmail='"+Nmail+"'");
	 int m = st6.executeUpdate("DELETE FROM handling_master WHERE Locname='"+Nname+"' AND locpost='"+post+"' AND mailid='"+Nmail+"'");
	 msg="Name__'"+Nname+"'__with__Designation__'"+post+"'__is__deleted__successfully";
	 response.sendRedirect("displayadmin.jsp?msg="+msg);
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