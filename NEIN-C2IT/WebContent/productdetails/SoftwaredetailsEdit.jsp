<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>

<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" />

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

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

<script language="javascript">

function deleteRecord(id)
    {   
	alert(id); 
	if(confirm('You are above to delete invoice'))
	      {
		
		var f=document.form;    
        f.method="post";    
        f.action="InvoiceDel.jsp?id&id1="+id;    
        f.submit();
        
		/* alert("hiiiiiiiiiiiiiiiiiii"+id);
           var f=document.form;    
           f.method="post";    
           f.action="productdetails/InvoiceDel.jsp?id="+id;    
           f.submit(); */
          }
	else{
		//alert("hiiiiiiiiiiiiiiiiiii elseeeeeee");
	}
   }


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
                       }       var url="SubBranchdisplay.jsp";  
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
<form name="form"  method="post" enctype="multipart/form-data" action="SoftwaredetailsUpdate.jsp" >
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
<tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">SOFTWARE AMC DETAILS</font></strong></td>
</tr>
 
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("emp_no")%>" >        
                </td>
 </tr>
</table>
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	    <td></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Software Name</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">License No</font></td>
	   <!-- 	<td bgcolor="#74c1b9" width="120" align=center><font color="black"><b>Vender</b></font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black"><b>PO</b></font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black"><b>AMC Vender</b></font></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black"><b>AMC PO</b></font></td>
	    --> <td bgcolor="#74c1b9" width="120" align=center><font color="black">Branch</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Sub Branch</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC From</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC To</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC Expiry</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC Amount</font></td>
	    <!--  <td bgcolor="#74c1b9" width="120" align=center><font color="black">License Type</font></td>
	      <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC AmountNo of Users</font></td> -->
	     <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC Documents</font></td>  
        <td bgcolor="#74c1b9" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%

String swid = request.getParameter("id");

Connection conn=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Statement st=null,st2=null,st3=null;
ResultSet rs=null,rs2=null,rs3=null;
 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   
    String query1 = "select s.sw_id,s.sw_index,s.software_name,s.license_no,s.vender,s.po_number,s.purchase_date,s.amc_po,s.amc_vender,s.branch,s.sub_branch,s.AMC_from_date,s.AMC_to_date,s.AMC_expiry,s.AMC_amount,s.license_type,s.No_of_users,b.m_b_name,sb.b_name from software_details s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch  where s.sw_id='"+swid+"'";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
   <tr>
   <%while(rs2.next()){ %>
    
         <td style="visibility: hidden;"><input type="hidden" name="sid" value="<%=swid%>">
                                         <input type="hidden" name="swindex" value="<%=rs2.getString("sw_index")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="sname" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("software_name")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="lno" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("license_no")%>"></td>
<%--    	     <td bgcolor="#d2f7f3"><input name="vender" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("vender")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="po" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("po_number")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="amcvender" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_vender")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="amcpo" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_po")%>"></td> --%>
   	     <td bgcolor="#d2f7f3"><%-- <input name="branch" style="background-color:white;width:100;color:black;" value="<%=Branch%>"> --%>
 
 <%Connection con1 = null;
                                                 /*  String url1 = "jdbc:mysql://localhost:3306/";
                                                  String db1 = "csdb";
                                                  String driver1= "com.mysql.jdbc.Driver";
                                                  String userName1 ="root";
                                                  String password1=""; */
                                                  // int sumcount=0;
                                                  Statement st1=null;
                                                  ResultSet rs1=null; 
                                                  int flag=0;
                                                  try
                                                     {
                                                	  Class.forName(driver).newInstance();
                                                	  con1= DriverManager.getConnection(url+dbName,userName,password);  String query = "select * from branch_master_main ORDER BY m_b_name";
                                                     st1 = con1.createStatement();
                                                     rs1 = st1.executeQuery(query);
                                                 %>
                                       <select name="city" onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="<%=rs2.getString("branch")%>"><%=rs2.getString("m_b_name")%></option>
	                                            <%while(rs1.next()){ flag=1;%>
			                                    <option value="<%=rs1.getString("m_b_no")%>"><%=rs1.getString("m_b_name")%></option>
    	                                        <%}%>
	                                  </select>


                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             //con1.close();
                                        			}%>                        			
                             

   	     </td>
   	     <td bgcolor="#d2f7f3"><%-- <input name="sbranch" style="background-color:white;width:100;color:black;" value="<%=Sbranch%>"> --%>
   	     <div id='Subcity'>      
                                              <select name="Subcity" style="font-size: 11px;width: 142px;overflow: auto;height: 20px ">   
                                                   <option value="<%=rs2.getString("sub_branch")%>"><%=rs2.getString("b_name")%></option>  
                                                         </select>     
                                                            </div>
   	     </td>
   	     <td bgcolor="#d2f7f3"><input name="afm" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("AMC_from_date")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="ato" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("AMC_to_date")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="aexp" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("AMC_expiry")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="aamt" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("AMC_amount")%>"></td>
<%--    	     <td bgcolor="#d2f7f3"><input name="ltype" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("license_type")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="nuser" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("No_of_users")%>"></td> --%>
	     <%-- <td bgcolor="#d2f7f3">
        <a href="DownloadFile.jsp?f=<%=invoice%>" >VIEW/DOWNLOAD</a><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=aid%>");' ></font>
        <table class="testxyz2">
     <tr>
     <td>
     <input type="file" id="invoice" name="invoice">
      <a href="# " class="plusbtn">Add</a>
      <a href="# " class="minusbtn">Remove</a></td>
     </tr>
     </table> 
        </td>--%>
        <td bgcolor="#d2f7f3">
       
 <%
Connection con = null;
/* String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password=""; */
try
{
	Class.forName(driver).newInstance();
	con= DriverManager.getConnection(url+dbName,userName,password);
String query2 = "select amc_id,license_no,amc_invoice,sw_index from software_amc_invoice where license_no='"+rs2.getString("license_no")+"' and sw_index='"+rs2.getString("sw_index")+"'";
st3 = con.createStatement();
 rs3 = st3.executeQuery(query2);
 /* String query1="Select user,ip_addr from software_details_multiple where sw_id='"+rs.getInt("sw_id")+"'";
 st1=con.createStatement();
 rs1 = st1.executeQuery(query1); */
%>
<%while(rs3.next()){%>


<input type="hidden" name="invoice" id="invoice" value="<%=rs3.getString("amc_invoice")%>" >
 <a href="DownloadFile.jsp?f=<%=rs3.getString("amc_invoice")%>" >VIEW/DOWNLOAD</a>
<%--  <input id="hiderow" type="button" class="button" size="2" name="user" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs3.getInt("amc_id")%>");' > --%>
<a href="InvoiceDel.jsp?f=<%=rs3.getString("amc_id")%>&g=<%=rs2.getInt("sw_id")%>" >Delete</a>
</font>
  
 <%}%>
 <%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>
<table class="testxyz2">
     <tr>
     <td>
     <input type="file" id="invoice1" name="invoice1">
      <a href="# " class="plusbtn">Add</a>
      <a href="# " class="minusbtn">Remove</a></td>
     </tr>
     </table>
 </td> 
       <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="#d2f7f3"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
	     
	  <%}%>
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
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
   <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
      </form>