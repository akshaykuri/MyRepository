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

 <table  align=center border=2 background=".jpg"  bordercolor=#aaaccc>
<%
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("newpwd");
String conpass=request.getParameter("confirm");
//String connectionURL = "jdbc:mysql://localhost:3306/csdb";
Connection con=null;
String msg = null;
String pass="";
//String formElement = "";
int id=0;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
   
//Class.forName("com.mysql.jdbc.Driver");
//con = DriverManager.getConnection(connectionURL, "root", "");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from login where UPWD='"+currentPassword+"'");
if(rs.next())
{
id=rs.getInt(1);
pass=rs.getString(4);
}
System.out.println(id+ " "+pass);
//if (new.pass.length < 5 || new.pass.length > 10) {
	//out.println("Please enter a password that is between 5 and 10 characters long");
	//} 

if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update login set UPWD='"+Newpass+"' where id='"+id+"'");
%>


<center>
<% 
//out.println("Password changed successfully");
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
response.sendRedirect("changePwdAdmin.jsp?msg=" +msg);
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