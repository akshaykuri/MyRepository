<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
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
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Software Details</title>
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" />

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />



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

<script type="text/javascript">
        $(function () {
            $("#amc1").datepicker({
                textboxImageOnly: true,
                textboxImage: 'images/calendar.png',
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                yearRange: "-40:+20"
               /*  maxDate: new Date() */
               
            });
            $("#amc2").datepicker({
                textboxImageOnly: true,
                textboxImage: 'images/calendar.png',
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                yearRange: "-40:+20",
               /*  maxDate: new Date() */
               onSelect: function () {
        $('#amc3').val(this.value);
    }
            });
            $("#pdate").datepicker({
                textboxImageOnly: true,
                textboxImage: 'images/calendar.png',
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                yearRange: "-40:+20"
               /*  maxDate: new Date() */
               
            });
            $("#apdate").datepicker({
                textboxImageOnly: true,
                textboxImage: 'images/calendar.png',
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                yearRange: "-40:+20"
               /*  maxDate: new Date() */
               
            });
            
        });
    </script>
    
<style>
/* The Modal (background) */
.modal
    {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body
    {
    padding: 2px 16px;
    background-color: #d2f7f3;
    }
.modal-content
    {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 70%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header
   {
   padding: 2px 16px;
   background-color: #74c1b9;
   color: black;
   }
</style>
<%-- <script  type="text/javascript">
<% 
String msg[] = request.getQueryString().toString().split("=");

String disp = msg[1].toString();
disp = disp.replace("%20", "");
disp = disp.replace("%27", " ");
disp = disp.replace("__","   ");

    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script> --%>
<script type="text/javascript">

$(document).ready(function(e) {
	$('.plusbtn').click(function() {
	    $(".testxyz2").append('<tr><td><input type="file" name="invoice" id="invoice" /> </td></tr>');
	    
	    
	});
    
	$('.minusbtn').click(function() {
		if($(".testxyz2 tr").length != 1)
			{
				$(".testxyz2 tr:last-child").remove();
			}
	   else
			{
				alert("You cannot delete first row");
			}
	});
	
	
});

</script> 

<script type="text/javascript">  
 function sendInfo(v)  
           {  
    	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="podetails.jsp";  
    		    url +="?pordernon=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
 
 
 
  function getInfo()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str2=xmlHttp.responseText;
               	             
                              //alert("here in po");
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("pdate").value =  document.getElementById("p1").value;
                             document.getElementById("vname").value= document.getElementById("p2").value;
                             document.getElementById("cperson").value= document.getElementById("p3").value;
                             document.getElementById("vnum").value= document.getElementById("p4").value;
                             
                            // var str3=xmlHttp.responseText;
                             
                             
                      		 }
             } 
</script>

 <script type="text/javascript">  
 function sendInfo1(m)  
           {  
    	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="podetailsa.jsp";  
    		    url +="?pordernon1=" +m;
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str2=xmlHttp.responseText;
                              //alert("here in amc");
                             document.getElementById("resultFromAjax3").innerHTML = str2;
                             document.getElementById("apdate").value =  document.getElementById("ap1").value;
                             document.getElementById("avname").value= document.getElementById("ap2").value;
                             document.getElementById("acperson").value= document.getElementById("ap3").value;
                             document.getElementById("avnum").value= document.getElementById("ap4").value;
                            /*  document.getElementById("idabc6").value =  document.getElementById("p2").value;
                      		 document.getElementById("idabc7").value =  document.getElementById("p3").value;
                      		 document.getElementById("idabc8").value =  document.getElementById("p4").value; */
                      		 }
             } 
</script>  

<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="SubBranchdisplay.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("Subcity").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
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
}
</script>

<script>
function othrSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("other").value;
        if(admOptionValue == nameSelect.value){
            document.getElementById("otherdiv").style.display = "block";
        }
        else{
            document.getElementById("otherdiv").style.display = "none";
        }
    }
    else{
        document.getElementById("otherdiv").style.display = "none";
    }
}
</script>

<script>
function validateForm() {
    var x = document.form.sno.value; 
    var amcpo=document.form.aponum.value;
    var apodate=document.form.apdate.value;
    var avender=document.form.avname.value;
    var acpersn=document.form.acperson.value;
    var acnum=document.form.avnum.value;
    var software=docuent.form.soft.value;
    
    
    if (x==null || x=="") {
        alert("License/Serial number should be filled out ");
        return false;
    }
    else if(amcpo==null || amcpo=="")
     {
        alert("AMC PO number should be filled out ");
        return false;
    }
    else if(apodate==null || apodate=="")
    {
       alert("AMC PO Date should be filled out ");
       return false;
   }
    else if(avender==null || avender=="")
    {
       alert("AMC Vender Name should be filled out ");
       return false;
   }
    else if(acpersn==null || acpersn=="")
    {
       alert("Vender contact person name should be filled out ");
       return false;
   }
    else if(acnum==null || acnum=="")
    {
       alert("Vender contact person number should be filled out ");
       return false;
   }
   
}
</script>
<style>
.tab1 {
    border-collapse: collapse;
}


</style>   
<style>
.button {
    background:none!important;
     border:none; 
     padding:0!important;
    
    /*optional*/
    font-family:arial,sans-serif; /*input has OS specific font-family*/
     color:red;
     text-decoration:underline;
  
</style>
    
    
<SCRIPT Language="Javascript">

/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function btnClick() { 
         close(); 
}
</script>

</head>
<body>
<br><br>
<form  name="form"  method="post" enctype="multipart/form-data" onsubmit="return validateForm()" action="HardwareDetailsRenewBack.jsp" >

 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
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

<center>
 <br />
                
<%-- 	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
		<tr>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Software Name</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>License No</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Vender</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>PO</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Vender</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC PO</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Branch</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>Sub Branch</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC From</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC To</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Expiry</b></font></td>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:#74c1b9"><font size="2" color="black"><b>AMC Amount</b></font></td>
    </tr>
	
<%

String licenseno=request.getParameter("licenseno");
System.out.println("lisence num----"+licenseno);


Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
Statement st=null,st1=null,st3=null;
ResultSet rs=null,rs1=null,rs3=null; 
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select s.sw_id,s.software_name,s.license_no,s.vender,s.po_number,s.purchase_date,s.amc_po,s.amc_vender,s.branch,s.sub_branch,s.AMC_from_date,s.AMC_to_date,s.AMC_expiry,s.AMC_amount,s.license_type,s.No_of_users,b.m_b_name,sb.b_name from software_details s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.license_no='"+licenseno+"'";
st = con.createStatement();
 rs = st.executeQuery(query);
 /* String query1="Select user,ip_addr from software_details_multiple where sw_id='"+rs.getInt("sw_id")+"'";
 st1=con.createStatement();
 rs1 = st1.executeQuery(query1); */
%>
<%while(rs.next()){%>
<tr>
 
<td bgcolor="#d2f7f3" width="100"> <font size="2" color="black"><%=rs.getString("software_name")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("license_no")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("vender")%></font></td>

<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("po_number")%>

</font></td>


<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_vender")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("amc_po")%>
</font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("m_b_name")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("b_name")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("AMC_from_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("AMC_to_date")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("AMC_expiry")%></font></td>
<td bgcolor="#d2f7f3" width="100"><font size="2" color="black"><%=rs.getString("AMC_amount")%></font></td>


 </tr><%}%>
 
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

	</table>
	
<br>
<br>
 --%>
<div class="modal-content">
<div class="modal-header">
     <!--  <center> <h2><marquee>ENTER SOFTWARE  AMC DETAILS</marquee></h2></center> -->
    </div>
    <div class="modal-body">

<center>

<table id="tab1"width="75%" border="1" align="center" bgcolor="#d2f7f3">
<%
String assetno=request.getParameter("assetno");
Connection con = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Statement stmt=null;
ResultSet rst=null; 
try
{
	Class.forName(driver).newInstance();
	con= DriverManager.getConnection(url+dbName,userName,password);
//String query4 = "select s.sw_id,s.software_name,s.license_no,s.vender,s.po_number,s.purchase_date,s.amc_po,s.amc_vender,s.branch,s.sub_branch,s.AMC_from_date,s.AMC_to_date,s.AMC_expiry,s.AMC_amount,s.license_type,s.No_of_users,b.m_b_name,sb.b_name from software_details s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.license_no='"+licenseno+"'";
String query4="SELECT * FROM `hardware_details` WHERE `hw_id`=( SELECT max(`hw_id`) FROM hardware_details WHERE `Asset_no`='"+assetno+"' AND `status`='Active')";
stmt = con.createStatement();
 rst = stmt.executeQuery(query4);
 /* String query1="Select user,ip_addr from software_details_multiple where sw_id='"+rs.getInt("sw_id")+"'";
 st1=con.createStatement();
 rs1 = st1.executeQuery(query1); */
%>
<%while(rst.next()){%>
<%-- <tr>
<td>Asset number</td>
<td> <input type="text" name="assetno" id="assetno" value="<%=rst.getString("Asset_no")%>" >	
     <input type="hidden" name="initiator" id="initiator" value="<%=rst.getString("initiator_empid")%>" >
 </td>
</tr> --%>
<tr>
<td>Asset Number</td>
<td><input type="text" name="assetnum" id="assetnum" value="<%=rst.getString("Asset_no")%>" >
    <input type="hidden" name="initiator" id="initiator" value="<%=rst.getString("initiator_empid")%>" ></td>
<td>PO Number</td>
<td><input type="text" name="ponum"  id="ponum" value="<%=rst.getString("po_no")%>" />                             			</td>
</tr>
<tr>
<td>Purchase Date</td>                              			
<td><input type="text" name="pdate" id="pdate" value="<%=rst.getString("po_date")%>">
</td>
<td>Vender</td>
<td><input type="text" id="vname" name="vname" value="<%=rst.getString("vender_name")%>" >
</tr>
<tr>
<td>Contact number</td>
<td><input type="text" name="vnum" id="vnum" value="<%=rst.getString("contact_number")%>"></td>
<td>Contact Person</td>
<td><input type="text" name="cperson" id="cperson" value="<%=rst.getString("contact_person")%>"></td>                                  			
</tr>
<tr>
<td><font color="red" size="4">*</font>AMC PO Number</td>
<td><input type="text" name="aponum" maxlength="20" id="aponum" value="" size=15 onkeyup="sendInfo1(this.value)" required/>     </td>
<td><font color="red" size="4">*</font>AMC Purchase Date</td>                              			
<td><input type="text" name="apdate" id="apdate" readonly>
</td></tr>
<tr>
<td><font color="red" size="4">*</font>AMC Vender</td>
<td><input type="text" id="avname" name="avname" readonly></td>
<td><font color="red" size="4">*</font>AMC Contact number</td>
<td><input type="text" name="avnum" id="avnum" readonly></td>
</tr>
<tr>
<td><font color="red" size="4">*</font>AMC Contact Person</td>
<td><input type="text" name="acperson" id="acperson" readonly></td> 
<td><font color="red" size="4">*</font>Branch</td>
<td>               <%Connection con2 = null;
                                                  /* String url2 = "jdbc:mysql://localhost:3306/";
                                                  String db2 = "csdb";
                                                  String driver2= "com.mysql.jdbc.Driver";
                                                  String userName2 ="root";
                                                  String password2=""; */
                                                  // int sumcount=0;
                                                  Statement st2=null;
                                                  ResultSet rs2=null; 
                                                  int flag=0;
                                                  try
                                                     {
                                                	  Class.forName(driver).newInstance();
                                                	  con= DriverManager.getConnection(url+dbName,userName,password);
                                                     String query2 = "select * from branch_master_main ORDER BY m_b_name";
                                                     st2 = con.createStatement();
                                                     rs2 = st2.executeQuery(query2);
                                                 %>
                                       <select name="city" required onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="">Select</option>
	                                            <%while(rs2.next()){ flag=1;%>
			                                    <option value="<%=rs2.getString(3)%>"><%=rs2.getString(2)%></option>
    	                                        <%}%>
	                                  </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             con.close();
                                        			}%>                        			
                                        			</td></tr>
<tr> 
<td><font color="red" size="4">*</font>Sub Branch</td>
<td>
<div id='Subcity'>      
<select name="Subcity" required style="font-size: 11px;width: 142px;overflow: auto;height: 20px ">   
  <option value='-1'></option>  
</select>     
</div>
</td>
<td>AMC From</td>
<td><input type="text" id="amc1" name="amc1" required></td>
</tr>
<tr>
<td>AMC To</td>
<td><input type="text" id="amc2" name="amc2" required> </td>
<td>AMC Expiry</td>
<td><input type="text" id="amc3" name="amc3" required></td>
</tr>
<tr>
<td>AMC Amount</td>
<td><input type="text" name="amcamt" id="amcamt" required>
</td>
<td>
<font color="red" size="4">*</font>AMC Documents</td>
<td><table class="testxyz2">
<tr>
<td>
<input type="file" id="invoice" name="invoice" required><br>
<a href="# " class="plusbtn">Add</a>
<a href="# " class="minusbtn">Remove</a></td>
</tr>
</table>
</td></tr>

<%}%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>
</table>

</center>
  <table width="100%" border="0" align="center" bgcolor="#d2f7f3">
                              <tr>
	                          	<td style="size:1">
	                          	     <center>
			                		<input type=submit name="button" value="OK" id="button" >
			                		<!-- <input type="button" name="backBtn"  value="BACK" /> -->
		                             <input type="reset" value="RESET">
		                             </center>
		                       </td>
		                      </tr>
	                         </table>
</div>
</div>



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
       <div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax1" style="display:none;">
        
       </div>
    <div id="resultFromAjax3" style="display:none;">
        
       </div>
</body>
</html>