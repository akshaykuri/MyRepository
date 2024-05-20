<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Asset</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'dd-M-yy' });
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

<script type="text/javascript">
function branchDataFetch(str){  
	alert("Please select assign to sub branch also");
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                                       alert("Browser does not support XMLHTTP Request");   
                                       return;     
                                       }      
              
                         var url="branchFieldFeatch.jsp";  
                         url +="?b_name=" +str;   
                           xmlHttp.onreadystatechange = onstateChange1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                               

         function onstateChange1()
                {     
        	    //alert(xmlHttp.readyState);
        	    var str1=xmlHttp.responseText;
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                        { 
                        //alert("here str1 :"+str1);
                        document.getElementById("resultFromAjax1").innerHTML = str1;
                        document.getElementById("idbranchCode").value =  document.getElementById("v1").value;
                        document.getElementById("idbname").value =  document.getElementById("v2").value;
                        document.getElementById("idbranchAddrs").value =  document.getElementById("v3").value;
                        //alert(document.getElementById("v1").value );
                        }
                   else
                        {  //idbranchCode,idbranchPhNo,idbranchAddrs,idremarks1
                        document.getElementById("resultFromAjax1").innerHTML = str1;
                        document.getElementById("idbranchCode").value = "";
                        document.getElementById("idbranchPhNo").value =""; 
	                    document.getElementById("idbranchAddrs").value = "";
                        document.getElementById("idremarks1").value = "";
                        }
                
                }
               
</script>  
<script type="text/javascript">
function assetType(str){  
	//alert(str);
	//document.getElementById("idassetconf").value = "";
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="assetavailable5.jsp"; 
                    //alert (str);
                            url +="?AssetBranch=" +str;   
                         //   alert(url);
                           xmlHttp.onreadystatechange = assetavailable5;  
                        //   alert(assetavailable5);
                          xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                     function assetavailable5(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                  
                            		//alert(xmlHttp.responseText);
                            		document.getElementById("assetName").innerHTML=xmlHttp.responseText;    
                                   // document.getElementById("idname").value=xmlHttp.responseText;
                                  }
                            	
                           } 
</script>

<script type="text/javascript">
	 function featchsubBranch(str12){  
	 	//alert("Sub Branch str :"+str12);
	 	if (typeof XMLHttpRequest != "undefined"){    
	       xmlHttp= new XMLHttpRequest();    
	         }      else if (window.ActiveXObject){    
	           xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
	               }      if (xmlHttp==null){   
	                  alert("Browser does not support XMLHTTP Request");   
	                    return;     
	                     }       var url="subBranchFeatch.jsp"; 
	                     //alert (str);
	                             url +="?bno=" +str12;   
	                             //alert(url);
	                            xmlHttp.onreadystatechange = assetavailable123;  
	                            xmlHttp.open("GET", url, true);   
	                            xmlHttp.send(null);    
	          }     
	                      function assetavailable123(){  
	                    	  //alert("Sub branch :"+xmlHttp.responseText);
	                             	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	                                     document.getElementById("subbranch").innerHTML= xmlHttp.responseText;    
	                                    }
	                            } 
	 </script>
<!--  <script type="text/javascript">
function assetnofetch(str){  
	//alert(str);
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="assetavailable3.jsp"; 
                    //alert (str);
                            url +="?AssetType=" +str;   
                            //alert(url);
                           xmlHttp.onreadystatechange = assetavailable1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                     function assetavailable1(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                    document.getElementById("assetno").innerHTML=xmlHttp.responseText;    
                                      //  document.getElementById("idname").value=xmlHttp.responseText;
                                        	         //document.getElementById("idsubBranch").value=xmlHttp.responseText;
                                    }
                           } 
</script> -->
<script type="text/javascript">
function assetnofetch(str,br){  
	//alert(str + "::" +br);
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="assetavailable4.jsp"; 
                            url +="?AssetType=" +str + "&Branch="+br;   
                           //alert(url);
                           xmlHttp.onreadystatechange = assetavailable1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
          function assetavailable1(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                    document.getElementById("assetno").innerHTML=xmlHttp.responseText;    
                                  }
                           }
          </script>
<!-- <script type="text/javascript">
function assetFetch(str)
{  
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }  
	else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }  
	if (xmlHttp==null)
	{   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
   }      
	var url="assignAssetBack1.jsp"; 
    url +="?it_nonit=" +str;   
   	xmlHttp.onreadystatechange = onstateChange3;  
  	xmlHttp.open("GET", url, true);   
  	xmlHttp.send(null);    
   }     
   function onstateChange3(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
                                   document.getElementById("assetName").innerHTML=xmlHttp.responseText;  
                                    }
                           } 
</script> -->
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
    width: 62%;
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
<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) {
	//var x=document.getElementById("idempId").value;
    //alert(x);
    
   // alert("here");
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    
   /*  var l=x.toString().length();
  alert(l); */
    return true;
    }
</script>



<script type="text/javascript"> //  body onloade()
function cleartext()
    {
	
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;
		var today = year + "-" + month + "-" + day;
		//idCalendar, idaType,idano
		
	document.getElementById('demo').value = today;
	document.getElementById("idaType").value="Select";
    document.getElementById("idano").value ="Select";
    var dropDown=document.getElementById("idBranch");
    dropDown.selectedIndex = 0;
    document.getElementById("idbranchCode").value = "";
    document.getElementById("idbranchPhNo").value = "";
    document.getElementById("idbranchAddrs").value = "";
    document.getElementById("idremarks1").value = "";
    document.getElementById("datepicker").value = "";
   
    }
	</script>



	<script language = "Javascript">
function validate()
     {
	// var itsel = document.getElementsByName('it');
	 //alert(itsel);
	 var va=document.getElementById('idaType').value;
	 var va1=document.getElementById('idano').value;
	 var va2=document.getElementById('idbranchPhNo').value;
	 var ba=document.getElementById('idBranch').value;
	 var dat=document.getElementById('datepicker').value;
	 var sbran=document.getElementById('idsubbranch').value; 
	  //alert(sba);
   // alert(document.getElementById("idano").value);
    if (va=="Select")
          {
          alert("Please select Asset Type...");
          return false;
          }
    if (va1==-1 || va1=="Select")
          {
          alert("Please select Asset Number...");
          return false;
          }
   	if(ba=="Select")
          {
	      alert("Please select the branch");
          return false;
          }
    /*  if (va2=="")
              {
               alert("Please enter branch contact  Number...");
               return false;
              } */
     if (dat=="")
     {
      alert("Please enter Date of Assign...");
      return false;
     }
     if (sbran=="Select")
     {
      alert("Please Select Assign To Branch...");
      return false;
     }	
   }
    
</script>
<script  type="text/javascript">

<% 
System.out.println("------------ Assign Asset -------------");
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
</head>

<body onload="cleartext()">
<form  name="form"  method="post"  onsubmit="return validate()" action="assignAssetDB.jsp" >
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
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
                
                </td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSIGN ASSET FORM</h2></center>
    </div>
    <div class="modal-body">

<center>
    <table  width="75%" border="1" style="height: 100; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
         <tr>
			
			
			<!-- Vijay Changed for asset Based on branch  -->

			<td><font color='red'>*</font><font size="2" face="Swiss" id="hiderow"> BRANCH </font></td>
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
						String query = "select * from branch_master_main  ORDER BY m_b_name";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branchName" id="idBranch"  onchange="assetType(this.value);branchDataFetch(this.value)" >
							<option selected="selected">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
									
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

	<!-- Asset Type  -->
			
	        <td><font size="2" face="Swiss" id="hiderow"><font color='red'>*</font>Asset&nbsp;Type.  :</font></td>
	        <td>
	        
	          <div id="assetName"> 
                     <select name="assetName" id="idaType" onchange="assetnofetch(this.value,br)">
		             <option value='Select'>Select</option>
		             </select>     
              </div>
	        
	        
	        </td>
			
            <%--  <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>ASSET&nbsp;TYPE :</font></td>
		     <td><%Connection con1 = null;
                   String url1 = "jdbc:mysql://localhost:3306/";
                   String db1 = "csdb";
                   String driver1 = "com.mysql.jdbc.Driver";
                   String userName1 ="root";
                   String password1="";
                   Statement st1=null;
                   ResultSet rs1=null; 
                   try
                     {
	                 Class.forName(driver1).newInstance();
                     con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                     String query1 = "select * from asset_type where it_nonit='IT' and item_name!='Laptop'";
                     st1 = con1.createStatement();
                     rs1 = st1.executeQuery(query1);
                     %>
                   <select name="assetName" id="idaType"  onchange="assetnofetch(this.value)" style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">
		                   <option selected="selected">Select</option>
	                       <%while(rs1.next()){%>
			                <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
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
                  
                   --%>
                  <!-- Asset Numbers   -->
                  
               	
                 <!--  <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>ASSET&nbsp;NO.:</font></td>
                  
                  
                  <td><div id='assetno'>      
                       <select name="assetno" id="idano" style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">  
                          <option selected="selected">Select</option> 
                          <option value='-1'></option>  
                       </select>     
                        </div>
                   </td> -->
		      </tr>
              <tr>
              <!-- Asset Branch  -->
                   <%-- <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>BRANCH&nbsp;:</font></td>
		           <td><%Connection con = null;
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
	                                                 Class.forName(driver).newInstance();
                                                     con = DriverManager.getConnection(url+db,userName,password);
                                                     String query = "select * from branch_master_main where m_b_no  ORDER BY m_b_name";
                                                     st = con.createStatement();
                                                     rs = st.executeQuery(query);
                                                 %>
                                           <select name="branchName" id="idBranch" onchange="featchsubBranch(this.value);branchDataFetch(this.value)">
		                                        <option selected="selected">Select</option>
	                                            <%while(rs.next()){%>
			                                    <option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
    	                                        <%}%>
	                                       </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//DbUtil.closeDBResources(rs,st,con);
		                                             con.close();
                                        			}%>
                    </td> --%>
                    <td><font size="2" face="Swiss" id="hiderow">BRANCH&nbsp;CODE:</font></td>
		            <td><input type="text" name="branchCode" maxlength="10" id="idbranchCode" value="" size=5 readonly/></td>
		            
		            <td><font color="red" size="4">*</font><font size="2" face="Swiss" id="hiderow">Asset&nbsp; No.  :</font>
           			 <td>
	                    <div id='assetno'>  
	                                
                           <select name="assetno" id="idano"  style="font-size: 11px;width: 142px;overflow: auto;height: 20px ">  
                               <option value="Select">Select</option>
                                
                           </select>     
                         </div>
	       			 </td>
		      </tr>  
              <tr>
                     <td><font size="2" face="Swiss" id="hiderow">BRANCH&nbsp;LOCATION:</font></td>
		             <td><input type="text" name="branchAddrs" maxlength="99" id="idbranchAddrs" value="" size=20 readonly/></td>
		             <td><font size="2" face="Swiss" id="hiderow"><!-- <font color="red" size="4">*</font> -->BRANCH&nbsp;PH.NO.:</font></td>
		             <td><input type="text" name="branchPhNo" maxlength="99" id="idbranchPhNo" value="" onkeypress="return isNumber(event)" size=15 /></td>
		      </tr>   
              <tr>
                     <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>DATE OF ASSIGN:</font></td>
		             <td><input type="text" name ="date1" id="datepicker" value=""></td>
                     <td><font size="2" face="Swiss" id="hiderow">REMARKS:</font></td>
		             <td><input type="text" name="remarks1" maxlength="99" id="idremarks1" value="" size=40 /><input type="hidden" name="bname" maxlength="99" id="idbname" value="" size=40 /></td>
		             
	          </tr> 
              <tr>
              <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>ASSIGN TO SUB&nbsp;BRANCH:</font></td>
                  <!-- <td>
                  <div id="subbranch">
                        <select name="subbranch" id="idsubbranch" style="font-size: 11px;width: 142px;overflow: auto;height: 20px">  
                          <option value='Select'>Select</option>
                       </select>     
                  </div>
                   </td> -->
                  <td><%
                   			try
                                                {
	                                                 Class.forName(driver).newInstance();
                                                     con = DriverManager.getConnection(url+db,userName,password);
                                                     String query = "select * from branch_master where b_no  ORDER BY b_name";
                                                     st = con.createStatement();
                                                     rs = st.executeQuery(query);
                                                 %>
                                           <select name="subbranch" id="idsubbranch" >
		                                        <option selected="selected">Select</option>
	                                            <%while(rs.next()){%>
			                                    <option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
    	                                        <%}%>
	                                       </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//DbUtil.closeDBResources(rs,st,con);
		                                             con.close();
                                        			}%>
                    </td>
              </tr> 
              <tr>
                 <td colspan="4">
                    <center>
	              	 <input type=submit name="button" value="ASSIGN" id="button">
			         <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" />
			         </center>
		        </td>
              </tr>                     
      </table>
      </center><br><br>
</div>

</div>
<br /> 
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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
       <div id="resultFromAjax1" style="display:none;">
        
       </div>
    
</body>
</html>