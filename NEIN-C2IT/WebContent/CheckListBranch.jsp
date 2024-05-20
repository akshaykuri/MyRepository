<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
    <%@ include file="banner.jsp" %>
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<body background =".jpg" >

<head><title>BRANCH WISE REPORT</title>
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
</head>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
              var w=document.form.loc;
              
            
            if ((w.value==null)||(w.value=="NULL")){
            alert("Please Select Location ")
            w.focus()
            return false
            }
            if (checkAddress(w.value)==false){
            w.value=""
            alert("Invalid Location!");
            w.focus()
            return false
            }
           
                  
	 else
       return true;
}
        </script>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>
<script type="text/javascript">

 function link1() {
   			 //document.form.action="PoBranchDayExcel";
   			  document.form.action="POBranchDayWiseExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="cs_BranchDayWiseBack.jsp?msg=1";
   			 document.form.method="post";
   			 document.form.submit();
   			     }

</script>

<body leftmargin="100" rightmargin="150" style="overflow-x: hidden; overflow-y: hidden;"> 
<div id="wrapper">


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center">
    <td width="1000" align="left"><img src="images/nippon.gif" height="35" width="220"> </td>
       
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">BRANCH WISE CHECK LIST</font></strong></td>
</tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
 </table>







<br />
<br />



<form name="form" method="post" action="CheckList_PageOne_HO.jsp?msg=1">
<%-- %>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
	 
	 
<%
String realname=null;
realname = (String) session.getAttribute("Nname");
String tot_val = null;
Connection cn9 = null;
Statement st9 = null; 
ResultSet rs9 = null;
try{
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
rs9 = st9.executeQuery("SELECT DISTINCT assignedLocation FROM assigned_master WHERE Locname='"+realname+"' ORDER BY assignedLocation");

%>	 
<table align="center">
<tr>
<th>SELECT BRANCH TO PREPARE CHECK LIST </th>
</tr>
</table>

<br>
<br>	 
	 
  <table width="280" align="center" border="0" cellpadding="3" cellspacing="1" class="blueLine">
   
 <!--   <tr>
    <td colspan="3"><strong>SELECT BRANCH AND DAY</strong></td></tr> -->
    
   <tr><th>BRANCH:</th>
	<td>
      <select  name="loc"  id="hiderow">     <option value="NULL">SELECT</option> 
										        <%while(rs9.next()){ %> 
										 
										        <option ><%=rs9.getString(1)%></option>
										         <%-- <option ><%=rs9.getString(1)+" - "+rs9.getString(2)%></option> --%>
										      
										        <%} %> 
										        </select>
      </td>
      

      
	</tr>


	
	</table>
	<%}
catch (Exception e) {
	 System.out.println(e);
}

finally{
DbUtil.closeDBResources(rs9,st9,cn9);

}
%>
	<br>
	<br>
	
	<table width="280" align="center" border="0" cellpadding="3" cellspacing="1" >
	<tr align="center">
	 <td align=center>
	 		<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="Prepare CheckList " name="save" onclick="return validate();">
		<!-- <INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button1 onclick="return OnButton1();"> -->
		<!-- <INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button2 onclick="return link1()"> -->
</td>
	</tr>
	
	</table>
	
	

	
	
	
	</form>

	
	<br>
<br>
<br>
<br><br><br><br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>




</body>
</html>