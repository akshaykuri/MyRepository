<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	<title>MATERIAL REQUISITION</title>
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

		<script  type="text/javascript">

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
 String req;
  req = request.getParameter("aabbcc");
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
                   rs = st.executeQuery("select cm_mail,cm_location,cm_name,cm_date,cm_time,cm_time2,idextend,complain_id,cm_type,cm_problem,desg,emp,cm_status,admin_remarks,transid,mail from complain_master_item where complain_id='"+req+"'");
                   
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
                	      
                   }
                	  //  else{
                	    	//msg = "...'"+req+"' IS ALREADY APPENDED.......";
                	   // 	}
                   System.out.println("transid after appended: "+transid);
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



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!-- <form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');"> -->
<form method="post" action="complainPageAdminBranchBack.jsp" onsubmit="return ValidateForm();" name="form1">


 <br />
		
	
<input type="hidden" name="transid" value="<%=transid%>" />
<input type="hidden" name="desg" value="<%=desg%>" />
<input type="hidden" name="emp" value="<%=emp%>" />	
<input type="hidden" name="mail" value="<%=mail%>" />	
<input type="hidden" name="cm_mail" value="<%=cm_mail%>" />	
	
<input type="hidden" name="city_no" value="<%=city_no%>" />	
	 <br />
		
<div id="leftfeature"><input type="button" value="BACK" onclick="window.location.href='complainDateWise.jsp?msg=1'"/></div>
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
<label><font color="black"><u><b>COMPLAIN PAGE</b></u></font></label> <br />


</center>
	 <br />


  


		<%
                     
                    String new_id = null;
                    int id=0;
                    Connection cn_id = null; 
                    Statement st_id = null; 
                    ResultSet rs_id = null; 
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    rs_id = st_id.executeQuery("SELECT max(id) from complain_master_item where complain_id like 'NEIN/CM-%'");
                    while ( rs_id.next() )
                    {    
                    	
                    	
                    	try
                    	{
                    		id=rs_id.getInt(1);
                                 id++;     
                    			System.out.println("Gen id "  +rs_id);
                    			new_id = "" +String.valueOf(id);
                    	}
                    	catch(SQLException ex)
                    	{
                    		  System.out.println(ex.toString());
                    		 new_id = "NEIN/CM-1";
                    	    }

                    }
                                   
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
   <%

Connection cn1 = null;
Statement st1 = null; 
ResultSet rs1 = null;
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select csm_name from current_status_master ORDER BY csm_name Asc");
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

<td>&nbsp;TYPE OF PROBLEM</td><td width="100"><input type ="text" name = "cm_location"  id = "cm_location" value ="<%=cm_type%>" size="40" readonly="readonly"/></td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>4</center></td>

<td>&nbsp;REPORT PROBLEM</td><td width="100"><textarea name="cm_problem" id="cm_problem" rows="2" cols="100" readonly="readonly"><%=cm_problem%></textarea> </td>
</tr>
<tr>
<td width="25" align="center" height="5" colspan="2"><center>5</center></td>

<td>&nbsp;REPORT DATED</td><td width="100"><textarea  rows="1" cols="30" readonly="readonly"><%=cm_time%></textarea> </td>
</tr>
<tr>
<td colspan="4">
<label><u><b>ADMINISTRATOR:</b></u></label>
</td>
</tr>
<tr>
<td colspan="4">

<label> <font color="Grey">Previous Comments:</font></label><br />
STATUS&nbsp;&nbsp;<textarea readonly="readonly" rows="1" cols="25" id="sta" onclick="Note();" style="background-color: lightgray;"><%=cm_status%></textarea><br />
COMMENTS&nbsp;&nbsp;<textarea readonly="readonly" rows="1" cols="150" id="com" onclick="Note2();"><%=admin_remarks%></textarea>

</td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>6</center></td>

<td>&nbsp;CURRENT STATUS</td><td width="100"><select name="cm_status"  id="cm_status" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("csm_name")%> </option> 
					<%} %> </select></td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>7</center></td>

<td>&nbsp;REPORT PROBLEM</td><td width="100"><textarea name="admin_remarks" id="admin_remarks" rows="2" cols="100" ></textarea> </td>
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
      
      --><td>&nbsp;&nbsp;<a href="PurchaseSingleHelpPage.jsp" onclick="return popitup('PurchaseSingleHelpPage.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
     <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="history.go(-1)"/> </td>
      
 </tr>
 
</table>


</center>
	<br /><br /><br />
</div>
</form>	

</body>

</html>