<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 //System.out.println("ID delete:"+id);
 String empid=id.substring(0,4);
// System.out.println("ID delete:"+empid);
 int l=id.length();
 //System.out.println("ID delete:"+l);
 String recid=id.substring(4,l);
 //System.out.println("rec ID delete:"+recid);
 Connection con =null;
 Statement st=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	 st=con.createStatement();           
	 int i=st.executeUpdate("delete from systembackupschdaytime where id="+recid+"");      
	 String msg="Deleted_successfully....?";
	 response.sendRedirect("backupScheduleBack.jsp?Nno=" +empid);
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,con);

			}%>