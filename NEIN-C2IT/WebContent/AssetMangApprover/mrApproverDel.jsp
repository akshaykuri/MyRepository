<%-- <%@page import="CON1.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String[] words=id.split(",");
 Connection con=null;
 Statement st=null;
 ResultSet rs=null;
 String msg="";
 try
     {          
	 Class.forName("com.mysql.jdbc.Driver");           
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	 st=con.createStatement();  
	 System.out.println(words[0]);
	 System.out.println(words[1]);
	 System.out.println(words[2]);
	 System.out.println(words[3]);
	 System.out.println(words[4]);
	 int i=st.executeUpdate("delete from mrapprover where (levelno="+words[0]+" and empid="+words[2]+" and branch="+words[1]+" and useroffice='"+words[4]+"')");           
	 response.sendRedirect("mrApproverDisp.jsp?itnonit="+words[3]+"&branch="+words[1]+"&useroffice="+words[4]+"&msg="+msg);}catch (Exception e){System.out.println(e);
     }
	 finally{
		/* 	DbUtil.closeDBResources(rs,st,con); */
       	    }
 %>