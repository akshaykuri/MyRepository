<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>FORM APPROVER</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />


<title>Insert title here</title>
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
				prot.find(".empid").attr("id","idempid"+id);
				prot.find(".allopt").attr("id","idallopt"+id);
				prot.find(".allop").attr("id","idallop"+id);
				prot.find(".direct").attr("id","iddirect"+id);
				prot.find(".direc").attr("id","iddirec"+id);
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
<script>

function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	//idabc5,idabc9,idInvDate,idabc6,idabc7,idabc8
	var itnonit=document.getElementById("iditnonit").value;
	var branch=document.getElementById("idbranch").value;
	//alert(invdate);
	if(itnonit==null || itnonit=="")
	    {
	    alert("Please selcet FORM TYPE..");
	    iditnonit.focus();
        return false;
	    }
	else if(branch==null || branch=="")
        {
         alert("Please select BRANCH..");
         idbranch.focus();
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
		   
		   var allopt= 'idallopt'+p.toString();
		   var allop= 'idallop'+p.toString();
		   var direct= 'iddirect'+p.toString();
		   var direc= 'iddirec'+p.toString();
		   //alert("level no :"+lno);
		   //alert("approvopt :"+approvopt);
		  // alert("allopt :"+allopt);
		   //alert("allop :"+allop);
		   //alert("direct :"+direct);
		   //alert("direc :"+direc);
		   var lno1 = document.getElementById(lno).value;
		   //alert("level no :"+lno1);
		   var empid1=document.getElementById(empid).value;
		   //alert("empid1 :"+empid1);
		  
		   var allopt1=document.getElementById(allopt);
		   //alert("allopt1 :"+allopt1.checked);
		   var allop1=document.getElementById(allop).value;
		   //alert("allopt1 :"+allop1);
		   
		   var directp2=document.getElementById(direct);
		  // alert("direct2 44444:"+directp2.checked);
		   var direct3=document.getElementById(direc).value;
		  // alert("direct3 :"+direct3); 
		   
		   
		   
		   if(lno1=="")
		    	 {
		    	 alert("Please select level no...");
		    	 return false;
		    	 }
	       else if(empid1=="")
  	             {
  	             alert("Please enter empid...");
  	             return false;
  	             }
	       else if (allopt1.checked == true)
	             {
		         //alert("All opt checked:");
		         document.getElementById(allop).value="1";
		         //return true;
		         }
	       else if (directp2.checked == true)
                {
	            //alert("All opt checked:");
	            document.getElementById(direc).value="1";
	            //return true;
	            }
	       }
		}return true;
 }
</script>  



</head>
<body>
<form  method="post" onsubmit="return validatefield()" action="createroutingback.jsp"  name="form1" id="form">
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="nippon.gif" height="35" width="220"> </td>
        
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">APPROVER MASTER</font></strong></td>
</tr>

<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h2>APPROVER ENTERY FORM</h2></center>
    </div>
    <div class="modal-body">
<br>
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr>
          <center><td colspan="9"><font size="5" face="Swiss" id="hiderow">Enter Approver Details</font></td></center> 
        </tr>
          <tr>
                  <td><font size="2" face="Swiss" id="hiderow">FORM TYPE<font color=red>*</font></font></td> 
                  <td>
		                 <select name="itnonit" class="Citnonit" id="iditnonit" >
        					<option value="">Select</option>
                            <option value="APPLICATION">NEIN APPLICATION FORM</option>
                            <option value="Audit_Form">AUDIT FORM</option> 
                            <option value="GATEPASS">GATEPASS</option>
                            <option value="CHECKLIST">CHECKLIST</option>
                            <option value="INCIDENTLOG">INCIDENTLOG</option>
                             <option value="CCDUser">CCDUSER</option>
                            <option value="CCDReport">CCDREPORT</option>
                            <option value="NEINUser">NEINUSER</option>
                            <!-- <option value="TMSUser">TMSUSER</option>
                            <option value="GSNET">GSNET</option> -->
                            <option value="IT_CLS">IT CLEARANCE</option>
                          <!--   <option value="LOTUS_NOTES">LOTUS_NOTES</option>
                            <option value="DOMAIN">DOMAIN</option> 
                             <option value="NEWINS">NEWINS</option>
                            <option value="ACCESS_CARD">ACCESS CARD</option> -->
                           <!--   <option value="LOTUS_TRAVELER">LOTUS TRAVELER</option>
                           <option value="SHARRED_FOLDER">SHARRED FOLDER</option>
                            <option value="INTERNET_ACCESS">INTERNET ACCESS</option>
                            <option value="USB_ACCESS">USB ACCESS</option> -->
					    </select>	
				  </td>
				  <td><font size="2" face="Swiss" id="hiderow">Branch<font color=red>*</font></font></td> 
		          <td><%Connection con = null;
		          ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
		      	String userName = dbProperties.getString("csdb.username");
		      	String password = dbProperties.getString("csdb.password");
		      	String url = dbProperties.getString("csdb.url");
		      	String driver = dbProperties.getString("csdb.driverName");
		      	String dbName = dbProperties.getString("csdb.dbName");
                        //int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+dbName,userName,password); 
						String query = "select m_b_name,m_b_no from branch_master_main ORDER BY m_b_name Asc";
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
                   
     </tr>
	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button' onclick="checkit_nonit()">+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Level No.<font color=red>*</font></font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Emp ID<font color=red>*</font></font></td>
		     <td><font size="2" face="Swiss" id="hiderow">All Approver allow</font></td>
		      <td><font size="2" face="Swiss" id="hiderow">Direct Approve option<font color=red>*</font></font></td> 
		   </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <!-- <td><input type="text" name="lno" maxlength="99" id="idlno" class="lno" value="" size=10 /></td> -->
		           <td>
		              <select name="lno" id="idlno" class="lno"   style="font-size: 11px;width: 70px;overflow: auto;"> 
				 	        <option value="">Select</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
				      </select>
		           </td>
		           <td><input type="text" name="empid" maxlength="99" id="idempid" class="empid" value="" size=15 /></td>
		           <td><input id="idallopt" type="checkbox" class="allopt" name="allopt" >
		               <input type="hidden" name="allop" maxlength="99" id="idallop" class="allop" value="0" size=15 />
		           </td>
		           <td><input id="iddirect" type="checkbox" class="direct" name="direct" >
		               <input type="hidden" name="direc" maxlength="99" id="iddirec" class="direc" value="0" size=15 />
		           </td>
	       </tr>
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	  <a href="approverD.jsp" onclick="return popitup('approverDisp.jsp')">View Approver</a>
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
<a href="../../adminbom.jsp?msg=1"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>

</body>
</html>