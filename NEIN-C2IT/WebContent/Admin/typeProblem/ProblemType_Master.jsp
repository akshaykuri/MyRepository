<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="banner.jsp" %>
    <%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PROBLEM MASTER</title>
<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />

<script type="text/javascript" src="../../js/layout.js"></script>\
<link href="stylelog.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />

</script>

</head>

<body background =".jpg" >
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("../../adminlink.jsp?msg=1");
}
%>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

 <script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
              var w=document.form.bkLocation;
              var bk = document.form.p_type;
              var bkk = document.form.pt_fullDescription;
              var sw_hw = document.form.sw_hw;
            if ((w.value==null)||(w.value=="")||(w.value=="Null"))
               {
               alert("Please Select category!");
               w.focus();
               return false;
               }
           
            if ((bk.value==null)||(bk.value=="")||(bk.value=="Null")){
                alert("Select Sub category");
                bk.focus();
                return false
                }
           if (checkAddress(bk.value)==false){
                	bk.value="";
                alert("Invalid Sub category !");
                	bk.focus();
                return false;
                }
          if ((bkk.value==null)||(bkk.value=="")||(bkk.value=="Null")){
                    alert("Select Sub category Description");
                    bkk.focus();
                    return false
                    }
          if (checkAddress(bkk.value)==false)
                  {
                  bkk.value="";
                  alert("Invalid Sub category Description!");
                  bkk.focus();
                  return false;
                  }
          if (sw_hw.value=="")
	          {
	          alert("Please select SW/HW option....");
	          sw_hw.focus();
	          return false;
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

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper"><div id="id">
<table>
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>

</table> 

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">PROBLEM TYPE MASTER </font></strong></td>
</tr>
 </table>


 
  <form name="form" method="post" onSubmit="return validate()" action="ProblemType_MasterBack.jsp">

 <div id='right_table'>

<!-- backup_name,backup_detail -->
<%
String p_type=request.getParameter("p_type");
Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
try{
cn02 = con.getConnection2();
st02=cn02.createStatement();
//rs02 = st02.executeQuery("select name from prob_type_master_main ORDER BY name Asc");
rs02 = st02.executeQuery("Select DISTINCT p_type,department from  prob_master ORDER BY department,p_type ASC");
%>
	<br>
	<br>
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="../../images/types.jpg" height="180" width="340">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
  
    
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 > CREATE PROBLEM TYPE DETAILS</font>
</td>
</tr>

	
	<tr><td><font size="2">CATEGORY:</font><font color=red>*</font></td><td>
    <select name="bkLocation">
			<option value="Null">Select</option>
			<%while(rs02.next()){
				String depart = rs02.getString("department");
				String p_typ = rs02.getString("p_type");
				//System.out.println("DEPART "+depart);
				//System.out.println("p_type "+p_typ);
				if(depart.equals("IT SUPPORT"))
				{%>
			        <option style="background-color: blue;" title="IT SUPPORT"><%=rs02.getString("p_type")%></option>
			   <%} %>
			  <%if(depart.equals("SOFTWARE DEVELOPMENT"))
				{%>
			        <option style="background-color: red;" title="SOFTWARE DEVELOPMENT"><%=rs02.getString("p_type")%></option>
			   <%}if(depart.equals("OFFICE ADMINISTRATION")){ %>
			   <option style="background-color: green;" title="OFFICE ADMINISTRATION"><%=rs02.getString("p_type")%></option>
			<%} }%>
		</select><label>Type Master</label>
    </td></tr> 
    <tr><td><font size="2">SUB CATEGORY:</font><font color=red>*</font></td><td><input type="text" size="50" name="p_type" value="" placeholder="Sub category" maxlength="49"></td></tr>
     <tr><td><font size="2">DESCRIPTION:</font><font color=red>*</font></td><td><input type="text" size="50" name="pt_fullDescription" value="" placeholder="By default this message will appear" maxlength="298"></td></tr>
      <tr>
          <td><font size="2">SW/HW:</font><font color=red>*</font></td>
         <td>
             <select id="sw_hw" name="sw_hw">
		             <option value="">Select</option>
		             <option value="SOFTWARE">SOFTWARE</option>
		             <option value="HARDWARE">HARDWARE</option>
		              <option value="HARDWARE/SOFTWARE">HARDWARE/SOFTWARE</option>
         
             </select>
       </td>
    </tr>
</table>
	<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
	
	<tr>
	<td><input type=submit name="button" value="SAVE" id="button" onclick="return validate();"></td>
	<td><input type="reset" value="RESET"/></td>
	<td>
    <a href="DisplaySubProb.jsp" onclick="return popitup('DisplaySubProb.jsp')">View Problem Type</a> </td>
    <td> <a href="typesMaster.jsp" onclick="return popitup('typesMaster.jsp')">New Type</a> </td>
   <!--  <td> <a href="SubTypeMaster.jsp" onclick="return popitup('SubTypeMaster.jsp')">New Category</a> </td> -->
	

	                 </tr>
	                 </table></td>
	
		<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
		DbUtil.closeDBResources(rs02,st02,cn02);
			} %>   

	
</tr>

</table>
	                 </div>
	                 
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../images/home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../images/bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 


</div>
</div>
</body>
</html>