<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<form method="post" action="MPLSUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
	<!--
ISP-NAME,MPLS-BRANCH,CIRCUIT ID,BRAND WIDTH,LAN IP,WAN IP,NETWORK IP
isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip  -->	
		<td height="20" bgcolor="white" width="120" align=center><font color="black">ISP-NAME</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">MPLS-BRANCH</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">CIRCUIT ID</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">BRAND WIDTH</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">LAN IP</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">WAN IP</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">NETWORK IP</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">Location</font></td>
<td style="visibility: hidden;" ></td>
<td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
			</tr>
<%
String no=request.getParameter("id");
  
  
Connection conn=null;
Statement st=null,st2=null;
ResultSet rs=null,rs2=null;
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
     String query = "select * from mpls_master where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  
  String query2 = "select * from branch_master ORDER BY b_name Asc";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2);
  while(rs.next()){%>
  <tr>
     	<!--
ISP-NAME,MPLS-BRANCH,CIRCUIT ID,BRAND WIDTH,LAN IP,WAN IP,NETWORK IP
isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip  -->	
      <td bgcolor=""><input name="isp_name" style="background-color:white;width:100;color:black;" value="<%=rs.getString("isp_name")%>"></td>
      <td bgcolor=""><font color="white"><input name="mpls_branch" style="background-color:white;width:80;color:black;" value="<%=rs.getString("mpls_branch")%>"></font></td>
      <td bgcolor=""><font color="white"><input name="crt_id" style="background-color:white;width:80;color:black;" value="<%=rs.getString("crt_id")%>"></font></td>
      <td bgcolor=""><font color="white"><input name="brndwdt" style="background-color:white;width:80;color:black;" value="<%=rs.getString("brndwdt")%>"></font></td>
      <td bgcolor=""><font color="white"><input name="lan_ip" style="background-color:white;width:80;color:black;" value="<%=rs.getString("lan_ip")%>"></font></td>
      <td bgcolor=""><font color="white"><input name="wan_ip" style="background-color:white;width:80;color:black;" value="<%=rs.getString("wan_ip")%>"></font></td>
      <td bgcolor=""><font color="white"><input name="network_ip" style="background-color:white;width:100;color:black;" value="<%=rs.getString("network_ip")%>"></font></td>
      
      <td bgcolor=""><font color="white">
      <select name="bkLocation">
		<option value="<%=rs.getString("bkLocation")%>"><%=rs.getString("bkLocation")%></option> 
			<%while(rs2.next()){ %>
			
			<option><%=rs2.getString("b_name")%></option>
			<%} %>
		</select>
      </font></td>
      <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
      <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
      </tr>
      
      <%}%>
      
      <%

  } catch (SQLException ex) {
      ex.printStackTrace();
  }	


  finally{
  			DbUtil.closeDBResources(rs,st,conn);
  			DbUtil.closeDBResources(rs2,st2,null);
  			}
      %>
      </table>
      </form>