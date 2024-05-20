<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>COMPLAINT ESCALATION</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
		 <script language="javascript"   type="text/javascript" src="js/onSubmitWait.js"></script>
	

	
	
	


<%
if(session==null)
{
	response.sendRedirect("loginho.jsp?msg=1");
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
                       }       var url="selEmp.jsp";  
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
                       }       var url="selectMailId.jsp";  
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
            

       function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
	
		 
		
</script>
 <script type="text/javascript">
function cancel()
{
   close();
}
</script>
  <style type="text/css"> 
textarea.special { 
font-family:arial; 

font-size:11px; 
overflow: auto;
}

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
select {
    font-size:0.8em;
     /* border-color:#999;  without this, it won't work */
}

</style>

<%-- 		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
     else
    	 {
    	 msg = "PLEASE ENTER AGAIN";
         response.sendRedirect("loginho.jsp?msg=" +msg);
    	 }
</script>
	 --%>
	
<script type="text/javascript">
var currentdate = new Date(); 
var hour = currentdate.getHours()+":"+ currentdate.getMinutes() + ":" + currentdate.getSeconds();

hour = document.getElementById('hour1').value;
//var vat = document.getElementById("hour").value;
alert("time zone :"+hour);

</script>	


<script language="javascript" type="text/javascript">
    function ValidateForm() {
        var isValidForm = true;
        var errorMessages = "";

        
        var e = document.getElementById("cm_status");
        //var strSel = "The Value is: " + e.options[e.selectedIndex].value + " and text is: " + e.options[e.selectedIndex].text;
        if (e.options[e.selectedIndex].text == "--Select--") {
            //document.getElementById("ComfortLevelError").innerHTML = "- Comfort Level is required.";
            alert("Select Status");
            e.focus();
            isValidForm = false;
        }
        
            
       var CommentsTextArea = document.getElementById("admin_remarks");
            if (CommentsTextArea.value == "") {
              alert("Enter Problem in brief");
              CommentsTextArea.focus();
              isValidForm = false;
            }    
        
        
        
        return isValidForm;
    }   
    
    function Note()
    {
    	var s = document.getElementById("sta");
    	var ss = document.getElementById("cm_status");
    	if(s.value == "" || s.value == "Resolved" );
    	alert("Select Status");
    	ss.focus();
    	isValidForm =false;
    }
    
    function Note2()
    {
    	var c = document.getElementById("com");
    	var ss = document.getElementById("admin_remarks");
    	if(c.value == "" || c.value == '%qwertyuiopasdfghjklzxcvbnm%' );
    	alert("Enter Problem in brief");
    	ss.focus();
    	isValidForm =false;
    }
</script>        
	
		
		<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
		</style>
		
		
</head>

<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              
	              String req;
	              Connection2 dbConn = new Connection2();
	            // String transId = null;  
	             
	            // String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
	           // String idextend,mr_id,mr_name,mr_approved,mr_discuss,mr_date,e_name,e_designation,totalcon,desg,emp,theName,transid,mr_remarks,stauts,mail;
	            String cm_mail,cm_date,cm_time,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid,mail,admin_remarks,cm_status;
	            String city_no=null;
	  
	  //EscalateSaName,EscalateSaDate
	  String InitiatorRemarksEscalateSsaRemarks =null;  
	   String FirstSysAdminEscalateSaName=null,SecondSystemAdminEscalateSsaName=null,ThirdSysAdminEscalateSssaName=null,FourthSysAdminEscalateItManagerName=null;
	   String FirstSysAdminEscalateSaDate=null,SecondSysAdminEscalateSsaDate=null,ThirdSysAdminEscalateSssaDate=null,FourthSysAdminEscalateItManagerDate=null;
	   String FirstSysAdminEscalateSaRemarks=null,SecondSysAdminEscalateSsaRemarks=null,ThirdSysAdminEscalateSssaRemarks=null,FourthSysAdminEscalateItManagerRemarks=null;
	   
	   String departmentOfComplaint=null;
	%>

<%
city_no =(String) session.getAttribute("b_no");
System.out.println("city_no *********************  :"+city_no);
if(session==null)
{
	response.sendRedirect("loginho.jsp?msg=1");
}
%>
<%
/*  String req;
  req = request.getParameter("aabbcc"); */
  
  String no=request.getParameter("complaint_no");
  System.out.println("wat is the getting value complaint_no :"+no); 
  String req = request.getParameter(no);
  System.out.println("wat is the getting value 2 complaint_no:"+req); 
  
  
Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
System.out.println("Payload"+req);

st10=cn10.createStatement();
rs10 = st10.executeQuery("select complain_id from complain_master_item WHERE complain_id='"+req+"'");
if(!rs10.next()){
	String msg1 = "Select__Complain__Number";
	response.sendRedirect("complainPageStatusBranch.jsp?msg="+msg1);
}
%>

     <%
                 // transId = "abc"+String.valueOf(Math.random()); 
     
                //  req = request.getParameter("aabbcc");
                  
                  
                  
                  System.out.println("Request payload: "+ req);
                  
                  
                 // out.println("Request payload: "+ req);
                   conn = con.getConnection2();
                   st = conn.createStatement();
                  // rs = st.executeQuery("select * from complain_master_item where complain_id='"+req+"'");
                   rs = st.executeQuery("select cm_mail,cm_location,cm_name,cm_date,cm_time,cm_time2,idextend,complain_id,cm_type,cm_problem,desg,emp,cm_status,admin_remarks,transid,mail,EscalateSsaRemarks,EscalateSsaName,EscalateSssaName,EscalateSsaRemarks,EscalateSsaName,DATE_FORMAT(EscalateSsaDate, '%d %b %Y') as EscalateSsaDate,EscalateSsaRemarks,EscalateSssaName,DATE_FORMAT(EscalateSssaDate, '%d %b %Y') as EscalateSssaDate,EscalateSssaRemarks,EscalateItManagerName,DATE_FORMAT(EscalateItManagerDate, '%d %b %Y') as EscalateItManagerDate,EscalateItManagerRemarks,EscalateSaName,DATE_FORMAT(EscalateSaDate, '%d %b %Y') as EscalateSaDate,EscalateSaRemarks,reportTo   from complain_master_item where complain_id='"+req+"'");
                   
                   //while(rs.next()){
                	    if(rs.next()){
                	    	
                	    
                	   cm_date = rs.getString("cm_date");    
                	   cm_time = rs.getString("cm_time");
                	  // cm_time2 = rs.getString("cm_time2");
                	  
                	  
                	  
                	  //Timestamp cm_time2 = rs.getTimestamp("cm_time2");
                	   //Timestamp cm_time2 = Timestamp.valueOf("2007-09-23 10:10:10.0");
                	   //Timestamp cm_time2 = Timestamp.valueOf("cm_time2");
                	 //  System.out.println("time stamp value "+cm_time2);
                	   idextend = rs.getString("idextend");
                	   complain_id = rs.getString("complain_id");
                	   mail = rs.getString("mail");   //it support mail id
                	   cm_name = rs.getString("cm_name");//sender name
                	   cm_mail = rs.getString("cm_mail");//sender mail id
                	   cm_location = rs.getString("cm_location");
                	   cm_type = rs.getString("cm_type");
                	   cm_problem = rs.getString("cm_problem");
                	   desg = rs.getString("desg");
                	   emp = rs.getString("emp");//it support name
                	   cm_status = rs.getString("cm_status");
                	   admin_remarks = rs.getString("admin_remarks");
                	   transid = rs.getString("transid");
                	   
                	   departmentOfComplaint = rs.getString("reportTo");
                	  
                	   
                	   InitiatorRemarksEscalateSsaRemarks = rs.getString("EscalateSsaRemarks");
                	   
                	   
                	   FirstSysAdminEscalateSaName = rs.getString("EscalateSaName");
                	   FirstSysAdminEscalateSaDate = rs.getString("EscalateSaDate");
                	   FirstSysAdminEscalateSaRemarks = rs.getString("EscalateSaRemarks");
                	 
                	   SecondSystemAdminEscalateSsaName = rs.getString("EscalateSsaName");
                	   SecondSysAdminEscalateSsaDate = rs.getString("EscalateSsaDate"); 
                	   SecondSysAdminEscalateSsaRemarks = rs.getString("EscalateSsaRemarks");
                	   
                	   ThirdSysAdminEscalateSssaName = rs.getString("EscalateSssaName");
                	   ThirdSysAdminEscalateSssaDate = rs.getString("EscalateSssaDate");
                	   ThirdSysAdminEscalateSssaRemarks = rs.getString("EscalateSssaRemarks");
                	   
                	   FourthSysAdminEscalateItManagerName = rs.getString("EscalateItManagerName");
                	   FourthSysAdminEscalateItManagerDate = rs.getString("EscalateItManagerDate");
                	   FourthSysAdminEscalateItManagerRemarks = rs.getString("EscalateItManagerRemarks");
                   }
                	  //  else{
                	    	//msg = "...'"+req+"' IS ALREADY APPENDED.......";
                	   // 	}
                   System.out.println("emp "+emp);
                   System.out.println("departmentOfComplaint :"+departmentOfComplaint);
                   conn.close();
                   st.close();
                   rs.close();
                   
                   //System.out.println("Append char check: "+req.charAt(req.length()-2));
                   // if(req.charAt(req.length()-1!='a')){
                  	 //if(req.charAt(req.length()-2)!='a'){
                  	//  req +="(a)"; 
               //     }
                  	 
                  	 
                  	 
     %>
<body>
<%!String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,SessionSuperAdmin=null,SessionMail=null; %>
<% SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
SessionMail = (String) session.getAttribute("Nmail"); %>

<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!-- <form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');"> -->
<form method="post" action="complaint_escaltion_Back.jsp" onsubmit="return ValidateForm();" name="form1">


 <br />
<input type="hidden" name="SessionName" value="<%=SessionName%>" />
<input type="hidden" name="Sessiondesg" value="<%=Sessiondesg%>" />
<input type="hidden" name="Sessioncity" value="<%=Sessioncity%>" />
<input type="hidden" name="SessionMail" value="<%=SessionMail%>" />	
	
<input type="hidden" name="transid" value="<%=transid%>" />
<input type="hidden" name="desg" value="<%=desg%>" />
<input type="hidden" name="emp" value="<%=emp%>" />	
<input type="hidden" name="mail" value="<%=mail%>" />	
<input type="hidden" name="cm_mail" value="<%=cm_mail%>" />	
	
<input type="hidden" name="city_no" value="<%=city_no%>" />	
	 <br />
		
<!-- <div id="leftfeature"><input type="button" value="BACK" onclick="window.location.href='complainDateWise.jsp?msg=1'"/></div> -->
	<div id="page-wrap">
   <table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<b><center><label>
		NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> </center>
		</b></font></td>
	</tr>
</table>
<br />

<center>
<label><font color="black"><u><b>COMPLAINT ESCALATION</b></u></font></label> <br />


</center>
	 <br />


  


		<%
                     
                    String new_id = null;
                    int id=0;
                    Connection cn_id = null,cn_id2=null; 
                    Statement st_id = null,st_id2=null,st_idRO=null; 
                    ResultSet rs_id = null,rs_id2=null,rs_idRO=null; 
                    Connection cn1 = null;
                    Statement st1 = null; 
                    ResultSet rs1 = null;
                    try{
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    cn_id2 = con.getConnection2();
                    st_id2=cn_id2.createStatement();
                    
                                   
                    %>


		
               <%  
                String cs_date;
         	   DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         	   //get current date time with Date()
         	   Date date = new Date();
            	
            	cs_date = dateFormat.format(date);
            	
            	
                System.out.println("cs date we are getting "+cs_date);
            	String cr_time;
            	
                %>
               <%
               Date currentdate = new Date(); 
               //Date hour = currentdate.getHours()+":"+ currentdate.getMinutes() + ":" + currentdate.getSeconds();

              // hour = document.getElementById('hour1').value;
               //var vat = document.getElementById("hour").value;
               //alert("time zone :"+hour);
               //--------------------------------------
               
               long start = System.currentTimeMillis();
				long end = start + (1*3600 + 23*60 + 45) * 1000; // 1 h 23 min 45.678 s
				Date timeDiff = new Date(end - start - 3600000); // compensate for 1h in millis
				SimpleDateFormat timeFormat = new SimpleDateFormat("H:mm:ss");
				System.out.println("Duration: " + timeFormat.format(timeDiff));
               System.out.println("second version"+timeFormat);
               %>
		<div style="clear:both"></div>
		
		<div id="customer">


		
		</div>

<div id="customer">


<table id="meta" width="200">
	<tr>
		<td class="meta-head" width="100">Complain No.:</td>


		<td class="meta-head" width="100"><textarea id="idpordernon" name="complain_id"
			readonly="readonly" ><%=complain_id %></textarea></td>
	</tr>
	<tr>
		<td class="meta-head" width="100">Creation Date</td>


		<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

		<td class="meta-head" width="100"><textarea id="temp_date" name="cm_date2" readonly="readonly"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
        

		<td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
</tr>

<%-- <tr><td class="meta-head" width="100">Time:</td><td class="meta-head" width="100"><textarea id="temp_date" name="cm_time2" readonly="readonly"> <%=timeFormat.format(timeDiff)%> </textarea> </td></tr>
 --%>

</table></div>

<br />
<%String naam=null;
String aawda=null;
String aawdaMail = null;
%>
   <%
   String SystemAdinNameNew = null;
   String SystemAdminExtraDesigNew = null,reportingOff=null;
System.out.println("SystemAdminExtraDesigNew  : "+SystemAdminExtraDesigNew);
cn1 = con.getConnection2();
st1=cn1.createStatement();//complain_id
//To Check Present SYSTEM ADMIN extra Desig is SA/SSA/SSSA/IT MANAGER
rs1 = st1.executeQuery("SELECT DISTINCT Nname,extraDesig,reportingOff FROM nentryho WHERE Nname='"+emp+"' LIMIT 1 ");
while(rs1.next()){
	 SystemAdinNameNew = rs1.getString(1);
	 SystemAdminExtraDesigNew = rs1.getString(2);
	 reportingOff = rs1.getString(3);
	System.out.println("SystemAdinNameNew :"+SystemAdinNameNew+"          SystemAdminExtraDesigNew -------------:"+SystemAdminExtraDesigNew+" reportingOff "+reportingOff);
	
	
}
String[] parts = reportingOff.split("--");
String full_name = parts[0]; // 004
String emp_id = parts[1]; // 034556
System.out.println("FULLNAME :"+full_name +"     EMP_ID"+emp_id);
//SystemAdminExtraDesigNew : 

//TO check All SYSTEM ADMIN RELATED TO THAT BRANCH with THERRE SA/SSA/SSSA/IT MANAGER Extra desig
/* rs_id = st_id.executeQuery("SELECT DISTINCT a.Locname,e.extraDesig FROM assigned_master a INNER JOIN nentryho e ON(a.Locname=e.Nname) WHERE a.assignedLocation='"+cm_location+"'");
while ( rs_id.next() )
{    
 String naam = rs_id.getString(1);
 String aawda = rs_id.getString(2);
 System.out.println("naam :"+naam+"          aawda :"+aawda);
} */


%>
<table border="2" cellspacing="1" width="900">

<tr><td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
			
<td width="25" align="center" height="5" colspan="2"><center>1</center></td>

<td >&nbsp;USER NAME </td><td width="443"><input type ="text" name = "cm_name"  id = "cm_name" value ="<%=cm_name%>" size="40" readonly="readonly"/></td>
</tr>
 <tr>
<td width="25" align="center" height="5" colspan="2"><center>2</center></td>

<td>&nbsp;LOCATION</td><td width="100"><input type ="text" name = "cm_location"  id = "cm_location" value ="<%=cm_location%>" size="40" readonly="readonly"/></td>
</tr>
<tr>
<td width="25" align="center" height="5" colspan="2"><center>3</center></td>

<td>&nbsp;TYPE OF PROBLEM</td><td width="100"><input type ="text" name = "cm_problem"  id = "cm_location" value ="<%=cm_type%>" size="40" readonly="readonly"/></td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>4</center></td>

<td>&nbsp;REPORT PROBLEM</td><td width="100"><textarea name="cm_problem" id="cm_problem" rows="2" cols="100" readonly="readonly"><%=cm_problem%></textarea> </td>
</tr>
<tr>
<td width="25" align="center" height="5" colspan="2"><center>5</center></td>

<td>&nbsp;REPORT DATED</td><td width="100"><textarea  rows="1" cols="30" readonly="readonly"><%=cm_time%></textarea> </td>
</tr>
<!-- <tr>
<td colspan="4">
<label><u><b>ADMINISTRATOR:</b></u></label>
</td>
</tr> -->
<tr>
<td colspan="4">

<label> <font color="Grey">Escalation Comments:</font></label><br />

<%-- INITIATOR :- <%=cm_name%>              &nbsp;INITIATOR REMARKS :- <%=FirstSysAdminEscalateSaRemarks%><br /> --%>
<table border="1" cellspacing="1" width="900">
<tr><td width="240"><%=departmentOfComplaint%></td><td width="140">DATE</td><td width="600">REMARKS</td></tr>
<%if((FirstSysAdminEscalateSaName!=null)){ %>
<tr><td>
 <font color="blue"><%=FirstSysAdminEscalateSaName%></font></td><td>
 <font color="blue" size="2"><%=FirstSysAdminEscalateSaDate%></font>&nbsp;</td><td>
<font color="blue"><%=FirstSysAdminEscalateSaRemarks%></font></td>
</tr><%} %>
<%if((SecondSystemAdminEscalateSsaName!=null)){ %>
<tr><td >
<%-- STATUS&nbsp;&nbsp; :- <textarea readonly="readonly" rows="1" cols="25" id="sta" onclick="Note();" style="background-color: lightgray;"><%=cm_status%></textarea><br /> --%>
 <font color="blue"><%=SecondSystemAdminEscalateSsaName%></font></td><td>
 <font color="blue" size="2"><%=SecondSysAdminEscalateSsaDate%></font>&nbsp;</td><td>
 <font color="blue"><%=SecondSysAdminEscalateSsaRemarks%></font>
</td></tr><%} %>
<%if((ThirdSysAdminEscalateSssaName!=null)){ %>
<tr><td>
 <font color="blue"><%=ThirdSysAdminEscalateSssaName %></font></td><td>
<font color="blue" size="2"><%=ThirdSysAdminEscalateSssaDate%></font>&nbsp;</td><td>
<font color="blue"><%=ThirdSysAdminEscalateSssaRemarks%></font>
</td></tr><%} %>
<%if(FourthSysAdminEscalateItManagerName!=null){%>
<tr><td>
<font color="blue"><%=FourthSysAdminEscalateItManagerName%></font></td><td>
 <font color="blue" size="2"><%=FourthSysAdminEscalateItManagerDate%></font>&nbsp;</td><td>
 <font color="blue"><%=FourthSysAdminEscalateItManagerRemarks%></font>
</td></tr>
<%} %>
</table></td></tr>
<tr>
<td colspan="4">
<%-- COMMENTS&nbsp;&nbsp;<textarea readonly="readonly" rows="1" cols="150" id="com" onclick="Note2();"><%=admin_remarks%></textarea>
PREVIOUS SYSTEM ADMIN&nbsp;&nbsp;<textarea readonly="readonly" rows="1" cols="130" id="com" onclick="Note2();"><%=emp%></textarea> --%>
<%
System.out.println("NAAM :"+naam);
//System.out.println("Present Admin Extra Deisg is---------SSSA--------"+naam.length());
if(SystemAdminExtraDesigNew.equals("SA"))
{
	 System.out.println("Present Admin Extra Deisg is----------SA--------");
         if(departmentOfComplaint.equals("IT SUPPORT"))
         {
        	 
        	 System.out.println("----------SA----if ----"+departmentOfComplaint);
		     rs_id2 = st_id2.executeQuery("SELECT DISTINCT a.Locname,e.extraDesig,e.Nmail FROM assigned_master a INNER JOIN nentryho e ON(a.Locname=e.Nname) WHERE a.assignedLocation='"+cm_location+"' AND a.depart='"+departmentOfComplaint+"' AND e.extraDesig='SSA'");
         }
         else //OFFICE ADMINISTRATION & SOFTWARE DEVELOPMENT
         {
        	 
        	 System.out.println("----------SA-- else------"+departmentOfComplaint);
        	 rs_id2 = st_id2.executeQuery("SELECT DISTINCT a.Locname,e.extraDesig,e.Nmail FROM assigned_master a INNER JOIN nentryho e ON(a.Locname=e.Nname) WHERE a.depart='"+departmentOfComplaint+"' AND e.extraDesig='SSA'"); 
         }
		 while ( rs_id2.next() )
		 {    
		   naam = rs_id2.getString(1);
		   aawda = rs_id2.getString(2);
		   aawdaMail = rs_id2.getString(3);
		  System.out.println("naam :"+naam+"          aawda :"+aawda);
		 }
		 %>
			<font color="Red"> ESCALATED TO 2nd stage :&nbsp;&nbsp;<textarea readonly="readonly" name="" rows="1" cols="150" id="com" onclick="Note2();"><%=naam%></textarea></font>
		 <%
}
else if (SystemAdminExtraDesigNew.equals("SSA"))
{
	 System.out.println("Present Admin Extra Deisg is--------SSA-------");	
	 if(departmentOfComplaint.equals("IT SUPPORT"))
     {
	 //rs_id2 = st_id2.executeQuery("SELECT DISTINCT Nname,extraDesig,Nmail FROM nentryho WHERE extraDesig='SSA' AND department='"+departmentOfComplaint+"'");//PRASANNA SHETTY
	     rs_id2 = st_id2.executeQuery("SELECT DISTINCT a.Locname,e.extraDesig,e.Nmail FROM assigned_master a INNER JOIN nentryho e ON(a.Locname=e.Nname) WHERE a.assignedLocation='"+cm_location+"' AND a.depart='"+departmentOfComplaint+"' AND e.extraDesig='SSSA'");
     }
	 else //OFFICE ADMINISTRATION & SOFTWARE DEVELOPMENT
	 {
		// rs_id2 = st_id2.executeQuery("SELECT DISTINCT a.Locname,e.extraDesig,e.Nmail FROM assigned_master a INNER JOIN nentryho e ON(a.Locname=e.Nname) WHERE a.depart='"+departmentOfComplaint+"' AND e.extraDesig='SSSA'");
		 rs_id2 = st_id2.executeQuery("SELECT DISTINCT Nname,Npost,Nmail FROM formuser_master WHERE EMP_NO='"+emp_id+"'");
	 }
	 while ( rs_id2.next() )
	 {    
	   naam = rs_id2.getString(1);
	   aawda = rs_id2.getString(2);
	   aawdaMail = rs_id2.getString(3);
	  System.out.println("naam :"+naam+"          aawda :"+aawda);
	 }
	 System.out.println("NAAM--------666-------- "+naam +"     EMP _ID "+emp_id);
	// System.out.println("Present Admin Extra Deisg is---------SSA--------"+naam.length());
// 	if((naam.equals(null)) && (!reportingOff.equals("null")))
/* 	 	if(((naam.equals(null))) || (naam.equals("null")) || (naam!="null"))
	{
	 		
	 		 System.out.println("naam if :"+naam);
		 rs_idRO = st_idRO.executeQuery("SELECT DISTINCT Nname,Npost,Nmail FROM formuser_master WHERE EMP_NO='"+emp_id+"'");//IT MANAGER 
	 
	 while ( rs_idRO.next() )
	 {    
	   naam = rs_idRO.getString(1);
	   aawda = rs_idRO.getString(2);
	   aawdaMail = rs_idRO.getString(3);
	  System.out.println("naam :"+naam+"          aawda :"+aawda);
	 }	
	} */  
	 %>
		<font color="Red"> ESCALATED TO 3rd stage&nbsp;&nbsp;<textarea readonly="readonly" name="" rows="1" cols="150" id="com" onclick="Note2();"><%=naam%></textarea></font>
	 <%
}
//System.out.println("NAAM :"+naam);
else if ((SystemAdminExtraDesigNew.equals("SSSA")) || (naam.equals("null")))

{//	else if (naam.length() < '0')
	 System.out.println("Present Admin Extra Deisg is---------SSSA--------"+naam.length());
	 if((departmentOfComplaint.equals("IT SUPPORT")) || (departmentOfComplaint.equals("SOFTWARE DEVELOPMENT")))
     {
	 rs_id2 = st_id2.executeQuery("SELECT DISTINCT Nname,post FROM login WHERE post='SR.MANAGER IT'");//IT MANAGER
     }
	 else
	 {
		// rs_id2 = st_id2.executeQuery("SELECT DISTINCT Nname,post FROM login WHERE post='SR.MANAGER IT'");//IT MANAGER
		 rs_id2 = st_id2.executeQuery("SELECT DISTINCT Nname,Npost,Nmail FROM formuser_master WHERE EMP_NO='"+emp_id+"'");
	 }
	 while ( rs_id2.next() )
	 {    
	   naam = rs_id2.getString(1);
	   aawda = rs_id2.getString(2);
	   aawdaMail = rs_id2.getString(2);
	  System.out.println("naam :"+naam+"          aawda :"+aawda);
	 }
	 %>
	<font color="Red"> ESCALATE TO 4th stage&nbsp;&nbsp;<textarea readonly="readonly" name="" rows="1" cols="150" id="com" onclick="Note2();"><%=naam%></textarea></font>
	 <%
}
else{
	
 System.out.println("naam if :"+naam);
		 rs_idRO = st_idRO.executeQuery("SELECT DISTINCT Nname,Npost,Nmail FROM formuser_master WHERE EMP_NO='"+emp_id+"'");//IT MANAGER 
	 
	 while ( rs_idRO.next() )
	 {    
	   naam = rs_idRO.getString(1);
	   aawda = rs_idRO.getString(2);
	   aawdaMail = rs_idRO.getString(3);
	  System.out.println("naam :"+naam+"          aawda :"+aawda);
	 }	
	
}
%>
</td>
</tr>

<%-- <tr>
<td width="25" align="center" height="5" colspan="2"><center>6</center></td>

<td>&nbsp;CURRENT STATUS</td><td width="100"><select name="cm_status"  id="cm_status" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("csm_name")%> </option> 
					<%} %> </select></td>
</tr> --%>
<tr style="visibility: hidden;display: none;">
<td>
<input name="PreviousToEscalatedName" value="<%=emp%>" />
<input name="PreviousToEscalatedDesg" value="<%=desg%>" />
<input name="PreviousToEscalatedMail" value="<%=mail%>" />
<input name="PreviousToEscalatedRemarks" value="<%=cm_problem%>" />
<input name="PreviousToEscalatedDate" value="<%=po_date.format(new java.util.Date())%>" />

<input name="EscalatedToName" value="<%=naam%>" />
<input name="EscalatedToDesg" value="<%=aawda%>" />
<input name="EscalatedToMail" value="<%=aawdaMail%>" />
<input name="SystemAdminExtraDesigNew" value="<%=SystemAdminExtraDesigNew%>"/>

</td>

</tr>
<tr>

<td width="25" align="center" height="5" colspan="2"><center>6</center></td>

<td>&nbsp;REMARKS</td><td width="100"><textarea name="admin_remarks" id="admin_remarks" rows="2" cols="100" ></textarea> </td>
</tr>
</table>
  

<br />


<center>
<table align=center bgcolor="lightgrey">

   <tr> 
     
	<td style="size:1">
	<div id="formsubmitbutton"> 
	<input style="font-size:1" type="submit" value="SAVE/SEND" name="save1" id="save1" onclick="return (ValidateForm() && ButtonClicked());"/>
	</div>
	<div id="buttonreplacement" style="margin-left:30px; display:none;">
			<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
			</div> 
	</td><!--
	  <td style="size:1">&nbsp;&nbsp;<input style="font-size:1" type="submit" value="SAVE" name="save1" id="save1" onclick="return operate();"/></td>
      --><td style="size:1">&nbsp;&nbsp;<input style="size:1" type="reset"    value="RESET"/></td>   
     <%-- <td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="PRINT" onclick="window.location.href='jasper2.jsp'"/> </td>
     <td style="size:1"><input style="font-size:1" type="submit" value="SAVE" name="save" id="save" onclick="this.disabled=true;return true;"/></td>
      <td><input type=button value=printtt onclick="window.open('D:/P1.pdf'); return true;"/></td> --%>
      <%-- %><td><input type="button" value="PDF" name="print" id="print" disabled="disabled" onclick="link();"/></td>
       
       <td><input type="button" value="WORD" name="word" id="word" disabled="disabled" onclick="Word();"/></td> --%><!--
      <td><input type="button" value="PDF" name="print" onclick="link();"  id="print" disabled="disabled"/></td>
       
       <td><input type="button" value="WORD" name="word" onclick="Word();" id="word" disabled="disabled"/></td>
      
      --><td>&nbsp;&nbsp;<a href="csHelpPage.jsp" onclick="return popitup('csHelpPage.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
<!--      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="history.go(-1)"/> </td> -->
 <td style="font-size:1">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='AccessCardSelectAdmin.jsp?msg=1'"/> -->
     <input type="button" value="Cancel" onclick="cancel();" />
      </td>
      
 </tr>
 
</table>
<%}catch (Exception e) {
		 		 System.out.println(e);
			}
			finally{
				DbUtil.closeDBResources(rs,st,null);
				DbUtil.closeDBResources(rs1,st1,cn1);
				DbUtil.closeDBResources(rs10,st10,cn10);
				DbUtil.closeDBResources(rs_idRO,null,null);
				DbUtil.closeDBResources(rs_id,st_id,cn_id);
				DbUtil.closeDBResources(rs_id2,st_id2,cn_id2);

				}%>

</center>
	<br /><br /><br />
</div>
</form>	

</body>

</html>