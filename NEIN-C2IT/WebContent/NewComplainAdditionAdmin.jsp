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
	<title>MATERIAL REQUISITION</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<link rel='stylesheet' type='text/css' href='css/Otherstyle.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
<!-- 	<script language="javascript"   type="text/javascript" src="js/ValidationForComplainAdminPage.js"></script> -->
	<script language="javascript"   type="text/javascript" src="js/SelectionComplain.js"></script>
    <script language="javascript"   type="text/javascript" src="js/datevalidateComplain.js"></script>
	
	
	


<%
if(session==null)
{
	response.sendRedirect("loginho.jsp?msg=1");
}
%>
		
	
	
	
  <script language="javascript" type="text/javascript">     
    function btnClick()
    {
    	close();
    }

</script>

		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
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
	


<script language="javascript" type="text/javascript">
function checkAddress(str){
    var re = /[^[a-z][A-Z][0-9]]/g;
    if (re.test(str)) return false;
    return true;
  }
    function ValidateForm() {
    	
    var cn=document.form1.cm_name;
    var cl=document.form1.cm_location;
   var ctt=document.form1.cm_type;
    var cp=document.form1.cm_problem;
    var cs=document.form1.cm_status;
   var ct1 = document.form1.cm_time;

  if ((cn.value==null)||(cn.value=="")){
    		alert("Enter Your Name");
    		cn.focus();
    		return false;
    		}
  if (checkAddress(cn.value)==false){
    	cn.value="";
    	alert("Invalid Name!");
    	cn.focus();
    	return false;
    	}

 if ((cl.value=="")||(cl.value.length==1)){
	 

    alert("Select Location");
    cl.focus();
    return false;
    }

	 if ((ctt.value==null)||(ctt.value=="")||(ctt.value==0)||(ctt.value=="0")){
		 // alert("length of blaaa "+ctt.value.length);
		    alert("Please Select Type Of Problem!");
		    ctt.focus();
		    return false;
		    }
		    if (checkAddress(ctt.value)==false){
		    ctt.value="";
		    alert("Invalid Problem!");
		    ctt.focus();
		    return false;
		    }
     if ((cp.value==null)||(cp.value=="")){
        alert("Enter Problem Details");
        cp.focus();
        return false;
        }
    
   if ((cs.value==null)||(cs.value=="")){
        alert("Select Status");
        cs.focus();
        return false;
        }
   if ((ct1.value==null)||(ct1.value=="")||(ct1.value.length==1)){
	  
   
        alert("Select From Date");
        ct1.focus();
        return false;
        }
 
    
    else
    return true;

     
    }


</script>        
	
	<script language="JavaScript" src="ts_picker.js">

//Script by Denis Gritcyuk: tspicker@yahoo.com
//Submitted to JavaScript Kit (http://javascriptkit.com)
//Visit http://javascriptkit.com for this script

</script>	
		
		
		
</head>
<%
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute("city")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("adminbom.jsp?msg="+msgg);
}
%>
<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null,locationNO=null;
	              
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
     		  locationNO = session.getAttribute("b_no");
     		  
     		  System.out.println("Branch nameeee Mrho  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<body onload="start()" onunload="stop()">



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!-- <form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');"> -->
<form method="post" action="NewComplainAdditionBack.jsp" name="form1" >


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
                    Connection cn3 = null;
                    Statement st3 = null; 
                    ResultSet rs3 = null;
                    Connection cn2 = null;
                    Statement st2= null; 
                    ResultSet rs2 = null;
                    Connection cn1 = null;
                    Statement st1 = null; 
                    ResultSet rs1 = null;
                    try{
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    rs_id = st_id.executeQuery("SELECT max(idextend) from complain_master_item where complain_id like 'NEIN/CM%'");
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
		<td class="meta-head" width="100">Creation Date</td>


		<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<td class="meta-head" width="100"><textarea id="temp_date" name="cm_date" readonly="readonly"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
		
</tr>


</table></div>


<table border="2" cellspacing="1" width="900">



<%-- <tr><td class="meta-head" width="100">Time:</td><td class="meta-head" width="100"><textarea id="temp_date" name="cm_time" readonly="readonly"> <%=timeFormat.format(timeDiff)%> </textarea> </td></tr> --%>




   <%
   java.text.DateFormat po_datecompare = new SimpleDateFormat("d-M-yyyy");
   String f = po_datecompare.format(new java.util.Date());
   System.out.println("Present date : "+f);
  

cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name from branch_master ORDER BY b_name Asc");

cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select p_type from prob_master ORDER BY p_type Asc");
%>
   <%


cn3 = con.getConnection2();
st3=cn3.createStatement();
rs3 = st3.executeQuery("select csm_name from current_status_master ORDER BY csm_name Asc");
%>
<tr>


		
<td width="25" align="center" height="5" colspan="2"><center>1</center>
<input type="hidden" name="compare" value="<%=f%>"/></td>

<td >&nbsp;COMPLAIN NO. </td><td class="meta-head" width="100"><textarea id="idpordernon" name="complain_id"
			readonly="readonly" >NEIN/CM-<%= new_id %></textarea></td>
</tr>
<tr><td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
			
<td width="25" align="center" height="5" colspan="2"><center>2</center></td>

<td >&nbsp;USER NAME </td><td width="443"><input type ="text" name = "cm_name" maxlength="49" id = "cm_name" value ="" size="40" />
<input type="hidden" name="emp" value="<%=realname%>"/>
<input type="hidden" name="desg" value="<%=desg%>"/>
<input type="hidden" name="mail"  value="<%=Initiator%>"/>
<input type="hidden" name="e_LocationNo" value="<%=locationNO%>"/>

</td>
</tr>
 <tr>
<td width="25" align="center" height="5" colspan="2"><center>3</center></td>

<td>&nbsp;LOCATION</td><td width="100"><select name="cm_location"  id="cm_location" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("b_name")%> </option> 
					<%} %> </select></td>
</tr>
<tr>
<td width="25" align="center" height="5" colspan="2"><center>4</center></td>

<td>&nbsp;TYPE OF PROBLEM</td><td width="100"><select name="cm_type"  id="cm_type" style="font-size : 8pt">
					<option value="0" style="background: lightgrey;" >--Select--</option>
					<%while(rs2.next()){ %>
					<option> <%=rs2.getString("p_type")%> </option> 
					<%} %> </select></td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>5</center></td>

<td>&nbsp;REPORT PROBLEM</td><td width="100"><textarea name="cm_problem" id="cm_problem" rows="2" cols="100" maxlength="199" onclick="this.style.height='60px';" onblur="this.style.height='';"></textarea> </td>
</tr>


<tr>
<td width="25" align="center" height="5" colspan="2"><center>6</center></td>

<td>&nbsp;CURRENT STATUS</td><td width="100">

<%-- <select name="cm_status"  id="cm_status" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs3.next()){ %>
					<option> <%=rs3.getString("csm_name")%> </option> 
					<%} %> </select> --%>
	<input name="cm_status"  id="cm_status" value="Pending" readonly="readonly" />				
					
					</td>
</tr>

<tr>
<td width="25" align="center" height="5" colspan="2"><center>7</center></td>

<td>&nbsp;REPORTED TIME</td><td width="100"><input type="text" name="cm_time" value="" id="idFromDate" readonly="readonly"/>
<a href="javascript:show_calendar('document.form1.cm_time', document.form1.cm_time.value);"><img src="cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>
 </td>
</tr>

<!-- <tr style="display: none;">
<td width="25" align="center" height="5" colspan="2"><center>8</center></td>

<td>&nbsp;RESOLVED TIME</td><td width="100"><input type="text" name="cm_time2" value="" id="idToDate" readonly="readonly"/>
<a href="javascript:show_calendar('document.form1.cm_time2', document.form1.cm_time2.value);"><img src="cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a>
</td>
</tr> -->


</table>
 <%

                    } catch (SQLException ex) {
                        // Exception handling stuff
                            ex.printStackTrace();
                    } finally {
                    	DbUtil.closeDBResources(null,null,conn);
                    	DbUtil.closeDBResources(rs1,st1,cn1 );
                    	DbUtil.closeDBResources(rs2,st2,cn2 );
                    	DbUtil.closeDBResources(rs3,st3,cn3 );
                    	DbUtil.closeDBResources(rs_id,st_id,cn_id );
                    }
%> 
<br />


<center>
<table align=center bgcolor="lightgrey">

   <tr> 
<td style="size:1"><input style="font-size:1" type="button" value="CANCEL" onclick="history.go(-1)" /></td>
	<td style="size:1"><input style="font-size:1 ;color: blue;"  type="submit" value="SAVE" name="save1" id="save1" onclick="return ValidateForm();"/></td><!--
	  <td style="size:1">&nbsp;&nbsp;<input style="font-size:1" type="submit" value="SAVE" name="save1" id="save1" onclick="return operate();"/></td>
      --><td style="size:1">&nbsp;&nbsp;<input style="size:1" type="reset"    value="RESET"/></td>   
   
      
     <td>&nbsp;&nbsp;<a href="PurchaseSingleHelpPage.jsp" onclick="return popitup('PurchaseSingleHelpPage.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
    
      
 </tr>
 
</table>


</center>
	<br /><br /><br />
</div>
</form>	

</body>

</html>