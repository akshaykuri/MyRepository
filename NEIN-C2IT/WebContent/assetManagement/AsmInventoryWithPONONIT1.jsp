<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="banner.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- <link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script> -->

<title>Asset Inventory</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#idInvDate" ).datepicker({ dateFormat: 'dd-M-yy' });
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
<!--  vijay changes -->

<script type="text/javascript">  
 function sendInfo(v)  
           {  
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
    	    var url="featchFullVendorDetails.jsp";  
    		    url +="?pordernon=" +v;
    		   
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str2=xmlHttp.responseText;
                             // alert("here");
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idPODate").value =  document.getElementById("p1").value;
                             document.getElementById("idabc6").value =  document.getElementById("p2").value;
                      		 document.getElementById("idabc7").value =  document.getElementById("p3").value;
                      		 document.getElementById("idabc8").value =  document.getElementById("p4").value;
                      		 document.getElementById("pono").value =  document.getElementById("p5").value;
                      		 
                      		 }
             } 
</script>

<script>
function sync(textbox)
{
 document.getElementById('idabc4').value = textbox.value;
}
function CalExp(selectBox,second)
{
	var podate1=document.getElementById('idInvDate').value;
	var calcval = null;
	var start_date = document.getElementById('idInvDate').value;;
	var term = selectBox.value;  // Is text value
	var set_start = start_date.split('-');  
	var day = set_start[0];
	var month = (set_start[1]);  // January is 0 so August (8th month) is 7
	 if (month == "Jan")
     {
         month="0";
     }
     if (month == "Feb")
     {
         month="1";
     }
     if (month == "Mar")
     {
         month="2";
     }
     if (month == "Apr")
     {
         month="3";
     }
     if (month == "May")
     {
         month="4";
     }
     if (month == "Jun")
     {
         month="5";
     }
     if (month == "Jul")
     {
         month="6";
     }
     if (month == "Aug")
     {
         month="7";
     }
     if (month == "Sep")
     {
         month="8";
     }
     if (month == "Oct")
     {
         month="9";
     }
     if (month == "Nov")
     {
         month="10";
     }
     if (month == "Dec")
     {
         month="11";
     }
     var year = set_start[2];
  	var datetime = new Date(year, month, day);
	var newmonth = (parseInt(month) + parseInt(term));  // Must convert term to integer
	var newdate = datetime.setMonth(newmonth);
	newdate = new Date(newdate);
	day = newdate.getDate();
	month = newdate.getMonth() + 1;
	year = newdate.getFullYear();
	var daysInMonths = [
	                    "01", "02", "03","04", "05", "06", "07","08", "09", "10","11", "12","13", "14","15", "16","17", "18","19", "20","21", "22","23", "24","25", "26","27", "28","29", "30","31"
	                  	];
	var monthNames = [
	                  "01", "02", "03","04", "05", "06", "07","08", "09", "10","11", "12"
	                  ];
	day = newdate.getDate();
	month = newdate.getMonth();
	year = newdate.getFullYear();
	var newdate1=daysInMonths[day]+ '-' + monthNames[month] + '-' + year;    	
	document.getElementById(second).value = newdate1;
}
</script>


<!-- vijay changes end here -->
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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-body {
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
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
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

</head>


<script type="text/javascript"> // scriptfor sysdate // body onloade()

function sendInfo1(v,first)  
{  
	//alert(v+" ::::: "+first);//document.getElementById(second).value);
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
	//var second1=first;
	 var url="assetNoDetails.jsp";  
	    url +="?assetNoCheck=" +v;
	   document.getElementById(first).value="0";
	    xmlHttp.onreadystatechange =function getInfo1(){  
	  		  			//alert("vijay  "+first);
	    				if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	    		                 { 
	    		  		            var str2=xmlHttp.responseText;
	    		  		          //  alert("hello");
	    		               		document.getElementById("resultFromAjax2").innerHTML = str2;
	    		                	 var flag=document.getElementById("p6").vlaue;
	    		                	 alert("Please select the different Asset NO and  Asset NO is already assigned  for Inventory "+document.getElementById("p1").value);
	    		               		 document.getElementById("idflag").value=document.getElementById("p6").value;
	    		               		 document.getElementById(first).value=document.getElementById("p6").value;
	    		            	 }
	    			}
	    		   
	    ;
//	    document.getElementById(second).value="1";
	    xmlHttp.open("GET", url, true);   
	    xmlHttp.send(null);    
  }  

  	
 

function myFunction()
    {
			var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			var date = new Date();
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
			
			document.getElementById('demo').value = today;
			document.getElementById('idwpo').checked=true;
			document.getElementById('idwipo').checked=false;
			document.getElementById("idabc4").disabled = false;
		    document.getElementById("idPODate").disabled = false;
		    document.getElementById("idabc4").focus();
		    document.getElementById("idabc4").value =null;
		    document.getElementById("idabc5").value=null;
		    document.getElementById("idabc6").value =null;
		    document.getElementById("idabc7").value =null;
		    document.getElementById("idabc8").value=null;
		    document.getElementById("idabc9").value =null;
		    document.getElementById("idPODate").value =null;
		    document.getElementById("idInvDate").value=null;
		   }
</script>

<script type="text/javascript"> // script for validate field
function validatefield()
    {
			
			 var mri=document.form1.mrScanCopy;
             var file_selected = false;
             var fileName = mri.value;
             var mrext = fileName.substring(fileName.lastIndexOf('.') + 1);
                if(mrext=='')
                  {
               	   alert("Please Browse MR Scanned File to upload "+mrext);
               	   mri.focus();
                	 return false;
                  }
             	                  
             var poi=document.form1.poScanCopy;
                 file_selected = false;
                 fileName = poi.value;
             var poext = fileName.substring(fileName.lastIndexOf('.') + 1);
                if(poext=='')
                  {
               	   alert("Please Browse PO Scanned File to upload "+poext);
               	   poi.focus();
                	 return false;
                  }
            	 var invi=document.form1.invScanCopy;
                 file_selected = false;
                 fileName = invi.value;
                var invext = fileName.substring(fileName.lastIndexOf('.') + 1);
                if(invext=='')
                  {
               	   alert("Please Browse Invoice Scanned File to upload "+invext);
               	invi.focus();
                	 return false;
                  }
           	var  p;
			var pono=document.getElementById("idabc4").value;
			var pod=document.getElementById("idPODate").value;
			var invno=document.getElementById("idabc5").value;
			var vnm=document.getElementById("idabc8").value;
			var vmob=document.getElementById("idabc7").value;
			var vadd=document.getElementById("idabc6").value;
			var invdate=document.getElementById("idInvDate").value;
			var invamt=document.getElementById("idabc9").value;
			var count=document.getElementById("count").value;
			
			if((pono==null || pono==""))
				{
					alert("Please Select po no..");
					idpo.focus();
			        return false;
				}
		
			 if(invno==null || invno == "")
			    {
				  	  alert("Please enter invoice no..");
				  	  idabc5.focus();
			       	 return false;
			    }
		     if(vnm==null || vnm=="")
		        {
			        alert("Please enter vendor name..");
			        idabc6.focus();
			        return false;
		        }
		      if(vmob==null || vmob=="")
		        {
			        alert("Please enter vendor mob no..");
			        idabc7.focus();
			        return false;
		        }
		      if(vadd==null || vadd=="")
			    {
				   	alert("Please enter vendor address..");
				   	 idabc8.focus();
			       	 return false;
			    }
		     if(invdate==null || invdate=="")
		        {
			        alert("Please enter Invoice date..");
			        idInvDate.focus();
			        return false;
		        }
		   	if(invamt==null || invamt=="")
		        {
			        alert("Please enter invoice amount..");
			        idabc9.focus();
			        return false;
		        } 
			if(count==0)
			   {
				  	 alert("Please enter item details..");
				 	  return false;
			   } 
			else
				{
					for(p = 1; p <=count; p++)
			      	 {
						var astno='assetNo'+p;
						var assetflag='testflag'+p;
						var x = 'idAsType'+p;
						var y = 'branchName'+p;
						var a = 'idWar'+p;
						var b = 'idWarExpDate'+p;
						var c = 'idremarks'+p;
						var assetNoValidate=document.getElementById(astno).value;
						var duplicate=document.getElementById(assetflag).value;
						if(duplicate=='1'){
							alert("Already Inventory done of given Asset No...");
				    		 return false;
						}
						if(assetNoValidate=="")
				    	 { alert("Please enter the  Asset No...");
				    		 return false;
				    	 }
						else{
							for(var v=p+1;v<=count;v++)
							{
								
								 var nextAsset='assetNo'+v;
								 var nextValue=document.getElementById(nextAsset).value;
								 if(nextValue == assetNoValidate)
									 {
										 alert("Duplicate Asset No Entery...");
						    			 return false;
						    	 	 }
							}	
						}
				       var astType = document.getElementById(x).value;
					    if(astType=="Select")
					    	 { alert("Please slect the Asset Type...");
					    		 return false;
					    	 }
					    var branch = document.getElementById(y).value;
						if(branch=="Select")
				    		 {
								alert("Please slect the Baranch Name...");
				    			 return false;
				    	 	}
						var war = document.getElementById(a).value;
					    if(war=="Select")
				    	 { alert("Please slect the Warranty...");
				    		 return false;
				    	 }
					    var warexpd = document.getElementById(b).value;
						if(warexpd=="")
				    	 {
							alert("Please slect the Warranty Expiry Date...");
				    		 return false;
				    	 }
						var rem = document.getElementById(c).value;
						if(rem=="")
				    	 { alert("Please enter the remarks..");
				    		 return false;
				    	 }
						}
				}
		 }
</script>

<script>
function popitup1(url)
        {
		//newwindow=window.open(url,'name','fullscreen=yes,height=,width=,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus();}
		return false;
	    }
</script>



<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) {
   evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
      return true;
    }
</script>


<body onload="myFunction()">
	<form method="post" action="asmInvDBNONIT.jsp" 
		name="form1" id="form" enctype="multipart/form-data" >
		<input type="hidden" id="idflag" name="idflag" value="0" />
		<%
			System.out.println("------------- NON-IT Asm Inventory with Po1 -----------------");
			String pono = request.getParameter("po");
		%>
		<br>
		<br>
		<table width="1118" align="center" border="0" cellspacing="0"
			cellpadding="0">
			<tr align="center">
				<td width="1000" align="left"><img src="../images/nippon.gif"
					height="35" width="220"></td>
				<td width="115" align="right"><img src="../images/cs-soft.jpg"
					height="30" width="100"></td>
			</tr>
			<tr align="center">
				<td bgcolor="#ec691f" colspan="2"><strong><font
						size="4" color="white"><b>WELCOME</b> <br /> </font>
				</strong>
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="#2f4377" colspan="2"><strong><font
						size="4" color="white">ASSET MANAGEMENT</font>
				</strong>
				</td>
			</tr>
			<tr>
				<td bgcolor=""><font size="2">NAME :<%=session.getAttribute("Nname")%>
				</font>&nbsp;&nbsp; <font size="2"> DEPARTMENT : <%=session.getAttribute("desg")%>
				</font>
				</td>
			</tr>
		</table>

		<div class="modal-content">
			<div class="modal-header">
				<center>
					<h2>NON-IT ASSET INVENTORY WITH PO FORM</h2>
				</center>
			</div>
			<div class="modal-body">

				<center>
					<table width="75%" border="1" style="height: 150;" cellspacing="0"
						cellpadding="0" bgcolor="lightgrey">
						<tr>
							<td colspan="2"><font size="2" face="Swiss" id="hiderow"
								align="right">Date&nbsp;</font> <input type="text" name="abc3"
								placeholder="System current date" maxlength="20" id="demo"
								value=" " size=11 readonly /></td>
						</tr>

						<tr>
							<td height="21" align="left" width="103">
								<table>

									<tr>
										<td><font size="2" face="Swiss" id="hiderow"><font
												color="red" size="4">*</font>PO&nbsp;No.</font>
										<td><input type="text" name="abc4" maxlength="20"
											id="idabc4" value="<%=pono%>" readonly size=15 /> <%
										 	int qty = 0, ii = 0;
										 	Connection con2v = null;
										 	String url2v = "jdbc:mysql://localhost:3306/";
										 	String db2v = "nepldb";
										 	String driver2v = "com.mysql.jdbc.Driver";
										 	String userName2v = "root";
										 	String password2v = "";
										 	Statement st2v = null;
										 	ResultSet rs2v = null;
										 	java.sql.Date podate = null;
										 	String vendor_Name = null;
										 	String vendor_Mobile_Number = null;
										 	String vendor_Address = null;
										 	try {
										 		Class.forName(driver2v).newInstance();
										 		con2v = DriverManager.getConnection(url2v + db2v, userName2v,
										 				password2v);
										 		String query2v = "select * from po where pordernon='" + pono
										 				+ "'";
										 		st2v = con2v.createStatement();
										 		rs2v = st2v.executeQuery(query2v);
										 		while (rs2v.next()) {
										 			podate = rs2v.getDate("po_date");
										 			vendor_Name = rs2v.getString("textarea1");
										 			vendor_Mobile_Number = rs2v.getString("tarea22");
										 			vendor_Address = rs2v.getString("VendorText");
										 			//System.out.println("Values"+vendor_Name);
										 		}
										 	} catch (SQLException ex1) {
										 		ex1.printStackTrace();
										 	} finally {
										 		/* DbUtil.closeDBResources(rs,st,con); */
										 		con2v.close();
										 	}
										 %>
										</td>
									</tr>
									<tr>
										<td><font size="2" face="Swiss" id="hiderow"><font
												color="red" size="4">*</font>PO Date :</font>
										</td>
										<td><input type="text" style="width: 6em" name="idPoDate"
											value="<%=podate%>" readonly id="idPODate">
										</td>
									</tr>
								</table></td>
							<td height="21" align="left" width="103">
								<table>
									<tr>
										<td>
											<table>
												<tr>
													<td><font size="2" face="Swiss" id="hiderow"><font
															color="red" size="4">*</font>Invoice &nbsp;No. :</font>
													<td><input type="text" name="abc5" maxlength="99"
														id="idabc5" value="" size=20 />
													</td>
												</tr>
												<tr>
													<td><font size="2" face="Swiss" id="hiderow"><font
															color="red" size="4">*</font>Invoice &nbsp;Date :</font>
													<td><input type="text" name="idInvDate" id="idInvDate"
														placeholder="Date" value=""> <!-- <input type="text"  style="width: 6em"  name="idInvDate" value="" id="idInvDate" onclick="showCalendarControl(this)" > -->
													</td>
												</tr>
											</table></td>
										<td>
											<table>
												<tr>
													<td><font size="2" face="Swiss" id="hiderow"><font
															color="red" size="4">*</font>Invoice &nbsp;Amount :</font>
													<td><input type="text" name="abc9" maxlength="99"
														id="idabc9" value="" size=20 />
													</td>
													<td><font size="2" face="Swiss" id="hiderow">Vendor
															&nbsp;Name :</font>
													<td><input type="text" name="abc8" maxlength="99"
														id="idabc8" value="<%=vendor_Address%>" readonly size=20 />
													</td>
												</tr>
												<tr>
													<!-- <td><font size="2" face="Swiss" id="hiderow"> Finance Asset NO :</font></td>
													<td><input type="text" name="abc10" maxlength="99" id="idabc10" value="" size=20 /></td> -->
													<td><font size="2" face="Swiss" id="hiderow">Vendor
															Mob &nbsp;No. :</font>
													<td><input type="text" name="abc7" maxlength="99"
														id="idabc7" value="<%=vendor_Mobile_Number%>" readonly size=20 />
													</td>
													<td><font size="2" face="Swiss" id="hiderow">Vendor
															&nbsp;Address :</font>
													<td><input type="text" name="abc6" maxlength="99"
														id="idabc6" value="<%=vendor_Name%>" readonly size=20 />
													</td>
												</tr>
											</table></td>
									</tr>
								</table></td>
						</tr>
					
					</table>
					<br>

					<table width="75%" border="1" style="height: 150;" cellspacing="0"
						cellpadding="0" bgcolor="lightgrey">
						<tr>
							<td colspan="9"><center>
									<font size="5" face="Swiss" id="hiderow">Enter Item
										Details
								 </font></center>
							</td>
						</tr>
						<tr>

							<td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
							<!--  <td>Group </td>
						     <td>Model</td>
							 <td>Serial</td>
						    -->
							<td><font size="2" face="Swiss" id="hiderow">Asset
									Name</font></td>
							<td><font size="2" face="Swiss" id="hiderow"><font
									color="red" size="4">*</font>A/C. Asset No.</font>
							</td>
							<td><font size="2" face="Swiss" id="hiderow"><font
									color="red" size="4">*</font>Asset&nbsp;Type</font>
							</td>
							<td><font size="2" face="Swiss" id="hiderow"><font
									color="red" size="4">*</font>Branch&nbsp;</font>
							</td>
							<td><font size="2" face="Swiss" id="hiderow"><font
									color="red" size="4">*</font>Warranty</font>
							</td>
							<td><font size="2" face="Swiss" id="hiderow"><font
									color="red" size="4">*</font>Warranty Exp&nbsp;Date</font>
							</td>
							<td><font size="2" face="Swiss" id="hiderow"><font
									color="red" size="4">*</font>Remarks</font>
							</td>
						</tr>
						<%
							Connection con21 = null;
							String url21 = "jdbc:mysql://localhost:3306/";
							String db21 = "nepldb";
							String driver21 = "com.mysql.jdbc.Driver";
							String userName21 = "root";
							String password21 = "";
							// int sumcount=0;

							Statement st21 = null;
							ResultSet rs21 = null;
							String itemName = null;
							int sr = 0;
							try {
								Class.forName(driver21).newInstance();
								con21 = DriverManager.getConnection(url21 + db21, userName21,
										password21);
								// String query21 = "select * from potable where pordernon1='"+pono+"' ";
								//    String query211 = "select * from potable where pordernon1='"+pono+"' ";
								String query21 = "select Distinct mi.mr_itemHeader,p.itemQuantity from mr_item mi inner join potable p on (mi.mr_id=p.mr_idpo and mi.cence='CE' ) where p.pordernon1='"
										+ pono + "' ";
								st21 = con21.createStatement();
								rs21 = st21.executeQuery(query21);
								// st211 = con21.createStatement();
								// rs211 = st211.executeQuery(query211); 

								while (rs21.next()) 
								{
										qty = Integer.parseInt(rs21.getString(2));
										while (ii < qty) 
										{
											sr = sr + 1;
											/*   if(rs211.next())
										    { */
											%>
										 	 <tr>
													<td><font size="2" face="Swiss" id="hiderow"><%=sr%></font>	</td>
													<td><input type="text" id="assetName<%=sr%>" name="assetName" readonly value="<%=rs21.getString(1)%>"></td>
													<td><input type="hidden" id="testflag<%=sr%>"
													name="testflag<%=sr%>" value="0" /> <input type="text"
													name="assetNo" placeholder="please enter asset no" maxlength="99" id="assetNo<%=sr%>"
													value=""  size=20	onkeyup="sendInfo1(this.value,'testflag<%=sr%>')" /></td>
													<td>
												<%
													Connection con2 = null;
																String url2 = "jdbc:mysql://localhost:3306/";
																String db2 = "csdb";
																String driver2 = "com.mysql.jdbc.Driver";
																String userName2 = "root";
																String password2 = "";
																// int sumcount=0;
																Statement st2 = null;
																ResultSet rs2 = null;
																try {
																	// id="branchName"
																	Class.forName(driver2).newInstance();
																	con2 = DriverManager.getConnection(url2 + db2,
																			userName2, password2);
																	String query2 = "select * from asset_type where it_nonit='NON IT' ";
																	st2 = con2.createStatement();
																	rs2 = st2.executeQuery(query2);
												%> <select name="astType" id="idAsType<%=sr%>">
													<option selected="selected">Select</option>
													<%
														while (rs2.next()) {
													%>
													<option value="<%=rs2.getString(3)%>">
														<%=rs2.getString(3)%></option>
													<%
														}
													%>
																	</select> <%
										 	} catch (SQLException ex1) {
										 					ex1.printStackTrace();
										 				} finally {
										 					/* DbUtil.closeDBResources(rs,st,con); */
										 					con2.close();
										 				}
										 %>
																	</td>
										    		<td>
											<%
												Connection con = null;
															String url22 = "jdbc:mysql://localhost:3306/";
															String db22 = "csdb";
															String driver22 = "com.mysql.jdbc.Driver";
															String userName22 = "root";
															String password22 = "";
															// int sumcount=0;
															Statement st = null;
															ResultSet rs = null;
															try {
																// id="branchName"
																Class.forName(driver22).newInstance();
																con = DriverManager.getConnection(url22 + db22,
																		userName22, password22);
																String query = "select * from branch_master_main ORDER BY m_b_name";
																st = con.createStatement();
																rs = st.executeQuery(query);
											%> <select name="branchName" id="branchName<%=sr%>">
												<option selected="selected">Select</option>
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
																		</select> <%
											 	} catch (SQLException ex) {
											 					ex.printStackTrace();
											 				} finally {
											 					//	DbUtil.closeDBResources(rs,st,con);
											 					con.close();
											 				}
											 %>
										</td>
									    			<td><select name="war" id="idWar<%=sr%>"
											onclick="CalExp(this,'idWarExpDate<%=sr%>')">
			
												<option value="Select">Select</option>
												<option value="0">0</option>
												<option value="3">3 Months</option>
												<option value="6">6 Months</option>
												<option value="12">1 Year</option>
												<option value="24">2 Year</option>
												<option value="36">3 Year</option>
												<option value="48">4 Year</option>
												<option value="60">5 Year</option>
												<option value="72">6 Year</option>
												<option value="84">7 Year</option>
												<option value="96">8 Year</option>
												<option value="108">9 Year</option>
												<option value="120">10 Year</option>
										</select></td>
									    <td><input type="text" style="width: 6em"name="warExp" value="" id="idWarExpDate<%=sr%>"></td>
										<td><input type="text" name="idremarks"maxlength="99" id="idremarks<%=sr%>" value="" size=28 /></td>
							         		</tr>
										  <%
											ii++;
										}//close ii
										ii=0;
								}// close for while sr
							%>
							
								<tr>
									<td> <input type="hidden" name="count" id="count" value="<%=sr%>"></td>
								</tr>
								
							<%	
							} catch (SQLException ex1) {
								ex1.printStackTrace();
							} finally {
								/* DbUtil.closeDBResources(rs,st,con); */
								con21.close();
							}
							%>
					</table>
					<br>
					<table width="75%" border="1" style="height: 150;" cellspacing="0"
						cellpadding="0" bgcolor="lightgrey">
						<tr>
							<td colspan="9"><center><font size="5" face="Swiss" id="hiderow">Upload Scanned Files </font></center></td>
						</tr>
						<tr>
							<td><font color="red" size="4">*</font>MR Scanned Copy :</td><td><input type="file" name="mrScanCopy" id="mrScanCopy" /></td>
						</tr>
						<tr>
							<td><font color="red" size="4">*</font>PO Scanned Copy :</td><td><input type="file" name="poScanCopy" id="poScanCopy" /></td>
						</tr>
						<tr>
							<td><font color="red" size="4">*</font>Invoice Scanned Copy :</td><td><input type="file" name="invScanCopy" id="invScanCopy" /></td>
						</tr>
						<tr>
							<td>Other Scanned Copy :</td><td><input type="file" name="otherScanCopy" id="otherScanCopy" /></td>
						</tr>
					</table>
				</center>
				<br>
				<center>
					<input style="font-size: 1" type="submit" value="SAVE" name="save3"
						onclick="return validatefield()" id="save1" /> <input
						type="button" onclick="history.go(0)" value="CANCEL" />
				</center>
				<br>
			</div>
		</div>
		<br>
		<table align="center" cellspacing="0" cellpadding="0" border="0"
			width="1118">
			<tr>
				<td width="1000" align="left"><a href="../HOME.jsp"><img
						src="../home12.jpg" border="0" height="35" width="35">
				</a>
				<address>
						<font size="2">HOME</font>
					</address></td>
				<td width="115" align="right"><a href="OtherPage.jsp?msg=1"><img
						src="../bakk.png" border="0" height="35" width="35">
				</a>
				<address>
						<font size="2">BACK</font>
					</address></td>
			</tr>
		</table>
		<table width="1118" align="center" border="0" cellspacing="0"
			cellpadding="0">
			<tr align="center">
				<td bgcolor="#2f4377" align="center"><strong><font
						size="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE
							LIMITED - GLOBAL LOGISTICS PROVIDER</font>
				</strong>
				</td>

			</tr>
		</table>
	</form>

	<div id="resultFromAjax2" style="display: none;"></div>
</body>
</html>