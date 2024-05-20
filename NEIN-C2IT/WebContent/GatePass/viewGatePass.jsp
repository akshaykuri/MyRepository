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
<%@ include file="../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>GATEPASS Form</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
  


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






 <script language="javascript" type="text/javascript">
	 
   function validate()
   {//txtmail_msg
   var d1 = document.form.txtmail_msg;
   var d2 = document.form.mail1;
   var ff=document.form.aabbcc;
   if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	   {
       alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
       document.getElementsByName("mmdradio")[0].focus();
       return false;
       } 
  if (document.getElementsByName("mmdradio")[0].checked)
	 {
	  if (!document.getElementsByName("higherAuthority")[0].checked ) 
	  		{  
		    alert("Select Radio Button For send Higher Authority ..");
		    document.getElementsByName("higherAuthority")[0].focus();
      		return false;
	  		}
	  }
  //alert("D2c :"+d2.value);
  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[0].checked && d2.value=="")
	 {
	        alert("Select next approver....");
	       // d2.focus();
   		    return false;
	  }
  if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	{
	 alert("Enter Remarks !");
	         d1.focus();
	 return false;
	 }
else
return true;
   }
</script>

<script type="text/javascript">
function OtherAdmin()
    {
    //document.form.action="DomainUserAdminBack.jsp";
    document.form.action="NExASformApproval1Back.jsp";
    document.form.method="post";
    document.form.submit();
    }
</script>
<script type="text/javascript">
function showTR()
	{
	var status = document.getElementById('idstatus').value;
	//alert("status is  "+status);
	if (status!="true")
	    {
	    alert("you are not authorized person");
	    return false;
	    }
	else
	    {
	    //alert("Send to Higher Authority");
		document.getElementById('idApproved').style.display="table-row";
	   	document.getElementById('idApproved').style.visibility="visible";
	 	document.getElementById('idPwd').style.display="table-row";
		document.getElementById('idPwd').style.visibility="visible";
		return true;
	    }
	}
function hideTR()
    {
    var status = document.getElementById('idstatus').value;
   //alert("status is  "+status);
   if (status!="true")
      {
      alert("you are not authorized person");
      return false;
      }
   else
      {
      document.getElementById('idApproved').style.hidden="table-row";
      document.getElementById('idApproved').style.visibility="hidden";
      document.getElementById('idApproved1').style.hidden="table-row";
      document.getElementById('idApproved1').style.visibility="hidden";
      document.getElementById('idApprovedd').style.hidden="table-row";
      document.getElementById('idApprovedd').style.visibility="hidden";
      return true;
      }
   }

function hideHigherTR()
   {
   document.getElementById('idApprovedd').style.display="table-row";
   document.getElementById('idApprovedd').style.visibility="visible";
   //alert("Select Designation And Name");
   }
 function showHigherTR()
   {
   document.getElementById('idApprovedd').style.display="table-row";
   document.getElementById('idApprovedd').style.display="none";
   alert("Mail Will Be Sent To IT (Head Office)");
   }

 function sync(val)
 {
 //alert(val);
 var parts = val.split(",");
 var part1 = parts[0]; 
 var part2 = parts[1]; 
 var part3 = parts[2]; 
 var part4 = parts[3];  
 var part5 = parts[4]; 
 if(val!="")
	  {
 	  document.getElementById("idrodesg").value=part3;
     document.getElementById("idroname").value=part2;
     document.getElementById("idromail").value=part4;
     document.getElementById("idempid1").value=part1;
     document.getElementById("idlevelno").value=part5;
	  }
 else
	  {
	  document.getElementById("idrodesg").value="";
     document.getElementById("idroname").value="";
     document.getElementById("idromail").value="";
     document.getElementById("idempid1").value="";
     document.getElementById("idlevelno").value="";
	  }
}



</script>




<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
	
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("adminlink.jsp?msg="+msg);
}
%>
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
	
 
</head>
<body>

<form  name="form" method="post"  >
<%!
String brcontact="",createdBy="",createdbydesg="",createdDate="",ganame="",gadesg="",gamail="",approvalremarks="",approvalStatus="",gaApprovedDate="",gaApproverRemarks="";
String formno="",passtype="",takenByName="",desg1="",dateTme="",transFrom="",transTo="",ITPName="",ScName="",expRetDate="",Vname="",purpose="",reasonForNoReturn="",time="",ITPDesg="",cityName="";
String descItems="",assetNo="",qty="",remarks="",reminderRemarks="",assetReceiptDate="",reminderUpdateFlag="";

String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,stl=null,stl1=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rsl=null,rsl1=null;
String req=null;
String empD=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");
/* System.out.println("-------------------------------------");
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------"); */
Connection cn5 = null,cn11=null; 
Statement st5 = null,st11=null,st0=null; 
ResultSet rs5 = null,rs11=null,rsO=null; 




String city = (String) session.getAttribute("city");
String b_no = (String) session.getAttribute("b_no");
System.out.println("City Name :"+city);
System.out.println("Branch Number :"+b_no);
String addr=null,loc=null;
Connection conn=null;
Statement st=null,st1=null,stitem=null; 
ResultSet rs=null,rs1=null,rsitem=null;



try{
%>

<%
String req = request.getParameter("req");
cn100 = con.getConnection2();
stitem=cn100.createStatement();
rsitem = stitem.executeQuery("select * from gatepassitem WHERE formno='"+req+"'");


st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from gatepassform WHERE formno='"+req+"'"); 
while(rs100.next())
        {
	    formno = rs100.getString("formno");
	    passtype = rs100.getString("passtype");
	    takenByName = rs100.getString("takenByName");
	    desg1 = rs100.getString("desg");
	    dateTme = rs100.getString("dateTme");
	    transFrom = rs100.getString("transFrom");
		transTo = rs100.getString("transTo");
		ITPName = rs100.getString("ITPName");
		ScName = rs100.getString("ScName");
		expRetDate = rs100.getString("expRetDate");
		Vname = rs100.getString("Vname");
		purpose = rs100.getString("purpose");
		reasonForNoReturn = rs100.getString("reasonForNoReturn");
		time = rs100.getString("time");
		ITPDesg = rs100.getString("ITPDesg");
		cityName = rs100.getString("cityName"); 
		
		brcontact = rs100.getString("brcontact");
		createdBy = rs100.getString("createdBy");
		createdbydesg = rs100.getString("createdbydesg");
		approvalremarks = rs100.getString("approvalremarks");
		createdDate = rs100.getString("createdDate");
		
		ganame = rs100.getString("ganame");
		gadesg = rs100.getString("gadesg");
		gamail = rs100.getString("gamail");
		approvalStatus = rs100.getString("approvalStatus");
		gaApprovedDate = rs100.getString("gaApprovedDate");
		gaApproverRemarks = rs100.getString("gaApproverRemarks");
		
		assetReceiptDate = rs100.getString("assetReceiptDate");
		reminderRemarks = rs100.getString("reminderRemarks"); 
		reminderUpdateFlag = rs100.getString("reminderUpdateFlag"); 
		}


%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table class="dynatable1" width="85%" border="2" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
          <tr>
             <td>Form No :<input type="text" name="vname" maxlength="99" id="idvname" class="lno" value="<%=formno %>" size=20 readonly/></td>
          
          </tr>
          <tr>
                  <td ><font size="2" face="Swiss" id="hiderow">Returnable/NonReturnable<font color=red>*</font></font>
                  <input type="text" name="vname" maxlength="99" id="idvname" class="lno" value="<%=passtype %> " size=20 readonly/>
           				  </td>
				  <td ><font size="2" face="Swiss" id="hiderow">Date:<font color=red>*</font></font>
				  <input type="text" name="date_time" maxlength="99" id="iddate_time" class="date_time" value="<%=dateTme %>" size=10 readonly /></td>
				  <td ><font size="2" face="Swiss" id="hiderow">Time:<font color=red>*</font></font>
				          <input type="text" name="time" maxlength="99" id="idtime"  value="<%=time %>" size=10 readonly/>
                </td>
          </tr>
          </table>
          <br>
          <table class="dynatable1" width="85%" border="2" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
           <tr>
                <td><font size="2" face="Swiss" id="hiderow">Vendor Name :<font color=red>*</font></font></td> 
				<td colspan=5><input type="text" name="vname" maxlength="99" id="idvname" class="lno" value="<%=Vname %>" size=80 readonly/></td>
		  </tr>  
          <tr>
                  <td><font size="2" face="Swiss" id="hiderow">Taken By Name<font color=red>*</font></font></td> 
                  <td colspan=2><input type="text" name="takeby" maxlength="99" id="idtakeby" class="lno" value="<%=takenByName %>" size=25 readonly/></td>
                  <td><font size="2" face="Swiss" id="hiderow">Designation<font color=red>*</font></font></td> 
				  <td colspan=2><input type="text" name="desg" maxlength="99" id="iddesg" class="lno" value="<%=desg1 %>" size=25 readonly/></td>
		          
                    
          </tr>
          <tr>
                <td><font size="2" face="Swiss" id="hiderow">Transport From<font color=red>*</font></font></td> 
				<td colspan=2><input type="text" name="trnsfrom" maxlength="99" id="idtrnsfrom" class="lno" value="<%=transFrom %>" size=25 readonly/></td>
				<td><font size="2" face="Swiss" id="hiderow">Transport To<font color=red>*</font></font></td> 
				<td colspan=2><input type="text" name="transto" maxlength="99" id="idtrnsto" class="lno" value="<%=transTo %>" size=25 readonly/></td>
          </tr>
          </table>
          <br>
          <table class="dynatable1" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
           <tr>
                <%-- <td><font size="2" face="Swiss" id="hiderow">Emp Code :<font color=red>*</font></font></td> 
				<td ><input type="text" name="ITPECode" maxlength="99" id="idITPECode" class="ITPECode" value="<%=ITPDesg %>" readonly size=25 onkeypress="return isNumber(event)" onkeyup="return sendInfo(this.value);"/></td>
 --%>     		<td><font size="2" face="Swiss" id="hiderow">Name :<font color=red>*</font></font></td> 
				<td colspan=2><input type="text" name="ITPName" maxlength="99" id="idITPName" class="ITPName" value="<%=ITPName %>" size=25 readonly/></td>
				<td><font size="2" face="Swiss" id="hiderow">Designation :<font color=red>*</font></font></td> 
				<td ><input type="text" name="ITPDesg" maxlength="99" id="idITPDesg" class="ITPName" value="<%=ITPDesg %>" size=25 readonly/></td>
		  </tr>
           
           <tr>
                <td><font size="2" face="Swiss" id="hiderow">Security Name<font color=red>*</font></font></td>
				<td colspan=2><input type="text" name="ScPName" maxlength="99" id="idScPName" class="ScPName" value="<%=ScName %>" size=25 readonly/></td>
				<td colspan=1 id="idepd"><font size="2" face="Swiss" id="hiderow">Expected Date Of Return<font color=red>*</font></font></td> 
				<td colspan=2 id="idepd1"><input type="text" name="expDateReturn" maxlength="99" id="idexpDateReturn" class="expDateReturn" readonly value="<%=expRetDate %>" size=25 /></td>
           </tr>
           <% if(passtype.equals("RETURNABLE")){%>
           <tr >
                <td ><font size="2" face="Swiss" id="hiderow">Purpose :<font color=red>*</font></font></td> 
				<td colspan=5><input type="text" name="purpos" maxlength="99" id="idpurpos" class="lno" value="<%=purpose%>" size=100 readonly/></td>
           </tr>
           <%}else{ %>
            <tr >
                <td ><font size="2" face="Swiss" id="hiderow">Reason for NON-RETURNABLE :<font color=red>*</font></font></p></td> 
				<td colspan=5><input type="text" name="purposNON" maxlength="99" id="idpurposNON" class="purposNON" value="<%=reasonForNoReturn  %>" size=100 readonly/></td>
           </tr>
           <%} %>
            <tr>
                <td ><font size="2" face="Swiss" id="hiderow">GatePass Branch :<font color=red>*</font></font></p></td> 
		  	    <td colspan=2>
                       <input type="text" name="cityName" maxlength="99" id="idcityName" value="<%=cityName  %>" size=20 readonly/>	
			    <td><font size="2" face="Swiss" id="hiderow">Branch ContactNo :<font color=red>*</font></font></p></td> 
				<td colspan=2>+91-<input type="text" name="brContact" maxlength="99" id="idbrContact"  value="<%=brcontact %>" size=20 readonly/></td>
           </tr>
           </table>
           <br>
         
     <table class="dynatable"  width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3    >
	        <tr>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>Desc. Of Items<font color=red>*</font></font></td>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>AssetNo<font color=red>*</font></font></td>
		     <td><font size="3" face="Swiss" id="hiderow" color=blue>Quantity</font></td>
		    <td><font size="3" face="Swiss" id="hiderow" color=blue>Remarks<font color=red>*</font></font></td> 
		   </tr>
		   <%
		   while(rsitem.next())
	        {
			descItems = rsitem.getString("descItems");
		    assetNo = rsitem.getString("assetNo");
		    qty = rsitem.getString("qty");
		    remarks = rsitem.getString("remarks");
		    %>
		   <tr >
		          <td ><textarea name="descOfItem" id="iddescOfItem" class="descOfItem" rows="4" cols="40" readonly><%= descItems%></textarea></td>
		           <td><input type="text" value="<%= assetNo%>" name="assetNo" maxlength="99" id="idassetNo" class="assetNo"  size=20 readonly/></td>
		           <td><input type="text" value="<%= qty%>"  name="qty" maxlength="99" id="idqty" class="qty" value="" size=5 readonly/></td>
		           <td><input type="text" value="<%= remarks%>"  name="remarks" maxlength="99" id="idremarks" class="remarks"  size=40 readonly/></td>
	       </tr>
		   <%}%>
		   
		   
		   
		   
		   
	       
   </table>
  
      <br>
      <table class="dynatable1" id="idapprovaRow" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor=#D5F5E3  >
               <tr>
        	         <td align="center"><font size="3"  color=blue>Name</font> </td>
        	         <td align="center"><font size="3"  color=blue>Designation </font></td>
        	         <td align="center"><font size="3"  color=blue>Status</font> </td>
        	         <td align="center"><font size="3"  color=blue>Remarks</font> </td>
        	         <td align="center"><font size="3" color=blue>Date</font> </td>
        	   </tr> 
               <tr>
        	         <td ><%=createdBy %> </td>
        	         <td ><%= createdbydesg%> </td>
        	         <td>Initiator</td>
        	         <td ><textarea name="descOfItem" id="iddescOfItem" class="descOfItem" rows="4" cols="80" readonly><%= approvalremarks%></textarea></td>
        	         <td><%=createdDate %> </td>
        	   </tr> 
        	   <tr>
        	         <td ><%=ganame %> </td>
        	         <td ><%= gadesg%> </td>
        	         <td><%= approvalStatus%> </td>
        	         <td ><textarea name="descOfItem" id="iddescOfItem" class="descOfItem" rows="4" cols="80" readonly><%= gaApproverRemarks%></textarea></td>
        	         <td><%=gaApprovedDate %> </td>
        	   </tr> 
        	   <%if(passtype.equals("RETURNABLE") && reminderUpdateFlag.equals("1")){%>
        	      <tr>
        	         <td >Reminder Remarks :</td>
        	         <td colspan="3"><textarea name="descOfItem" id="iddescOfItem" class="descOfItem" rows="4" cols="80" readonly><%=reminderRemarks%></textarea></td>
        	         <td ><%=assetReceiptDate %> </td>
        	     </tr> 
        	  <%}%> 
           </table>
           <br>
  
  
  
</CENTER>	

	                          	 <br>
	                           <center>
	                          	     <input type="button" onclick="window.history.go(-1);" value="Back" />
		                             </center>
		                        <br>

<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs2,st2,cn2);
	 }
%>
</center>
	<br /><br /><br />
	
</div>

</form>	

</body>

</html>