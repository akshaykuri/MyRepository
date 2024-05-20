<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 
 
 String id = request.getParameter("id");
 //System.out.println("sched  ID delete:"+id);
 String empid=id.substring(0,4);
// System.out.println("ID delete:"+empid);
 int l=id.length();
// System.out.println("ID delete:"+l);
 String recid=id.substring(4,l);
 //System.out.println("rec ID delete:"+recid);
 
 
 String day="dayy"+recid;
 String hr="hrr"+recid;
 String min="mmm"+recid;
 String soft="soft"+recid;
// System.out.println("rec ID delete:"+day);
// System.out.println("rec ID delete:"+hr);
 //System.out.println("rec ID delete:"+min);
// System.out.println("rec ID delete:"+soft);
 
 String daydb = request.getParameter(day);
 String hrdb = request.getParameter(hr);
 String mindb = request.getParameter(min);
 String schtime=hrdb+":"+mindb;
 String softdb = request.getParameter(soft);
 
 
 Connection con =null;
 Statement st=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	 st=con.createStatement();           
	 int i=st.executeUpdate("update systembackupschdaytime set schday='"+daydb+"',schtime='"+schtime+"',softwareused='"+softdb+"' where id="+recid+"");      
	 String msg="updated_successfully....?";
	 response.sendRedirect("backupScheduleBack.jsp?Nno=" +empid);
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,con);

			}%>