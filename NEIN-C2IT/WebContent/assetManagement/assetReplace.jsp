<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%-- <%@page import="CON2.DbUtil"%> --%>
 <%@ page import="java.sql.*" %>
 <%@ include file="banner.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asset Replace</title>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
 {	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script> 

<script>
function popitup1(url)
        {
			newwindow=window.open(url,'name','height=300,width=2000,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
			if (window.focus) {newwindow.focus();}
			return false;
	    }
</script>
<script>
function popitup2(url)
        {
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus();}
		return false;
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
	    width: 50%;
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
<script type="text/javascript"> // script for sysdate // body onloade(), clear of field
function cleartext() 
    {
	 //	alert(document.getElementById("idano").value);
	document.getElementById("idbranchName").value= "Select";
	document.getElementById("idaType").value= "Select";
	document.getElementById("idano").value= "Select";
	
	
	//alert(document.getElementById("idbranchName1").value + document.getElementById("idaType1").value);
	
	
	document.getElementById("idbranchName1").value= "Select";
	document.getElementById("idaType1").value= "Select";
	document.getElementById("idano1").value= "Select";
	document.getElementById("iddoiLink").value="";
	document.getElementById("idAssignRemarks").value="";
    }
</script>

<script type="text/javascript"> // script for Search button onclic func
function validatefunc()
         {
	     var ano = document.getElementById("idaNo").value;
	     if(ano=="Select")
	    	 {
	    	 alert("please enter asset no....");
	    	 return false;
	    	 }
	    }
</script>
 <script type="text/javascript"> // script for Search button onclic func  idaType,idaNo1,idano
function searchfunc()
         {
		     var ano = document.getElementById("idaType").value;
		     var ano1 = document.getElementById("idano").value;
	      	
		     var newano=document.getElementById("idaType1").value;
	      	 var newano1 = document.getElementById("idano1").value; 
		    
	      //alert(ano1);
		     
		  if(ano=="Select")
		         {
			          alert("Please Select Asstet Type....");
			          return false;
		          }
		  else if(newano=="Select")
			  {
		        alert("Please Select New Asstet Type....");
		          return false;
	        }
		  else{
				  if(ano=="DESKTOP" )
					 {
					  if(newano!="CPU" && newano!="MONITER"){
						  
						  alert("Please Select  New Asstet Type as CPU or Moniter ....");
				          return false;
					  }  
					 }
				  else if(ano=="CCTV_SETUP")
					  {
						if(newano!="DVR" && newano!="CAMERA"){
						  alert("Please Select  New Asstet Type as DVR or CAMERA ....");
				          return false;
					  } 
					  }
				  else if(ano=="UPS_SETUP")
				  {
					if(newano!="UPS" && newano!="BATTERY"){
					  alert("Please Select  New Asstet Type as UPS or BATTERY ....");
			          return false;
				  } 
				  }
				  else if(ano!=newano)
					  {
						  alert("Asset Type Does not match....");
				          return false;
					  }
			  }
		
		    if(ano1=="Select")
	        {
	         alert("Please Select Asstet No....");
	         return false;
	         }
		    else if(newano1=="Select")
		    	{
		    	 alert("Please Select New Asstet No....");
		         return false;
		       }
		    else
		    	{
		    	var assignedDate=document.getElementById("iddoiLink").value;
		    	var remarks=document.getElementById("idAssignRemarks").value;
		    	if(assignedDate=="")
		    		{
		    		 alert("Please Select Date of Assign ....");
			         return false;
		    		}
		    	if(remarks=="")
	    		{
	    		 alert("Please Select Date of Assign ....");
		         return false;
	    		}
		       	 var f=document.form;    
			     f.method="post";    
			     f.action='assetreplaceback.jsp?assetno='+ano1;    
			     f.submit();
		    	}
	     }
</script>

<script type="text/javascript">
function assetType(str){  

	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    } 
				   var url="assetavailable5.jsp"; 
                   url +="?AssetBranch=" +str;   
                   xmlHttp.onreadystatechange = assetavailable5;  
                   xmlHttp.open("GET", url, true);   
                   xmlHttp.send(null);    
         }     
		function assetavailable5(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                  			  		document.getElementById("assetName").innerHTML=xmlHttp.responseText;    
                                  }
                          	} 
		function assetType1(str){  

			if (typeof XMLHttpRequest != "undefined"){    
		      xmlHttp= new XMLHttpRequest();    
		        }      else if (window.ActiveXObject){    
		          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
		              }      if (xmlHttp==null){   
		                 alert("Browser does not support XMLHTTP Request");   
		                   return;     
		                    } 
						   var url="assetavailable51.jsp"; 
		                   url +="?AssetBranch=" +str;   
		                   xmlHttp.onreadystatechange = assetavailable51;  
		                   xmlHttp.open("GET", url, true);   
		                   xmlHttp.send(null);    
		         }     
				function assetavailable51(){     
		                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
		                  			  		document.getElementById("assetName1").innerHTML=xmlHttp.responseText;    
		                                  }
		                          	} 


</script>


<script type="text/javascript">
function assetnofetch(str,br)
{  
		if (typeof XMLHttpRequest != "undefined"){    
     		 xmlHttp= new XMLHttpRequest();    
      	  }    
		else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }    	   var url="assetavailable4.jsp"; 
                         	   url +="?AssetType=" +str + "&Branch="+br;   
	                           xmlHttp.onreadystatechange = assetavailable1;  
	                           xmlHttp.open("GET", url, true);   
	                           xmlHttp.send(null);    
}     
function assetavailable1(){    
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                    document.getElementById("assetno").innerHTML=xmlHttp.responseText;    
                          		 }
                            	
                           } 
                           
                           
function assetnofetch12(str,br)
{  
	if (typeof XMLHttpRequest != "undefined"){    
 		 xmlHttp= new XMLHttpRequest();    
  	  }    
	else if (window.ActiveXObject){    
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
          }      if (xmlHttp==null){   
             alert("Browser does not support XMLHTTP Request");   
               return;     
                }    	   var url="assetavailable41.jsp"; 
                     	   url +="?AssetType=" +str + "&Branch="+br;   
                           xmlHttp.onreadystatechange = assetavailable11;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
}     
function assetavailable11(){     
                        	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                document.getElementById("assetno1").innerHTML=xmlHttp.responseText;    
                      		 }
                   } 
</script>
<script type="text/javascript"> // script for Search button onclic func
function searchfunc1()
         {
	     var ano1 = document.getElementById("idaNo1").value;
	     if(ano1=="")
	         {
	          alert("please enter view asset no ....");
	          return false;
	          }
	    else
	    	{	
	         var f=document.form;    
		     f.method="post";    
		     f.action='assettransferDisp.jsp?ano='+ano1;    
		     f.submit();
		     } 
         }
</script>
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
 </head>
<body onload="cleartext()">
<!-- <form action="searchAssetDisp.jsp" method="post" name="form" id="form" > -->
<form method="post" name="form" id="form" >

<%

String branch=(String) session.getAttribute("city");

String str1=branch.substring(0, branch.length() - 5);

Connection con1 = null;
String url1 = "jdbc:mysql://localhost:3306/";
String db1 = "csdb";
String driver1 = "com.mysql.jdbc.Driver";
String userName1 ="root";
String password1="";
Statement st1=null,st2=null;
ResultSet rs1=null, rs2=null;
Class.forName(driver1).newInstance();
con1 = DriverManager.getConnection(url1+db1,userName1,password1);


%>


<BR><BR>
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
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSET REPLACE FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
	    <table width="100%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	   	    
	   	    <tr>
	   	    <td colspan="4" align="center"> SELECT THE EXISTING ASSET DETAILS </td>
	   	    
	   	    </tr>
	   	     <tr>
	   	     <td><font size="2" face="Swiss" id="hiderow">Select Branch. </font></td>
	   	 	 <td>
	   	 	 		<%Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                   
                        Statement st=null;
                        ResultSet rs=null; 
                    	 try
                       	{
              
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select * from branch_master  ORDER BY b_name";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branchName" id="idbranchName" onchange="assetType(this.value)"  >
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
                    <td><font size="2" face="Swiss" id="hiderow"><font color='red'>*</font>Asset&nbsp;Type.  :</font></td>
	        <td>
	        
	          <div id='assetName'> 
                     <select name="assetName" id="idaType" onchange="assetnofetch(this.value,br)">
		             <option selected="selected">Select</option>
		             <option value='-1' ></option>  
                     </select>     
              </div>
	        
	        
	        </td>
		   	  <!--   <td><font size="2" face="Swiss" id="hiderow">View Asset&nbsp; No.  :</font></td>
		        <td><input type="text" name="aNo1" maxlength="30" id="idaNo1" value="" size=20 /></td> -->
	        </tr>
	        <tr>
	       
	        <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp; No.  :</font>
            <td>
	                    <div id='assetno'>      
                           <select name="assetno" id="idano"  style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">  
                               <option selected="selected">Select</option> 
                               <option value='-1' ></option>  
                           </select>     
                         </div>
	        </td>
		 
		    
            </tr>
            <tr></tr>
             <tr>
	   	    <td colspan="4" align="center"> SELECT THE NEW  ASSET DETAILS TO LINK </td>
	   	    
	   	    </tr>
	   	    
	   	    
	   	     <tr>
	   	     <td><font size="2" face="Swiss" id="hiderow">Select Branch. </font></td>
	   	 	 <td>
	   	 	 		<% con = null;
                        url = "jdbc:mysql://localhost:3306/";
                        db = "csdb";
                        driver = "com.mysql.jdbc.Driver";
                        userName ="root";
                        password=""; 
                        
                         st=null;
                         rs=null; 
                    	 try
                       	{
              
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select * from branch_master  ORDER BY b_name";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branchName1" id="idbranchName1" onchange="assetType1(this.value)"  >
							<option selected="Select">Select</option>
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
                    <td><font size="2" face="Swiss" id="hiderow"><font color='red'>*</font>Asset&nbsp;Type.  :</font></td>
	        <td>
	        
	          <div id='assetName1'> 
                     <select name="assetName1" id="idaType1" onchange="assetnofetch12(this.value,br)">
		             <option selected="Select">Select</option>
		             <option value='-1' ></option>  
                     </select>     
              </div>
	        
	        
	        </td>
		   	  <!--   <td><font size="2" face="Swiss" id="hiderow">View Asset&nbsp; No.  :</font></td>
		        <td><input type="text" name="aNo1" maxlength="30" id="idaNo1" value="" size=20 /></td> -->
	        </tr>
	        <tr>
	       
	        <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp; No.  :</font>
            <td>
	                    <div id='assetno1'>      
                           <select name="assetno1" id="idano1"  style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">  
                               <option selected="selected">Select</option> 
                               <option value='-1' ></option>  
                           </select>     
                         </div>
	        </td>
			 <td><font size="2" face="Swiss" id="hiderow">Date of Assign:</font>
            <td>
	                <input type="text" name="doiLink" maxlength="99" id="iddoiLink" value="" size=15 onclick="showCalendarControl(this)"/>   
	        </td>
		    
            </tr>
            <tr>
            <td><font size="2" face="Swiss" id="hiderow"> Remarks:</font>
            </td>
            <td> <input type="text" name="assignRemarks" maxlength="99" id="idAssignRemarks" value="" size=30 /></td>
            
            </tr>
	   	    <tr></tr>
	   	    <tr></tr>
	        <tr>
	      
		    <td colspan=2><a href="DisplayAllAsset.jsp" onclick="return popitup1('DisplayAllAsset.jsp')">View All Asset Link</a>
		    <input style="font-size:1" type="submit" value="LINK" name="save3" id="save1" onclick="return searchfunc()"/></td>
		   <td colspan=2>
                 <a href="assetAllView.jsp" onclick="return popitup2('assetAllView.jsp')">View All Asset  </a> 		      
		       <!--  <input style="font-size:1" type="submit" value="VIEW" name="save2" id="save2" onclick="return searchfunc1()"/> -->
		       <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" /></td>
		     </tr>
	    </table>
	    
       
          <br>    

</center>
</div>

</div>
<br>
<br>
<br>
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
</body>
</html>