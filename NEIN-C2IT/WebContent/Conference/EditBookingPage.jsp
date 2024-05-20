<%-- <%@page import="CON2.DbUtil"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>

<%@ page import="java.sql.*" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
 
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> 
  <link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" /> 

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>


      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>

<script>
function validate()
{

	var x=document.getElementById("status").value;
	
	if(x=="select")
		{
		alert("Please select the mail sending option");
		return false;
		}
	return true;
}
</script>
 
 <script>
$(function() 
		  {   $( "#date1,#date2" ).datepicker({
		       changeMonth:true,
		       changeYear:true,
		       yearRange:"-50:+50",
		       minDate: 0,
		       dateFormat:"yy-mm-dd" });
		   });
</script>
  
  <style>
			.dynatable1 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable1 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable1 .prototype1 {
				display:none;
			}
</style> 
   
    <script>
		var id1 =0;
		$(document).ready(function() {
		//	alert("hiiiii");
			// Add button functionality
			$("table.dynatable1 button.add").click(function() {
				id1++;
			//	alert("ID :"+id);
				var master = $(this).parents("table.dynatable1");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype1").clone();
				prot.attr("class", "");
				prot.find(".id1").attr("value",id1);
				//alert(value);
				prot.find(".vcbranch").attr("id","vcbranch"+id1);
				
			
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable1 button.remove").live("click", function() {
				$(this).parents("#tr2").remove();
				alert(id1);
				id1--;
			});
		});
	</script>
   
   <script>
 function check() {
    
	 document.getElementById("inp").value=document.getElementById("id").value;
  
	 var x=document.getElementById("inp").value;
	// alert(x);
	 var y=document.getElementById("inp1").value;
	// alert(y);
	 var z= document.getElementById("inp2").value;
	// alert(z);
	 
	 document.getElementById("inpf").value=x+":"+y+" "+z;
    } 
 </script>
 <script>
 function check1() {
    
	 document.getElementById("inp1").value=document.getElementById("id1").value;
  
	 var x=document.getElementById("inp").value;
	 //alert(x);
	 var y=document.getElementById("inp1").value;
	// alert(y);
	 var z= document.getElementById("inp2").value;
	// alert(z);
	 
	 document.getElementById("inpf").value=x+":"+y+" "+z;
	 
    } 
 </script>
<!--  <script>
 function check2() {
    
	 document.getElementById("inp2").value=document.getElementById("id2").value;
 //  alert("hiii1111");
	 var x=document.getElementById("inp").value;
	 //alert(x);
	 var y=document.getElementById("inp1").value;
	// alert(y);
	 var z= document.getElementById("inp2").value;
	// alert(z);
	 
	 document.getElementById("inpf").value=x+":"+y+" "+z;
    } 
 </script>
  -->
 
 <script>
 function checkt() {
    
	 document.getElementById("inpt").value=document.getElementById("idt").value;
  
	 var x=document.getElementById("inpt").value;
	// alert(x);
	 var y=document.getElementById("inpt1").value;
	// alert(y);
	 var z= document.getElementById("inpt2").value;
	// alert(z);
	 
	 document.getElementById("inptf").value=x+":"+y+" "+z;
    } 
 </script>
 <script>
 function checkt1() {
    
	 document.getElementById("inpt1").value=document.getElementById("idt1").value;
  
	 var x=document.getElementById("inpt").value;
	// alert(x);
	 var y=document.getElementById("inpt1").value;
	// alert(y);
	 var z= document.getElementById("inpt2").value;
	// alert(z);
	 
	 document.getElementById("inptf").value=x+":"+y+" "+z;
	 
    } 
 </script>
<!--  <script>
 function checkt2() {
    
	 document.getElementById("inpt2").value=document.getElementById("idt2").value;
   ///alert("hiii1111");
	 var x=document.getElementById("inpt").value;
	// alert(x);
	 var y=document.getElementById("inpt1").value;
	// alert(y);
	 var z= document.getElementById("inpt2").value;
	// alert(z);
	 
	 document.getElementById("inptf").value=x+":"+y+" "+z;
    } 
 </script>
 
  -->
  <script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showRoom(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="RoomTypeSelectPage.jsp";  
                           url +="?branchid=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("room").innerHTML=xmlHttp.responseText;    
                                                      } 
                                                              
            }  
</script>	

 <script>
   $(document).ready(function () {
	   var $tbl = $('#table1');
	     $('#Button1').click(function(){
	        var num = $('input[id="Text1"]').val();
	            //alert(num);
	            $tbl.find('.row').remove();
	            for(var i=1;i<=num;i++){
	            	
	            $('table[id="table1"]').append(' <tr class="row"><td><input type="text" name="rr1"></td><td><input type="text" name="rr"></td><td><select name="type"><option value="Host/Leader">Host/Leader</option><option value="Participant">Participant</option></select></td></tr>');

	        }
	        });
	    });
</script>

<%-- <script  type="text/javascript">
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
 --%>
<style>
.button {
    background:none!important;
     border:none; 
     padding:0!important;
    
    /*optional*/
    font-family:arial,sans-serif; /*input has OS specific font-family*/
     color:red;
     text-decoration:underline;
  
</style>
   <!-- <script>
function admSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("vc").value;
        admOptionValue1 = document.getElementById("ac").value;
        
        if((admOptionValue == nameSelect.value) || (admOptionValue1 == nameSelect.value)){
            document.getElementById("divs").style.display = "block";
        }
        else{
            document.getElementById("divs").style.display = "none";
        }
        
       
    }
    else{
        document.getElementById("divs").style.display = "none";
    }
}
</script>  -->

<script>
function admSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("vc").value;
        admOptionValue1 = document.getElementById("ac").value;
      admOptionValue2 = document.getElementById("webex").value;
     //alert(admOptionValue2);
        //alert("hiiii");
        if((admOptionValue == nameSelect.value) || (admOptionValue1 == nameSelect.value)){
            document.getElementById("divs").style.display = "block";
        }
        else{
            document.getElementById("divs").style.display = "none";
        }
        if(admOptionValue2 == nameSelect.value){
            document.getElementById("div").style.display = "block";
        }
        else{
            document.getElementById("div").style.display = "none";
        }
       
    }
    else{
        document.getElementById("divs").style.display = "none";
    }
}
</script>
    
<SCRIPT Language="Javascript">

/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function btnClick() { 
         close(); 
}
</script>

</head>
<body>
<br><br>
 <form name="form"  method="post"  action="UpdateBookingPage.jsp" > 
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
       <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">BOOKING DETAILS</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
               <%--  <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="text" name="empid" value="<%=session.getAttribute("empid")%>" >        
                </td>
 </tr>
</table>

<center>
 <br />
                
	
<%
response.setContentType("text/html;charset=UTF-8");

String bookingno=request.getParameter("id");
//System.out.println("booking number-in edit page--"+bookingno);
String id1=request.getParameter("id1");

Connection con1 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null,st1=null,st2=null,st3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null; 
try
{
	Class.forName(driver).newInstance();
	con1= DriverManager.getConnection(url+dbName,userName,password);
String query =null;
PreparedStatement prds=null;


		System.out.println("in edit try block");
		//query = "SELECT * FROM `conference_room_booking` WHERE `Booking_no`='"+bookingno+"'";
		query="SELECT a.*,b.branch_name,d.department_name FROM csdb.conference_room_booking a inner join leavemanagement.branchmaster b on b.branch_type_code=a.booking_for_branch inner join leavemanagement.department d on d.department_id=a.booking_for_dept WHERE a.id='"+id1+"'";
		 prds = con1.prepareStatement(query);
		/* 	prds.setDate(1, new java.sql.Date(startDate.getTime() ));
			prds.setDate(2,new java.sql.Date(endDate.getTime())); */
			rs = prds.executeQuery();
	
%>
<%while(rs.next()){%>
<table width="75%" border="1" align="center" bgcolor="#d2f7f3">
 <tr>
<td>Booking for(Person Name)<input type="hidden" name="booking_no" id="booking_no" value="<%=rs.getString("Booking_no")%>"/>
<input type="hidden" name="id" id="id" value="<%=rs.getString("id")%>"/></td>
<td><input type="text" name="bname" id="bname" value="<%=rs.getString("booking_for_person")%>"/></td>

<td>Branch</td>
<td>
 <%  try
     {
	  Class.forName(driver).newInstance();
		con1= DriverManager.getConnection(url+dbName,userName,password);
      String query1 = "select * from vc_branchmaster ORDER BY branch_name";
      st1 = con1.createStatement();
      rs1= st1.executeQuery(query1);
      int flag=0;
                                                 %>
                                       <%-- <select name="bpcity" onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="<%=rs.getString("booking_for_branch")%>"><%=rs.getString("branch_name")%></option>
	                                            <%while(rs1.next()){ %>
			                                    <option value="<%=rs1.getString("branch_type_code")%>"><%=rs1.getString("branch_name")%></option>
    	                                        <%}%>
	                                  </select>
 --%>
                                            <select name="branchid" required onchange="showRoom(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="<%=rs.getString("booking_for_branch")%>"><%=rs.getString("branch_name")%></option>
	                                            <%while(rs1.next()){ %>
			                                    <option value="<%=rs1.getString("branch_id")%>"><%=rs1.getString("branch_name")%></option>
    	                                        <%}%>
	                                  </select>
                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                            // con2.close();
                                        			}%>  
</td>
</tr>
<tr>
<td>Department</td>
<td> <%
                                                 
                                                  
                                                  int flag1=0;
                                                  try
                                                     {
                                                	  Class.forName(driver).newInstance();
                                                		con1= DriverManager.getConnection(url+dbName,userName,password);
                                                     String query2 = "select * from leavemanagement.department ORDER BY department_name";
                                                     st2 = con1.createStatement();
                                                     rs2= st2.executeQuery(query2);
                                                 %>
                                       <select name="bdept" onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="<%=rs.getString("booking_for_dept")%>"><%=rs.getString("department_name")%></option>
	                                            <%while(rs2.next()){ %>
			                                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
    	                                        <%}%>
	                                  </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             con1.close();
                                        			}%>  </td>
<td>Purpose</td>
<td><select name="purpose">
    <option><%=rs.getString("purpose")%></option>
    <option>Internal</option>
    <option>External</option>
</select></td>
</tr>

<tr>
<td>Booking Room Type
</td>
<td>
<div id='room'>      
<select name="room" required style="font-size: 11px;width: 142px;overflow: auto;height: 20px ">   
<option value="<%=rs.getString("booking_room_type")%>"><%=rs.getString("booking_room_type")%></option>
<option value='-1'></option>  
</select>     
</div>
<%-- <% 
                                                     try
                                                     {
	                                                 Class.forName(driver).newInstance();
                                                     con1 = DriverManager.getConnection(url+db,userName,password);
                                                     String query3 = "select * from bookinformaster ORDER BY Booking_For";
                                                     st3 = con1.createStatement();
                                                     rs3 = st3.executeQuery(query3);
                                                 %>
                                       <select name="bookingtype" onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="<%=rs.getString("booking_room_type")%>"><%=rs.getString("booking_room_type")%></option>
	                                            <%while(rs3.next()){%>
			                                    <option value="<%=rs3.getString(2)%>"><%=rs3.getString(2)%></option>
    	                                        <%}%>
	                                  </select>

                                          <%} catch (SQLException ex) {
                                                    ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             con1.close();
                                        			}%>   --%>
</td>
<td>Meeting Type</td>
<td><select id="select" name="select" onchange="admSelectCheck(this);">
<option value="<%=rs.getString("meeting_type")%>"><%=rs.getString("meeting_type")%></option>
<option id="vc">Video Conference</option>
<option id="ac">Audio Conference</option>
<option id="webex">Web-Ex Meeting</option>
<option>General Meeting</option>
<option>Others</option>
</select>

<div id="div" style="display:none;">
     Number of Web-Ex participants :<input type="text" id="Text1" name="Text1">
     
     <input id="Button1" type="button" value="Add" onclick="showRow()"/>
     <br>
     
     <table id="table1">
     <tr>
     <th>Name</th>
     <th>Email Id</th>
     <th>Type</th>
     </tr>
    
     <tr class="row">
    <td><input type="text" name="rr1"></td>
    <td><input type="text" name="rr"></td>
    <td><select name="type"><option value="Host/Leader">Host/Leader</option><option value="Participant">Participant</option></select></td>
  </tr>
     </table>
     </div>

<div id="divs" style="display:none;">
<p>Select VC/AC with Branch</p>
<table class="dynatable1" width="75%" border="1"  cellspacing="0" cellpadding="0" bgcolor="#d2f7f3">
  	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Select</font></td>
		    
	     </tr>
		 <tr class="prototype1" id="tr2">
		           <td width="2" align="center" height="21"><button class="remove" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" name="id1[]" value="0" size=1 class="id1" readonly="readonly" /></td>
		           <td>
		                <% 
		                Connection con6 = null;
                        /* String url6 = "jdbc:mysql://localhost:3306/";
                        String db6 = "csdb";
                        
                        String driver6 = "com.mysql.jdbc.Driver";
                        String userName6 ="root";
                        String password6=""; */
                        // int sumcount=0;
                        Statement st6=null;
                        ResultSet rs6=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
	                  con6= DriverManager.getConnection(url+dbName,userName,password);
						String query2 = "select * from vc_branchmaster ORDER BY branch_name";
						st6 = con6.createStatement();
 						rs6 = st6.executeQuery(query2);
						%>
					    <select name="vcbranch" class="vcbranch" id="vcbranch">
        					<option selected="selected">Select</option>
							<%while(rs6.next()){%>
								
										<option  value="<%=rs6.getString(3)%>"><%=rs6.getString(2)%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con6.close();
					   }%>	
				
		       </td>
              </tr>
</table>
		

</td>
</tr>
<tr>
<td>From Date & Time
</td>
<td>
<!-- <input type="text" name="fromd" id="fromd" placeholder="Date"/> -->
<input type="text" name="date1" id="date1" placeholder="Date" value="<%=rs.getString("from_date")%>"/>
<!-- <select id="id"  onChange="check();">
<option value="HRf">HR</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>

</select>
<input type="hidden" name="input" id="inp" value="">
<select id="id1"  onChange="check1();">
<option value="MMf">MM</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>

</select>
<input type="hidden" name="input" id="inp1" value="">
<select id="id2"  onChange="check2();">
<option>AM/PM</option>
<option>AM</option>
<option>PM</option>
</select>
<input type="hidden" name="input" id="inp2" value=""> -->
<input type="text" name="inpf" id="inpf" value="<%=rs.getString("from_time")%>">
</td>
<td>To Date & Time
</td>
<td><input type="text" name="date2" id="date2" placeholder="Date" value="<%=rs.getString("to_date")%>"/>
<!-- <select id="idt"  onChange="checkt();">
<option value="HRt">HR</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>
<input type="hidden" name="input" id="inpt" value="">
<select id="idt1"  onChange="checkt1();">
<option value="MMt">MM</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>

</select>
<input type="hidden" name="input" id="inpt1" value="">
<select id="idt2"  onChange="checkt2();">
<option>AM/PM</option>
<option>AM</option>
<option>PM</option>
</select>
<input type="hidden" name="input" id="inpt2" value=""> -->
<input type="text" name="inptf" id="inptf" value="<%=rs.getString("to_time")%>">
</td>
</tr>
<!-- <tr>
<td>From Time
</td>
<td>  <input type="text" id="time1" name="time1" />
                                         
        </td>
<td>To Time
</td>
<td>
                         
</td>
</tr> -->
<tr>

<td>Total No of Attendies</td>
<td><input type="text" name="npart" id="npart" value="<%=rs.getString("no_of_attendies")%>"/></td>
<td>Remarks</td>
<td><textarea name="remarks"><%=rs.getString("remarks")%></textarea></td>
</tr>
<%-- <tr>

<td>cc
</td>
<td > <input type="text" name="cc" id="cc" value="<%=rs.getString("cc")%>"></td>
</tr> --%>

</table>
 <%}%>
 
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>

	</table>
<br>
<br>
<table>
<tr>
<td>Should updation mail go to your cc list<font color="red">*</font>
</td>
<td>
<Select name="status" id="status" >
<option value="select">select</option>
<option value="yes">yes</option>
<option value="no">no</option>
</Select>
</td></table>
<br>
<input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;" onclick="return validate();">&nbsp&nbsp&nbsp&nbsp
<input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'>
</form> 

<br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="#" onclick='history.go(-1)'><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 

</body>
</html>