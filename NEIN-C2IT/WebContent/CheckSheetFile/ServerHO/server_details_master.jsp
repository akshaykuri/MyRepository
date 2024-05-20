<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
    <%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BACKUP MASTER PAGE</title>
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />

<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />
<script type="text/javascript" src="../../js/layout.js"></script>
<link href="../../stylelog.css" rel="stylesheet" type="text/css" />
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
	String msg=null;
	msg="Session Time Out \\n Login Again";
	response.sendRedirect("../../adminlink.jsp?msg="+msg);
}
%>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script language="javascript" type="text/javascript">
/* function jsFunction(){
	//alert("Working");
	  var myselect = document.getElementById("selectOpt");
	  alert(myselect.options[myselect.selectedIndex].value);
	  
	} */
	function vatname(taxname)
	{
	document.getElementById('idtax').value = taxname;
	}
	function vatcal()
    { 
    // alert("wor");
       	//var value = clearComma(document.getElementById("totalcon").value);
  	     var value = "1000";
  	  
          var vat = document.getElementById("idhdd_space").value;
          var wat = document.getElementById("abcvat").value;
		//alert("value : "+value);
		//alert("vat : "+vat);
		//alert("Which value is this wat :"+wat);
		if(wat=="TB")
			{
		//var subTotal = parseFloat(Math.round(parseFloat(value)*parseFloat(vat))/(100));
              var subTotal = value*vat;
		      document.getElementById("idtax").value=subTotal;
			}
		else
			var subTotal = vat;
			document.getElementById("idtax").value=subTotal;
		//var taxval = document.getElementById("abcvat").value;
		
		//document.getElementById('idtax').value = taxval;
	  }
</script>

 <script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            function checkNumber(string)
            {
            //var numericExpression = /^[0-9]+$/;
            var numericExpression = /^-?\d+(?:[.,]\d*?)?$/;
            if(string.match(numericExpression)) {
             return true;
            } else {
            return false;
               }
            }
          function validate(){
        	  //server_name,si_drive,hdd_space
              var w=document.form.server_name;
              var bk = document.form.si_drive;
              var ab=document.form.hdd_space;
              var abb = document.form.si_drive_type;
            
            if ((w.value==null)||(w.value=="") ||(w.value=="Null") ){
            alert("Please Select Server Name!")
            w.focus()
            return false
            }
            if (checkAddress(w.value)==false){
            w.value=""
            alert("Invalid Server Name!");
            w.focus()
            return false
            }
           
           
            if ((bk.value==null)||(bk.value=="")||(bk.value=="Null")){
                alert("Select Drive");
                bk.focus();
                return false
                }
                if (checkAddress(bk.value)==false){
                	bk.value="";
                alert("Invalid Drive!");
                	bk.focus();
                return false;
                }
                
                if ((ab.value==null)||(ab.value=="") ){
                    alert("Please Enter HDD Space !")
                    ab.focus()
                    return false
                    }
                    if (checkNumber(ab.value)==false){
                    ab.value=""
                    alert("Invalid HDD Space !");
                    ab.focus()
                    return false;
                    }
                    if ((abb.value==null)||(abb.value=="")||(abb.value=="Null") ){
                        alert("Please Enter HDD Space Size!")
                        abb.focus()
                        return false
                        }
                        if (checkAddress(abb.value)==false){
                        abb.value=""
                        alert("Invalid HDD Space Size !");
                        abb.focus()
                        return false;
                        }
	 else
       return true;
}
        </script>

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
<div id="wrapper">
<div id="id">

<table>
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>

</table>


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">

 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">SERVER HDD SPACE</font></strong></td>
</tr>
 </table>


 
  <form name="form" method="post" onSubmit="return validate()" action="server_details_masterBack.jsp">

 <div id='right_table'>

<!-- backup_name,backup_detail -->
<%
String backup_name=request.getParameter("backup_name");
String backup_detail=request.getParameter("backup_detail");
Connection cn02 = null;
Statement st02 = null; 
ResultSet rs02 = null;
try{
cn02 = con.getConnection2();
st02=cn02.createStatement();
rs02 = st02.executeQuery("select sname from servername WHERE bkLocation='Head Office' ORDER BY sname Asc");
%>
	<br>
	<br>
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="../../images/drive.png" height="150" width="340">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
  
    
<tr>
<td align=center width=60% colspan=2  background=".jpg">
<font color=darkblue size=3 >CREATE HO SERVER DETAILS</font>
</td>
</tr>

	<tr><td><font size="2">SERVER NAME:</font><font color=red>*</font></td>
	<td>
    <select name="server_name">
			<option value="Null">Select</option>
			<%while(rs02.next()){ %>
			
			<option><%=rs02.getString("sname")%></option>
			<%} %>
		</select>
    </td>
	
	</tr>
<tr>
    <td><font size="2">DRIVE:</font><font color=red>*</font></td>
    <td width="" align=""  height="21" >
					     <select name="si_drive"  id="hiderow" style="font-size : 8pt">
							 <option value="Null" style="background: lightgrey;">--Select--</option>
  							 <option value="DRIVE A" >DRIVE A</option>
  							  <option value="DRIVE B" >DRIVE B</option>
  							   <option value="DRIVE C" >DRIVE C</option>
  							    <option value="DRIVE D" >DRIVE D</option>
  							     <option value="DRIVE E" >DRIVE E</option>
  							     <option value="DRIVE F" >DRIVE F</option>
  							     <option value="DRIVE G" >DRIVE G</option>
  							     <option value="DRIVE H" >DRIVE H</option>
  							     <option value="DRIVE I" >DRIVE I</option></select>
  							 
					</td>
</tr>
	<tr><td><font size="2">HDD SPACE:</font><font color=red>*</font></td><td><input type="text" size="5" id="idhdd_space" name="hdd_space" value=""><font size="2">
	
    <select name="si_drive_type" style="font-size : 8pt" onchange="vatcal();" id="abcvat">
							 <option value="Null" style="background: lightgrey;">--Select--</option>
  							<!--  <option value="GB" onclick="vatname('GB')">GB</option> -->
  							 <option value="GB" >GB</option>
  							  <option value="TB" >TB</option>
  							  </select></font>
  							<input type="text" id="idtax" readonly="readonly" name="vatname" value="" />
    </td>
    </tr>
    <%-- <tr><td><font size="2">LOCATION:</font><font color=red>*</font></td>
    <td>
    <select name="bkLocation">
			<option value="Null">Select</option>
			<%while(rs02.next()){ %>
			
			<option><%=rs02.getString("sname")%></option>
			<%} %>
		</select>
    </td></tr>  --%>
	</table>
	<%}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(rs02,st02,cn02);

	

	}
%>
	<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
	
	<tr>
	<td>
    <a href="DisplayServerDetails.jsp" onclick="return popitup('DisplayServerDetails.jsp')">View HO Server</a> </td>
	<td><input type=submit name="button" value="SAVE" id="button"></td>
	<td><input type="reset" value="RESET"/></td>

	                 </tr>
	                 </table></td>
	
	

	
</tr>

</table>
	                 </div>
	                 
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a>
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