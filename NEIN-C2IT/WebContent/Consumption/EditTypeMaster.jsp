<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<form method="post" action="UpdateTypeMaster.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="50%">
	<tr>
		<td bgcolor="lightgrey" width="120" align="center" colspan="2"><font color="black">TYPE MASTER</font></td>	    
		</tr>
<%
String id=request.getParameter("id");

Connection conn = null;
Connection2 dbConn = new Connection2();
conn = dbConn.getConnection2();
Statement st=null;
ResultSet rs=null; 
 try 
  {
     
   String query1 = "select * from type_master where type_id="+id;
   st = conn.createStatement();
   rs = st.executeQuery(query1);  %>
    <tr>
              
	      <% while(rs.next()){ %>
	         <td width="120" align="center" colspan="2">
	         <input name="type_name" size="60"  style="background-color:white;color:black;" value="<%=rs.getString("type_name")%>">	
	         <input name="type_id" style="background-color:white;width:100;color:black;visibility: hidden;" value="<%=rs.getString("type_id")%>"></td>
	      <%}%> 	    
	     
	     </tr>
	     <tr> <br><br>    
        <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
        <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='close' onclick='history.go(-1)'>
       </td></tr>
	     
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
      </form>