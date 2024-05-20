<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="bomAuthorupdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
		
		<td height="20" bgcolor="white" width="100" align=center><font color="black">E-ID</font></td>
		<td bgcolor="white" width="100" align=center><font color="black">E-NAME</font></td>
		<td bgcolor="white" width="140" align=center><font color="black">E-DESIGNATION</font></td>
		<td bgcolor="white" width="100" align=center><font color="black">DESIG-CODE</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">DEPT-Name</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">MAIL-ID</font></td>
		
		</tr>
<%
String no=request.getParameter("id");
  
Connection conn=null;
Statement st=null;
ResultSet rs=null;
  int sumcount=0;
  ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
  String query = "select * from emp where id='"+no+"'";
  st = conn.createStatement();
  rs = st.executeQuery(query);
  while(rs.next()){%>
  <tr>
     
     <td bgcolor=""><input type="text" name="EMP_NO" style="background-color:white;width:100;color:black;" value="<%=rs.getString("EMP_NO")%>"></td>
      <td bgcolor=""><input type="text" name="EMP_NAME" style="background-color:white;width:100;color:black;" value="<%=rs.getString("EMP_NAME")%>"></td>
      <td bgcolor=""><input type="text" name="DESIGNATION" style="background-color:white;width:100;color:black;" value="<%=rs.getString("DESIGNATION")%>"></td>
      <td bgcolor=""><input type="text" name="DESG_NO" style="background-color:white;width:100;color:black;" value="<%=rs.getString("DESG_NO")%>"></td>
      <td bgcolor=""><input type="text" name="DEPT_NAME" style="background-color:white;width:100;color:black;" value="<%=rs.getString("DEPT_NAME")%>"></td>
      <td bgcolor=""><input type="text" name="MAIL_ID" style="background-color:white;width:100;color:black;" value="<%=rs.getString("MAIL_ID")%>"></td>
      
      
      <td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td></tr>
      <%}}	catch (Exception e) {
	 		 System.out.println(e);
		}

finally{
		DbUtil.closeDBResources(rs,st,conn);

		}%>
      </table>
      </form>