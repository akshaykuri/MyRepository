<%@ page import="java.sql.*" %>
 <%
 int id = Integer.parseInt(request.getParameter("id"));
// String AssetNo = request.getParameter("id");
// System.out.println("asset numberrrrr-----"+AssetNo);
 Connection con =null;
 Statement st=null,st1=null,st2=null;
 try
 {        
	// System.out.println("asset numberrrrr inside tryyyyyy-----"+id);
	 
	 Class.forName("com.mysql.jdbc.Driver");           
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	  st=con.createStatement();           
	 int i=st.executeUpdate("update hardware_amc_nonit set status='Inactive' where hw_id_Nit="+id+"");
	
	 response.sendRedirect("ViewFirstPage.jsp");
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>