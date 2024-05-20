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
            
    /*         
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
                                                              
            }  */
            

  function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
	if (window.focus) {newwindow.focus()}
	return false;
    }
</script>

 <script type="text/javascript">
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


	
<script type="text/javascript">
var currentdate = new Date(); 
var hour = currentdate.getHours()+":"+ currentdate.getMinutes() + ":" + currentdate.getSeconds();
hour = document.getElementById('hour1').value;
alert("time zone :"+hour);
</script>	


<script language="javascript" type="text/javascript">
    function fun(v)
        {
    	/*  var root_cause = document.getElementById("root_cause");
         var steps_taken = document.getElementById("steps_taken");    
         var CommentsTextArea = document.getElementById("admin_remarks"); */
         
       if (v=="ESCALATE") 
         {
    	 document.getElementById("root_cause").value="Escalated to HO";
    	 document.getElementById("steps_taken").value="Escalated to HO";
    	 document.getElementById("admin_remarks").value="Escalated to HO";
    	 
    	 document.getElementById("root_cause").readOnly = true;
    	 document.getElementById("steps_taken").readOnly = true;
    	 document.getElementById("admin_remarks").readOnly = true;
         }  
     else
    	 {
    	 document.getElementById("root_cause").value="";
         document.getElementById("steps_taken").value="";
         document.getElementById("admin_remarks").value="";   
         
         document.getElementById("root_cause").readOnly = false;
    	 document.getElementById("steps_taken").readOnly = false;
    	 document.getElementById("admin_remarks").readOnly = false;
    	 }
         
         
        }
    function ValidateForm() 
        {
    	//alert("hhh");
        var isValidForm = true;
        var errorMessages = "";
        var e = document.getElementById("cm_status");
        var root_cause = document.getElementById("root_cause");
        var steps_taken = document.getElementById("steps_taken");    
        var CommentsTextArea = document.getElementById("admin_remarks");
        var emp = document.getElementById("emp1");
        
        
        if (e.value == "") 
            {
            alert("Select Status....");
            e.focus();
            isValidForm = false;
            }
        else if (root_cause.value == "" && e.value!="ESCALATE") 
           {
           alert("Enter root cause.....");
           root_cause.focus();
           isValidForm = false;
           }    
        else if (steps_taken.value == "" && e.value!="ESCALATE") 
           {
           alert("Enter steps taken to the resolve.....");
           steps_taken.focus();
           isValidForm = false;
           }    
        else if (CommentsTextArea.value == "" && e.value!="ESCALATE") 
	       {
	       alert("Enter Problem in brief....");
	       CommentsTextArea.focus();
	       isValidForm = false;
	       } 
        else if (e.value=="ESCALATE") 
	        {
        	if (emp.value == "")
        	    {
		        alert("Select Escalate To...... ");
		        isValidForm = false;
		        } 
	        }
	   
	       return isValidForm;	
   }   
    
  
</script>        
</head>

<%!
	            Connection conn = null;
	            Statement st;
	            ResultSet rs;
	            String req;
	            Connection2 dbConn = new Connection2();
	            String cm_mail,cm_date,cm_time,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid,mail,admin_remarks,cm_status;
	            String city_no=null;
	            
	%>

<%
city_no =(String) session.getAttribute("b_no");
//System.out.println("city_no *********************  :"+city_no);
if(session==null)
    {
	response.sendRedirect("loginho.jsp?msg=1");
    }

String no=request.getParameter("complaint_no");
String req = request.getParameter(no);
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
   conn = con.getConnection2();
   st = conn.createStatement();
   rs = st.executeQuery("select cm_mail,cm_location,cm_name,cm_date,cm_time,cm_time2,idextend,complain_id,cm_type,cm_problem,desg,emp,cm_status,admin_remarks,transid,mail from complain_master_item where complain_id='"+req+"'");
   if(rs.next())
       {
       cm_date = rs.getString("cm_date");    
       cm_time = rs.getString("cm_time");
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
       conn.close();
       st.close();
       rs.close();
    %>
<body>
	<%!String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,SessionSuperAdmin=null,SessionMail=null; %>
	<% SessionName = (String) session.getAttribute("Nname");
	Sessiondesg = (String) session.getAttribute("desg");
	Sessioncity = (String) session.getAttribute("city");
	SessionMail = (String) session.getAttribute("Nmail"); %>
   
    <form method="post" action="complaint_resolve_Back.jsp"  name="form1">
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
       <label><font color="black"><u><b>COMPLAINT PAGE</b></u></font></label> <br />
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
		<div style="clear:both"></div>
		<div id="customer"></div>
        <div id="customer">
        <table id="meta" width="200">
	        <tr>
		        <td class="meta-head" width="100">Complain No.:</td>
                <td class="meta-head" width="100"><textarea id="idpordernon" name="complain_id"	readonly="readonly" ><%=complain_id %></textarea></td>
	        </tr>
	        <tr>
		       <td class="meta-head" width="100">Creation Date</td>
                   <%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
              <td class="meta-head" width="100"><textarea id="temp_date" name="cm_date2" readonly="readonly"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
              <td style="visibility: hidden; display: none"><input	type="hidden" name="idextend" value="<%=id%>" /></td>
            </tr>
        </table>
        </div>
        <br />
<%
Connection cn1 = null;
Statement st1 = null,stmtt=null; 
ResultSet rs1 = null,rst=null;
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select csm_name from current_status_master ORDER BY csm_name Asc");
%>
<table border="2" cellspacing="1" width="900">
   <tr>
      <td style="visibility: hidden; display: none"><input type="hidden" name="idextend" value="<%=id%>" /></td>
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
     <td width="25" align="center" height="5" colspan="2"><center>6</center></td>
     <td>&nbsp;CURRENT STATUS</td><td width="100">
          <select name="cm_status"  id="cm_status" style="font-size : 8pt" onchange=fun(this.value)>
  			 <option value="" >Select</option>
			 <option value="ESCALATE"> Escalate </option> 
			 <option value="Resolved"> Resolved </option> 
         </select>
     </td>
 </tr>
 <tr>
    <td width="25" align="center" height="5" colspan="2"><center>7</center></td>
    <td>&nbsp;ROOT CAUSE :</td><td width="100"><textarea name="root_cause" id="root_cause" rows="2" cols="100" ></textarea> </td>
  </tr>
  <tr>
    <td width="25" align="center" height="5" colspan="2"><center>8</center></td>
    <td>&nbsp;STEPS TAKEN TO RESOLVE THE ISSUE:</td><td width="100"><textarea name="steps_taken" id="steps_taken" rows="2" cols="100" ></textarea> </td>
  </tr>
  <tr>
    <td width="25" align="center" height="5" colspan="2"><center>9</center></td>
    <td>&nbsp;REMARKS BY ADMIN :</td><td width="100"><textarea name="admin_remarks" id="admin_remarks" rows="2" cols="100" ></textarea> </td>
  </tr>
  <tr>
     <td colspan="2">10</td>
     <td >ESCALATE TO(HO)</td>
     <td >
        <%try{
	         String l=null;
	         cn1 = con.getConnection2();
	         stmtt=cn1.createStatement();
	        
	         rst = stmtt.executeQuery("SELECT DISTINCT NEHo.Locname,SubQ.Locname FROM assigned_master NEHo LEFT JOIN"+
	        		 "(SELECT a.Locname,av.name FROM assigned_master a LEFT JOIN availability av ON(a.Locname=av.name) WHERE DATE(NOW()) between av.date1 AND av.date2) as subQ ON (NEHo.Locname=subQ.Locname) WHERE  NEHo.assignedLocation='Head Office' AND NEHo.depart='IT SUPPORT' AND SubQ.locname is null ORDER BY NEHo.Locname ASC");
	    %>
       <select name="emp1" id="emp1" style="width: 130px;" onchange="Mail2(this.value)">   
		      <option value="">Select</option>
	        <% while(rst.next())
	              {  
	        	  l=rst.getString("Locname");
	        	  System.out.println("Adminname :"+l);
	        	  if(!l.equals("PRASANNA KUMAR")){%>
	        	     <option value='<%=l%>'><%=l%></option>
	         <%}}
	        
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    }	
 %>
</select>
   
     
		     <label id="idMailLabel"></label>  
		     <input type="hidden" name="mail1" id="idMailValue" value="" />  
		     </br>

   
   
   
   
   </td>



</tr>




</table>
  

<br />


<center>
<table align=center bgcolor="lightgrey">

   <tr> 
     
	<td style="size:1">
	<div id="formsubmitbutton"> 
	<input style="font-size:1" type="submit" value="SAVE/SEND" name="save1" id="save1" onclick="return ValidateForm();"/>
	</div>
	<div id="buttonreplacement" style="margin-left:30px; display:none;">
			<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
			</div> 
	</td>
	<td style="size:1">&nbsp;&nbsp;<input style="size:1" type="reset"    value="RESET"/></td>   
<td>&nbsp;&nbsp;<a href="PurchaseSingleHelpPage.jsp" onclick="return popitup('PurchaseSingleHelpPage.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
<!--      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="history.go(-1)"/> </td> -->
 <td style="font-size:1">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='AccessCardSelectAdmin.jsp?msg=1'"/> -->
     <input type="button" value="Cancel" onclick="cancel();" />
      </td>
      
 </tr>
 
</table>


</center>
	<br /><br /><br />
</div>
</form>	

</body>

</html>