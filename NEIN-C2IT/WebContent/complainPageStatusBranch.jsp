<%@page import="CON2.DbUtil"%>
<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
 <%@ include file="banner.jsp" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>Complain Page</title>
<script type="text/javascript">

var showdata="";
function check(value){ 
xmlHttp=GetXmlHttpObject();
var url="ComplainAjaxValidity.jsp";
url=url+"?aabbcc="+value;
xmlHttp.onreadystatechange=stateChanged; 
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
showdata = xmlHttp.responseText; 
//alert(showdata);

document.getElementById("mydiv").innerHTML= showdata;
} 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try{
xmlHttp=new XMLHttpRequest();
}
catch (e) {
try {
xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
}
catch (e){
xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
}
}
return xmlHttp;
}
</script>
</head>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
   function get_val9(tot_val)
   {
   		
   		 form.action = "complainPageAdmin.jsp?msg=1";
   		 form.method = "post";
 		 form.submit();
      
   }
</script>
<%
if(session==null||session.getAttribute("NpostingCo")==null||session.getAttribute("b_no")==null||session.getAttribute("Nname")==null)
{
	String msgg="Session TimeOut";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
%>
	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__", "   ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
     
     
</script>
 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }

   function validate()
   {
       
       var d1=document.form1.aabbcc;
    if ((d1.value==null)||(d1.value=="NULL"))
				{
  				 alert("Select Complain Id !");
   			         d1.focus();
  				 return false;
  				 }
   if (checkAddress(d1.value)==false)
				{
   				d1.value="";
 			       alert("Invalid Complain Id");
   				d1.focus();
  				 return false;
  				 }
      
  	 
else
return true;
   }
</script>
<%--
//String city = request.getParameter( "city" );
session.getAttribute("city");

--%><%!
String req=null;
                  
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null,LocationNo=null;
	              
	%>
	 <%      req=request.getParameter("txtCalendar");
System.out.println("Request payload: *********************************  "+ req);
     
     String[] dateString = req.split("-");
     
     System.out.println(dateString[1]);
    
     if (dateString[1].equals("Jan"))
     {
   	  dateString[1]="01";
     }
     if (dateString[1].equals("Feb"))
     {
   	  dateString[1]="02";
     }
     if (dateString[1].equals("Mar"))
     {
   	  dateString[1]="03";
     }
     if (dateString[1].equals("Apr"))
     {
   	  dateString[1]="04";
     }
     if (dateString[1].equals("May"))
     {
   	  dateString[1]="05";
     }
     if (dateString[1].equals("Jun"))
     {
   	  dateString[1]="06";
     }
     if (dateString[1].equals("Jul"))
     {
   	  dateString[1]="07";
     }
     if (dateString[1].equals("Aug"))
     {
   	  dateString[1]="08";
     }
     if (dateString[1].equals("Sep"))
     {
   	  dateString[1]="09";
     }
     if (dateString[1].equals("Oct"))
     {
   	  dateString[1]="10";
     }
     if (dateString[1].equals("Nov"))
     {
   	  dateString[1]="11";
     }
     if (dateString[1].equals("Dec"))
     {
   	  dateString[1]="12";
     }
     
     String dateF = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
    // System.out.println("Check List view Date ***************"+dateF);
	 
	 
	 
	 String realName2=null;
	 
             // logInName = session.getAttribute("theName");
             // realname =  session.getAttribute("Nname");
              realName2 = (String) session.getAttribute("Nname");
     		//   desg = session.getAttribute("desg");
     		//   city = session.getAttribute("NpostingCo");
     		//  LocationNo = session.getAttribute("b_no");
     		//   Initiator = session.getAttribute("Nmail");
     	//	  System.out.println("logInName  "+logInName);
     	//	  System.out.println("realname  "+realname);
     	//	  System.out.println("desg  "+desg);
     	//	  System.out.println("Location Number **********  "+LocationNo);
     	//	  System.out.println("Branch nameeee  "+city);
     	//	  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<%-- <font > Welcome :<%= session.getAttribute( "city" ) %></font> --%>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<div id="wrapper">


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>NEIN C2IT </b><br />
    
 </font></strong></td></tr>
<tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">COMPLAINT PAGE STATUS</font></strong></td></tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>

<%-- <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><font color="blue"> 
<%= session.getAttribute( "NpostingCo" ) %>-BRANCH</font>
</td>
<td width="1118" align="right"> 
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table> --%>
<br />
<br />

<%
String msg2=null;
String tot_val;
Connection cn9 = null;
ResultSet rs99 =null;
PreparedStatement psmt=null;
try{
cn9 = con.getConnection2();

System.out.println("Name **********  1vv  "+realName2);
System.out.println("Location date **********  2   "+dateF);
//rs9 = st9.executeQuery("select DISTINCT mr_id from mr_master");
//rs9 = st9.executeQuery("select DISTINCT complain_id from complain_master_item WHERE complain_id LIKE 'NEIN/CM%' ");
//rs9 = st9.executeQuery("select DISTINCT complain_id from complain_master_item Left Join branch_master On(substr(complain_id,9,2)=branch_master.b_no) WHERE '"+LocationNo+"'=branch_master.b_no  AND cm_date='"+dateF+"' GROUP BY complain_id");
//rs9 = st9.executeQuery("select DISTINCT complain_id from complain_master_item  WHERE emp='"+realname+"'   AND cm_date='"+dateF+"' GROUP BY complain_id");
String sql="select DISTINCT complain_id from complain_master_item  WHERE emp=? AND cm_date=? ";
psmt = cn9.prepareStatement(sql);
//psmt.getString(1,realName2);
psmt.setString(1,realName2);
psmt.setString(2,dateF);
rs99 =  psmt.executeQuery();
boolean records = false;
%>
<form name="form1" method="post" action="complainPageAdminBranch.jsp?msg=1" onsubmit="return validate();">

	
	 
<table align="center">
<tr>
<th>ENTER COMPLAIN NUMBER </th>
</tr>
</table>

<br>
<br>	 
	 
  <table width="280" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#ec691f">
   
  <tr >
  <td>Date: &nbsp;&nbsp; <%=req %>
  </td>
  </tr>
  
   <tr><!--<th>BRANCH:</th>
	--><td>
	  <label>Select</label>
      <select  name="aabbcc"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs99.next()){
										        	 records = true;
										        	%> 
										       <option><%=rs99.getString("complain_id")%> </option>
										        <%}%> 
										        </select>
      </td></tr>


	<tr align="center">
	       <td align=center>&nbsp;</td>
	       <td>&nbsp;</td>
	       <%-- %><td><input type=submit name="button" value="DISPLAY" id="b2"  ;></td>
	
	<td>
	<input type="submit" name="subpopup" value="DISPLAY"    onclick="myform.target='POPUPW'; POPUPW = window.open(   'about:blank','POPUPW','width=600,height=400');">
	</td> --%>
	<td align="center">
	<input style="background-color:#2f4377;font-weight:bold;color:white;" type="submit" align="middle" name="subpopup" value="DISPLAY"/></td>
	</tr>
	</table>
	
<%
if(!records)
{
	msg2="__Sorry__Complaint__Is__Not__registered__For__This__Date";

	   response.sendRedirect("complainDateWise.jsp?msg="+msg2);	
}

}
catch(SQLException ex)
{
	ex.printStackTrace();
}
finally{
	DbUtil.closeDBResources(rs,st,cn9);
    DbUtil.closeDBResources(rs99,psmt,conn);
}
%>	
	
	</form>

	
	<br>
<br>
<br>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="complainDateWise.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 
</div>




</body>
</html>