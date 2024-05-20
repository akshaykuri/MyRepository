
<%@ page import="java.sql.*" %>
<%@ page import="CON2.Connection2" %>
 <% 
 String id = request.getParameter("group");
 Connection con = null; 
 Connection2 dbConn = new Connection2();
 con = dbConn.getConnection2();
 Statement st=null;
 String msg=null;
 int i=0;
 
 try
 {         
	   st=con.createStatement();           
	   i=st.executeUpdate("delete from ispoutageemailgroup_master where id="+id);           
	  
	  if(i != 0){
		  msg = "Data__Deleted__SUCCESSFULLY";
	  }
	  else{
		  msg = "not__Deleted";
	  }
	  response.sendRedirect("DispalyOutageEmailGroup.jsp?msg="+msg);
 
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>