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
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>MATERIAL REQUISITION</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<link rel='stylesheet' type='text/css' href='css/Otherstyle.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<script language="javascript"   type="text/javascript" src="js/ValidationForComplainPage.js"></script>
	<script language="javascript"   type="text/javascript" src="js/SelectionComplain.js"></script>

		
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
    

       function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
	
       function  get_v2( tot_val )
       {
        document.getElementById('idpordernon').value = tot_val;
        }		 
		
</script>

		<script  type="text/javascript">

<% String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
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
//var vat = document.getElementById("hour").value;
alert("time zone :"+hour);

</script>	


<script language="javascript" type="text/javascript">
function load()
{
alert("Page is loaded");
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
	      ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	  	String userName = dbProperties.getString("csdb.username");
	  	String password = dbProperties.getString("csdb.password");
	  	String url = dbProperties.getString("csdb.url");
	  	String driver = dbProperties.getString("csdb.driverName");
	  	String dbName = dbProperties.getString("csdb.dbName");
	%>


     <%
                  transId = "abc"+String.valueOf(Math.random());
     
     		   logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		  System.out.println("Branch nameeee Mrho  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<body onload="start()" onunload="stop()">



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!-- <form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');"> -->
<form method="post" action="complainPageBack.jsp" onsubmit="return ValidateForm();" name="form1" >


 <br />
		
	
<input type="hidden" name="transid" value="<%=transId%>" />
		
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
                    rs_id = st_id.executeQuery("SELECT max(idextend) from complain_master_item where complain_id like 'NEIN/CM/10-%'");
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
                    		 new_id = "NEIN/CM/10-1";
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
			//	System.out.println("Duration: " + timeFormat.format(timeDiff));
             //  System.out.println("second version"+timeFormat);
               %>
		<div style="clear:both"></div>
		
		<div id="customer">


		
		</div>

<div id="customer">


<table id="meta" width="200">
	<tr>
		<td class="meta-head" width="100">Complain No.:</td>


		<td class="meta-head" width="100"><textarea id="idpordernon" name="complain_id"
			readonly="readonly" >NEIN/CM/10-<%= new_id %></textarea></td>
	</tr>
	<tr>
		<td class="meta-head" width="100">Creation Date</td>


		<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<td class="meta-head" width="100"><textarea id="temp_date" name="cm_date" readonly="readonly"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
		<td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
</tr>

<%-- <tr><td class="meta-head" width="100">Time:</td><td class="meta-head" width="100"><textarea id="temp_date" name="cm_time" readonly="readonly"> <%=timeFormat.format(timeDiff)%> </textarea> </td></tr> --%>
<tr><td class="meta-head" width="100">Time:</td><td class="meta-head" width="100"><textarea id="temp_date" name="cm_time" readonly="readonly"></textarea> </td></tr>


</table></div>

<br />
   <%
   String tot_val="";
Connection cn1 = null;
Statement st1 = null; 
ResultSet rs1 = null;
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name from branch_master ORDER BY b_name Asc");



Connection cn2 = null;
Statement st2= null; 
ResultSet rs2 = null;
cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select p_type from prob_master ORDER BY p_type Asc");
%>
<table border="2" cellspacing="1" width="900">

<tr><td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
			
<td width="25" align="center" height="5" colspan="2"><center>1</center></td>

<td >&nbsp;USER NAME </td><td width="443"><input type ="text" name = "cm_name"  id = "cm_name" value ="" size="40" /></td>
</tr>
 <tr>
<td width="25" align="center" height="5" colspan="2"><center>2</center></td>

<td>&nbsp;LOCATION</td><td width="100"><select name="cm_location"  id="cm_location" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					
					<option ><%=rs1.getString("b_name")%> </option>
					<%} %> </select></td>
</tr>
<tr>
<td width="25" align="center" height="5" colspan="2"><center>3</center></td>

<td>&nbsp;TYPE OF PROBLEM</td><td width="100">
<select name="cm_type"  id="cm_type" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs2.next()){ %>
				   <option> <%=rs2.getString("p_type")%> </option> 
					
					
										         
					<%} %> </select></td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>4</center></td>

<td>&nbsp;REPORT PROBLEM</td><td width="100"><textarea name="cm_problem" id="cm_problem" rows="2" cols="100"></textarea> </td>
</tr>
</table>
  

	 <br />
		<label>SEND TO: </label>
		<br />
		
			
				
		<table width="767" border="1" cellspacing="0" cellpadding="0">  
<% 
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
cn5 = con.getConnection2();
st5 = cn5.createStatement();

%>

   
                                    
                                    
                       <select name="desg" onchange="showEmp(this.value)" style="width: 130px;" id="desg">      
                       <option value="none">-----Select-----</option>
                          
                          <% Class.forName(driver).newInstance();
                          cn5 = DriverManager.getConnection(url+dbName,userName,password);                            st5 = cn5.createStatement();  
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

<br />


<center>
<table align=center bgcolor="lightgrey">

   <tr> 
      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='HOME.jsp'"/> </td>
	<td style="size:1"><input style="font-size:1 ;color: blue;"  type="submit" value="SEND" name="save1" id="save1" onclick="return ValidateForm();"/></td><!--
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
</div>
</form>	

</body>

</html>