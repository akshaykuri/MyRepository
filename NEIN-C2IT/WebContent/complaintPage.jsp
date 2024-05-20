<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%-- <%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %> --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Complain Page</title>
<!-- 	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<link rel='stylesheet' type='text/css' href='css/Otherstyle.css' />
	<link rel='stylesheet' type='text/css' href='css/homePage.css' /> -->
	
<link rel='stylesheet' type='text/css' href='css/style2.css' />
    <script language="javascript"   type="text/javascript" src="js/jquery-1.5.1.min.js"></script> 
    

	
	<!-- <script language="javascript"   type="text/javascript" src="js/popWindowAtCenter.js"></script> -->
	 <script language="javascript"   type="text/javascript" src="js/onSubmitWait.js"></script> 
	 
	 
<script type="text/javascript">
	function validateEmailsh(email)
           {
           var splitted = email.match("^(.+)@(.+)$");
           if (splitted == null) return false;
           if (splitted[1] != null)
                {
                var regexp_user = /^\"?[\w-_\.]*\"?$/;
                if (splitted[1].match(regexp_user) == null) return false;
                }
          if (splitted[2] != null)
               {
               var regexp_domain = /^[\w-\.]*\.[A-Za-z]{2,4}$/;
               if (splitted[2].match(regexp_domain) == null)
                   {
                   var regexp_ip = /^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
                   if (splitted[2].match(regexp_ip) == null) return false;
                   } // if
              return true;
          }
    return false;
}
</script>

	
<script type="text/javascript">
function check(value)
    { 
	xmlHttp=GetXmlHttpObject()
	var url="softwareAssignedAjaxPwd.jsp";
	url=url+"?app="+value;
	xmlHttp.onreadystatechange=stateChanged 
	xmlHttp.open("GET",url,true)
	xmlHttp.send(null)
	}
function stateChanged()
    { 
	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	    { 
	    var showdata = xmlHttp.responseText; 
	    document.getElementById("check").innerHTML= showdata;
	    } 
    }
function GetXmlHttpObject()
    {
    var xmlHttp=null;
	try
	  {
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

<script type="text/javascript">

function checkEmail() 
    {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value))
       {
       return true;
       }
    return false; 
   }
  function checkName(str)
      {
      var re = /[^a-zA-Z]\s/g;
      if (re.test(str)) return false;
      return true;
      }
  function checkNumber(string)
     {
     var numericExpression = /^[0-9]+$/;
     if(string.match(numericExpression)) 
         {
         return true;
         } 
     else
         {
         return false;
        }
     }
  function checkAddress(str)
      {
      var re = /[^[a-z][A-Z][0-9]]/g;
      if (re.test(str)) return false;
      return true;
      }
    
  function validate()
      {
	  var cp1=document.form1.cm_name;
	  var cp2=document.form1.cm_mail;
	  var rad = document.form1.reportTo;
	  var ph=document.form1.phno;
	  var cp3=document.form1.cm_location;
      var reportt = document.form1.reportTo;
      var report = reportt.value;
      var cp4=document.form1.cm_type;
      var cp4a=document.form1.pType;
      var cp4b=document.form1.typo;
      var cp5=document.form1.cm_problem;
      var cp6=document.form1.mail;
      var cp7=document.form1.emp;
      var pp = document.form1.priority;
      var fi1=document.form1.file;
      var fileName1 = fi1.value;
      var ext1 = fileName1.substring(fileName1.lastIndexOf('.') + 1);
        
    if ((cp1.value==null)||(cp1.value==""))
         {
         alert("Please Enter Your Name!");
         cp1.focus();
         return false;
         }
    else if (checkName(cp1.value)==false)
         {
         cp1.value="";
         alert("Invalid Name!");
         cp1.focus();
         return false;
         }
    else if ((cp2.value==null)||(cp2.value==""))
        {
        alert("Enter Validate Email ID!");
        cp2.focus();
        return false;
        }
    else if (validateEmailsh(cp2.value)==false)
        {
        cp2.value="";
        alert("Invalid Email ID!");
        cp2.focus();
        return false;
        }
    if ((ph.value==null)||(ph.value==""))
        {
        alert("Please Enter valid contact no. !");
        ph.focus();
        return false;
        }
    else if (checkNumber(ph.value)==false)
        {
        ph.value="";
        alert("Contact no should be only integer...!");
        ph.focus();
        return false;
        }
    else if ((rad[0].checked == false ) && (rad[1].checked == false ) && (rad[2].checked == false ) )
        {
        alert("Please Select Complaint Related To!");
        rad[0].focus();
        return false;
        }
    else if ((cp3.value==null)||(cp3.value=="")||(cp3.value==0)||(cp3.value=="0"))
        {
        alert("Please Select Your Location!");
        cp3.focus();
        return false;
        }
    else if (checkAddress(cp3.value)==false)
        {
        cp3.value="";
        alert("Invalid Location!");
        cp3.focus();
        return false;
        }
    else if ((cp4.value==null)||(cp4.value=="")||(cp4.value==0)||(cp4.value=="none"))
        {
        alert("Please Select Type!");
        cp4.focus();
        return false;
        }
    else if ((cp4a.value==null)||(cp4a.value=="")||(cp4a.value==0)||(cp4a.value=="none")||(cp4a.value=="-1"))
        {
        alert("Please Select Category!");
        cp4a.focus();
        return false;
        }
    else if ((cp4b.value==null)||(cp4b.value=="")||(cp4b.value==0)||(cp4b.value=="-1"))
        {
        alert("Please Select Type Of Sub Category!");
        cp4b.focus();
        return false;
        }
    else if ((cp5.value==null)||(cp5.value==""))
        {
        alert("Please Enter Remarks!");
        cp5.focus();
        return false;
        }
    else if (checkAddress(cp5.value)==false)
        {
        cp5.value="";
        alert("Invalid Remarks!");
        cp5.focus();
        return false;
        }
    else if ((pp.value==null)||(pp.value=="")||(pp.value=="NULL")||(pp.value=="NULL"))
        {
        alert("Please Select Priority   ");
        pp.focus();
        return false;
        }
    else if ((cp6.value=="Select")||(cp6.value=="0")||(cp6.value==""))
        {
        alert("Please Select '"+report+"' Name !");
        cp6.focus();
        return false;
        }
    else if (checkAddress(cp6.value)==false)
        {
        cp6.value="";
        alert("Invalid DESIGNATION And Name!");
        co.focus();
        return false;
        }
    else if ((cp7.value=="-1"))
        {
        alert(""+report+" Not Exists For This Location \n \n \t \t \t \t \t \t \t \t \t \t  OR \n \n you have not selected sent to option.");
        cp7.focus();
        return false;
        }
    else if (checkAddress(cp7.value)==false)
        {
        cp7.value="";
        alert("Invalid DESIGNATION And Name-----------!");
        co.focus();
        return false;
        }
     else
        return true;
        }

</script>

<script type="text/javascript">
function bluring()
      {
	  document.getElementById("cm_name").readOnly = true;  
	  document.getElementById("cm_mail").readOnly = true;  
	  document.getElementById("feedback").readOnly = true;  
      }

</script>		
<script>
var timer=null;
function stop()
	{
	clearTimeout(timer);
	}

function start()
	{
	var time=new Date();
	var hours=time.getHours();
	var minutes=time.getMinutes();
	minutes=((minutes < 10) ? "0" : "") + minutes;
	var seconds=time.getSeconds();
	seconds=((seconds < 10) ? "0" : "") + seconds;
	var clock=hours + ":" + minutes + ":" + seconds;
	document.forms[0].cm_time.value=clock;
	timer=setTimeout("start()",1000);
	}
</script>	
<script language="javascript" type="text/javascript">     
   function  get_v2( tot_val )
       {
       document.getElementById('idpordernon').value = tot_val;
       }		 
</script>

<script  type="text/javascript">

<% String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";
    if(msg!="1")
		{
           alert(msg);
		}
</script>
	
	
<script type="text/javascript">
var currentdate = new Date(); 
var hour = currentdate.getHours()+":"+ currentdate.getMinutes() + ":" + currentdate.getSeconds();
hour = document.getElementById('hour1').value;
function validateEmail() {
    var emailText = document.getElementById('cm_mail').value;
    var pattern = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
    if (pattern.test(emailText)) {
        return true;
    } else {
        alert('Bad email address: ' + emailText);
        return false;
    }
}
</script>	

     
  <script language="javascript" type="text/javascript">   //CHINTU WRITEN THIS SCRIPT CODE
  function copy()
	       {
           document.getElementById("label").innerHTML = document.getElementById("cm_type").value
           }
	</script>  	
	
<script language="javascript" type="text/javascript">
	 
      var xmlHttp;  
      function showEm(str){ 
   	  var col = $('input[name=reportTo]:checked').val();
      if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="selEmpComplains.jsp";  
                            url +="?count=" +str +"-----"+col;
                              xmlHttp.onreadystatechange = stateChange2;  
                                  xmlHttp.open("GET", url, true); 
                                     xmlHttp.send(null);    
                                       }      function stateChange2(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText;    
                                                      } 
                                                              
            }  
            
     var xmlHttp;       
     function Mail2(str){    
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="selectMailId.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange2;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange2(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText;  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText;   
                                                      } 
                                                              
            } 
            
	</script>	
		
<script language="javascript" type="text/javascript">  
      var xmlHttp;        
      function show(str)
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
         var url="selEmpComplainsDepart.jsp";  
         url +="?count=" +str;   
         xmlHttp.onreadystatechange = stateChange1;  
         xmlHttp.open("GET", url, true);   
         xmlHttp.send(null);    
         }
      function stateChange1()
         {     
         if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
               {   
               document.getElementById("pType").innerHTML=xmlHttp.responseText;    
               } 
         }  
</script>
<script language="javascript" type="text/javascript">
var xmlHttp;    
function showType(str)
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
    var url="selTypeProblem.jsp";  
    url +="?count=" +str;   
    xmlHttp.onreadystatechange = stateChange;  
    xmlHttp.open("GET", url, true);   
    xmlHttp.send(null);    
    }
 function stateChange()
     {     
     if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
          {   
          document.getElementById("typo").innerHTML=xmlHttp.responseText; 
          } 
     } 
 
 
 function showDesc(str)
     {    
     if (typeof XMLHttpRequest != "undefined"){    
       xmlHttp= new XMLHttpRequest();    
         }      else if (window.ActiveXObject){    
           xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
               }      if (xmlHttp==null){   
                  alert("Browser does not support XMLHTTP Request");    
                    return;     
                     }       var url="selectType1Id.jsp";  
                         url +="?count=" +str;   
                            xmlHttp.onreadystatechange = onstateChange;  
                                xmlHttp.open("GET", url, true);   
                                   xmlHttp.send(null);    
                                     }      function onstateChange(){     
                                         if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                       document.getElementById("idcm_problemss").innerHTML=xmlHttp.responseText;  
                                                       document.getElementById("idcm_problemssTT").value=xmlHttp.responseText;   
                                                    } 
                                                            
          } 
</script>
		
</head>












<%
if(session==null)
    {
	response.sendRedirect("loginho.jsp?msg=1");
    }
%>
<%!
	Connection conn = null;
	Statement st;
	ResultSet rs;
	String []id;
	Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	
	String []itemName=null;
	String []itemQuantity;
	String []itemRate;
	String []abbreviation;
	String []asset;
	String []itemAmount;
	Connection2 dbConn = new Connection2();
	String transId = null;       
	%>


     <%
       transId = "abc"+String.valueOf(Math.random());
       logInName = session.getAttribute("theName");
       realname =  session.getAttribute("Nname");
       desg = session.getAttribute("desg");
       city = session.getAttribute("NpostingCo");
       Initiator = session.getAttribute("Nmail");
     %>
<body onload="start()" onunload="stop()" background="images/u.jpg">
<form name="form1" method="post" enctype="multipart/form-data" action="complainPageBACKKKKKKK.jsp"   onsubmit="return validate();">
 <br />
<input type="hidden" name="transid" value="<%=transId%>" />
<div id="page-wrap">
<table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<b><center><label>NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> </center></b></font></td>
	</tr>
</table>
<br />
<center><label><font color="black"><u><b>COMPLAINT/ISSUE</b></u></font></label> <br /></center> <br />
<%
	
    
   String new_id = null;
   int id=0;
   Connection cn_id = null; 
   Statement st_id = null; 
   ResultSet rs_id = null; 
   cn_id = con.getConnection2();
   st_id=cn_id.createStatement();
   rs_id = st_id.executeQuery("SELECT max(idextend) from complain_master_item where complain_id like 'NEIN/CM-%'");
   while ( rs_id.next() )
       {    
   	try
   	   {
   		id=rs_id.getInt(1);
        id++;     
   		new_id = "" +String.valueOf(id);
   	   }
   	catch(SQLException ex)
   	    {
   		System.out.println(ex.toString());
   		 new_id = "NEIN/CM-1";
   	    }
     }
    String cs_date;
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    Date date = new Date();
    cs_date = dateFormat.format(date);
    String cr_time;
   
    Date currentdate = new Date(); 
    long start = System.currentTimeMillis();
	long end = start + (1*3600 + 23*60 + 45) * 1000; // 1 h 23 min 45.678 s
	Date timeDiff = new Date(end - start - 3600000); // compensate for 1h in millis
	SimpleDateFormat timeFormat = new SimpleDateFormat("H:mm:ss");
	%>

<div id="customer">
   <table id="meta" width="200">
    	<tr>
		     <td class="meta-head" width="100">Creation Date</td>
             <%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
             <td class="meta-head" width="100"><textarea id="temp_date" name="cm_date" readonly="readonly"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
		     <td style="visibility: hidden; display: none"><input type="hidden" name="idextend" value="<%=id%>" /></td>
        </tr>
        <tr>
            <td class="meta-head" width="100">Time:</td>
            <td class="meta-head" width="100"><textarea id="temp_date" name="cm_time" readonly="readonly"></textarea> </td>
       </tr>
   </table>
</div>

<br />
 <%
String tot_val="";
Connection cn1 = null;
Statement st1 = null; 
ResultSet rs1 = null;
Connection cn2 = null;
Statement st2= null; 
ResultSet rs2 = null;
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
Connection cn6 = null;
Statement st6 = null;
ResultSet rs6=null;
Connection cn66 = null;
Statement st66 = null;
ResultSet rs66=null;


try{
	cn1 = con.getConnection2();
	st1=cn1.createStatement();
	rs1 = st1.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
	cn2 = con.getConnection2();
	st2=cn2.createStatement();
	rs2 = st2.executeQuery("select DISTINCT  NAME from prob_type_master_main ORDER BY NAME Asc");
	%>
 <table border="2" cellspacing="1" width="900">
      <tr>
          <td style="visibility: hidden; display: none">
               <input type="hidden" name="idextend" value="<%=id%>" />
               <input type="hidden" name="desg" value="IT SUPPORT" />
          </td>
          <td width="5" align="center" height="5" colspan="2" ><center>1</center></td>
          <td align="left">&nbsp;<font color="red" size="4">*</font>USER NAME </td>
          <td width="443" align="left"><input type ="text" name = "cm_name"  id = "cm_name" value ="" size="40" maxlength="49" autofocus/></td>
      </tr>
      <tr>
          <td width="5" align="center" height="5" colspan="2"><center>2</center></td>
          <td align="left">&nbsp;<font color="red" size="4">*</font>USER MAIL ID </td><td width="443" align="left"><input type ="text" name = "cm_mail"  id = "cm_mail" value ="" size="40" maxlength="79"/></td>
      </tr>
      <tr>
          <td width="5" align="center" height="5" colspan="2"><center>3</center></td>
          <td align="left">&nbsp;<font color="red" size="4">*</font>Phone ( Mobile/Landline) : </td><td width="443" align="left"><input type ="text" name = "phno"  id = "phno" value ="" size="20" maxlength="20"/></td>
      </tr>
      <tr>
          <td width="5" align="center" height="5" colspan="2"><center>4</center></td>
          <td align="left">&nbsp;<font color="red" size="4">*</font>REPORT TO</td><td width="100" align="left">
  	         <input type="radio" name="reportTo" value="IT SUPPORT" id="IT SUPPORT"  onchange="show(this.value)"/> <label for="IT SUPPORT">IT SUPPORT</label>
             <input type="radio" name="reportTo" value="OFFICE ADMINISTRATION" id="HR ADMIN" onchange="show(this.value)"/> <label for="HR ADMIN">OFFICE ADMINISTRATION</label>
             <input type="radio" name="reportTo" value="SOFTWARE DEVELOPMENT" id="SOFTWARE DEVELOPER" onchange="show(this.value)"/> <label for="SOFTWARE DEVELOPER">SOFTWARE DEVELOPMENT</label>		
 	      </td>
     </tr> 
     <tr>
          <td width="5" align="center" height="5" colspan="2"><center>5</center></td>
          <td align="left">&nbsp;<font color="red" size="4">*</font>LOCATION</td>
          <td width="100" align="left">
               <select name="cm_location" onchange="showEm(this.value)" id="Idcm_location" style="font-size : 8pt" >
				<option value="0" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					    <option value="<%=rs1.getString("b_name")%>"><%=rs1.getString("b_name")%></option>
					<%}%>
			  </select>
		  </td>
     </tr>
     <tr>
          <td width="5" align="center" height="5" colspan="2"><center>6</center></td>
          <td align="left">&nbsp;<font color="red" size="4">*</font>TYPE</td><td width="100" align="left">
              <select name="cm_type"  id="cm_type" style="font-size : 8pt"  onchange="copy();">                     
					<option value="0" style="background: lightgrey;" >--Select--</option>
					<%while(rs2.next()){ %>
				   <option> <%=rs2.getString("NAME")%> </option> 
					<%} %> 
		     </select>
	  	</td>
     </tr>
     <tr>
        <td width="5" align="center" height="5" colspan="2"><center>7</center></td>
        <td align="left">&nbsp;<font color="red" size="4">*</font>CATEGORY</td>
        <td align="left">
            <select name="pType" onchange="showType(this.value);" onblur="check(this.value);"  style="width: 130px;" id="pType">      
                 <option value="none">--Select--</option>
            </select> 
        </td>                              
     </tr> 
     <tr>
        <td width="5" align="center" height="5" colspan="2"><center>8</center></td>
        <td align="left">&nbsp;<font color="red" size="4">*</font>SUB CATEGORY</td>
        <td align="left">  
            <div id='typo'>      
               <select name="typo" onchange="showTypeDesc(this.value)" style="width: 130px;"  id="idtypo">   
                   <option value='-1' style="width: 130px;" >--Select--</option>  
               </select> 
            </div>    
            <input value="" type="hidden" id="idcm_problemsstt"  name="idcm_problemtt" /> 
       </td>                              
     </tr> 
     <tr>
       <td width="5" align="center" height="5" colspan="2"><center>9</center></td>
       <td align="left">&nbsp;<font color="red" size="4">*</font>REPORT<div id="label"></div></td>  
       <td width="100" align="left">
             <textarea name="cm_problem" id="idcm_problemss" rows="2" cols="100" maxlength="199" onclick="this.style.height='60px';" onblur="this.style.height='';"></textarea>
       </td>
    </tr>
    <tr>
       <td width="5" align="center" height="5" colspan="2"><center>10</center></td>
       <td align="left">&nbsp;<font color="red" size="4">*</font>PRIORITY</td><td width="20" align="left">
            <select name="priority">
              <option value="NULL">--Select--</option>
              <option value="LOW">LOW - 1 day</option>
              <option value="NORMAL">NORMAL - 8 hours</option>
              <option value="HIGH">HIGH - 4 hours</option>
              <option value="URGENT">URGENT - 2 hours</option>
            </select>
       </td>
   </tr> 
   <tr>       
        <td width="5" align="center" height="5" colspan="2"><center>11</center></td>
        <td> Upload Screenshot :</td>
        <td><input type="file" name="file" id="filename" size="15" value="" class="incTotal" />
            <br><font color="red" size="2">Note : Screen Shot is not mandatory, However it's recommended to provide Screen Shot, So that IT person can resolve this issue at the earliest</font>    </br>
        </td>
   </tr>
</table>
<br />
<label>SEND TO: </label>
<div id="check" style="color: blue;"></div> 
<table width="767" border="1" cellspacing="0" cellpadding="0">  
<table width="767" border="1" cellspacing="0" cellpadding="0">  
<br>    
      <div id="emp">      
      <select name="emp" style="width: 130px;" >   
          <option value='-1' style="width: 130px;">--Select--</option>  
      </select>     
     </div>    
     <label id="idMailLabel"></label>  
     <input type="hidden" name="mail" id="idMailValue" value="" />                               
</table>
<%
} catch (SQLException ex) {
     ex.printStackTrace();
} finally {
	DbUtil.closeDBResources(rs1,st1,cn1 );
	DbUtil.closeDBResources(rs2,st2,cn2 );
	DbUtil.closeDBResources(rs5,st5,cn5 );
	DbUtil.closeDBResources(rs_id,st_id,cn_id );
}
%>
<br />
<center>
<table align=center border="0" style="border-collapse: collapse;border:0px solid transparent;border-color: lightgrey">
   <tr> 
     <td >
		<div id="formsubmitbutton"> 
		<input   type="submit" value="SEND" name="save1" id="save1" onclick="return (validate() && ButtonClicked() && bluring()) ;"/>
		<input style="size:1" type="reset" value="RESET"/> 
         <!--   <a href="#" onclick="openHelpPDF()"><button type="button">HELP</button></a>
        <input  type="button"  value="HOME" onclick="window.location.href='HOME.jsp'"/>  -->
        </div>
    <div id="buttonreplacement" style="display:none; position: static;">
			<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
			</div> 
       </td>
 </tr>
</table>
</center>
</div>
</form>	

</body>

</html>