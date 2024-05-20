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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

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

 <style>
   div.scrollable {
    width: 80%;
    max-height:225px;
    overflow-Y: scroll;
}
</style>
<script>
function popitup(url)
        {
		newwindow=window.open(url,'name','height=400,width=950,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>
<script language="JavaScript">
function toggle(source) {
      checkboxes = document.getElementsByName("relationNumber");
      for(var i=0, n=checkboxes.length;i<n;i++) {
    	    checkboxes[i].checked = source.checked;
    	  }
}
</script>
<script>
function validate()
     {
	  var groupName=document.getElementById("groupName").value;
      var items=document.getElementsByName('relationNumber');
      
      if(groupName == ''){
    	  alert("Enter group name");
    	  return false;
      }
      
	  var selectedItems="";
      var a=0;
      
		for(var i=0; i<items.length; i++){
			
			if(items[i].type=='checkbox' && items[i].checked==true)
				{a=a+1;
				selectedItems+=items[i].value+",";
				}
		}
		
		if(a == 0){
	    	  alert("select atleast one Relationship Number");
	    	  return false;
		}
      document.getElementById("number").value=selectedItems;
      return true;
     }
</script>
</head>

<body background="../images/u.jpg">
<br><br>
<form method="post" name="form" action="InsertGroupMaster.jsp">

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
<table  align="center" border="1"  width="60%" > 
   
     <tr>
        <td> <span style="color:red;">*</span>Group Name:</td>
        <td> <input type="text" name="groupName" id="groupName" size="50" placeholder="Enter reference name/number.Ex:HO-Airtel Data Card"> </td>
	 </tr>
	
     <tr ><%int number=0;%>	<%int number1=0;%>		
        <td>  Relationship Number:</td>
		<td >
		<div class=scrollable>
		&nbsp <input type="checkbox" onClick="toggle(this)"> Select All<br/>
		<%                   Connection con1 = null;
							 Connection2 dbConn = new Connection2();
							 con1 = dbConn.getConnection2(); 
                             Statement st1=null;
                             ResultSet rs1=null; 
                             String aa=null;
                             String bNo=(String)session.getAttribute("b_no");
                             String query = null;
                            /*  String type="DATA CARD";
                             String type1="MOBILE"; */
                           try
                              {
	                            
                               if(bNo.equals("90")){
                                    query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND branchNo in(90) ";
                                  }
                               if(bNo.equals("40")){
                            	   
                            	   query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND  branchNo in(40,41,52,43,42) ";
                                }
                               if(bNo.equals("20")){ 
                            	   
                            	   query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND  branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                               }
                               if(bNo.equals("30")){ 
                            	   
                            	   query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND  branchNo in(30,31,53,32,11)";
                               }
                               if(bNo.equals("10")){  
                            	   query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND  branchNo in(10)";
                               }
                               if(bNo.equals("54")){  
                            	   query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND  branchNo in(54,44)";
                               }
                               if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90") || bNo.equals("54"))){ 
                            	   query = "SELECT distinct relationnumber,`typename`,`isptype` FROM `consumptionreportmaster` where   group_name IS NULL AND  branchNo ='"+bNo+"'";
                               }
                               
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query);
                              %>
                
	              <%while(rs1.next()){%>
	               <%=++number%>.<input type="checkbox" name="relationNumber" id="id<%=++number1%>" value="<%=rs1.getString("relationnumber")%>"><%=rs1.getString("relationnumber")%>&nbsp; &nbsp;<%=rs1.getString("isptype")%>&nbsp; &nbsp;<%=rs1.getString("typename")%><br>
			     
    	            <%}%> 
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con1.close();
                            	}%>
		
		</div> 
		</td>			<input type="hidden" name="number" id="number" >
		</tr>
        <tr>
        <td colspan="2" align="center"> 
           <input type="submit" value="SUBMIT" name="save3" id="save1" onclick="return validate()"/> &nbsp &nbsp &nbsp &nbsp
           <a href="DisplayConsumptionGroupMaster.jsp" onclick="return popitup('DisplayConsumptionGroupMaster.jsp')">VIEW ALL</a> 
         </td>
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