<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ include file="banner.jsp" %>
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" />

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

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
		alert("hiiiiiiiiiiiiiiiiiii elseeeeeee");
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
<form name="form"  method="post" enctype="multipart/form-data" action="UpdatePage.jsp" >
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">HARDWARE AMC DETAILS</font></strong></td></tr>
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
		
	    <!-- <td bgcolor="#74c1b9" width="120" align=center><font color="black">Vender</font></td> -->
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Branch</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Sub Branch</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC From</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC To</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC Expiry</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC Amount</font></td>
	    <!--  <td bgcolor="#74c1b9" width="120" align=center><font color="black">License Type</font></td>
	      <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC AmountNo of Users</font></td> -->
	     <td bgcolor="#74c1b9" width="120" align=center><font color="black">AMC Invoice</font></td>  
        <td bgcolor="#74c1b9" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%

String swid = request.getParameter("id");
//System.out.println("idddddd----edit page"+swid);
Connection conn=null;
Statement st=null,st2=null,st3=null;
ResultSet rs=null,rs2=null,rs3=null;
 try 
  {
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
  
   
    String query1 = "select s.hw_id_Nit,s.Asset_no,s.amc_vender,s.amc_po,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch  where s.hw_id_Nit='"+swid+"'";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
   <tr>
   <%while(rs2.next()){ %>
    
         <td style="visibility: hidden;"><input type="hidden" name="sid" value="<%=rs2.getInt("hw_id_Nit")%>">
         <input type="hidden" name="assetno" value="<%=rs2.getString("Asset_no")%>"></td>
          <input type="hidden" name="pono" value="<%=rs2.getString("amc_po")%>"></td>
   	 <%--     <td bgcolor="#d2f7f3"><input name="vender" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_vender")%>"></td> --%>
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
	                                                 Class.forName("com.mysql.jdbc.Driver");
                                                     con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
                                                     String query = "select * from branch_master_main ORDER BY m_b_name";
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
   	     <td bgcolor="#d2f7f3"><input name="afm" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_from_date")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="ato" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_to_date")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="aexp" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_exp_date")%>"></td>
   	     <td bgcolor="#d2f7f3"><input name="aamt" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("amc_amount")%>"></td>
<td bgcolor="#d2f7f3">
       
 <%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query2 = "select hnit_id,Asset_no,amc_po,hnit_invoice from hardware_nonit_invoice where amc_po='"+rs2.getString("amc_po")+"'";
st3 = con.createStatement();
 rs3 = st3.executeQuery(query2);

%>
<%while(rs3.next()){%>


<input type="hidden" name="invoice" id="invoice" value="<%=rs3.getString("hnit_invoice")%>" >
 <a href="DownloadFile.jsp?f=<%=rs3.getString("hnit_invoice")%>" >VIEW/DOWNLOAD</a>


<a href="hwInvoiceDel.jsp?f=<%=rs3.getString("hnit_id")%>&g=<%=rs2.getInt("hw_id_Nit")%>" >Delete</a>
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
       <td bgcolor="#d2f7f3"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
       </tr>
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
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 
      </form>