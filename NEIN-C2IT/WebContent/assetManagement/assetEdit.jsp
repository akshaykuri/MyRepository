<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%-- <%@page import="CON2.DbUtil"%> --%>

<%@page language="java"%>
<%@page import="java.sql.*"%>


<html>
<head>
<script type="text/javascript" language="javascript" > // script for scrap 
function scrapfun()
       {
	  	  // alert("Herro");
			String sc=document.getElementById("idscrap").value;
			String ma=document.getElementById("idmaint").value;
		    alert(sc);
			alert(ma);			   
        }
</script>
</head>
<%
System.out.println("------------- Asset Edit  -----------------");
String no=request.getParameter("id");
System.out.println(no);
String[] temp;
temp = no.split(",");
String inv=temp[0];
String asno=temp[1];
String at=temp[2];
String bran=temp[3];
String war=temp[4];

String sc=temp[6];
String man=temp[7];
System.out.println(inv);
System.out.println(asno);
System.out.println(at);
System.out.println(bran);

System.out.println(war);

System.out.println(sc);
System.out.println(man);%>


<body>
<form method="post" action="assetUpdate.jsp">
<br />
<br/><br/>
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		<td bgcolor="lightgrey" width="120" align=center><font color="black">Inventory No</font></td>
	    <td bgcolor="lightgrey" width="120" align=center><font color="black">Asset No</font></td>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">Asset Type</font></td>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">Branch</font></td>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">WarExpDate</font></td>
	    <td bgcolor="lightgrey" width="120" align=center><font color="black">Scrap</font></td>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">Maintenance</font></td>
        <td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
	    </tr>
             
        <tr>
         <td bgcolor=""><%=inv%></td>
	     <td bgcolor=""><%=asno%></td>
         <td bgcolor=""><%=at%></td>
	     <td bgcolor=""><%=bran%></td>
	     <td bgcolor=""><%=war%></td>
	     <td bgcolor=""><input type="text" name="sc" id="idsc" style="background-color:white;width:100;color:black;" value="<%=sc%>" /></td>
         <td bgcolor=""><input type="text" name="main" id="idmain" style="background-color:white;width:100;color:black;" value="<%=man%>" /></td>
	     <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
         <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
       </tr>
 </table>
 <input type="hidden" name="an" id="idan"  value="<%=asno%>" />
 </form>
</body>
</html>