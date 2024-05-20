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
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
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
	
	 var d=document.f.feedback;
	
	
	
	    if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
					{
	  				 alert("Enter Your Name!");
	   			         d1.focus();
	  				 return false;
	  				 }
	   
	    if ((d.value==null)||(d.value=="NULL")||(d.value==""))
		{
			 alert("Enter Message to be displayed in Home Page!");
		         d.focus();
			 return false;
			 }
	else
	return true;
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

<form name="f" method="post" action="thoughtMasterback.jsp" >
<center title="Feedback" >
<fieldset style="margin: 2 cm; border-bottom-color: black; width: 80%; " >

<label style="font: 3;font-size: large;"><font size="2">Thoughts/Note</font></label>
  <table width="80%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>

   <% Object newName = session.getAttribute("Nname");
   String SessionSuperAdmin = (String) session.getAttribute("admin");
   
   %>
    <tr style="visibility: hidden;" ><td align="center" width="20%"><input value="<%=SessionSuperAdmin%>" name="whoseThat"/> </td></tr>
 
   <tr><td align="center" width="20%"><font size="1"> Name</font></td>
   <td><font size="1"><input size="20" type="text"  name="name" value="<%=session.getAttribute( "Nname" ) %>" readonly="readonly" title="Enter Your Name" placeholder="Enter Your Name" ></font></td></tr>
 

<tr><td align="center"><font size="1">Remarks</font></td><td><font size="1">	<textarea rows="5" cols="40" name="feedback" maxlength="198" placeholder="Enter Your remarks"></textarea></font></td></tr>

<tr><td colspan="2" align="center"><div id="formsubmitbutton">
    <input type="submit" value="Send" onclick="return (Validation() && ButtonClicked());"/> <input type="button" value="Cancel" onclick="cancel();" /></div>
    
     <div id="buttonreplacement" style="margin-left:30px; display:none;">
	<img src="images/Loading.gif" alt="loading..." />
	</div>
   
     
    </td></tr>
</table>
</fieldset>
</center>
</form>
</body>
</html>