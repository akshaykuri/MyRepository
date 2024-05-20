<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<script>
function cancel()
{
   close();
}
</script>

</head>
<form>
Welcome : <%= session.getAttribute( "Nname" ) %>
 <table  align=center border=2 background=".jpg"  bordercolor=#aaaccc>
<%

Object newName = session.getAttribute("Nname");
//System.out.println("NAME222   "+newName);

String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("newpwd");
String conpass=request.getParameter("confirm");
//String connectionURL = "jdbc:mysql://localhost:3306/csdb";
Connection con=null;

String msg = null;
int j=0;
String pass="";
int id=0;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try{
/* Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionURL, "root", "");
 */
 Class.forName(driver).newInstance();
 con = DriverManager.getConnection(url+dbName,userName,password); 

 Statement st=con.createStatement();





ResultSet rs1=st.executeQuery("select * from formuser_master where Npwd='"+currentPassword+"' AND Nname='"+newName+"'");
if(rs1.next())
{
id=rs1.getInt(1);

pass=rs1.getString(4);
}
System.out.println(id+ " "+pass);

if(pass == null )
{
	%>
	<center>
	<% 
	//out.println("Incorrect Entry");
	 msg = "Incorrect__Entry";
	
	%>
	</center>
	<% 
}

	
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update formuser_master set Npwd='"+Newpass+"' where id='"+id+"'");
%>
<center>
<% 
out.println("Password changed successfully");
msg="Password__changed__successfully";
%>
</center>
<% 
st1.close();
con.close();
}
else{
	%>
	<center>
	<% 
out.println(" Try Again ");
	msg="Try__Again";
	%>
	</center>
	<% 
}

response.sendRedirect("change_pwd_hr.jsp?msg=" +msg);
}


catch(Exception e){
out.println(e);
}
%>

<br>
<br>
<br>

<tr><td><input type="button" value="OK" onclick="cancel();" /></td></tr>
</table>
</form>
</html>