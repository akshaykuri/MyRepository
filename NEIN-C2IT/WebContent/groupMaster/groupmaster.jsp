<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GROUP MASTER</title>
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>

</head>

<body background =".jpg" >
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
	

 <script language = "Javascript">
          
            
          function validate(){
              var w=document.form.groupname;
             
            if ((w.value==null)||(w.value=="")){
            alert("Please Enter New GroupName...!")
            w.focus()
            return false
            }
            
           
                 
	 else
       return true;
}
        </script>
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

  <form name="form" method="post" onSubmit="return validate()" action="groupmasterback.jsp">
	<br>
	<br>
	<center>
     <table width="500" height="3" cellpadding="0" cellspacing="0" ID="Table1" border=1 bgcolor="gray">
            <tr>
                 <td align=center width=60% colspan=2  background=".jpg">
                            <font color=darkblue size=3 > CREATE NEW GROUP</font>
                </td>
               
          </tr>
      	  <tr>
      	       <td><font size="2">GROUP NAME:</font><font color=red>*</font></td>
      	       <td><input type="text" size="20" name="groupname" id="idgroupname" value=""></td>
      	 </tr>
         <tr>
	         <td><a href="groupmasterDisp.jsp" onclick="return popitup('groupmasterDisp.jsp')">View Group</a> </td>
	         <td><input type=submit name="button" value="Create" id="button"><input type="reset" value="Reset"/></td>
         </tr>
	</table>
	</center>
	</form>
</body>
</html>