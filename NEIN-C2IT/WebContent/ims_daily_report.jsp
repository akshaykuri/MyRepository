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
<%@page import="java.util.ResourceBundle"%>

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>MATERIAL REQUISITION</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	

	
	
	


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

        if (document.getElementById("cm_name").value == "") {
            //document.getElementById("FirstNameError").innerHTML = alert("- First name is required.");
            alert("Name is required");
            isValidForm = false;
        }
        
        
        var e = document.getElementById("cm_location");
        //var strSel = "The Value is: " + e.options[e.selectedIndex].value + " and text is: " + e.options[e.selectedIndex].text;
        if (e.options[e.selectedIndex].text == "--Select--") {
            //document.getElementById("ComfortLevelError").innerHTML = "- Comfort Level is required.";
            alert("Select Location");
            isValidForm = false;
        }
        var f = document.getElementById("cm_type");
        if (f.options[f.selectedIndex].text == "--Select--") {
            alert("Select Type Of Problem");
            isValidForm = false;
        }
        
     /*    if (document.getElementById("cm_problem").value == "") {
            //document.getElementById("FirstNameError").innerHTML = alert("- First name is required.");
            alert("Enter Problem in brief");
            isValidForm = false; */
            
       var CommentsTextArea = document.getElementById("cm_problem");
            if (CommentsTextArea.value == "") {
              alert("Enter Problem in brief");
                isValidForm = false;
            }    
        
        var g = document.getElementById("desg");
        //var strSel = "The Value is: " + e.options[e.selectedIndex].value + " and text is: " + e.options[e.selectedIndex].text;
        if (g.options[g.selectedIndex].text == "-----Select-----") {
            alert("Select Desination");
            isValidForm = false;
        }
        
        var h = document.getElementById("emp");
        if (h.options[h.selectedIndex].text == "--Select--") {
            alert("Select Employee");
            isValidForm = false;
        }
        
        return isValidForm;
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
	      String transId = null,req,req2;       
	      String idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_time,cm_time2,cm_time_diff,cm_status,admin_remarks;
	%>



     <%
                
                   conn = con.getConnection2();
                   st = conn.createStatement();
                   rs = st.executeQuery("select * from complain_master where cm_name='"+req+"'");
                   req = request.getParameter("aabbcc");
                   System.out.println("Request payload: "+ req);
                   
                   req2 = request.getParameter("txtCalendar");
                   System.out.println("Request payload: "+ req2);
                    
                    String[] dateString = req2.split("-");
                    
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
                    
                    String dateF = dateString[2]+"/"+dateString[1]+"/"+dateString[0];
                   
                   while(rs.next()){
                	   
                	   complain_id = rs.getString("complain_id");
                	   desg = rs.getString("desg");
                	   emp = rs.getString("emp");
                	    cm_name = rs.getString("cm_name");
                	    cm_location = rs.getString("cm_location");
                	    cm_date = rs.getString("cm_date");
                	    cm_time = rs.getString("cm_time");
                	    cm_time2 = rs.getString("cm_time2");
                	    cm_time_diff = rs.getString("cm_time_diff");
                	    cm_status = rs.getString("cm_status");
                	    
                	      transid = rs.getString("transid");
                	      
                   }
               transId = "abc"+String.valueOf(Math.random());
     
     		   logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		  System.out.println("NAME::::real one "+realname);
     		 System.out.println("NAME::::login name "+logInName);
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		  System.out.println("Branch nameeee Mrho  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<body>



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!-- <form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');"> -->
<form method="post" action="complainPageBack.jsp" onsubmit="return ValidateForm();" name="form1">


 <br />
		
	
<input type="hidden" name="transid" value="<%=transId%>" />
		
	 <br />
		

<center>
   <table width="1200"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<b><center><label>
		NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> </center>
		</b></font></td>
	</tr>
</table>
<br />






		<%
                     
                    String new_id = null;
                    int id=0;
                    Connection cn_id = null; 
                    Statement st_id = null; 
                    ResultSet rs_id = null; 
                    Connection cn5 = null; 
                    Statement st5 = null; 
                    ResultSet rs5 = null; 
                    Connection cn2 = null;
                    Statement st2= null; 
                    ResultSet rs2 = null;
                    Connection cn1 = null;
                    Statement st1 = null; 
                    ResultSet rs1 = null;
                    
                    try{
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    rs_id = st_id.executeQuery("SELECT max(id) from complain_master where complain_id like 'NEIN/CM-%'");
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
	
	<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>


<br />
   <%

cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name from branch_master ORDER BY b_name Asc");

cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select p_type from prob_master ORDER BY p_type Asc");
%>
<table border="1" cellspacing="1" width="1200">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">IMS DAILY WORK LOG</font></b></center></td></tr>
<tr><td colspan="4" width="750" align="left">COMPLAIN NUMBER:<textarea id="idpordernon" name="complain_id" rows="1" cols="15" readonly="readonly" >NEIN/CM-<%= new_id %></textarea></td>
<td class="meta-head" width="150" align="left">DATE:<textarea id="temp_date" name="cm_date" readonly="readonly" rows="1" cols="15"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
</tr>
<tr>
<td colspan="4" align="left">SYSTEM ADMINISTRATOR NAME:<textarea rows="1" cols="25" readonly="readonly" name="ims_admin_name"><%=realname%></textarea> </td>
<td class="meta-head" width="100" align="left">Time IN : <textarea id="" name="" rows="1" cols="10"></textarea></td>


</tr>
<tr>
<td colspan="4" align="left">Location Name :<textarea rows="1" cols="15	" readonly="readonly" name="ims_admin_city"><%=city%></textarea></td>
<td class="meta-head" width="100" align="left">Time OUT : <textarea id="" name="" rows="1" cols="10"></textarea></td>


</tr>
<%-- <tr><td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
			
<td width="25" align="center" height="5" colspan="2"><center>1</center></td>

<td >&nbsp;USER NAME </td><td width="443"><input type ="text" name = "cm_name"  id = "cm_name" value ="" size="40" /></td>
</tr>
 <tr>
<td width="25" align="center" height="5" colspan="2"><center>2</center></td>

<td>&nbsp;LOCATION</td><td width="100"><select name="cm_location"  id="cm_location" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("b_name")%> </option> 
					<%} %> </select></td>
</tr>
<tr>
<td width="25" align="center" height="5" colspan="2"><center>3</center></td>

<td>&nbsp;TYPE OF PROBLEM</td><td width="100"><select name="cm_type"  id="cm_type" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs2.next()){ %>
					<option> <%=rs2.getString("p_type")%> </option> 
					<%} %> </select></td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>4</center></td>

<td>&nbsp;REPORT PROBLEM</td><td width="100"><textarea name="cm_problem" id="cm_problem" rows="2" cols="100"></textarea> </td>
</tr> --%>
</table>



	<table class="dynatable" width="1200" border="1" style="height: 150;" cellspacing="0" cellpadding="0" >
				<tr>
				    
					<td width="" align="center"  height="21" >Sl No</td>
					<td width="67" align="center"  height="21" >Complain ID </td>	
					<td width="67" align="center"  height="21" >User Name </td>	
					<td width="67" align="center"  height="21" >Module</td>				
					<td width="67" align="center"  height="21" >Problem Description</td>
					<td width="67" align="center"  height="21" >Report Time</td>
					<td width="67" align="center"  height="21" >Completed Time</td>
					<td width="67" align="center"  height="21" >Total Duration</td>
					<td width="67" align="center"  height="21" >Current status</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr>
				    
				    <%
				            int i=0;
				            conn = con.getConnection2();
				            st = conn.createStatement();
				            rs = st.executeQuery("select * from complain_master where substr(complain_id,9,2)='"+req.substring(req.length()-2,req.length())+"'  and cm_date = '"+dateF+"' AND status = 'normal' ORDER BY YEAR(cm_date),MONTH(cm_date),DATE(cm_date)");
				            while(rs.next()){
				            		   
				            	complain_id = rs.getString("complain_id");
			                	   desg = rs.getString("desg");
			                	   emp = rs.getString("emp");
			                	    cm_name = rs.getString("cm_name");
			                	    cm_location = rs.getString("cm_location");
			                	    cm_date = rs.getString("cm_date");
			                	    admin_remarks = rs.getString("admin_remarks");
			                	    cm_problem = rs.getString("cm_problem");
			                	    cm_status = rs.getString("cm_status");
				            	        i++;
				           
				            	      
				            	       
				            	        String itemN = "iditemName";
				            %>
				            
				            <script>
				                    
				                     id++;
				                     
				            </script>
				            
				                 
				     <tr>
				  
				     
				     <%-- %><td width="7" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>--%>
				 
				    <td width="" align="center"  height="21" ><textarea rows="1" cols="2" name="id[]" class="id" readonly="readonly" ><%=i%></textarea></td>
				    <td width="67" align="center"  height="21" ><textarea rows="1" cols="20" readonly="readonly" ><%=complain_id%></textarea></td>
					<td><textarea  name="" id="<%=itemN+i%>"  rows="1" cols="30" readonly="readonly"   ><%=cm_name %></textarea></td>
	                <td width="67" align="center"  height="21" ><textarea rows="1" cols="10" readonly="readonly" ><%=cm_location%></textarea></td>
					<td width="67" align="center"  height="21" ><textarea rows="1" cols="38" readonly="readonly"  class="incQuantity"><%=cm_problem%></textarea></td>
					<td width="67" align="center"  height="21" ><textarea rows="1" cols="15" readonly="readonly" ><%=cm_time %></textarea></td>
					<td width="67" align="center"  height="21" ><textarea rows="1" cols="15" readonly="readonly" ><%=cm_time2 %></textarea></td>
					<td width="67" align="center"  height="21" ><textarea rows="1" cols="15" readonly="readonly" class="incTotal"><%=cm_time_diff %></textarea></td>
					<td width="67" align="center"  height="21" ><textarea rows="1" cols="15" readonly="readonly" ><%=cm_status %></textarea></td>
					<td width="67" align="center"  height="21" ><textarea rows="1" cols="38" readonly="readonly" ><%=admin_remarks %></textarea></td>
					</tr>
				        
				            
				            <%         
				            	        
				            }
				    %>
				   
			
               
	 
		</table>

	 <br />
		<label>SEND TO: </label>
		<br />
		
			
				
		<table width="767" border="1" cellspacing="0" cellpadding="0">  
<% 

cn5 = con.getConnection2();
st5 = cn5.createStatement();
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
%>

   
                                    
                                    
                       <select name="desg" onchange="showEmp(this.value)" style="width: 130px;" id="desg">      
                       <option value="none">-----Select-----</option>
                          
                          <% Class.forName(driver).newInstance();
                          cn5 = DriverManager.getConnection(url+dbName,userName,password); 
                               st5 = cn5.createStatement();  
                           rs5 = st5.executeQuery("Select * from desg");
                          while(rs5.next()){     %>     
                          
                           <option value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>     
                                        <br>    
                                            <div id='emp'>      
                                              <select name="emp" style="width: 130px;">   
                                                   <option value='-1' style="width: 130px;">--Select--</option>  
                                                         </select>     
                                                            </div>    
                                                            
                                                            
                                                               
  <label id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" />                               
</table>
</center>
<br />

	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,conn);

	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs5,st5,cn5);
	DbUtil.closeDBResources(rs_id,st_id,cn_id);
  }
	%>
<center>
<table align=center bgcolor="lightgrey">

   <tr> 
      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='HOME.jsp'"/> </td>
	<td style="size:1"><input style="font-size:1" type="submit" value="SEND" name="save1" id="save1"/></td><!--
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
    
      
 </tr>
 
</table>


</center>
	<br /><br /><br />

</form>	

</body>

</html>