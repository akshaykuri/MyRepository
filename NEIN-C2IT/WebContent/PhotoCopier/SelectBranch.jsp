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
		 var location = document.forms["form1"]["location"].value; 
		if(location == 'Select'){		
		              alert("Select Location/Branch");
		              return false;
		    }  
		
		return true;
	}
	
</script>	
<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=400,width=950,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>
<%-- <script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg1 = "<%=disp%>";

     if(msg1!="1")
		{
           alert(msg1);
		}
</script> --%>
</head>

<body background="../images/u.jpg">
<br><br>
<form method="post" name="form1" action="ViewBranchWiseModel.jsp">

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

<table width="300" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#1ABC9C"> 

  <tr>
       <td style="color:white"><span style="color:red;">*</span>Location/Branch:</td>
               <td>      <%  Connection con1 = null;
                             Statement st3=null;
                             ResultSet rs3=null; 
                             String msg=null;
                             String bNo=(String)session.getAttribute("b_no");
                             String query=null;
                             
                           try
                              {
                        
       						   Connection2 dbConn = new Connection2();
       						   con1 = dbConn.getConnection2();
       						   
                               //String query = "select * from branch_master_main ORDER BY m_b_name";
       						if(bNo.equals("90")){
                                query = "select * from branch_master_main  ";
                              }
                           if(bNo.equals("40")){
                        	   
	                           	   query = "select * from branch_master_main b1 where b1.m_b_no in(40,41,52,43,42)  ";
                            }
                           if(bNo.equals("20")){ 
                        	   
                         	  query = "select * from branch_master_main b1 where b1.m_b_no in(20,51,21,89,88,22,23,24,25,26,27,28)  ";
                           }
                           if(bNo.equals("30")){ 
                        	   
                         	  query = "select * from branch_master_main b1 where b1.m_b_no in(30,31,53,32,11) ";
                           }
                           if(bNo.equals("10")){ 
                        	   
                         	  query = "select * from branch_master_main b1 where b1.m_b_no in(10)  ";
                           }
                           if(bNo.equals("54")){ 
                        	   
                          	  query = "select * from branch_master_main b1 where b1.m_b_no in(54,44)  ";
                            }
                           if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("54") || bNo.equals("40") || bNo.equals("90"))){
                        	   query = "select * from branch_master_main b1 where b1.m_b_no ='"+bNo+"'";
                           }
                           
                               st3 = con1.createStatement();
                               rs3 = st3.executeQuery(query);
                              %>
                <select name="location" id="location" >
		        <option >Select</option>
	              <%while(rs3.next()){%>
			        <option value="<%=rs3.getString("m_b_no")%>"><%=rs3.getString("m_b_name")%></option>
    	            <%
    	            msg = "Get all sub branch details";  
	              }%>
	           </select>
                 <input type="hidden" name="msg" id="msg" value="<%=msg%>">
                <%} catch (SQLException ex) {
                       ex.printStackTrace();
                       }	
                    finally{
                    	
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
        </td>
   </tr>
   <tr>
       <td colspan="2" align="center"> <input type="submit" value="Submit" onclick="return (Validation());"> </td>
   </tr>
  </table>
  <br>
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
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>