<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String[] words=id.split(",");
 Connection con=null;
 Statement st=null;
 ResultSet rs=null;
 String msg="";
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
	 System.out.println(words[0]);
	 System.out.println(words[1]);
	 System.out.println(words[2]);
	 System.out.println(words[3]);
	
	 int i=st.executeUpdate("delete from formapproval where (levelno="+words[0]+" and empid="+words[2]+" and branch="+words[1]+" and formtype='"+words[3]+"')");           
	 response.sendRedirect("approverDisp.jsp?itnonit="+words[3]+"&branch="+words[1]+"&msg="+msg);}catch (Exception e){System.out.println(e);
     }
	 finally{
			//DbUtil.closeDBResources(rs,st,con);
       	    }
 %>