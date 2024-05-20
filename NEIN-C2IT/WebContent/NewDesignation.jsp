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
<title>PRINTER MASTER PAGE</title>
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
	<%-- 	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
   disp = disp.replace("%20", "");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script> --%>

 <script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
              var w=document.form.DESIGNATION;
             
            if ((w.value==null)||(w.value=="")){
            alert("Please Enter New Designation!")
            w.focus()
            return false
            }
            if (checkAddress(w.value)==false){
            w.value=""
            alert("Invalid Designation!");
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
<div id="wrapper"> 
  <form name="form" method="post" onSubmit="return validate()" action="NewDesigBack.jsp">

 <div id='right_table'>

	<br>
	<br>
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="images/39.jpg" height="180" width="340">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
  
    
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE NEW DESIGNATION</font>
</td>
</tr>

	<tr><td><font size="2">NAME:</font><font color=red>*</font></td><td><input type="text" size="20" name="DESIGNATION" value=""></td></tr>
<%
                     
                    String new_id = null;
                    int id=0;
                    Connection cn_id = null; 
                    Statement st_id = null; 
                    ResultSet rs_id = null; 
                    try{
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    rs_id = st_id.executeQuery("SELECT max(DESG_NO) from desg");
                    while ( rs_id.next() )
                    {    
                    	
                    	
                    	try
                    	{
                    		id=rs_id.getInt(1);
                    		System.out.println("ID VALUE NOW : "+id);
                                 id++;     
                                 System.out.println("ID VALUE NOW AFTER ID PLUS : "+id);
                    			System.out.println("Gen id "  +rs_id);
                    			new_id = "" +String.valueOf(id);
                    	}
                    	catch(SQLException ex)
                    	{
                    		  System.out.println(ex.toString());
                    		 new_id = "NEIN/90-1";
                    	    }

                    }
                                   
                    %>
	<tr>
	
	<td><font size="2">DEFAULT:</font><font color=red>*</font></td>
	<td><input type="text" size="20" name="DESG_NO" value="<%= new_id %>" readonly="readonly"></td></tr>

	</table>
	<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
	
	<tr>
	<td>
    <a href="DisplayNewDesignation.jsp" onclick="return popitup('DisplayNewDesignation.jsp')">View Detail</a> </td>
	<td><input type=submit name="button" value="Create" id="button"></td>
	<td><input type="reset" value="Reset"/></td>

	                 </tr>
	                 </table></td>
	
	

	
</tr>

</table>
	 <%
	 
                    } catch (SQLException ex) {
                        // Exception handling stuff
                            ex.printStackTrace();
                    } finally {
                    
                    	DbUtil.closeDBResources(rs_id,st_id,cn_id );
                    }
	 %>                </div>
	                 
	</form>
	
	



<table width="165" align ="center">
<tr>
 <td width="40" class="small_cont_uline"><a href="javascript:top.window.close(),close1()"><img src="images/ok.jpg" height="40" width="40" ></a> 
</td>
</tr>
</table> 






</div>
</body>
</html>