<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit user Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" />

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />




<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>
      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>


<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>

<script>
   $(document).ready(function () {
	   var $tbl = $('#table1');
	     $('#Button1').click(function(){
	        var num = $('input[id="Text1"]').val();
	            //alert(num);
	            $tbl.find('.row').remove();
	            for(var i=1;i<=num;i++){
	            	
	            $('table[id="table1"]').append(' <tr class="row"><td><input type="text" name="rr1"></td><td><input type="text" name="rr"></td></tr>');

	        }
	        });
	    });
</script>

<script>
function admSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("multiple").value;
        
        if(admOptionValue == nameSelect.value){
            document.getElementById("div").style.display = "block";
           
        }
        else{
            document.getElementById("div").style.display = "none";
        }
        
        admOptionValue1 = document.getElementById("single").value;
        
        if(admOptionValue1 == nameSelect.value){
            document.getElementById("divs").style.display = "block";
        }
        else{
            document.getElementById("divs").style.display = "none";
        }
    }
    else{
        document.getElementById("div").style.display = "none";
    }
    
    var selectBox = nameSelect;
    var selected = selectBox.options[selectBox.selectedIndex].value;
    var textarea = document.getElementById("hid");

    if(selected === '1'){
        textarea.style.display = "block";
    }
    else{
        textarea.style.display = "none";
    }
}
</script>


 </head>
<body>
<br><br> 

<form method="post" action="hardwareAssetDetailsUpdate.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
     
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">HARDWARE AMC DETAILS</font></strong></td>
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
	    <td></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Asset Type</font></td>
	  <td bgcolor="#74c1b9" width="120" align=center><font color="black">Serial Number</font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Brand</font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Model</font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Configuration</font></td>
        <td bgcolor="#74c1b9" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%
String no=request.getParameter("id");
//System.out.println("in edit pageeeeeeeeeeeeee"+no);
String[] temp;
temp = no.split(",");

Connection conn=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;
int sumcount=0;
 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   

    String query1 = "select hwp_id,Asset_no,Asset_type,serial_no,brand,model,configuration from hardware_details_multiple where hwp_id='"+no+"'";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
   <%while(rs2.next()){%>
    <tr>
          <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=rs2.getString("hwp_id")%>">
          <input type="hidden" name="assetno" value="<%=rs2.getString("Asset_no")%>"></td>
          
         
          <td bgcolor="#d2f7f3"><input name="assettype" id="nuser" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("Asset_type")%>" ></td>
   	     <td bgcolor="#d2f7f3"><input name="sno" id="user" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("serial_no")%>" ></td>
	     <td bgcolor="#d2f7f3"><input name="brand" id="ip" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("brand")%>" ></td>
	     <td bgcolor="#d2f7f3"><input name="model" id="ip" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("model")%>" ></td>
	     <td bgcolor="#d2f7f3"><input name="config" id="ip" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("configuration")%>"></td>
      
       <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
      <!--  <td bgcolor="#d2f7f3"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
	    -->  
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

</tr>
</table>
</center>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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