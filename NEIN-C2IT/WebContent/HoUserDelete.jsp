<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String namae = null;
 String maill = null;
 String Npost = null;
 Connection con=null;
 Statement st=null,st2=null,st3=null,st4=null;
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
	
	 rs = st2.executeQuery("SELECT id,Nname,Nmail,NpostingCo FROM nentryho WHERE id="+id+"");
	 if(rs.next()){
	 String id2 = rs.getString("id");
     namae = rs.getString("Nname");
     maill = rs.getString("Nmail");
     Npost = rs.getString("NpostingCo");
	// System.out.println("RESULTTTTTTTTTTTTTTTTTTTTTTTT name :"+namae);
   //  System.out.println("RESULTTTTTTTTTTTTTTTTTTTTTTTT mail :"+maill);
   //  System.out.println("RESULTTTTTTTTTTTTTTTTTTTTTTTT post :"+Npost);
	 }
	 
	 int i=st.executeUpdate("delete from nentryho where id="+id+"");   
	 int j=st3.executeUpdate("delete FROM emp WHERE EMP_NAME='"+namae+"' AND e_city='"+Npost+"'"); 
	 int k=st4.executeUpdate("delete FROM assigned_master WHERE Locname='"+namae+"' AND delet='"+Npost+"'");
	 response.sendRedirect("DisplayDelHo.jsp?msg=1");
 }
  catch (SQLException ex) {
	    ex.printStackTrace();
	}	


	finally{
		DbUtil.closeDBResources(rs,st,con);
		DbUtil.closeDBResources(rs,st2,con);
		DbUtil.closeDBResources(null,st3,null);
		DbUtil.closeDBResources(null,st4,null);

				}
 %>