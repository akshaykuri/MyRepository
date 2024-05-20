<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="CON2.DbUtil"%>

<%@ page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.text.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@ page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script language="javascript" type="text/javascript">
function Validation()
	{ 		
		 var groupName = document.getElementById("groupName").value; 
		 var branchId = document.getElementById("branchId").value; 
		 
		 if(groupName == ''){		
		        alert("Enter group Name");
		        return false;
		    } 
		 if(branchId == 'Select'){		
		        alert("Select Branch Name");
		        return false;
		    } 
		  return true;
	}
	
</script>	

<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=400,width=950,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus();}
		return false;
	    }
</script>
<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
   %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
</head>

<body background="../images/u.jpg">
<br><br>
<form method="post" name="form1" action="InsertOutageEmailGroup.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
</td>
 </tr>
   </table><br><br>

<table  align="center" border="1" width="50%"> 

   <tr>
		
		<td> <span style="color:red;">*</span>Select Branch:</td>
		<td>      <%                                        
                               Connection con1 = null;
   							   Connection2 dbConn = new Connection2();
   							   con1 = dbConn.getConnection2();
   							
                               Statement st1=null;
                               ResultSet rs1=null; 
                               String bNo=(String)session.getAttribute("b_no");
                               String query=null;
                               
                             try
                                {
                                 query = "select * from branch_master_main";
                                  
                                 st1 = con1.createStatement();
                                 rs1 = st1.executeQuery(query);
                              %>
                <select name="branchId" id="branchId" >
		        <option >Select</option>
	              <%while(rs1.next()){%>
			        <option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
    	            <%}%>
	           </select>

                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
				</td>	
				<td> <span style="color:red;">*</span>GROUP MASTER:</td>
		        <td><input type="text" name="groupName" id="groupName"  size="30"></td>	
		
   </tr>
   <tr>
      <td colspan="4" align="center" >
         <input type="submit" value="Submit" name="save1" id="save"  onclick="return Validation();">&nbsp &nbsp 
         <input type="reset" value="Reset">&nbsp &nbsp  
         <a href="DispalyOutageEmailGroup.jsp?msg=1" onclick="return popitup('DispalyOutageEmailGroup.jsp?msg=1')" >VIEW ALL</a> 
      </td>
   </tr>
 </table> 
  <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table> 
  <br>
   <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>