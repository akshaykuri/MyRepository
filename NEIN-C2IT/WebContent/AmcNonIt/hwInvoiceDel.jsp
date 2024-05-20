<%@ page import="java.sql.*" %>
 <%
 
 //System.out.println("in delete page");
 String id = request.getParameter("f");
 String id1 = request.getParameter("g");
// int id = Integer.parseInt(request.getParameter("id"));
 //int id1 = Integer.parseInt(request.getParameter("id1"));
 //String id1 = request.getParameter("id1");
 //System.out.println("in delete page-----"+id);
 //System.out.println("in delete page--f---"+id);
 //System.out.println("in delete page--g---"+id1);
 Connection con =null;
 Statement st=null,st1=null,st2=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	  st=con.createStatement();           
	/*  int i=st.executeUpdate("delete from  software_details where sw_id="+id+"");
	 st1=con.createStatement(); 
	 int j=st.executeUpdate("delete from software_details_multiple where sw_id="+id+"");
	 st2=con.createStatement(); */ 
	 int k=st.executeUpdate("delete from hardware_nonit_invoice where hnit_id="+id+"");
	 response.sendRedirect("EditPage.jsp?id="+id1);
	 %><%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>