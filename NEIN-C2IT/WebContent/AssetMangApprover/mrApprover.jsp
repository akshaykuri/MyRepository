<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>MR Level</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    width: 80%; /* Full width */
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
    width: 60%;
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
.dynatable {
	border: solid 1px #000; 
    border-collapse: collapse;
	}
.dynatable td {
	border: solid 1px #000; 
	padding: 2px 10px;
	width: 100px;
	text-align: center;
	}
.dynatable .prototype {
	display:none;
	}
</style>
</head>
<%int p =0;%>
 <script>
 		var id =0;
		$(document).ready(function() {
			// Add button functionality
			//alert("ID :"+id);
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID 1:"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(id);
				prot.find(".lno").attr("id","idlno"+id);
				/* prot.find(".lname").attr("id","idlname"+id); */
				prot.find(".empid").attr("id","idempid"+id);
				prot.find(".allopt").attr("id","idallopt"+id);
				prot.find(".allop").attr("id","idallop"+id);
				prot.find(".approvopt").attr("id","idapprovopt"+id);
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {//alert(id);
				$(this).parents("tr").remove();
				id--;
				
			});
		});
	</script>




<script type="text/javascript"> // script for validate field
function checkit_nonit()
{
//alert("hello...");
var bkColor = "red";
var bkColor2 = "white";
var ma1 = document.form1.itnonit;
var ma2 = document.form1.branch;
var ma3 = document.form1.useroffice;
//alert(ma1.value);
//alert(ma2.value);
//alert(ma3.value);
if (ma1.value=="" || m2.value=="" || ma3.value=="")
     {
     alert("Please Select asset IT/NONIT,Branch and user/office");
     ma1.focus();
     ma1.style.bkColor = ma1.style.backgroundColor;
     ma1.style.backgroundColor = bkColor;
     return false;
     }
}
function checkchangeit_nonit1()
{
//alert(id);
var ma1 = document.form1.itnonit;
var ma2 = document.form1.branch;
//alert("ma1"+ma1.value);
//alert("ma2"+ma2.value);
if (ma1.value=="" || ma2.value=="")
     {
     alert("Please Select both asset IT/NONIT and branch first");
     document.getElementById("iduseroffice").selectedIndex = "0";
     return false;
     }
if(id>0)
   {
   alert("You cant change IT/NONIT type first remove all Added Rows");
   return false;
   }
}
function checkchangeit_nonit()
    {
    //  alert(id);
    // var ma1 = document.form.mr_IT_NONIT;
    var ma1 = document.form1.itnonit;
    // alert(ma1.value);
    var i=document.form1.itnonit.selectedIndex;
    //  alert(i);
    if(id>0)
       {
       alert("Only IT or NOIT item can add in one Asset Management You cant change IT/NONIT type");
       ma1.focus();
       document.form.itnonit.selectedIndex =i.value;
       ma1.focus();
       return false;
       }
   }


function myFunction()
   {
   document.getElementById("iditnonit").value ="";
   
   
   document.getElementById("idrmaster").value ="";
   
   
   document.getElementById("idbranch").value="";
   document.getElementById("iduseroffice").value="";
   }
function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	
	var rmaster=document.getElementById("idrmaster").value;
	var itnonit=document.getElementById("iditnonit").value;
	var branch=document.getElementById("idbranch").value;
	var useroffice=document.getElementById("iduseroffice").value;
	
	
	//alert(invdate);
	if(rmaster==null || rmaster=="")
	    {
	    alert("Please selcet Master For.");
	    idrmaster.focus();
        return false;
	    }
	
	if(itnonit==null || itnonit=="")
	    {
	    alert("Please selcet IT/NONIT..");
	    iditnonit.focus();
        return false;
	    }
	else if(branch==null || branch=="")
        {
         alert("Please select branch..");
         idbranch.focus();
         return false;
         } 
	else if(useroffice==null || useroffice=="")
         {
         alert("Please select user/office..");
         iduseroffice.focus();
          return false;
          } 
	else if(id==0)
	     {
	     alert("Please enter Approver details..");
	     return false;
	     } 
	else
		 {
	     //alert(id);
	     for(p = 1; p <=id; p++)
	       {
		   var lno = 'idlno'+p.toString();
		   var empid = 'idempid'+p.toString();
		   var allopt = 'idallopt'+p.toString();
		   var allop= 'idallop'+p.toString();
		   var approvopt= 'idapprovopt'+p.toString();
		   //alert("level no :"+lno);
		   //alert("approvopt :"+approvopt);
		   //alert("allop :"+allop);
		   var lno1 = document.getElementById(lno).value;
		   var empid1=document.getElementById(empid).value;
		   var allopt1=document.getElementById(allopt);
		   var approvopt1=document.getElementById(approvopt).value;
		   //alert("approvopt :"+approvopt1);
		   //alert("level no :"+lno1);
		   if (allopt1.checked == true)
		         {
			     //alert("All opt checked:");
			     document.getElementById(allop).value="1";
			     }
		   else if(lno1=="-1")
		    	 {
		    	 alert("Please select level no...");
		    	 return false;
		    	 }
	        else if(empid1=="")
  	             {
  	             alert("Please enter empid...");
  	             return false;
  	             }
	        else if(approvopt1=="")
		         {
		         alert("Please selcet Approver option..");
		         return false;
		         }
	       }
		}
 }
</script>  
<script language="javascript" type="text/javascript">     
     var xmlHttp  ;     
      function featchitems(str){  
        var itnon=document.getElementById("iditnonit").value;
        var rmaster=document.getElementById("idrmaster").value;
        var branch=document.getElementById("idbranch").value;
        var itbranch=str+","+itnon+","+branch+","+rmaster;
        // alert(itbranch);
    	//alert(str);
    	//alert(rmaster);
        if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="levelNofetch.jsp";  
                           url +="?count=" +itbranch+"&type="+rmaster;   
                              xmlHttp.onreadystatechange = stateChange2;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange2(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("abc5").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
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
        msg=null;
		}
</script>

<body onload="myFunction()">
<form  method="post" onsubmit="return validatefield()" action="mrApproverBack.jsp"  name="form1" id="form">
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="cs-soft.jpg" height="30" width="100" > </td>
    </tr>
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT  APPROVER MASTER</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSET MANAGEMENT APPROVER ENTERY FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr>
          <center><td colspan="9"><font size="5" face="Swiss" id="hiderow">Enter Approver Details</font></td></center> 
        </tr>
        <tr>
	          <td colspan="2"><font size="2" face="Swiss" id="hiderow">SELECT MASTER FOR </font><font color=red>*</font></td> 
	          <td>
			                 <select name="rmaster" class="crmaster" id="idrmaster" >
	        					<option value="">Select</option>
	                            <option value="DISPOSAL">DISPOSAL</option>
	                            <option value="TRANSFER">TRANSFER</option>
						    </select>	
					  </td>
        </tr>
          <tr>
                  <td><font size="2" face="Swiss" id="hiderow">IT/NONIT ASSET.<font color=red>*</font></font></td> 
                  <td>
		                 <select name="itnonit" class="Citnonit" id="iditnonit" >
        					<option value="">Select</option>
                            <option value="IT">IT</option>
                            <option value="NONIT">NONIT</option>
					    </select>	
				  </td>
				  <td><font size="2" face="Swiss" id="hiderow">Branch<font color=red>*</font></font></td> 
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
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+db,userName,password);
						String query = "select b_name,b_no from branch_master ORDER BY b_name Asc";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="branch" id="idbranch" >
							<option value="">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
									
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
                   <td><font size="2" face="Swiss" id="hiderow">USER/OFFICE<font color=red>*</font></font></td> 
                    <td>
		                 <select name="useroffice"  id="iduseroffice" onchange="return checkchangeit_nonit(),featchitems(this.value); " onclick="return checkchangeit_nonit1();">
        					<option value="">Select</option>
                            <option value="USER">USER</option>
                            <option value="OFFICE">OFFICE</option>
					    </select>	
				  </td>
     </tr>
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button' onclick="checkit_nonit()">+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Level No.<font color=red>*</font></font></td>
		     <!-- <td><font size="2" face="Swiss" id="hiderow">Level Name<font color=red>*</font></font></td> -->
		     <td><font size="2" face="Swiss" id="hiderow">Emp ID<font color=red>*</font></font></td>
		     <td><font size="2" face="Swiss" id="hiderow">All Approver allow</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Approve option<font color=red>*</font></font></td>
		   </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <!-- <td><input type="text" name="lno" maxlength="99" id="idlno" class="lno" value="" size=10 /></td> -->
		           <td>
		               <div id='abc5'>
					       <select name="lno" id="idlno" class="lno" onclick="checkit_nonit();"  style="font-size: 11px;width: 200px;overflow: auto;"> 
				 	       <option value='-1'></option>  
						   </select>
		               </div>
		           </td>
		           <!-- <td><input type="text" name="lname" maxlength="99" id="idlname" class="lname" value="" size=15 /></td> -->
		           <td><input type="text" name="empid" maxlength="99" id="idempid" class="empid" value="" size=15 /></td>
		           <td><input id="idallopt" type="checkbox" class="allopt" name="allopt" >
		           <input type="hidden" name="allop" maxlength="99" id="idallop" class="allop" value="0" size=15 /></td>
		           <td>
		               <select name="approvopt" id="idapprovopt" class="approvopt"   style="font-size: 11px;width: 70px;overflow: auto;"> 
				 	       <option value="">Select</option>
                            <option value="SEND">SEND</option>
                            <option value="DIRECT">DIRECT</option>
                            <option value="SEND_DIRECT">SEND/DIRECT</option>
				      </select>
		           </td>   
		         
		           		         
       </tr>
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	  <a href="mrApproverD.jsp" onclick="return popitup('mrApproverDisp.jsp')">View Approver</a>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(-1)" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../assetManagement/OtherPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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