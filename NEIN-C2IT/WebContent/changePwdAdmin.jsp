<html>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
	<script language="javascript"   type="text/javascript" src="js/confirmMessage.js" ></script>
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
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script>
function validate()
{
		var isValidForm = true;
        var errorMessages = "";
        
        var a=document.getElementById("idCurrent");
        if (a.value == "") 
        {
         alert("Current Password is required");
         a.focus();
         isValidForm = false;
        }
        
        var b=document.getElementById("idNew");
        if (b.value == "") 
        {
         alert("New Password is required");
         b.focus();
         isValidForm = false;
        }    
        
        var c=document.getElementById("idConfirm");
        if (c.value == "") 
        {
         alert("Confirmation of Password is required");
         c.focus();
         isValidForm = false;
        }   
        
       // if(document.f.new.value!=document.f.confirm.value){
    	     if(b.value!=c.value){
alert("New Password and Confirm Password should be same"+'\n'+" Re-enter confirm-password!");
document.f.confirm.value="";
return false;
}
//return true;
 if (!isValidForm) {
            //alert(errorMessages);
        }

        return isValidForm;
}
</script>
<script type="text/javascript">
function Validation()
{
	 var d1=document.f.current; //Current pwd
	 var d2=document.f.newpwd; //new pwd
	 var d3=document.f.confirm;
	
	    if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
					{
	  				 alert("Enter Current Password!");
	   			         d1.focus();
	  				 return false;
	  				 }
	    if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
		{
			 alert("Enter New Password!");
		         d2.focus();
			 return false;
			 }
	    if ((d3.value==null)||(d3.value=="NULL")||(d3.value==""))
		{
			 alert("Enter Confirm Pwd!");
		         d3.focus();
			 return false;
			 }
	    if(d2.value!=d3.value){
	    	alert("New Password and Confirm Password should be same"+'\n'+" Re-enter confirm-password!");
	    	document.f.confirm.value="";
	    	d3.focus();
	    	return false;
	    	}
	   /* if (checkAddress(d1.value)==false)
					{
	   				d1.value="";
	 			       alert("Invalid Material Requisition");
	   				d1.focus();
	  				 return false;
	  				 } */
	      
	  	 
	else
	return true;
	   }
	

</script>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" >
<form name="f" method="post" action="ChangePwdAdminBack.jsp" >
<center>
<fieldset style="margin: 2 cm; border-bottom-color: black; width: 60%; " >

<label style="font: 300;"><font size="3">CHANGE PASSWORD</font> </label>
  <table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
    <%-- Welcome : <%= session.getAttribute( "Nname" ) %> --%>
   <% Object newName = session.getAttribute("theName");%>
   <tr><td align="center" width="50%"><font size="2">Super Admin </font></td><td><font size="2"><%= session.getAttribute( "Nname" ) %></font></td></tr>  
<tr><td align="center" width="50%"><font size="2">Current Password</font></td><td><input size="20" type="password" id="idCurrent" maxlength="25" name="current" ></td></tr>
<tr><td align="center" width="50%"><font size="2">New Password</font></td><td><input size="20" type="password" id="idNew" maxlength="25" name="newpwd" onkeyup="return confirmpass()"></td></tr>
<tr><td align="center" width="50%"><font size="2">Confirm Password</font></td><td><input size="20" type="password" id="idConfirm" maxlength="25" name="confirm" onkeyup="return confirmpass()"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Change Password" onclick="return Validation();" /><input type="button" value="Cancel" onclick="cancel();" /></td></tr>
</table>
</fieldset>
</center>
</form>
</body>
</html>