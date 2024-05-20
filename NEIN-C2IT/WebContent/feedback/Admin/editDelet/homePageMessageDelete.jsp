<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 System.out.println("iddd :"+id);
/*  String branch4=null;
 String date4= null;
 String date44= null;
 branch4 = (String) session.getAttribute("branch4");
 date4 = (String) session.getAttribute("date4");
 date44 = (String) session.getAttribute("date44");
 System.out.println("branch4 :"+branch4);
 System.out.println("date4 :"+date4);
 System.out.println("date44 :"+date44);
 System.out.println("---------------------------------------------------------------------"); */
 
 Connection con=null;
 Statement st=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver"); 
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", ""); 
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from notemaster where id="+id+"");           
	 response.sendRedirect("homePageMessage.jsp");}catch (Exception e){System.out.println(e);
 }finally{
		DbUtil.closeDBResources(null,st,con);

	}
 %>
<%--  <input type="hidden" name="branch4" value="<%=branch4%>"/>
 <input type="hidden" name="date4" value="<%=date4%>"/>
 <input type="hidden" name="date44" value="<%=date44%>"/> --%>