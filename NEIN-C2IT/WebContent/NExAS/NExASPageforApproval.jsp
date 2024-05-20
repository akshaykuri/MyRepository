<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>NExAS FORM</title>
	
  
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
  	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
    <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
 
  
                     <!--    Date Picker -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'dd,mm,yy' });
  } );
  </script>
 
                      <!--  Date Picker close-->
 
 
         <script language = "Javascript">
         function checkAddress(str)
              {
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
              }
         function validate()
              {
        	  var w=document.form.branch;
        	  var dpt=document.form.depart;
        	  var fn=document.form.full_name;
        	  var sw=document.form.scopeOfWork;
        	  var ec=document.form.emp_code;
        	  var desg=document.form.designation;
        	  var roff=document.form.reporting_officer;
        	  var rb = document.form.requestBy;
        	  var req=document.form.requestOption;
        	  //alert(req);
        	  //userid,iduserid,username,idusername,compCode,idcompCode,costCCode,idcostCCode,costCName,idcostCName,email,idemail,position,idposition
        	  var uId=document.form.userid;
        	  var uName=document.form.username;
        	  var compCode=document.form.compCode;
        	  var costCode=document.form.costCCode;
        	  var costName=document.form.costCName;
        	  var email = document.form.email;
        	  var pos=document.form.position;
        	  var uk=document.form.userKind;
        	  var opmenu=document.getElementsByName("OptionalMenu[]");
        	  var opu=document.form.operationUnit;
        	  var dispu=document.form.dispUnit;
        	 // var opmenu=document.form.OptionalMenu[];operationUnit,dispUnit 
        	  alert(opu);
        	  
        	  
        	  var l=document.form.remarks;
        	  var mail=document.form.mail;
        	  var desgS=document.form.desg;
          	  var empS=document.form.emp;
          	  var empid=document.form.empid;
       	      var reqbrcode=document.form.reqBrCode;
       	      var idnextapprover=document.form.nextapproverchecked;
       	      
              var bkColor = "red";
          	  var bkColor2 = "white";
          	  if ((empid.value==null)||(empid.value==""))
          	     {
                 alert("Please Enter EmpID!");
                 empid.style.bkColor = empid.style.backgroundColor;
                 empid.style.backgroundColor = bkColor;
                 empid.focus();
                 return false;
                 }
            if ((w.value==null)||(w.value=="")||(w.value=="Null"))
                 {
                 alert("Please Select Branch!");
                 w.style.bkColor = w.style.backgroundColor;
                 w.style.backgroundColor = bkColor;
                 w.focus();
                 return false
                 }
            if (checkAddress(w.value)==false)
                 {
                 w.value="";
                 alert("Invalid Selection!");
                 w.focus();
                 return false
                 }
           if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null"))
                 {
                 alert("Please Enter Department!");
                 dpt.style.bkColor = dpt.style.backgroundColor;
                 dpt.style.backgroundColor = bkColor;
                 w.style.backgroundColor = bkColor2;
                 dpt.focus();
                 return false;
                 }
            if (checkAddress(dpt.value)==false)
                {
            	dpt.value="";
                alert("Invalid Department!");
            	dpt.focus();
                return false;
                }
            if ((fn.value==null)||(fn.value==""))
                {
                alert("Please Enter Full Name!");
                fn.style.bkColor = fn.style.backgroundColor;
                fn.style.backgroundColor = bkColor;
                dpt.style.backgroundColor = bkColor2;
                fn.focus();
                return false;
                }
            if (checkAddress(fn.value)==false)
                {
                fn.value="";
                alert("Invalid Name!");
                fn.focus();
                return false;
                }  
            if ((roff.value==null)||(roff.value==""))
                {
                alert("Please Enter Reporting Officer Name!");
                roff.style.bkColor = roff.style.backgroundColor;
                roff.style.backgroundColor = bkColor;
                desg.style.backgroundColor = bkColor2;
                roff.focus();
                return false;
                }
            if (checkAddress(roff.value)==false)
                {
                roff.value="";
                alert("Invalid Name!");
               	roff.focus();
                return false;
                } 
          if ((desg.value==null)||(desg.value=="")||(desg.value=="Null"))
                {
                alert("Please Enter Designation!");
                desg.style.bkColor = desg.style.backgroundColor;
                desg.style.backgroundColor = bkColor;
                sw.style.backgroundColor = bkColor2;
                desg.focus();
                return false;
                }
           if (checkAddress(desg.value)==false)
                {
                desg.value="";
                alert("Invalid Designation!");
                desg.focus();
                return false;
                } 
          if ((rb.value==null)||(rb.value==""))
                {
                alert("Please Enter Requested By whom!");
                rb.style.bkColor = rb.style.backgroundColor;
                rb.style.backgroundColor = bkColor;
                ec.style.backgroundColor = bkColor2;
                rb.focus();
                return false;
                }
           if (checkAddress(rb.value)==false)
                {
                rb.value="";
                alert("Invalid Request!");
                rb.focus();
                return false;
                }
          if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false )  )
                {
                alert("Select  Request Type! \n \n New/Change/Reset");
                req[0].focus();
                return false;
                }
      if (uId.value=="")
          {
          alert("Please Enter User ID(NExAS)!");
          uId.style.bkColor =uId.style.backgroundColor;
          uId.style.backgroundColor = bkColor;
          uId.focus();
          return false;
          }
      if (uName.value=="")
          {
          alert("Please Enter User Name!");
          uName.style.bkColor = uName.style.backgroundColor;
          uName.style.backgroundColor = bkColor;
          uName.focus();
          return false;
          }
      if (compCode.value=="")
          {
          alert("Please Enter Company Code!");
          compCode.style.bkColor = compCode.style.backgroundColor;
          compCode.style.backgroundColor = bkColor;
          compCode.focus();
          return false;
          }
      if (costCode.value=="")
          {
          alert("Please Enter Cost Center Code!");
          costCode.style.bkColor =costCode.style.backgroundColor;
          costCode.style.backgroundColor = bkColor;
          costCode.focus();
          return false;
          }
      if (costName.value=="")
          {
          alert("Please Enter Cost Center Name!");
          costName.style.bkColor = costName.style.backgroundColor;
          costName.style.backgroundColor = bkColor;
          costName.focus();
          return false;
          }
       if (email.value=="")
          {
          alert("Please Enter email Address!");
          email.style.bkColor =email.style.backgroundColor;
          email.style.backgroundColor = bkColor;
          email.focus();
          return false;
          }
       if (pos.value=="")
          {
          alert("Please Enter Position!");
          pos.style.bkColor = pos.style.backgroundColor;
          pos.style.backgroundColor = bkColor;
          pos.focus();
          return false;
          }
      if ((uk[0].checked == false ) && (uk[1].checked == false ) && (uk[2].checked == false ) && (uk[3].checked == false ) )
          {
          alert("Select  User kind option...");
          uk[0].focus();
          return false;
          }
      if ((opmenu[0].checked == false ) && (opmenu[1].checked == false ) && (opmenu[2].checked == false ) && (opmenu[3].checked == false )&& (opmenu[4].checked == false ) && (opmenu[5].checked == false ) && (opmenu[6].checked == false ) && (opmenu[7].checked == false ) && (opmenu[8].checked == false ) && (opmenu[9].checked == false ) && (opmenu[10].checked == false ) && (opmenu[11].checked == false ) )
          {
          alert("Select optional menu with respeect on User Kinds option...");
          opmenu[0].focus();
          return false;
          }   
      if ((opu[0].checked == false ) && (opu[1].checked == false ) && (opu[2].checked == false ) )
          {
          alert("Select Operation unit option...");
          opu[0].focus();
          return false;
          }   
      if ((dispu[0].checked == false ) && (dispu[1].checked == false ) && (dispu[2].checked == false ) )
          {
          alert("Select Display unit option...");
          dispu[0].focus();
          return false;
          }       
          
          
      if ((tvapp[0].checked == false ) && (tvapp[1].checked == false ))
      {
      alert("Select TV Application option...");
      tvapp[0].focus();
      return false;
      }   
  if ((emptype[0].checked == false ) && (emptype[1].checked == false ) )
      {
      alert("Select Employee type option...");
      emptype[0].focus();
      return false;
      }    
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          if ((l.value==null)||(l.value==""))
                {
                alert("Enter Remarks!");
                l.style.bkColor = l.style.backgroundColor;
                l.style.backgroundColor = bkColor;
                rb.style.backgroundColor = bkColor2;
                l.focus();
                return false;
                } 
          if ((mail.value==null)||(mail.value==""))
                {
                alert("Select Employee Name and Designation!");
                desgS.style.bkColor = desgS.style.backgroundColor;
                desgS.style.backgroundColor = bkColor;
                l.style.backgroundColor = bkColor2;
                empS.style.bkColor = empS.style.backgroundColor;
                empS.style.backgroundColor = bkColor;
                mail.focus();
                return false;
                } 
          if (idnextapprover.value=="0")
                {
                alert("Please select the next approver..!");
                return false;
                } 
           else
               return true;
        }
   </script>
  
  <script  type="text/javascript">
    <% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
  </script>
    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
    {	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../adminlinkHR.jsp?msg="+msg2);
    }
    %>
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
                       }       var url="../selEmpFormsUsers.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
            
            
     function Mail(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="../selectMailId.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText   
                                                      } 
                                                              
            } 

</script>
<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) 
    {
	evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    return true;
    }
function sync1()
{
//alert("Here......."+v);
document.getElementById("idnextapproverchecked").value= "1";
}
</script>
<script type="text/javascript">  
 function sendInfo(v)  
           { // alert("empid :"+v);
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
    	    var url="getEmployee.jsp";  
    		    url +="?EMP_NO=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
	         var str2=xmlHttp.responseText;
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
                             // alert("here");//idname,iduid,idpass,idnmail
                             document.getElementById("resultFromAjax2").innerHTML = str2;//fname,iddept,idbranch,iddesg
                             document.getElementById("fname").value =  document.getElementById("p1").value;
                             document.getElementById("iddesg").value =  document.getElementById("p2").value;
                      		 document.getElementById("idbranch").value =  document.getElementById("p3").value;
                      		 document.getElementById("iddept").value =  document.getElementById("p4").value;
                      		 document.getElementById("rofficer").value =  document.getElementById("p5").value;
                      		 document.getElementById("sow").value =  document.getElementById("p6").value;
                     		 document.getElementById("ecode").value =  document.getElementById("p7").value;
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("fname").value = "";
                             document.getElementById("iddesg").value =""; 
      		                 document.getElementById("idbranch").value = "";
      		                 document.getElementById("iddept").value =  "";
      		                 document.getElementById("rofficer").value =  "";
      		                 document.getElementById("sow").value = "";
                   		     document.getElementById("ecode").value = "";
      		                 }
                 } 
</script>
                
 <script type="text/javascript"> //  body onloade()
 function unchecked()
    {
	 document.getElementById("OptionalMenu4").checked = false;
     document.getElementById("OptionalMenu5").checked = false;
     document.getElementById("OptionalMenu6").checked = false;
     document.getElementById("OptionalMenu8").checked = false;
     document.getElementById("OptionalMenu11").checked = false;
     document.getElementById("OptionalMenu12").checked = false;
     
     document.getElementById("OptionalMenu1").checked = false;
     document.getElementById("OptionalMenu2").checked = false;
     document.getElementById("OptionalMenu3").checked = false;
     document.getElementById("OptionalMenu7").checked = false;
     document.getElementById("OptionalMenu9").checked = false;
     document.getElementById("OptionalMenu10").checked = false;
    }
 
 document.getElementById("checkbox").checked = false;
 function active(value)
 {
	/* userid(iduserid),username(idusername),costCCode(idcostCCode),costCName(idcostCName),email(idemail),position(idposition)
	  userKind(userKind1-4),OptionalMenu(OptionalMenu1-12),operationUnit(operationUnit1-3),dispUnit(dispUnit1-3),dispRange1-6,
	  TVApp(TVApp1-2),empType(empType1-2),HRMenu(idHRMenu),date1(datepicker) */
	 /* //HOAcUser,BRAcUser,ITUser,RepoDispOnly */
	  unchecked()
	  if(value=="HOAcUser")
		   {
	       document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu12").style.backgroundColor = "#bff0a1";
	       document.getElementById("OptionalMenu1").disabled = true;
	       document.getElementById("OptionalMenu2").disabled = true;
	       document.getElementById("OptionalMenu3").disabled = true;
	       document.getElementById("OptionalMenu7").disabled = true;
	       document.getElementById("OptionalMenu9").disabled = true;
	       document.getElementById("OptionalMenu10").disabled = true;
		   }
	  if(value=="BRAcUser")
	      {
		  document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu3").disabled = false;
	       document.getElementById("OptionalMenu7").disabled = false;
	       
	       document.getElementById("OptionalMenu1").disabled = true;
	       document.getElementById("OptionalMenu2").disabled = true;
	       document.getElementById("OptionalMenu9").disabled = true;
	       document.getElementById("OptionalMenu10").disabled = true;
	      }
	  if(value=="ITUser")
	      {
		  document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       
	       document.getElementById("OptionalMenu1").disabled = true;
	       document.getElementById("OptionalMenu2").disabled = true;
	       document.getElementById("OptionalMenu3").disabled = true;
	       document.getElementById("OptionalMenu7").disabled = true;
	       document.getElementById("OptionalMenu9").disabled = true;
	       document.getElementById("OptionalMenu10").disabled = true;
	      }
	  if(value=="RepoDispOnly")
	      {
		  document.getElementById("OptionalMenu4").disabled = false;
	       document.getElementById("OptionalMenu5").disabled = false;
	       document.getElementById("OptionalMenu6").disabled = false;
	       document.getElementById("OptionalMenu8").disabled = false;
	       document.getElementById("OptionalMenu11").disabled = false;
	       document.getElementById("OptionalMenu12").disabled = false;
	       document.getElementById("OptionalMenu3").disabled = false;
	       document.getElementById("OptionalMenu7").disabled = false;
	       document.getElementById("OptionalMenu1").disabled = false;
	       document.getElementById("OptionalMenu2").disabled = false;
	       document.getElementById("OptionalMenu9").disabled = false;
	       document.getElementById("OptionalMenu10").disabled = false;
	   }
	 
	
 }
function hidefields()
    {
	/* userid(iduserid),username(idusername),costCCode(idcostCCode),costCName(idcostCName),email(idemail),position(idposition)
	  userKind(userKind1-4),OptionalMenu(OptionalMenu1-12),operationUnit(operationUnit1-3),dispUnit(dispUnit1-3),dispRange1-6,
	  TVApp(TVApp1-2),empType(empType1-2),HRMenu(idHRMenu),date1(datepicker) */
	 document.getElementById("OptionalMenu1").disabled = true;
	 document.getElementById("OptionalMenu2").disabled = true;
	 document.getElementById("OptionalMenu3").disabled = true;
	 document.getElementById("OptionalMenu4").disabled = true;
	 document.getElementById("OptionalMenu5").disabled = true;
	 document.getElementById("OptionalMenu6").disabled = true;
	 document.getElementById("OptionalMenu7").disabled = true;
	 document.getElementById("OptionalMenu8").disabled = true;
	 document.getElementById("OptionalMenu9").disabled = true;
	 document.getElementById("OptionalMenu10").disabled = true;
	 document.getElementById("OptionalMenu11").disabled = true;
	 document.getElementById("OptionalMenu12").disabled = true;
	 
	
    }
</script>               
</head>
<body onload="hidefields()">
<form action="NExASPageBack.jsp.jsp" method="post" name="form">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
/* System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------"); */
%>
<%-- <%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %> --%>
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
    <table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	 <tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>NExAS APPLICATION FORM</label>
		</b></font></center></td> 
	</tr>
	<tr style="visibility: hidden;display: none;">
	   <td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
	    <%-- 	<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/> --%>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
	</tr>
    <tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<%-- <td width="165"><%= po_date.format(new java.util.Date())%></td> --%>
	</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
<td>
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
<br />
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn11=null;
Statement st1= null,st2=null,st3=null,st4=null,st11=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs11=null;Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
try
  {
  cn1 = con.getConnection2();
  st1=cn1.createStatement();
  rs1 = st1.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

  cn11 = con.getConnection2();
  st11=cn11.createStatement();
  rs11 = st11.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_no Asc"); 

  cn2 = con.getConnection2();
  st2=cn2.createStatement(); 
  rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 
 
  cn4 = con.getConnection2();
  st4=cn4.createStatement();
  rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

  String new_id = null;
  int id=0;
  String id2=null;
  cn3 = con.getConnection2();
  st3=cn3.createStatement();
  rs3 = st3.executeQuery("SELECT max(idextend) FROM form7_newins WHERE form7_no IN(SELECT form7_no FROM form7_newins LEFT JOIN branch_master b ON(substr(form7_no,16,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form7_no)");
  if(rs3.next())
      {
	  try
	    {
		id=rs3.getInt(1);
		if(id==0)
 			id=1;
		System.out.println("ID VALUE "+id);
		if(id2==null)
 			id2="NEIN/CS/NEWINS/"+b_no+"-";
		//id2= rs_id.getString(3);
		System.out.println("ID2 VALUE "+id2);
        id++;     
		//System.out.println("Gen id "  +rs_id.getInt(1));
		//new_id = "" +String.valueOf(id);
		new_id = id2+String.valueOf(id);
		System.out.println("MR HO "  +new_id);
	  }
	  catch(SQLException ex)
	      {
		  System.out.println(ex.toString());
		  new_id = "NEIN/CS/NEWINS/90-1";
	      }
	  //System.out.println("new Id **************************222222222: "  +new_id);
   }
 %>	 
		
<table  width="895">
    <%-- <tr>
	  <td bgcolor="grey" style="text-align: right;width:23%;">
	    <input name="form7_no" readonly="readonly" value="<%=new_id%>" size="25" />
	 </td>
   </tr> --%>
   <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Emp ID :<input type="hidden" name="idextend" value="<%=id%>" /></td>
     <td align="left"><input type="text" name="empid" value="" id="idempid"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"><font color="red"> <div id="mydiv2"></div></font></td>
     <td></td><td></td>
    
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
    <td style="text-align:left;"><input type="text" name="full_name" size="29" id="fname" maxlength="44" readonly/></td>
    <td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
    <td style="text-align: left;"><input type="text" name="depart" id="iddept" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="<%=id%>" /></td>
     <td style="text-align: left;"><input type="text" name="branch" id="idbranch" size="28" maxlength="44" readonly/>	</td>
     <td  style="text-align: right;"><font color=red>*</font>Designation :</td>
     <td style="text-align: left;"><input type="text" name="designation" id="iddesg" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
     <td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer" size="28" maxlength="44" readonly/></td>
     <td style="text-align: right;"><font color=red>*</font>Emails ID :</td>
	 <td style="text-align: left;"><input type="text" name="scopeOfWork"	id="sow" size="28" maxlength="44" readonly/></td>
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Mobile No :</td>
    <td style="text-align:left;"><input type="text" name="emp_code" id="ecode" maxlength="44" size="29"/ readonly></td>
    <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
    <td style="text-align:left;"><input type="text" name="requestBy" id="req" value='<%=Name%>' size="28" maxlength="44" readonly/></td>
  </tr>
  
  
  
  <tr>
    <td align="left"><font color=red>*</font>(1)Request Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> 
          <input style="" type ="radio" name = "requestOption" value ="New" id="" onclick="hideTR();"/>New
          <input type ="radio" name = "requestOption" value ="Change" onclick="showTR();" />Change
          <input type ="radio" name = "requestOption" value ="Reset" onclick="showTR();" />Reset
    </td>
  </tr>
  
  <tr style="visibility: hidden;display: none;" id="idDelete">
    <td align="right"><font color=red>*</font>Remarks :</td>
    <td colspan="3"><textarea name="deleteremarks" rows="2" cols="80" id="ta" maxlength="99" title="Remarks 100 characters"></textarea></td>
  </tr>
</table>
<br />







<table id="it" width="895">
   <tr>
      <td align="center" colspan=2><H3>USE FOR HEAD OFFICE</H3></td>
   
  </tr>
  <tr>
      <td align="left"><font color=red>*</font>(2)User ID(NExAS)  :</td>
      <td style="font-weight:bold;font-style:italic;width:23%;" colspan="3" ><input type="text" name="userid"	id="iduserid" size="28" maxlength="44" /></td>
  </tr>
  <tr>
      <td align="left"><font color=red>*</font>(3)User Name  :</td>
      <td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"><input type="text" name="username"	id="idusername" size="28" maxlength="44" /></td>
  </tr>
  <tr >
     
          <td align="left"><font color=red>*</font>(4)Company Code:	</td>
          <td colspan=2>
             <table>
                <tr>
                  <td >
                    <select style="width: 60px;height:20px;" name="compCode" id="idcompCode">
                         <option value="">Select</option>
                         <option value="NIN">NIN</option>
                   </select>
                   </td>
                  <td align="left"><font color=red>*</font>(5)Cost Center Code:</td>
                  <td style="text-align: left;"><input type="text" name="costCCode"	id="idcostCCode" size="10" maxlength="44" /></td>
                  <td align="left"><font color=red>*</font>(6)Cost Center Name:</td>
                  <td style="text-align: left;"><input type="text" name="costCName"	id="idcostCName" size="28" maxlength="44" /></td>
               </tr>
            </table>
         </td>
     
  </tr>
  <tr>
      <td align="left"><font color=red>*</font>(7)E-mail address  :</td>
      <td style="text-align: left;" colspan="3"><input type="text" name="email"	id="idemail" size="28" maxlength="44" /></td>
  </tr>
  <tr>
      <td align="left"><font color=red>*</font>(8)Position  :</td>
      <td style="text-align: left;" colspan="3"><input type="text" name="position"	id="idposition" size="28" maxlength="44" /></td>
  </tr>
  <tr>
     <td align="left"><font color=red>*</font>(9)Authority  :</td>
     <td colspan=2>
             <table>
                <tr>
                  <td align="left">Accounting Menu</td>
                   <td colspan=2>
                   
                 
                      <table>
                         <tr>
                             <td align="center">User kind <font color=red>(Please select first)</font></td>
                             <td>
                                 <input type="radio" name="userKind" id="userKind1" value="HOAcUser" onclick="active(this.value)"></input>HO Acounting User
                                 <input type="radio" name="userKind" id="userKind2" value="BRAcUser" onclick="active(this.value)"></input>Branch Acounting User</br>
                                 <input type="radio" name="userKind" id="userKind3" value="ITUser" onclick="active(this.value)"></input>IT User
                                 <input type="radio" name="userKind" id="userKind4" value="RepoDispOnly" onclick="active(this.value)"> </input>Report display only User 
                             </td>
                         </tr>
                         <tr>
                            <td align="center">Optional menu</td>
                            <td>
                                <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" ></input>Payment Proposal
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr"></input>Payment Approval <br/>
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch"></input> Open/Close Schedule
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq"></input> Void Cheque <br/>
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" ></input>Issue Cheque 
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo"></input>Tax Report <br/>
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa"></input> Exchange Rate Maintainance
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc"></input>Offset Account  <br/>
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" ></input> Addfree master Maintainance
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch"></input>Payment operation of branch </br>
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput"></input> Batch Input
                                 <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS"></input>  SEPA.BACS data Download
                             </td>
                        </tr>
                        <tr>
                           <td align="center">Operation unit</td>
                            <td>
                                 <input type="radio" name="operationUnit" id="operationUnit1" value="Company" ></input> Company
                                 <input type="radio" name="operationUnit" id="operationUnit2" value="Branch"></input> Branch
                                 <input type="radio" name="operationUnit" id="operationUnit3" value="Region"></input> Region
                            </td>
                         </tr>
                         <tr>
                             <td align="center">Operation range(If Additional comp)</td>
                             <td align="left">
                             (1) <input type="text" name="operationRangeOptional" id="idoperationRangeOptional" value="" size="10" maxlength="10"/>
                             (2)<input type="text" name="operationRangeOptional" id="idoperationRangeOptional" value="" size="10" maxlength="10"/>
                             (3)<input type="text" name="operationRangeOptional" id="idoperationRangeOptional" value="" size="10" maxlength="10"/><br>
                             (4)<input type="text" name="operationRangeOptional" id="idoperationRangeOptional" value="" size="10" maxlength="10"/>
                             (5)<input type="text" name="operationRangeOptional" id="idoperationRangeOptional" value="" size="10" maxlength="10"/>
                             (6)<input type="text" name="operationRangeOptional" id="idoperationRangeOptional" value="" size="10" maxlength="10"/>    
                             </td>
                         </tr>
                         <tr>
                            <td align="center">Display unit</td>
                            <td>
                                 <input type="radio" name="dispUnit" id="dispUnit1" value="Company" ></input>Company 
                                 <input type="radio" name="dispUnit" id="dispUnit2" value="Branch"></input>Branch
                                 <input type="radio" name="dispUnit" id="dispUnit3" value="Region"></input>Region
                            </td>
                        </tr>
                        <tr>
                           <td align="center">Display range(If Additional comp)</td>
                           <td align="left">
                              (1)<input type="text" name="dispRange1"	id="dispRange1" size="10" maxlength="44" />
                             (2) <input type="text" name="dispRange2"	id="dispRange2" size="10" maxlength="44" />
                              (3)<input type="text" name="dispRange3"	id="dispRange3" size="10" maxlength="44" /><br />
                              (4)<input type="text" name="dispRange4"	id="dispRange4" size="10" maxlength="44" />
                             (5) <input type="text" name="dispRange5"	id="dispRange5" size="10" maxlength="44" />
                              (6)<input type="text" name="dispRange6"	id="dispRange6" size="10" maxlength="44" />
                           
                           </td>
                        </tr>
                      </table>
                    </td>
               </tr>
               <tr>
                  <td align="left">TV</td>
                  <td colspan=2>
                      <table>
                         <tr>
                             <td align="left">TV Application</td>
                             <td>
                                 <input type="radio" name="TVApp" id="TVApp1" value="ClaExpByUr" >Claiming Expense by yourself</input> <br/>
                                 <input type="radio" name="TVApp" id="TVApp2" value="ClaExpByOther">Claiming Expense by others</input> 
                            </td>
                         </tr>
                         <tr>
                            <td align="left">Employee Type</td>
                            <td>
                                 <input type="radio" name="empType" id="empType1" value="localEmp" >Local employee</input> <br/>
                                 <input type="radio" name="empType" id="empType2" value="transEmp">Transfer employee</input> 
                            </td>
                        </tr>
                     </table>
                 </td>
               </tr>
               <tr>
                  <td align="left">HR menu</td>
                  <td align="left"><input type="text" name="HRMenu"	id="idHRMenu" size="50" maxlength="44" /></td>
               </tr>
            </table>
     </td>
  </tr>
  <tr>
      <td align="left"><font color=red>*</font>(10)Use Date(dd,mm,yyyy)  :</td>
       <td style="text-align: left;" colspan="3"><input type="text" name ="date1" id="datepicker" placeholder="Date"></td>
  </tr>
   <tr>
      <td align="left"><font color=red>*</font>(11)Remarks  :</td>
      <td><textarea name="remarks" rows="3" cols="124" id="ta" maxlength="199" title="Remarks 200 characters"></textarea></td>
  </tr>
</table>
<font color=red><b><h3>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br /></h3>
</font>       
    <b><font color=red>*</font>Send To:</b>
	<br />
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
  <tr>
    <% 
    String nextapprover=null,empname=null,empmail=null,empid=null;
    cn5 = con.getConnection2();
    st5 = cn5.createStatement();
    String bno=(String)session.getAttribute("b_no");
    %>
    <%
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
    
    System.out.println("Branch no :"+ bno);
    Class.forName(driver).newInstance();
    cn5 = DriverManager.getConnection(url+dbName,userName,password); 
    st5 = cn5.createStatement();  
    rs5 = st5.executeQuery("Select * from formapproval where levelno='1' and formtype='NExAS_NEWINS' and branch='"+bno+"' ");
    while(rs5.next())
        { 
        nextapprover=rs5.getString(6);
        empname=rs5.getString(8);
        empmail=rs5.getString(10);%>
      
           <td> 
              <input align="left" type="radio" name="nextapprover" value="<%=nextapprover%>" id="idnextapprover" onclick="sync1()"/><%=nextapprover%>-<font color="blue"><%=empmail%></font>
   	      </td>
   	
       <% }%> 
          </tr>  
       <input type="text" name="nextapproverchecked" id="idnextapproverchecked" value="0"/>
       <%-- <select name="desg" onchange="showEmp(this.value)" style="font-size : 8pt">      
         <option value="none">Select</option>
              <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                 cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                 st5 = cn5.createStatement();  
                 rs5 = st5.executeQuery("Select DISTINCT DESIGNATION from desg where DESG_NO  in('2','40','7','5','15','41','20','19','45') ORDER BY DESIGNATION ASC");
                 while(rs5.next()){     %>     
                      <option value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                 <% }     %>   
     </select>  
     <br>    
        <div id='emp'>      
           <select name="emp" style="font-size : 8pt">   
             <option value='-1'></option>  
           </select>     
        </div>    
    <br />                                                 
  <label style="float: left;" id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" />          --%>                      
</table>  
</br>
</center>                                                                   
   </td>
</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
     <td style="size:1">
        <div id="formsubmitbutton">
            <input  type="submit" value="SEND" name="save1" id="save1" onclick="return (validate() && ButtonClicked()) " />
        </div>
        <div id="buttonreplacement" style="display:none;">
	       <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	    </div> 
     </td>
     <td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
     <td>&nbsp;&nbsp;
   	 <!-- <input type="button" id="btnShowSimple" value="HELP" /> -->
     </td>
   	 <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp'"/> </td>
   	</tr>
 
</table> 	

	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs3,st3,cn3);
	DbUtil.closeDBResources(rs4,st4,cn4);
	DbUtil.closeDBResources(rs5,st5,cn5);
  }
	%>
</center>
	<br /><br /><br />
	
</div>
<!-- <div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />
<label style="text-align:center;">HR/Admin (Local)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>HR/Admin (Local)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>VP</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>SR.MANAGER IT (HO)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>HO(Finance/Accounts) - 1 & 2 Approval</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>SR.MANAGER IT (HO)</label>
<br /><br />
<br />
<label>---------------------------------------------------</label>
<br />
<br />
<label>IF INITIATED BY HO </label>
<br />
<label>HR -> IT support -> HR -> GM/VP -> IT Manager </label>
<br />
<label> -> Arun Bhat -> IT </label>



<br />
<br />
<br />
</div> -->
</form>	
<div id="resultFromAjax2" style="display:none;">
        
       </div>
</body>

</html>