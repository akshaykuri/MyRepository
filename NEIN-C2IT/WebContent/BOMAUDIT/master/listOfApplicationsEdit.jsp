<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>

<form method="post" action="listOfApplicationsUpdate.jsp">

<br><br><br>
<div align="center">
<table border="1" style="text-align: center;background-color: #F0F0F0;border-color: grey;width: 600px;">
	<tr style="font-weight: bolder;font-size: 20;text-align: center;vertical-align: middle;">
		<th colspan="4">Edit List of Applications</th>
	</tr>
	<tr>
		<th nowrap>Application Name</th>
		<th nowrap>Application Description</th>
		<th nowrap colspan="2">Update / Cancel</th>
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
try{
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url+dbName,userName,password); 
	String query = "select * from listofapplications where id='"+no+"'";
	st = conn.createStatement();
	rs = st.executeQuery(query);
	while(rs.next()){
%>
	<tr>
		<td>
			<input name="app_name" style="background-color:white;width:100%;color:black;" value="<%=rs.getString("app_name")%>">
		</td>
		<td>
			<input name="app_desc" style="background-color:white;width:100%;color:black;" value="<%=rs.getString("app_desc")%>">
			<input type="text" style="display: none;" name="id" value="<%=rs.getString(1)%>">
		</td>
		<td>
			<input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;">
		</td>
		<td bgcolor="lightgrey">
			<input type="button" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'>
		</td>
	</tr>
<%	}
}catch(SQLException ex){
	ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,conn);
}
%>
</table>
</div>
</form>