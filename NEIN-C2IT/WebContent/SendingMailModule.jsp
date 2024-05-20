<%@page import="CON2.DbUtil"%>
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<html>
  <script language="javascript"   type="text/javascript" src="js/onSubmitWait.js"></script>
<script type="text/javascript">
function cancel()
{
   close();
}
</script>
<script  type="text/javascript">
<%--
session.setMaxInactiveInterval(30*60);

if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("theName")==null||session.getAttribute("AdminSign")==null)
{   
	String msg=null;
	msg="Session Time Out \\n Login Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
}
--%>
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
function Validation()
{
	 var d1=document.f.name;
	 var d2= document.f.user_mail_id;
	 var d3=document.f.branch;
	 var d4= document.f.aboutWhat;
	 var d44 = document.f.systemAdmin;
	 var d=document.f.feedback;
	
	
	
	    if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
					{
	  				 alert("Enter Your Name!");
	   			         d1.focus();
	  				 return false;
	  				 }
	    if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
		{
			 alert("Enter Your Mail ID!");
		         d2.focus();
			 return false;
			 }
	    if (validateEmailsh(d2.value)==false){
	        d2.value="";
	        alert("Invalid Email ID!");
	        d2.focus();
	        return false;
	        }
	    if ((d3.value==null)||(d3.value=="NULL")||(d3.value==""))
		{
			 alert("Select Your Branch!");
		         d3.focus();
			 return false;
			 }
	    if ((d4.value==null)||(d4.value=="NULL")||(d4.value==""))
		{
			 alert("Select Your About selection list!");
		         d4.focus();
			 return false;
			 }
	    
	    if ((d4.value=="System Admin") && (d44.value=="Select"))
		{
			 alert("Kindly Select System Admin Name!");
		         d4.focus();
			 return false;
			 }
	    if ((d.value==null)||(d.value=="NULL")||(d.value==""))
		{
			 alert("Enter Your Remarks/Complaints/Feedback!");
		         d.focus();
			 return false;
			 }
	else
	return true;
	   }
	

</script>
<script type="text/javascript">
function hideHigherTR()
{
/*  document.getElementById('idApproved1').style.display="none";
 document.getElementById('idApproved1').style.visibility="hidden"; */
/*  document.getElementById('idPwd1').style.display="none";
 document.getElementById('idPwd1').style.visibility="hidden"; */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.display="none";

}
 function showHigherTR()
{
/*  document.getElementById('idApproved1').style.display="table-row";
 document.getElementById('idApproved1').style.visibility="visible"; */

 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.visibility="visible";

}
function selectAdmin()
{
	// ALERTS REQUIRE ONE ARGUMENT
	var message = "Kindly Enter System Admin Namefffffffffffff";
	 document.getElementById('idApprovedd').style.display="table-row";
	 document.getElementById('idApprovedd').style.display="none";
	 //alert("Mail Will Be Sent To IT (Head Office)");
	// ALERTS DO NOT RETURN A VALUE
	// ALERTS ARE INFORMATIONAL ONLY
	

}
</script>
<style type="text/css">
html, body{height: 70%; width: 100%; border: 0; padding: 0; margin: 0; background:'last1.jpg' ;}

#spacer{
display: block;
height: 85%;
width: 1px;
padding: 0;
margin: 0;
border: 0;
background:images/last1.jpg ; /* same as body bg */
float: right;
}

#bodycontent {
width: 100%;
margin: 0;
padding: 0;
border: 0;
float: right;
margin-right: -1px; /* this is the key to avoid the 1px jog caused by spacer */
}




#footer{
display: block;
clear: both;
width: 100%;
padding: 0;
margin: 0;
background: #ddd;
text-align: center;
margin-right: 0px;
}

#footer p{background: #ddd;}



</style>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70"  >
<%String SessionSuperAdmin =null;
SessionSuperAdmin = (String) session.getAttribute("AdminRights"); %>
<form name="f" method="post" action="feedback.jsp" >
<center title="Mail Sending" >
<fieldset style="margin: 2 cm; border-bottom-color: black; width: 80%; " >

<label style="font: 3;font-size: large;"><font size="2">Mail Module</font></label>
  <table width="50%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
  <%if(session.getAttribute("m_b_no")!=null && session.getAttribute("m_b_no").equals("90") && SessionSuperAdmin.equals("5"))
	{ %>
  <tr>
  <td> 
  <a href="SendingMail.jsp?msg=1" onclick="return popitup2('SendingMail.jsp?msg=1')" id="hiderow"><img width="35" src="images/a1.png">To IT Support</a>
  </td></tr>
   <tr>
  <td> 
  <a href="SendingAllHRMail.jsp?msg=1" onclick="return popitup2('SendingAllHRMail.jsp?msg=1')" id="hiderow"><img width="35" src="images/a1.png">To All HR Admin</a>
  </td></tr>
  <%} %>
  <tr><td>
<a href="feedbackUser.jsp?msg=1" onclick="return popitup2('feedbackUser.jsp?msg=1')" id="hiderow"><img width="35" src="images/doubt.jpg">Feedback</a></td>
</tr>
  <tr>
<td>
<a href="thoughtMaster.jsp?msg=1" onclick="return popitup2('thoughtMaster.jsp?msg=1')" id="hiderow"><img width="35" src="images/face.jpg">Message on home screen</a>

</td> 
  </tr>

</table>
</fieldset>
</center>
</form>
</body>
</html>