<%@ page import="java.sql.*" %>
 <%
		 String id = request.getParameter("id");
		 Connection con =null;
		 Statement st=null;
		 try
		 {          
			 System.out.println("------------- access Bio Del  -----------------");
			 Class.forName("com.mysql.jdbc.Driver");           
			  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
			  st=con.createStatement();           
			 int i=st.executeUpdate("delete from accessbiotype where id="+id+"");           
			 response.sendRedirect("DisplayAccesBioType.jsp");
		 %><%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	
		finally{
				con.close();
					//DbUtil.closeDBResources(null,st,con);
				}
%>