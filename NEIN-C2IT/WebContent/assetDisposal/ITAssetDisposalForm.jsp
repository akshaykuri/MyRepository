	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>

<script>
  $( function() {
    $( "#idauditDate" ).datepicker({ dateFormat: 'dd-mm-yy' });
    $( "#idPODate" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
</script>

<script type="text/javascript"> // scriptfor sysdate // body onloade()
function myFunction()
    {
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	var date = new Date();
	//document.getElementById('datepicker-13').value =null;
	//document.getElementById('datepicker-131').value =null;
	var day = date.getDate();
	var month = date.getMonth();
	var year = date.getFullYear();
	for(var i=0;i<12;i++)
		{
		if (i==month)
			 {
			var mo=months[i];
		    break;
			 }
		}
	
	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;
	var today =day+"-"+mo+"-"+year;
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	document.getElementById('DDate').value = today;
   }
   
   
function featchassetdisposal(v)  
{ 
	 alert(v);
	if (typeof XMLHttpRequest != "undefined")
		    {    
	   		 	 xmlHttp= new XMLHttpRequest();    
	   		 }
 	else if (window.ActiveXObject)
      {    
    	  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
		} 
 	if (xmlHttp==null)
	    {   
		    alert("Browser does not support XMLHTTP Request");   
		    return;     
		    }      
	    var url="featchassetdisposal.jsp";  
	    url +="?asset_no=" +v;
		xmlHttp.onreadystatechange = getInfo;  
		xmlHttp.open("GET", url, true);   
		xmlHttp.send(null);  
}  
function getInfo()
     {     
      var str2=xmlHttp.responseText;
      var matches=0;
      if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")//iddesg,iddept,idbranch,idcono
       { 
              // alert("here");//idname,iduid,idpass,idnmail
             document.getElementById("resultFromAjax2").innerHTML = str2;
             document.getElementById("assetBranch").value =  document.getElementById("BranchName").value;
             document.getElementById("assetInitiatedBy").value =  document.getElementById("InventoryDoneBy").value; 
             document.getElementById("IntiatedDept").value =  "IT"; 
             document.getElementById("assetSerialNo").value =  document.getElementById("serial_no").value;
             document.getElementById("assetModelNo").value =  document.getElementById("model_no").value;
             document.getElementById("disposalAssetType").value =  document.getElementById("assetname").value;
             document.getElementById("disposalDescription").value =  document.getElementById("Remarks").value;
     		 document.getElementById("assetSerialNo").value =  document.getElementById("serial_no").value;
             document.getElementById("disposalPONO").value =  document.getElementById("PoNo").value;
             document.getElementById("disposalPONODate").value =  document.getElementById("PoDate").value;
             document.getElementById("disposalPONOAmount").value =  document.getElementById("InvAmount").value;
         }
          
     } 
   
</script>


<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>Asset Disposal Form</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#disposalDate" ).datepicker({ dateFormat: 'dd-M-yy' });
    $( "#idPODate" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
</script>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
    {
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
    }
</script>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body 
    {
    padding: 2px 16px;
    background-color: #D3D3D3;
    }
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header {
     padding: 2px 16px;
     background-color: #D3D3D3;
     color: black;
     }
</style>
 <style>
.table {
	border: solid 1px #000; 
    border-collapse: collapse;
	}
.table td {
	border: solid 1px #000; 
	padding: 2px 10px;
	width: 100px;
	text-align: center;
	}

</style>
</head>
<body onload="myFunction()">
<form  method="post" onsubmit="return validatefield()" action="itAssetDisposalDB.jsp"  name="form1" id="form">

<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :  <%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2"> DEPARTMENT :  <%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2> IT ASSET DISPOSAL FORM </h2></center>
    </div>
    <div class="modal-body">
	<center>
		<table align="center" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey"	>
		<tr>
			<td colspan="3" align="center" >Asset Belongs to</td>
			<td>Date</td>
		</tr>
		<tr>
		<td>Branch</td>
		<td>Dept</td>
		<td>User Name</td>
		<td rowspan="2">
		<input type="text" name="DDate"  maxlength="20" id="DDate" value=" " size=11 readonly placeholder="System current date"/>
		</tr>
		<tr>
		<td>  
		<input type="text" name="assetBranch"  maxlength="20" id="assetBranch" value=" " size=11 readonly />
		<%-- <%Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                            // int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select * from branch_master_main  ORDER BY m_b_name";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branchName" class="branchName" onchange="featchassetdisposal(this.value);" >
							<option selected="selected">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
									
    						<%}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con.close();
					   }%>
		 --%>
		
		</td>
		<td> <input type="text" name="assetDept" id="assetDept"   /></td>
		<td> <input type="text" name="assetAssignedUser" id="assetAssignedUser" /></td>
		
			
		</tr>
		<tr>
		<td>Asset Disposal No.</td>
		<td>Asset No/Code</td>
		<td>Initiated By</td>
		<td>Department</td>
			
		
		</tr>
		<tr>
		<td> 
		
		
		
		
			<%
			Connection con1 = null;
                       String url1 = "jdbc:mysql://localhost:3306/";
                        String db1 = "csdb";
                        String driver1 = "com.mysql.jdbc.Driver";
                        String userName1 ="root";
                        String password1="";
                            // int sumcount=0;
                        Statement st1=null;
                        ResultSet rs1=null; 
                        int idval=0;
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver1).newInstance();
						con1 = DriverManager.getConnection(url1+db1,userName1,password1);
						String query1 = "SELECT max(id) as val FROM asset_disposal ";
						st1 = con1.createStatement();
 						rs1= st1.executeQuery(query1);
						while(rs1.next()){
							
							if(rs1.getString("val")==null)
							{
								idval=1;
							//	System.out.println("Idval ::::"+idval);
							}
							else{
								idval=Integer.parseInt(rs1.getString("val"));
								idval=idval+1;
							//	System.out.println("Idval ::::"+idval);
							}
						}
						%>
						<input type="text" name="assetDisposalNo"  id="assetDisposalNo" value="<%=idval%>" >
						<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con1.close();
					   }%>
		</td>
		
		
		
		<td> 
			<%Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                            // int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "SELECT * FROM `asset_item` where( `assignStatus`=0 && `Scrap`=0 && `Maintanance`=0)  ORDER BY BranchName";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="assetNoDisposal" id="assetNoDisposal"class="assetNoDisposal" onchange="featchassetdisposal(this.value);" >
							<option selected="selected">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(3)%>"><%=rs.getString(3)%></option>
									
    						<%}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con.close();
					   }%>
		</td>
			
		<td> <input type="text" name="assetInitiatedBy" id="assetInitiatedBy" ></td>
									  
		<td> <input type="text" name="IntiatedDept"  id="IntiatedDept"  /></td>
		</tr>
		<tr>
		<td>Asset Serial No.</td>
		<td>Make /Model</td>
		<td colspan="2" align="center">Purchase Details</td>
		</tr>
		<tr>
		
		<td> <input type="text" name="assetSerialNo"  id="assetSerialNo" /></td>
		<td> <input type="text" name="assetModelNo"  id="assetModelNo"  /></td>
		<td colspan="2" align="center" >
		
		<table align="center" width="85%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
		<tr>
		<td> 
		PO.No.
		</td>
		
		<td>
		PO.Date.
		</td>
		
		<td>
		Purchase Value.
		</td>
		</tr>
		<tr>
		<td> <input type="text" name="disposalPONO" id="disposalPONO"  /></td>
		<td> <input type="text" name="disposalPONODate" id="disposalPONODate"   /></td>
		<td> <input type="text" name="disposalPONOAmount"  id="disposalPONOAmount" /></td>
		</tr>
		</table>
	 </td>
		</tr>
		<tr>
		
		<td>Asset Name / Type</td>
		<td colspan="3" align="center">Description of asset</td>
	
		
		</tr>
		
		
		
		<tr><td> <input type="text" name="disposalAssetType"  id="disposalAssetType"  size=15 /></td>
		
		<td colspan="3" align="center"> <textarea rows="2" cols="50"  name="disposalDescription" id="disposalDescription" ></textarea></td>
		</tr>
		<tr>
		<td colspan="4" align="center" >DISPOSAL</td>
		</tr>
		<tr>
		<td colspan="2" align="center" >Reason for Disposal </td>
		<td>Disposal Date</td>
		<td>Disposal Consideration</td>
			
		</tr>
		<tr><td colspan="2" align="center" > <textarea rows="2" cols="30"  name="disposalReason" id="disposalReason"  ></textarea></td>
	
		<td> 
		
		<input type="text" name ="disposalDate" class="txtCalendar2" placeholder="Date" value="" id="disposalDate" >
		</td>
		<td> <textarea rows="2" cols="30"  name="disposalConsidaration" id="disposalConsidaration" ></textarea></td>
			</tr>
		<tr>
		<td colspan="2" align="center">Disposal Initiated By</td>
		<td colspan="2" align="center">Disposal Approved by</td>
		</tr>
		<tr>
		<td colspan="2" align="center"> <input type="text"  id="disposalInitiatedBY1" name="disposalInitiatedBY1" value="<%=session.getAttribute("Nname")%> "/></td>
		<td colspan="2" align="center"> <input type="text"  id="disposalApporvedBY" name="disposalApporvedBY" /></td>
		</tr>
		<tr>
		<td colspan="1">Remarks :</td>
		<td colspan="3" ><textarea rows="2" cols="50"  name="disposalRemarks" id="disposalRemarks" value="" ></textarea></td>
		</tr>
		<tr><!-- <td colspan="1" >For HO Account Dept Only :</td>
		<td colspan="3" ><textarea rows="2" cols="50"  name="disposalAccountRemarks" id="disposalAccountRemarks" value="" ></textarea></td>
		 -->
		 <td colspan="4"> 
		        Approval Request Send To:  
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		        <select name="nextAppdetails" id="nextAppdetails" >
		          <option value="Select">Select</option>
		     <%           
		      String loginUser=(String)session.getAttribute("empid");
		    	  System.out.println(session.getAttribute("empid")+" :: "+loginUser);
		     Connection cn001 = null;
		     Statement st002=null;
             ResultSet rs002=null; 
					     String url21 = "jdbc:mysql://localhost:3306/";
					     String db21 = "leavemanagement";
					     String driver21 = "com.mysql.jdbc.Driver";
					     String userName21 ="root";
					     String password21="";
					     Class.forName(driver21).newInstance();
					     cn001 = DriverManager.getConnection(url21+db21,userName21,password21);
					     st002=cn001.createStatement(); 
					     
					     int aa=0;
					     String ro=null;
					     String sro=null;
		     
					     st002=cn001.createStatement();
					     rs002 = st002.executeQuery(" SELECT DISTINCT u.user_name,u.emp_id,b.branch_name, m3.emp_id AS m1id,m3.user_name " +
									              " AS manager_name,m3.email as email1, m6.role_id, m4.user_name AS manager2_name,m4.email as email2,m7.role_id, " +
									              " m4.emp_id AS m2id FROM user u "+
									              " INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id " +
									              " INNER JOIN user_role m5 ON m5.user_id = u.user_id "+
									              " INNER JOIN branchmaster b ON b.branch_id = u.branch_id " +
									              " INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER " +
									              " JOIN user_role m6 ON m3.user_id = m6.user_id "+
									              " INNER JOIN user m4 ON m4.user_id = m1.manager2_id " +
									              " INNER JOIN user_role m7 ON m4.user_id = m7.user_id "+
									              " WHERE m1.emp_id ='"+loginUser+"' AND u.employee_status = 'yes' "); 
					    		            		   
		           while(rs002.next()){ 
		        	   ro=rs002.getString("m1id")+","+rs002.getString("manager_name")+","+rs002.getString("email1");
		        	   sro=rs002.getString("m2id")+","+rs002.getString("manager2_name")+","+rs002.getString("email2");
		            %>	   
		               <option value="<%=ro%>"><%=rs002.getString("manager_name")%></option>
		               <option value="<%=sro%>"><%=rs002.getString("manager2_name")%></option>  
		           <%}%>
		       </select> 
		      <br>
		  </td>
		 
		 </tr>
		</table>
		
		
		
	 	
<!-- Scanned files update here  -->

	<!-- <table width="75%" border="1" style="height: 150;" cellspacing="0"
						cellpadding="0" bgcolor="lightgrey">
						<tr><td colspan="9"><center><font size="5" face="Swiss" id="hiderow">Upload Supporting Documents </font></center></td></tr>
						<tr><td><font color="red" size="4">*</font>Audit Document :</td><td><input type="file" name="mrScanCopy" id="mrScanCopy"/></td></tr>
						<tr><td>Other Scanned Copy :</td><td><input type="file" name="otherScanCopy" id="otherScanCopy" /></td></tr>
	</table> -->

</center>
                           
	                          	 <br>
	                          	 <center>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(0)" value="CANCEL" />
		                             </center>
		                             <br>
             
    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="/assetManagement/OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 

</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>
</body>
</html>