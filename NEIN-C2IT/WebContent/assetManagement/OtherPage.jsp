<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %> 
<%@page import="CON2.DbUtil"%>
<%@ page import="java.io.*"%>
<%@page language="java"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CON2.Connection2"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu-v.css" />
<script language="javascript" type="text/javascript" src="../js/popWindowAtCenter.js"></script>
<script type="text/javascript">
</script>
<script  type="text/javascript">
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
<script type="text/javascript" src="../API/Js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});

</script>
<script type="text/javascript" language="javascript">
function openPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	     //  var ref = window.open('http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	     var ref = window.open('http://localhost:8180/NEIN-C2IT/ITSupportHelpPage.jsp', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}
function openHelpPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	       var ref = window.open('http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   //  var ref = window.open('http://localhost:8180/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}
</script>
<script type="text/javascript" language="javascript">
 window.onload=blinkOn;
 var t=null,y=null;
function blinkOn()
{
   t = document.getElementById("blink").style.color="#FF0000";
  
  setTimeout("blinkOff()",1000);
}
 
function blinkOff()
{
   y = document.getElementById("blink").style.color="white";
  setTimeout("blinkOn()",1000);
}
function blinkOff1()
{
  y= document.getElementById("blink").style.color="black";
  setTimeout("blinkOff()",1000);
}
function blinkOff2()
{
	 document.getElementById("blink").style.color="black";
	setTimeout("blinkOff1()",100000000);
	clearTimeout(y);
}
</script>
<title>Welcome to HO</title>
<%
String city_no=null;
String city= null,department=null;
city_no = (String) session.getAttribute("b_no");
city = (String) session.getAttribute("city");
department = (String) session.getAttribute("department");
String[] parts = city.split("-");
String part1 = parts[0]; // 004
String part2 = parts[1];
System.out.println("System Check Sheet Branch Number :"+city_no);
%>
</head>
<%
Connection conn=null;
Statement st=null;
ResultSet rs=null;
int flag=0;
String remarks=null,sentby_name=null;
try 
      {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
      //s_no,s_date,customer,s_person,s_add,s_contact,s_mail,s_web,s_sExecutive,s_industry,
      //String query = "SELECT complain_id,cm_name,emp,cm_type,cm_problem,cm_location,cm_status  FROM complain_master_item WHERE emp='"+req+"' AND cm_date='"+cs_date+"'";
      String query = "SELECT remarks,sentby_name FROM sendingMail_it_support";
      st = conn.createStatement();
      rs = st.executeQuery(query);
      while(rs.next())
           {
	       flag=1;
           remarks = rs.getString(1);
           sentby_name = rs.getString(2);
           }
%>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<form>
<div id="id">
 <table>
      <tr>
         <td>
             <img src="../images/nippon.gif" height="35" width="220"> 
         </td>
         <td align="right">
              <img src="../images/cs-soft.jpg" height="30" width="100" hspace="796" >
         </td>
         </tr>
</table>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr align="center">
            <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>CONNECT TO IT(C2IT)</b><br /></font></strong>
           </td>
     </tr>
     <tr align="center">
          <td bgcolor="#2f4377"><strong><font size ="4" color="white"><%=part1 %></font></strong></td></tr>
</table>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr align="center">
<td align="left"><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
               <%--  <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>&nbsp;&nbsp; --%>
                <font size ="2">BRANCH :<%= session.getAttribute( "city" )%></font>&nbsp;&nbsp;
                 <%--         <font size ="2">RIGHTS :<%= session.getAttribute( "rights" )%></font> --%>
               </td>
                <td align="right">
                   <a href="../feedbackComplaintUser.jsp?msg=1" onclick="return popitup2('../feedbackComplaintUser.jsp?msg=1')" id="hiderow"><img width="35" src="../images/doubt.jpg">Feedback</a>
                   <a href="../Attendence/availability.jsp?msg=1" onclick="return popitup2('../Attendence/availability.jsp?msg=1')" id="hiderow"><img width="35" src="../images/yesno.jpg">Availability</a>
                   <a href="../thoughtMaster.jsp?msg=1" onclick="return popitup2('../thoughtMaster.jsp?msg=1')" id="hiderow"><img width="35" src="../images/face.jpg">Message</a>
                   <a href="../change_pwdHO.jsp?msg=1" onclick="return popitup2('../change_pwdHO.jsp?msg=1')" id="hiderow"><img width="35" src="../images/passChange.jpg">Change Password</a>
                   <a href="#" onclick="openHelpPDF()"><img width="30" src="../images/help3.jpg"><font size ="2">Help</font></a>
                   <a class="a_link" href="../logout.jsp"><img width="30" src="../images/icon_log.png"><font size ="2">Logout</font></a>
               </td>
</tr> 
</table>


<table width="1000" height="310" border="0" cellpadding="0" cellspacing="0" ID="Table1">
   <tr>
       <!-- <td width="360" align="justify" valign="top"></td>
       <td width="360" align="justify" valign="top"></td>
       <td width="60" align="justify" valign="top"></td> -->
       <td width="200"  >
  <%
  session.setMaxInactiveInterval(50*60);//seconds
  if(session==null||session.getAttribute( "Nname" )==null)
    {
	String msg2=null;
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("loginho.jsp?msg="+msg2);
   }
  %>
<br>
<div id="smoothmenu2" class="ddsmoothmenu-v">
<ul id="sidebarmenu1">
  <!--######################## THIS MODULE ADDED BY CHINTU KUMAR for office admin asset module####################### -->
  
<% System.out.println("Department Name:"+department);

if((department !=null) && (department.equals("OFFICE ADMINISTRATION")))            
	{
	%>
	    <li><a href="#">ASSET INVENTORY</a>
	 	          <ul><li><a href="AsmInventoryNONIT.jsp?msg=1">NON IT INVENTORY</a>
	 	                   <ul><li><a href="AsmInventoryWithPONONIT.jsp?msg=1">WITH PO(Auto)</a></li>
	 	                        <li><a href="AsmInventoryWithouthPONONIT.jsp?msg=1">MANUAL PO</a></li>
	 	                  </ul>
	 	              </li>
	 	             <!--  <li><a href="#">Upload Asset Details </a>
	 	              		<ul><li><a href="uploadAssetInventoryNONIT.jsp?msg=1">UPLOAD ASSET INVENTORY</a></li>
	 	                         <li><a href="uploadAssetItemNONIT.jsp?msg=1">UPLOAD ASSET ITEM</a></li>
	 	                 	</ul>
	 	              </li> -->
	 	         </ul>
	 	 </li>
	 	 
	 	 <li><a href="#">ASSET AUDIT</a>
	 	          <ul>
	 	               <li><a href="nonItAssetAudit.jsp?msg=1">NON IT ASSET AUDIT</a></li>
	 	               <li><a href="AsmInventory.jsp?msg=1">IT AUDIT REPORT</a></li>
	 	         </ul>
	 	      </li>
	 	 <%if((city_no !=null) && (city_no.equals("90"))) 
	 	          { %>
	 	          <li><a href="#">ASSIGN ASSET</a>
	 	               <ul>
		                  <li><a href="assignOtherAssetNONIT.jsp?msg=1">TO USER</a></li>
		                  <li><a href="assignAssetNONIT.jsp?msg=1">TO OFFICE</a></li>
		                  <!--  <li><a href="uploadEmpNONITAssetFile.jsp?msg=1">UPLOAD USER ASSET</a></li>
		                    <li><a href="uploadOfficeAssetNONIT.jsp?msg=1">UPLOAD OFFICE ASSET</a></li> -->
		              </ul>
		         </li>  
		         <li><a href="assetUpdateNONIT1.jsp?msg=1">ASSET UPDATE</a></li>   
		        <%} %> 
		        
	     	     <%if((city_no !=null) && (city_no.equals("90"))) 
	 	               { %>
		          <li><a href="assetTransferNONIT.jsp?msg=1">ASSET TRANSFER</a></li>
		         <!--  <li><a href="../assetDisposal/ITAssetDisposalForm.jsp?msg=1">ASSET DISPOSAL</a></li> -->
		          
		               <%} %> 
		                <li><a href="searchAssetNONIT.jsp?msg=1">SEARCH / REPORT ASSET</a></li>
		                
	 	          <li><a href="assetConfigUpdateNONIT.jsp?msg=1">UPDATE ASSET CONFIG</a></li>
	 	          
	 	          <li><a href="#">MASTER</a>
	                     <ul>
	                         <li><a href="assetTypeMasterNONIT.jsp?msg=1">ADD New Asset Type / Config</a></li>
	                     </ul>
	              </li>  
	 	          
		     
  
     <%}%>
  
   <!--######################## till here###################### -->
   <!--######################## THIS MODULE ADDED BY CHINTU KUMAR for system admin####################### -->
 
  <%
  if((department !=null) && (department.equals("IT SUPPORT")))            
	{%>
	 
	 	        <li><a href="#">ASSET INVENTORY</a>
	 	          <ul>
	 	               <li><a href="AsmInventory.jsp?msg=1">IT INVENTORY</a>
	 	                   <ul>
	 	                        <li><a href="AsmInventoryWithPO.jsp?msg=1">WITH PO(Auto)</a></li>
	 	                        <li><a href="AsmInventoryWithouthPO.jsp?msg=1">MANUAL PO</a></li>
	 	                  </ul>
	 	               </li>
	 	              <li><a href="AsmInventory.jsp?msg=1">Upload Asset Details </a><ul>
	 	                        
	 	                        <li><a href="uploadAssetInventory.jsp?msg=1">UPLOAD ASSET INVENTORY</a></li>
	 	                            <li><a href="uploadAssetItem.jsp?msg=1">UPLOAD ASSET ITEM</a></li>
	 	                  </ul>
	 	               </li>
	 	         </ul>
	 	      </li>
	 	      
	 	       <li><a href="#">ASSET AUDIT</a>
	 	          <ul>
	 	               <li><a href="itAssetAudit.jsp?msg=1">IT ASSET AUDIT</a></li>
	 	               <li><a href="AsmInventory.jsp?msg=1">IT AUDIT REPORT</a></li>
	 	         </ul>
	 	      </li>
	 	      <%if((city_no !=null) && (city_no.equals("90"))) 
	 	          { %>
	 	          <li><a href="#">ASSIGN ASSET</a>
	 	               <ul>
		                  <li><a href="assignOtherAsset.jsp?msg=1">TO USER</a></li>
		                  <li><a href="assignAsset.jsp?msg=1">TO OFFICE</a></li>
		                   <li><a href="uploadEmpITAssetFile.jsp?msg=1">UPLOAD USER ASSET</a></li>
		                    <li><a href="uploadOfficeAsset.jsp?msg=1">UPLOAD OFFICE ASSET</a></li>
		              </ul>
		         </li>  
		         <li><a href="assetUpdate1.jsp?msg=1">ASSET UPDATE</a></li>   
		        <%} %> 
		        
	     	     <%if((city_no !=null) && (city_no.equals("90"))) 
	 	               { %>
	 	               
	 	               <!-- <li><a href="../assetDisposal/ITAssetDisposalForm.jsp?msg=1">ASSET DISPOSAL</a></li> -->
		          <li><a href="assetTransfer.jsp?msg=1">ASSET TRANSFER</a></li>
		          <!-- <li><a href="../assetTransfer/ITAssetTransferForm.jsp?msg=1"> New ASSET TRANSFER</a></li> -->
		         <!--  <li><a href="assetReplace.jsp?msg=1">ASSET REPLACE / LINK</a></li> -->
		               <%} %> 
		                <li><a href="searchAsset.jsp?msg=1">SEARCH/REPORT ASSET</a></li>
		                <!-- <li><a href="newSearchForm.jsp?msg=1">New SEARCH/REPORT ASSET</a></li> -->
	 	          <li><a href="assetConfigUpdate.jsp?msg=1">UPDATE ASSET CONFIG</a></li>
		          <li><a href="#">MASTER</a>
	                     <ul>
	                         <li><a href="assetTypeMaster.jsp?msg=1">ADD New (Asset Type / Configuration)</a></li>
	                         <li><a href="assetISPmaster.jsp?msg=1">ADD New ISP</a></li>
	                         <li><a href="assetDCType.jsp?msg=1">ADD New Data Card Type</a></li>
	                          <li><a href="assetAccessBioType.jsp?msg=1">ADD Access / Biometric Type</a></li>
	                 <!--    <li><a href="#">ROUTING MASTER</a>
	                     <ul>
	                         <li><a href="../AssetMangApprover/mrApprover.jsp?msg=1">Approver Master</a></li>
	                         <li><a href="../AssetMangApprover/levelOfApprovar.jsp?msg=1">Level Master</a></li>
	                     </ul>
	                    
	              </li>  -->
	                     </ul>
	                     
	                     
	  
	              </li> 
	  
    
    <%}%>
  
  
                                  <!--##################################### TILL HERE ############################-->
  
  </ul> 
</div>
 
</td>
		<td  >
	<div style="margin-top:0%;overflow-y: scroll; margin-right:0%;height:150px;">
 			                   <table align="right" border="1"  bgcolor="#FFFFFF">
 			                   <tr><td colspan="6" bgcolor="Bisque"> <center><b>Asset Configuration Pending Asset List</b></center></td>
									</tr>
									<tr bgcolor="DarkKhaki "><td align="center">SL NO </td><td align="center"> Asset Name</td> <td align="center"> Asset No</td> <td align="center">Asset Type</td><td align="center"> Inventory No </td>  <td align="center">Update LINK</td></tr>
			


<% 
		                Connection con2v = null;
                        String url2v = "jdbc:mysql://localhost:3306/";
                        String db2v = "csdb";
                        String driver2v = "com.mysql.jdbc.Driver";
                        String userName2v ="root";
                        String password2v="";
                        Statement st2v=null;
                        ResultSet rs2v=null; 
                        java.sql.Date podate=null;
                        String vendor_Name=null;
                        String vendor_Mobile_Number=null;
                        String vendor_Address=null;
                        int srno=0;
                       try
                      	 {
                    		Class.forName(driver2v).newInstance();
							con2v = DriverManager.getConnection(url2v+db2v,userName2v,password2v);
							//String query2v="select * from po where pordernon='"+pono+"'";
							
							String query2v="SELECT distinct l.Nname, l.Nmail, i.`Inventory_No`, i.`Asset_No`,i.`assetname`, i.`AssetType`, i.`ConfigAddStatus` from asset_item i "+
							" Inner join `asset_inventory` ai on ai.`Inventory_No` = i.`Inventory_No` " +
							" Inner join `login` l on l.Nname = ai.`InventoryDoneBy` where i.`ConfigAddStatus` = '0' and l.b_no='"+city_no+"' ";
							
							st2v = con2v.createStatement();
 							rs2v = st2v.executeQuery(query2v);
 							 
						   while(rs2v.next()){
								
								if(srno==0)
								{%>
								<% 	}
								
								srno=1+srno;
							%>
							<tr><td><%=srno%></td><td ><%=rs2v.getString("assetname") %></td><td><%=rs2v.getString("Asset_No") %></td><td><%=rs2v.getString("AssetType") %></td><td><%=rs2v.getString("Inventory_No")%></td><td><a href="EditAssetConfigField.jsp?atype=<%=rs2v.getString("AssetType")%>&invno=<%=rs2v.getString("Inventory_No")%>&assetno=<%=rs2v.getString("Asset_No")%>">Edit</a></td></tr>
							<%	
						
						}
						}catch (SQLException ex1){
    											ex1.printStackTrace();
						}finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con2v.close();
					   }%></table></div>
	     </td>
</tr>
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="loginAssetPage.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
</td> 
</tr> 
</table> 



<%}catch(Exception e){}
finally{
	 DbUtil.closeDBResources(rs,st,conn);
}

%>


<div id="layer05_holder">


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 


 
</div>
 </div> <!--end wrapper-->
 
 
</form>
</body>
</html>