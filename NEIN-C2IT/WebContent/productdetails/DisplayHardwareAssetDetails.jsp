<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Softwares Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
    <link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
    
    


<script language="javascript">
function editRecord(id)
    {  
	//alert(id);
    var f=document.form;    
    f.method="post";    
    f.action='hardwareAssetDetailsEdit.jsp?id='+id;    
    f.submit();
    }
    
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('You are above to delete Software Type'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='Userdelete.jsp?id='+id;    
           f.submit();
          }
	else{}
   }
   </script>
 </head>
<body>
<br><br>  
<form method="post" name="form">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
      
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">ASSET  DETAILS</font></strong></td>
</tr>
 
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("emp_no")%>" >        
                </td>
 </tr>
</table>

<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	  <td bgcolor="#74c1b9" width="120" align=center><font color="black">Asset Type</font></td>
	  <td bgcolor="#74c1b9" width="120" align=center><font color="black">Serial Number</font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Brand</font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Model</font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Configuration</font></td>
	    <!-- <td bgcolor="lightgrey" width="120" align=center><font color="black">Config field</font></td>
        <td bgcolor="#74c1b9" width="120" align=center><font color="black">Config field</font></td>
        <td style="visibility: hidden;" ></td> -->
       <!--  <td bgcolor="white" width="120" align=center  style="background-color:#74c1b9"><font size="2" color="black"><b>EDIT</b></font></td>
		 --></tr>
<%
String no=request.getParameter("id");
System.out.println("assettttt-----"+no);

Connection conn=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;

 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   
  //String query = "select assettype,configname from assetconfgfield where assettype='"+an+"' and configname ='"+co+"'";
   //st = conn.createStatement();
   //rs = st.executeQuery(query);
   
    String query1 = "select distinct hwp_id,Asset_type,serial_no,brand,model,configuration from hardware_details_multiple where Asset_no='"+no+"'";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
   <%while(rs2.next()){%>
    <tr>
         <%--  <td style="visibility: hidden;"><input type="hidden" name="sid" value="<%=sid%>"></td> --%>
         <td bgcolor="#d2f7f3"><input name="user" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("Asset_type")%>" readonly></td>
         <td bgcolor="#d2f7f3"><input name="user" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("serial_no")%>" readonly></td>
   	     <td bgcolor="#d2f7f3"><input name="user" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("brand")%>" readonly></td>
	      <td bgcolor="#d2f7f3"><input name="ip" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("model")%>" readonly></td>
       <td bgcolor="#d2f7f3"><input name="ip" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("configuration")%>" readonly></td>
       <%-- <td bgcolor="#d2f7f3"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs2.getInt("hwp_id")%>");' ></td>
 --%>
<%-- <td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs2.getString("sw_id")%>");' ></td> --%>
 </tr>
	  <%}%>
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
  <br>
<table width="165" align ="center" id="hiderow">
<tr>
<td align="left" id="hiderow"><input id="hiderow" type='submit' style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'></td>
<!-- <td align="right" id="hiderow">
<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td> -->
</tr>
</table>
</center>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="#" onclick='history.go(-1)'><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>
</body>
</html>