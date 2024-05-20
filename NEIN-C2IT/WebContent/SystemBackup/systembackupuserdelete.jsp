 <%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String Nno=null,Nname=null,post=null,Nmail=null;
 String msg=null;
 Connection con=null;
 Statement st=null,st2=null,st3=null,st4=null,st5=null,st6=null;
 ResultSet rs=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	 st=con.createStatement();  
	 int i=st.executeUpdate("delete from systemuserbackup where empno="+id+"");    
	 msg="Deleted__Successfully.....";
	 response.sendRedirect("viewuser.jsp?msg="+msg);
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