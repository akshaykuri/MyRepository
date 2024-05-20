<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="NewSubTypeUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="120" align=center><font color="black">DESIGNATION</font></td>
	

			</tr>
<%
String no=request.getParameter("id");
Connection conn=null;
Statement st=null;
ResultSet rs=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName"); 
 
  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
  String query = "select * from  prob_master where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  while(rs.next()){%>
  <tr>
     
      <td bgcolor=""><input name="DESIGNATION" style="background-color:white;width:100;color:black;" value="<%=rs.getString("p_type")%>"></td>
     
      <td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td></tr>
      <%}%>
      <%
  } catch (SQLException ex) {
	    ex.printStackTrace();
	}	


	finally{
				DbUtil.closeDBResources(rs,st,conn);

				}
      %>
      </table>
      </form>