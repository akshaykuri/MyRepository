<%@ page import="CON2.Connection2" %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="UpdateIspOutageEmailAddMaster.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="20%">
	<tr>
		<td bgcolor="lightgrey" align="center" ><font color="black">Branch Name</font></td>
		<td bgcolor="lightgrey" align="center" ><font color="black">Group Name</font></td>
		<td bgcolor="lightgrey" align="center" ><font color="black">Employee Name</font></td>
		<td bgcolor="lightgrey" align="center" ><font color="black">Employee Email Id</font></td>	    
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
			 
		   String query1 = " select isp.id,b.m_b_name,i.groupName,b.id,isp.empName,isp.empEmail from ispoutageemailadd_master isp "+
				           " INNER JOIN branch_master_main b ON b.id=isp.branchId"+
				           " INNER JOIN ispoutageemailgroup_master i ON i.id=isp.groupId"+
				           " where isp.id='"+id+"' " ;
		   
		   st = conn.createStatement(); 
		   rs = st.executeQuery(query1);   %>
      <tr>    
	      <% while(rs.next()){ %>
	           <td><input name="bname" value="<%=rs.getString(2)%>" readonly>	
	           <input type="hidden" name="id"  value="<%=id%>"></td>
	           <td><input name="groupName" id="groupName"  value="<%=rs.getString(3)%>" readonly >	
	           <td><input name="empName" id="empName" size="30" value="<%=rs.getString(5)%>">	
	           <td><input name="empEmail" id="empEmail" size="40" value="<%=rs.getString(6)%>">	
	      <%}%> 	    
	     
	     </tr>
	     <tr> 
        <td colspan="4" align="center">
           <input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"> 
           <input type="button" style="background-color:white;font-weight:bold;color:black;" value='close' onclick='history.go(-1)'>
       </td></tr>
	     
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
      </form>