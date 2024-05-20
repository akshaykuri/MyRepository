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
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID :"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(id);
				prot.find(".lno").attr("id","idlno"+id);
				prot.find(".lname").attr("id","idlname"+id);
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

function myFunction()
   {
   document.getElementById("iditnonit").value ="";
   document.getElementById("idbranch").value="";
   
   document.getElementById("idrmaster").value ="";
   
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
         alert("Please selcet user/office..");
         iduseroffice.focus();
         return false;
         }
	else if(id==0)
	     {
	     alert("Please enter Level details..");
	     return false;
	     } 
	else
		 {
	     //alert(id);
	     for(p = 1; p <=id; p++)
	       {
		   var lno = 'idlno'+p.toString();
		   var lname = 'idlname'+p.toString();
		   var lno1 = document.getElementById(lno).value;
		   var lname1=document.getElementById(lname).value;
	       if(lno1=="")
		    	 {
		    	 alert("Please enter level no...");
		    	 return false;
		    	 }
	       else if(lname1=="")
	    	     {
	    	     alert("Please enter level name...");
	    	     return false;
	    	     }
	       }
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
<form  method="post" onsubmit="return validatefield()" action="levelOfApproverBack.jsp"  name="form1" id="form">
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
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT  LEVEL MASTER</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>LEVEL CREATE FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr>
          <center><td colspan="9"><font size="5" face="Swiss" id="hiderow">Enter Level Details</font></td></center> 
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
                  <td><font size="2" face="Swiss" id="hiderow">Level For IT/NONIT.<font color=red>*</font></font></td> 
                  <td>
		                 <select name="itnonit" class="Citnonit" id="iditnonit" >
        					<option value="">Select</option>
                            <option value="IT">IT</option>
                            <option value="NONIT">NONIT</option>
					    </select>	
				  </td>
				  <td><font size="2" face="Swiss" id="hiderow">Level For Branch<font color=red>*</font></font></td> 
		          <td><%Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/";
                        String db = "csdb";
                        String driver = "com.mysql.jdbc.Driver";
                        String userName ="root";
                        String password="";
                        int i=1;
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
                   <td><font size="2" face="Swiss" id="hiderow">Level For USER/OFFICE.<font color=red>*</font></font></td> 
                  <td>
		                 <select name="useroffice" class="Citnonit" id="iduseroffice" >
        					<option value="">Select</option>
                            <option value="USER">USER</option>
                            <option value="OFFICE">OFFICE</option>
					    </select>	
				  </td>
     </tr>
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Level No.<font color=red>*</font></font></td>
		     <td colspan=3><font size="2" face="Swiss" id="hiderow">Level Name<font color=red>*</font></font></td>
		     
	     </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td><!-- <input type="text" name="lno" maxlength="99" id="idlno" class="lno" value="" size=10 /> -->
		             <select name="lno" id="idlno" class="lno" >
							<option value="">Select</option>
							<%while(i<=20){%>
								<option value="<%=i%>"><%=i%></option>
							<%i++;}%>
							</select>
		               
		           </td>
		           <td colspan=3><input type="text" name="lname" maxlength="99" id="idlname" class="lname" value="" size=20 /></td>
       </tr>
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	 <a href="levelD.jsp" onclick="return popitup('levelDisp.jsp')">View level</a>
			                       <input style="font-size:1" type="submit" value="SAVE" name="save3" id="save1" />
	                               
		                          <input type="button" onclick="history.go(0)" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../adminbom.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../adminbom.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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