<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String namae = null;
 String maill = null;
 String Npost = null;
 String msg=null;
 Connection con=null;
 Statement st=null,st2=null,st3=null,st4=null;
 ResultSet rs=null,rs2=null;
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
	  
	 rs = st2.executeQuery("SELECT id,Nname,Nmail,NpostingCo FROM formUser_master WHERE id="+id+"");
	 if(rs.next()){
	 String id2 = rs.getString("id");
     namae = rs.getString("Nname");
     maill = rs.getString("Nmail");
     Npost = rs.getString("NpostingCo");
	}
	 int i=st.executeUpdate("delete from formUser_master where id="+id+"");  
	// int k=st.executeUpdate("delete from nentryho where id="+id+""); 
	rs2 = st4.executeQuery("SELECT Nname,Npost FROM nentryho WHERE Nname='"+namae+"' AND Npost='"+Npost+"'");
	if(rs.next())
	{
	 int k=st2.executeUpdate("UPDATE into nentryho SET form_user='NULL' WHERE Nname='"+namae+"' AND Npost='"+Npost+"'");
	}
	 int j=st3.executeUpdate("delete FROM emp WHERE EMP_NAME='"+namae+"' AND e_city='"+Npost+"'"); 
	 msg="Name__'"+namae+"'__Details__is__deleted__successfully__From__Form__Master";
	 response.sendRedirect("DisplayFormUser.jsp?msg="+msg);} catch (SQLException ex) {
		    ex.printStackTrace();
	 }	


	 finally{
	 			DbUtil.closeDBResources(rs,st,con);
	 			DbUtil.closeDBResources(rs2,st2,null);
	 			DbUtil.closeDBResources(null,st3,null);
	 			DbUtil.closeDBResources(null,st4,null);
	 			} %>

 
