<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%-- <%@page import="CON2.DbUtil"%> --%>
 <%@ page import="java.sql.*" %>
 <%@ include file="banner.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<title>Search Asset</title>
<script  type="text/javascript">

<% 
	System.out.println("------------- Search Asset  -----------------");
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
           msg=null;
		}
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

<script type="text/javascript"> // script for branch validation
function selfromdate() 
    {
	var fd=document.getElementById("datepicker-13").value;
	var td=document.getElementById("datepicker-131").value;
	//alert(fd);
	//alert(td);
	if(fd=="")
		 {
		  alert("Please enter Date from first...");
		  document.getElementById("datepicker-13").focus();
		  return false;
		 }
	//alert(fd);
    //alert(td);
    }
</script>
<script type="text/javascript"> // script for sysdate // body onloade(), clear of field
function cleartext() 
    {
	
	 document.getElementById("datepicker-13").value=null;
	 document.getElementById("datepicker-131").value=null;
	 document.getElementById("idbranch").value=null;
	 document.getElementById("idasgFor").value=null;
	 document.getElementById("idAtype").value=null;
	 document.getElementById("idOtherCriteria").value=null;
  	 
	
  	 
  	 
  	  document.getElementById('datepicker-13').value ="";
  	 document.getElementById('datepicker-131').value ="";
  	 
  	 var dropDown=document.getElementById("idbranch");
     dropDown.selectedIndex = 0;
     
     var dropDown1=document.getElementById("idasgFor");
     dropDown1.selectedIndex = 0;
     
     var dropDown2=document.getElementById("idOtherCriteria");
     dropDown2.selectedIndex = 0;
     document.getElementById("idAssetText").value="";
     document.getElementById("idAtype").value="Select";
  	 
  	 
  	 
  	 
  	 
  	 
	document.getElementById("idaNo").value= null;
    document.getElementById("idaNo").disabled = false;
    document.getElementById("idAssetText").value= null;
    document.getElementById("idAssetText").style.visibility='visible';
    document.getElementById("assetText1").disabled = false;
    /* 
    
    document.getElementById("idempId").value= null;
    document.getElementById("idempId").disabled = false;
    
    
    document.getElementById("idinvNo").value= null;
    document.getElementById("idinvNo").disabled = false;
    document.getElementById("idsrNo").value= null;
    document.getElementById("idsrNo").disabled = false;
    
    
    document.getElementById('idmain').checked=false;
	document.getElementById('idscrap').checked=false;
	document.getElementById('idunassigned').checked=false;
	document.getElementById("idscrap").disabled = false;
    document.getElementById("idmain").disabled = false;
    document.getElementById("idunassigned").disabled = false;
    var dropDown1=document.getElementById("idasgFor");
    dropDown1.selectedIndex = 0;
    document.getElementById("idasgFor").disabled = false;
    var dropDown=document.getElementById("idbranch");
    dropDown.selectedIndex = 0;
    document.getElementById("idbranch").disabled = false;
    var dropDown2=document.getElementById("idAtype");
    dropDown2.selectedIndex = 0;
    document.getElementById("idAtype").disabled = false;
   */
	//document.getElementById("idaNo1").value="";
    //document.getElementById("idaNo1").disabled = false;
    /* document.getElementById("datepicker-13").disabled = false;
    document.getElementById("datepicker-131").disabled = false;
	
	document.getElementById("idaNo").value=null;
	document.getElementById("idempId").value=null;
	document.getElementById("idadminId").value=null;
	//document.getElementById("idasgType").value="Select";
	document.getElementById("idasgFor").value="Select";
	document.getElementById('idbranch').value="Select";
	 *///document.getElementById('idsub').value="Select";
	}
</script>

<!-- idaNo,idempId,idscrap,idmain,idunassigned,idasgFor,idbranch,idAtype,idaNo1,datepicker-13,datepicker-131 -->
<script type="text/javascript"> // script for seluseroffice fun
function assetnofunc()
        {
	     document.getElementById("idempId").value="";
	     document.getElementById("idempId").style.visibility='visible';
	     document.getElementById("idinvNo").value="";
	     document.getElementById("idinvNo").style.visibility='visible';
	     document.getElementById("idsrNo").value="";
	     document.getElementById("idsrNo").style.visibility='visible';
	     document.getElementById('idscrap').checked=false;
         document.getElementById('idmain').checked=false;
         document.getElementById('idunassigned').checked=false;
	     document.getElementById("idscrap").style.visibility='visible';
	     document.getElementById("idmain").style.visibility='visible';
	     document.getElementById("idunassigned").style.visibility='visible';
	     var dropDown1=document.getElementById("idasgFor");
	     //alert(dropDown);
         dropDown1.selectedIndex = 0;
         document.getElementById("idasgFor").style.visibility='visible';
	     var dropDown=document.getElementById("idbranch");
	     //alert(dropDown);
         dropDown.selectedIndex = 0;
         document.getElementById("idbranch").style.visibility='visible';
	     //alert(dropDown);
         var dropDown2=document.getElementById("idAtype");
	     //alert(dropDown);
         dropDown2.selectedIndex = 0;
         document.getElementById("idAtype").style.visibility='visible';
         //document.getElementById("idaNo1").value="";
	     //document.getElementById("idaNo1").style.visibility='visible';
	     document.getElementById("datepicker-13").value=""; 
	     document.getElementById("datepicker-13").style.visibility='visible';
	     document.getElementById("datepicker-131").value="";
	     document.getElementById("datepicker-131").style.visibility='visible';
	     }
 </script>



 <script type="text/javascript"> // script for seluseroffice fun
function assetTextDetails()
         {
	document.getElementById("idAssetText").value= "";
    
	
         }
 </script>
 <script type="text/javascript"> // script for Search button onclic func
function searchfunc()
         {
	 		var fd = document.getElementById("datepicker-13").value;
	 		var ft = document.getElementById("datepicker-131").value;
	 		var br = document.getElementById("idbranch").value;
	 	    var asfor = document.getElementById("idasgFor").value;
			var at = document.getElementById("idAtype").value;
			var Criteria = document.getElementById("idOtherCriteria").value;
			var  assetText=document.getElementById("idAssetText").value;
	 
			alert(fd+" :: "+ft+" :: "+br+" :: "+asfor+" :: "+at+" :: "+Criteria+" :: "+assetText);
		    
			if(asfor!="Select")
				{
				  var res1=asfor+","+br+","+at+","+fd+","+ft;
		          alert(res1);
		          var f=document.form;
		          alert(res1);
		          f.method="post";    
		          f.action='searchAssetDisp.jsp?res1='+res1;    
		          f.submit();
				
				}
			
			
			
			if(Criteria!="Select")
				{
				 if((Criteria == "0") && (assetText!=""))
					{
						alert(Criteria);
						alert(assetText);
						 var f=document.form;    
					     f.method="post";    
					     f.action='searchAssetNo.jsp?ano='+assetText;    
					     f.submit();
					}
				 if((Criteria == "1") && (assetText!=""))
					{
						alert(Criteria);
						alert(assetText);
						var f=document.form;    
				          f.method="post";    
				          f.action='searchsrno.jsp?srno='+assetText;    
				          f.submit();
					}
					if((Criteria == "3")&& (assetText!=""))
					{
						alert(Criteria);
						alert(assetText);
							 var f=document.form;    
						     f.method="post";    
						     f.action='searchEmpID.jsp?eid='+assetText;    
						     f.submit();
					}
					if((Criteria == "4")&&  (assetText!=""))
					{
						alert(Criteria);
						alert(assetText);
							  var f=document.form;    
					          f.method="post";    
					          f.action='searchinvno.jsp?invno='+assetText;    
					          f.submit();
					}
					if((Criteria == "6") )
					{
						var s=false;
						var m=false;
						var una=true;
						var res=s+","+m+","+una;
				 	     alert(res);
				 	     var f=document.form;    
					     f.method="post";    
					     f.action='searchScrapMainUna.jsp?res='+res;    
					     f.submit();
					}
					if((Criteria == "7") )
					{
						
						var s=false;
						var m=true;
						var una=false;
						var res=s+","+m+","+una;
				 	     alert(res);
				 	     var f=document.form;    
					     f.method="post";    
					     f.action='searchScrapMainUna.jsp?res='+res;    
					     f.submit();
						
					}if((Criteria == "8"))
					{
						
						var s=true;
						var m=false;
						var una=false;
						var res=s+","+m+","+una;
				 	     alert(res);
				 	     var f=document.form;    
					     f.method="post";    
					     f.action='searchScrapMainUna.jsp?res='+res;    
					     f.submit();
					}
				
				} 
			 else
				 {
				     alert(asfor);
						 if(asfor=="Select")
			    		 {
			    		  alert("First choose the Office/User field..");
			    		  return false;
			    		 }
			    	  else
			    		 {
			    		       
				          var res1=asfor+","+br+","+at+","+fd+","+ft;
				          alert(res1);
				          var f=document.form;
				          alert(res1);
				          f.method="post";    
				          f.action='searchAssetDisp.jsp?res1='+res1;    
				          f.submit();
			    		 }	
				 	 }
				 }
</script>
<script type="text/javascript"> // script for Search button onclic func
function validate()
         {
	
			    var fd = document.getElementById("datepicker-13").value;
				var ft = document.getElementById("datepicker-131").value;
				var br = document.getElementById("idbranch").value;
			    var asfor = document.getElementById("idasgFor").value;
			    var at = document.getElementById("idAtype").value;
			    var Criteria = document.getElementById("idOtherCriteria").value;
			    var  assetText=document.getElementById("idAssetText").value;
		
			    if( asfor=="Select" && br=="Select" && at=="Select" && fd=="" && ft=="" && Criteria=="Select" && assetText=="" )
			     {
		    	    alert("Please enter or select any field...!");
		    	    return false;
			     }
			
	
	  }
</script>
 </head>
 
 
 
<body onload="cleartext()">
<form method="post" name="form" id="form" >
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
                <font size ="2">DEPARTMENT :<%=session.getAttribute("department")%> </font></td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>SEARCH ASSET FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
<table width="75%" border="1" style="height: 100; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
 <tr>
 	 <td ><font size="2" face="Swiss" id="hiderow"> From Date: </font>
	 <input type="text"  style="width: 6em"  name="txtCalendar" value="" id="datepicker-13"  onclick="showCalendarControl(this)"></td>
	 <td ><font size="2" face="Swiss" id="hiderow">End Date:</font>
	 <input type="text"  style="width: 6em"name="txtCalendar1" value="" id="datepicker-131"  onclick="showCalendarControl(this)"></td>
 </tr>         
		               
 <tr>
      <td>Select Branch :</td>
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
	               Class.forName(driver).newInstance();
                   con = DriverManager.getConnection(url+db,userName,password);
                   String query = "select * from branch_master ORDER BY b_name";
                   st = con.createStatement();
                   rs = st.executeQuery(query);
                %>
                   <select name="branchName" id="idbranch" style="font-size: 11px;width: 110px; overflow: auto; height: 20px">
		           <option selected="selected">Select</option>
	               <%while(rs.next()){%>
			       <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
    	           <%}%>
	               </select>
              <%}catch (SQLException ex)
                    {
                    ex.printStackTrace();
                    }	
              finally{
		            con.close();
           			}%>			
	        </td>
		  </tr>
		 <tr>
	         <td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>Office/User&nbsp; Use:</font></td>
		     <td>
		         <select name="assignFor" id="idasgFor" style="font-size: 11px;width: 110px; overflow: auto; height: 20px">
		         <option selected="selected">Select</option>
                 <option value="0">User</option>
                 <option value="1">Office</option>
                 <option value="2">All</option>
                 </select>
	         </td> 
	       </tr>
	        <tr>
		     <td>Asset&nbsp;Type :</td>
		     <td><%Connection con1 = null;
                 String url1 = "jdbc:mysql://localhost:3306/";
                 String db1 = "csdb";
                 String driver1 = "com.mysql.jdbc.Driver";
                 String userName1 ="root";
                 String password1="";
                 // int sumcount=0;
                 Statement st1=null;
                 ResultSet rs1=null; 
              try
                 {
	             Class.forName(driver1).newInstance();
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 String query1 = "select * from asset_type";
                 st1 = con1.createStatement();
                 rs1 = st1.executeQuery(query1); %>
                       <select name="aType" id="idAtype" style="font-size: 11px;width: 110px; overflow: auto; height: 20px">
		                  <option selected="selected">Select</option>
	                     <%while(rs1.next()){%>
			             <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
    	                                  <%}%>
	                   </select>
             <%} catch (SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        con1.close();		             
			           }%>
	        </td>
	        
		</tr>
		<tr>
		<td>Other Criteria </td><td><select name="otherCriteria" id="idOtherCriteria" onclick="assetTextDetails()" style="font-size: 11px;width: 110px; overflow: auto; height: 20px">
		         <option selected="selected">Select</option>
                 <option value="0">Asset NO</option>
                 <option value="1">Serial NO</option>
                 <option value="2">PO NO</option>
                 <option value="3">EMP ID</option>
                 <option value="4">Inventory NO</option>
                 <option value="5">Assigned</option>
                 <option value="6">Un Assigned</option>
                 <option value="7">Repair / Maintenenc </option>
                 <option value="8">Scrap </option>
                 <option value="9">To Be Scrap </option>
                 </select> 
        </td>
     	</tr>
		<tr>
		<td> Enter the Asset Details: </td>
		<td><input type="text" value="" name="assetText" id="idAssetText" size=20>
		</td>
		</tr>
		</table>
		<table width="75%" border="1" align="center" bgcolor="lightgrey">
          <tr><td style="size: 1">
	       <center>
		   <input style="font-size:1" type="submit" value="SEARCH" name="save3" id="save1"  onclick="searchfunc();validate()"/>
		   <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" />
		   </center>
		  </td></tr>
        </table>
    <br>    

</center>
</div>
</div>
<br/>
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