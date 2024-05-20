<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hardware Details</title>
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" />

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

 <link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>


      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>

<script type="text/javascript">
        $(function () {
            $("#amc1,#amc2,#amc3,#pdate").datepicker({
                textboxImageOnly: true,
                textboxImage: 'images/calendar.png',
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                yearRange: "-40:+0"
               /*  maxDate: new Date() */
            });
        });
    </script>
<style>
/* The Modal (background) */
.modal
    {
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
    background-color: #d2f7f3;
    }
.modal-content
    {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 70%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header
   {
   padding: 2px 16px;
   background-color: #74c1b9;
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
</script> --%>
		
<script type="text/javascript">

$(document).ready(function(e) {
	$('.plusbtn').click(function() {
	    $(".testxyz2").append('<tr><td><input type="file" name="invoice" id="invoice" /> </td></tr>');
	    
	    
	});
    
	$('.minusbtn').click(function() {
		if($(".testxyz2 tr").length != 1)
			{
				$(".testxyz2 tr:last-child").remove();
			}
	   else
			{
				alert("You cannot delete first row");
			}
	});
	
	
});

</script> 
<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="selsubBranch.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("Subcity").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
</script>
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
    	    var url="podetails.jsp";  
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
               	             
                              //alert("here in po");
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("pdate").value =  document.getElementById("p1").value;
                             document.getElementById("vname").value= document.getElementById("p2").value;
                             document.getElementById("cperson").value= document.getElementById("p3").value;
                             document.getElementById("vnum").value= document.getElementById("p4").value;
                             
                            // var str3=xmlHttp.responseText;
                             
                             
                      		 }
             } 
</script>
 <script type="text/javascript">  
 function sendInfo1(m)  
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
    	    var url="podetailsa.jsp";  
    		    url +="?pordernon1=" +m;
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str2=xmlHttp.responseText;
                              //alert("here in amc");
                             document.getElementById("resultFromAjax3").innerHTML = str2;
                             document.getElementById("apdate").value =  document.getElementById("ap1").value;
                             document.getElementById("avname").value= document.getElementById("ap2").value;
                             document.getElementById("acperson").value= document.getElementById("ap3").value;
                             document.getElementById("avnum").value= document.getElementById("ap4").value;
                            /*  document.getElementById("idabc6").value =  document.getElementById("p2").value;
                      		 document.getElementById("idabc7").value =  document.getElementById("p3").value;
                      		 document.getElementById("idabc8").value =  document.getElementById("p4").value; */
                      		 }
             } 
</script> 
<script>

$(document).ready(function () {
	var $tbl = $('#table1'), origRow = $tbl.find('.row').first();
    $('#Button1').click(function(){
       var num = $('#Text1').val();
          $tbl.find('.row').remove();
           for(var i=0;i<num;i++){
        	   var newRow = origRow.clone();
           /* $('table[id="table1"]').append(' <tr class="row"><td><input type="text"></td><td><input type="text"></td></tr>');
 */
        	   $tbl.append(newRow); 
       }
       });
   });
</script>



<script>
function othrSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("other").value;
        if(admOptionValue == nameSelect.value){
            document.getElementById("otherdiv").style.display = "block";
        }
        else{
            document.getElementById("otherdiv").style.display = "none";
        }
    }
    else{
        document.getElementById("otherdiv").style.display = "none";
    }
}
</script>

<script>
function admSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("multiple").value;
        admOptionValue1 = document.getElementById("single").value;
        
        if(admOptionValue == nameSelect.value){
            document.getElementById("multiple1").style.display = "block";
        }
        else{
            document.getElementById("multiple1").style.display = "none";
        }

        if(admOptionValue1 == nameSelect.value){
            document.getElementById("single1").style.display = "block";
        }
        else{
            document.getElementById("single1").style.display = "none";
        } 
        
    }
    
}
</script>

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
				//alert(value);
				prot.find(".hardpc").attr("id","hardp"+id);
				prot.find(".sernoc").attr("id","serno"+id);
				prot.find(".quanc").attr("id","quan"+id); 
				prot.find(".brandc").attr("id","brand"+id);
				prot.find(".modelc").attr("id","model"+id);
				prot.find(".configc").attr("id","config"+id);
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("#tr1").remove();
				//alert(id);
				id--;
			});
		});
	</script>

</head>

<body onload="cleartext()">
<form  name="form"  method="post" enctype="multipart/form-data" onsubmit="return validate()" action="CreatePageback.jsp" >
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
    
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">PRODUCT DETAILS</font></strong></td>
</tr>
 
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
                
                </td>
 </tr>
</table>

<div class="modal-content">
<div class="modal-header">
      <center> <h2>HARDWARE DETAILS</h2></center>
    </div>
    <div class="modal-body">

<center>
<table width="75%" border="1" align="center" bgcolor="#d2f7f3">
<tr>
<td>Asset Type</td>
<td>Serial Number</td>
<td>Brand</td>
<td>Model</td>
<td>Configuration</td>
 </tr> 
 <%
 String assetno=request.getParameter("assetno");
 //System.out.println("in hard pageeeeeeeee-----"+assetno);
 
 Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
Statement st=null;
ResultSet rs=null; 
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "SELECT AssetType,serial_no,model_no,brand,ConfigField FROM asset_item WHERE Asset_No='"+assetno+"'";
st = con.createStatement();
 rs = st.executeQuery(query);
%>
<%while(rs.next()){%>
 <tr>
 <td> <input type="hidden" name="assetnum" id="assetnum" value="<%=assetno%>" readonly/>
 <input type="text" name="assettype" id="assettype" value="<%=rs.getString("AssetType")%>" readonly/></td>
 <td><input type="text" name="sno" id="sno" value="<%=rs.getString("serial_no")%>" readonly/></td>
 <td><input type="text" name="brand" id="brand" value="<%=rs.getString("brand")%>" readonly/></td>
 <td><input type="text" name="model" id="model" value="<%=rs.getString("model_no")%>" readonly/></td>
 <td><input type="text" name="config" id="config" value="<%=rs.getString("ConfigField")%>" readonly/></td>
 </tr>
 <%}%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>
 </table>
 <table width="75%" border="1" align="center" bgcolor="#d2f7f3">     
  <tr>
     <td>PO Number</td>
    
            <td><input type="text" name="ponum" maxlength="20" id="ponum" value="" size=15 onkeyup="sendInfo(this.value)"/>                             			</td>
     <td>Purchase Date</td>                              			
     <td><input type="text" name="pdate" id="pdate" readonly>
     </td>
     </tr>
     <tr>
     <td>Vender</td>
     <td><input type="text" id="vname" name="vname" readonly>
     
         <td>Contact number</td>
     <td><input type="text" name="vnum" id="vnum" readonly></td>
     </tr>
     <tr>
     <td>Contact Person</td>
     <td><input type="text" name="cperson" id="cperson" readonly></td>                                  			
    <td><font color="red" size="4">*</font>AMC PO Number</td>
    
            <td><input type="text" name="aponum" maxlength="20" id="aponum" value="" size=15 onkeyup="sendInfo1(this.value)" required/>     </td>
     
     </tr>
     <tr>
                             			
     <td><font color="red" size="4">*</font>AMC Purchase Date</td>                              			
     <td><input type="text" name="apdate" id="apdate" readonly>
     </td>
      <td><font color="red" size="4">*</font>AMC Vender</td>
     <td><input type="text" id="avname" name="avname" readonly></td>
     </tr>
     <tr>
    
     <td><font color="red" size="4">*</font>AMC Contact number</td>
     <td><input type="text" name="avnum" id="avnum" readonly></td>
      <td><font color="red" size="4">*</font>AMC Contact Person</td>
     <td><input type="text" name="acperson" id="acperson" readonly></td> 
     </tr>

     
     <tr> 
     <td>Branch</td>
     <td><%Connection con1 = null;
                                                  String url1 = "jdbc:mysql://localhost:3306/";
                                                  String db1 = "csdb";
                                                  String driver1= "com.mysql.jdbc.Driver";
                                                  String userName1 ="root";
                                                  String password1="";
                                                  // int sumcount=0;
                                                  Statement st1=null;
                                                  ResultSet rs1=null; 
                                                  int flag=0;
                                                  try
                                                     {
	                                                 Class.forName(driver).newInstance();
                                                     con = DriverManager.getConnection(url+db,userName,password);
                                                     String query = "select * from branch_master_main ORDER BY m_b_name";
                                                     st = con.createStatement();
                                                     rs = st.executeQuery(query);
                                                 %>
                                       <select name="city" required onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="">Select</option>
	                                            <%while(rs.next()){ flag=1;%>
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
     <td>Sub Branch</td>
     <td><div id='Subcity'>      
                                              <select name="Subcity" required style="font-size: 11px;width: 142px;overflow: auto;height: 20px ">   
                                                   <option value='-1'></option>  
                                                         </select>     
                                                            </div></td>
     </tr>
     <tr>
     <td>AMC From</td>
     <td><input type="text" id="amc1" name="amc1" required></td>
     
     <td>AMC To</td>
     <td><input type="text" id="amc2" name="amc2" required> </td>
     </tr>
     <tr>
     <td>AMC Expiry</td>
     <td><input type="text" id="amc3" name="amc3" required></td>
     <td>AMC Amount</td>
     <td><input type="text" name="amcamt" id="amcamt" required>
     </td>
     </tr>
     <tr>
     <!-- <td>IP Address</td>
     <td><input type="text" name="ip" id="ip"></td>
      -->
     <td>
     AMC Invoice</td>
     <td  ><table class="testxyz2">
     <tr>
     <td>
     <input type="file" id="invoice" name="invoice" required> <br>
      <a href="# " class="plusbtn">Add</a>
      <a href="# " class="minusbtn">Remove</a></td>
     </tr>
     </table>
     </td>
</table>



</center>

                          
                              <table width="100%" border="0" align="center" bgcolor="#d2f7f3">
                              <tr>
	                          	<td style="size:1">
	                          	     <center>
			                		<input type=submit name="button" value="OK" id="button">
			                		<!-- <input type="button" name="backBtn"  value="BACK" /> -->
		                            <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" />
		                             </center>
		                       </td>
		                      </tr>
	                         </table>
</div>
</div>
</br> 
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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
       <div id="resultFromAjax1" style="display:none;">
        
       </div>
    <div id="resultFromAjax3" style="display:none;">
        
       </div>
</body>
</html>