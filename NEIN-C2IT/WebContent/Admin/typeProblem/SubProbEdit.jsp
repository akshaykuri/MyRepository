<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<script language="javascript" type="text/javascript">
function btnClick() { 
    close(); 
}
</script>
<form method="post" action="SubProbUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="120" align=center><font color="black">TYPE</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">CATEGORIES</font></td>
<td bgcolor="white" width="120" align=center><font color="black">DESCRIPTION</font></td>
<td bgcolor="white" width="120" align=center><font color="black">SW/HW</font></td>
<td style="visibility: hidden;" ></td>
<td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
			</tr>
<%
String no=request.getParameter("id");
  
  
 
  int sumcount=0;
  Connection conn=null;
  Statement st2 =null;
  ResultSet rs2=null;
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
  String query = "select * from prob_type_master_sub where id='"+no+"'";
  Statement st = conn.createStatement();
  ResultSet rs = st.executeQuery(query);
  
  String query2 = "select * from prob_type_master_main ORDER BY NAME Asc";
  st2 = conn.createStatement();
  rs2 = st2.executeQuery(query2);
  
  while(rs.next()){%>
  <tr>
     
      <td bgcolor=""><input name="backup_name" style="background-color:white;width:100;color:black;" readonly="readonly" value="<%=rs.getString("name")%>"></td>
      <td bgcolor=""><font color="white"><input name="backup_detail" style="background-color:white;width:80;color:black;" value="<%=rs.getString("pt_descriptions")%>"></font></td>
      <td bgcolor=""><font color="white"><input name="bkLocation" style="background-color:white;width:80;color:black;" value="<%=rs.getString("pt_fullDescription")%>"></font></td>
      <td bgcolor=""><font color="white">
           <select id="sw_hw" name="sw_hw">
		             <option value="<%=rs.getString("sw_hw")%>"><%=rs.getString("sw_hw")%></option>
		             <option value="SOFTWARE">SOFTWARE</option>
		             <option value="HARDWARE">HARDWARE</option>
		              <option value="HARDWARE/SOFTWARE">HARDWARE/SOFTWARE</option>
             </select>
        </td>
      <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td bgcolor="lightgrey"><input type="submit" size="2"  name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
      </tr>
      <%}}		catch (Exception e) {
	 		 System.out.println(e);
		}
		finally{
			DbUtil.closeDBResources(rs2,st2,conn);

			}	%>
      </table>
      </form>