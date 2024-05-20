<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PRINTER MASTER</title>
<link rel='stylesheet' type='text/css' href='../../css/style.css' />
<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='js/example.js'></script>
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />

<script>
function editRecord(id){
	var f=document.form;    
	f.method="post";    
	f.action='listOfApplicationsEdit.jsp?id='+id;    
	f.submit();
}

function deleteRecord(id){
	if(confirm('Are you sure deleting an Application Name from the list?')){
		var f=document.form;    
		f.method="post";    
		f.action='listOfApplicationsDelete.jsp?id='+id;    
		f.submit();
	}else{
		return false;
	}
}
</script>

<script>
function printit(){
	if(window.print){
		window.print();
	}else{
		var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
		document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
		WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
	}
}

function btnClick(){
	close(); 
}
</script>
</head>

<body>
<br><br>
<form method="post" name="form">
<div align="center">
	<table border="1" style="background-color: #F0F0F0; border-color: grey;">
		<tr>
			<th style="font-weight: bolder;font-size: 20;text-align: center;vertical-align: middle;" nowrap colspan="7">View List of Applications</th>
		</tr>
		<tr>
			<th nowrap>Sl No.</th>
			<th nowrap>Application Name</th>
			<th nowrap>Application Description</th>
			<th nowrap>Added By</th>
			<th nowrap>Added On</th>
			<th nowrap colspan="2" id="hiderow">EDIT/DELETE</th>
		</tr>
<%
Connection con = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
int sumcount=0;
Statement st=null;
ResultSet rs=null; 

try{
	Class.forName(driver).newInstance();
	con = DriverManager.getConnection(url+dbName,userName,password); 
	String query = "select id,app_name,app_desc,addedBy,date_format(addedOn,'%d-%m-%Y') as addedOn from listofapplications where deleteStatus<>'1' order by app_name asc";
	st = con.createStatement();
	rs = st.executeQuery(query);
	int i=0;
	while(rs.next()){
%>
		<tr>
			<td style="text-align: center;vertical-align: middle;background-color: white;" nowrap><%=++i%></td>
			<td style="text-align: left;vertical-align: middle;background-color: white;" nowrap><%=rs.getString("app_name")%></td>
			<td style="text-align: left;vertical-align: middle;background-color: white;" nowrap><%=rs.getString("app_desc")%></td>
			<td style="text-align: left;vertical-align: middle;background-color: white;" nowrap><%=rs.getString("addedBy")%></td>
			<td style="text-align: left;vertical-align: middle;background-color: white;" nowrap><%=rs.getString("addedOn")%></td>
			<td style="text-align: center;vertical-align: middle;background-color: white;" nowrap id="hiderow"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString("id")%>);" ></td>
			<td style="text-align: center;vertical-align: middle;background-color: white;" nowrap id="hiderow"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString("id")%>);" ></td>
		</tr>
<%
	}
}catch(SQLException ex){
	ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,con);
}
%>
	</table>

	<table style="text-align: center;" id="hiderow">
		<tr>
			<td align="left" id="hiderow">
				<input id="hiderow" type='submit' style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'>
			</td>
			<td align="right" id="hiderow">
				<script>
				var NS = (navigator.appName == "Eclipse");
				var VERSION = parseInt(navigator.appVersion);
				if (VERSION > 3) {
				    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
				} 
				</script>
			</td>
		</tr>
	</table> 
</div>
</form>
</body>
</html>