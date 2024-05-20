<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>

<title>Asset Inventory With PO</title>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
    {
		String msgg=null;
		msgg="Session__Time__out__Login__In__Again ";
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
    width: 30%;
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
 
</head>
 




<script type="text/javascript"> // script for validate field
function validatefield()
    {
	var  p;
	//alert("Please entere po no..");
	var pono=document.getElementById("idpo").value;
	
	if((pono==null || pono==""))
		{
		alert("Please enter po no..");
		idpo.focus();
        return false;
		}
	else
		return true;
  }
</script>  



<body>
<form  method="post" onsubmit="return validatefield()" action="AsmInventoryWithPO1.jsp"  name="form1" id="form">
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
<tr > <td bgcolor=""><font size ="2">NAME : <%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2"> DEPARTMENT : <%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
 <div class="modal-content">
<div class="modal-header">
      <center> <h4>IT ASSET INVENTORY WITH PO</h4></center>
    </div>
    <div class="modal-body">
</br>
<center>

     <table width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
     	<tr>
	       	<td><font size="2" face="Swiss" id="hiderow"><font color="red" size="4">*</font>Enter PO&nbsp;No.</font>
	       	
	       	
	                   	<% 
	                   	System.out.println("------------- Asm Inventory With PO  -----------------");
		                Connection con2 = null;
                        String url2 = "jdbc:mysql://localhost:3306/";
                        String db2 = "nepldb";
                        String driver2 = "com.mysql.jdbc.Driver";
                        String userName2 ="root";
                        String password2="";
                        Statement st2=null;
                        ResultSet rs2=null;
                        ResultSet rs3=null;
                        String bno=(String)session.getAttribute("b_no");
                        String city = (String) session.getAttribute("city");
                    try
                       {
                    	Class.forName(driver2).newInstance();
						con2 = DriverManager.getConnection(url2+db2,userName2,password2);
						String query2=null;
					/* 	if(bno.equals("90")) */
							query2 = "SELECT DISTINCT p.pordernon FROM po p	inner join potable po on po.pordernon1=p.pordernon	WHERE ( p.pordernon like '%NEIN/90-%' and po.cence='CE' ) order by pordernon ASC";
						/* if(bno.equals("10"))
						     query2 = "SELECT DISTINCT p.pordernon FROM po p inner join mr_master mr on mr.mr_id=p.mr_idpo inner join mr_item mri on mr.mr_id=mri.mr_id inner join potable po on po.pordernon1=p.pordernon   WHERE ((mr.mr_IT_NONIT='it' OR mr.mr_IT_NONIT='IT') and  (p.pordernon like '%NEIN/10-%' or p.pordernon like '%NEIN/54-%')) order by pordernon ASC";
						if(bno.equals("20"))
							query2 = "SELECT DISTINCT p.pordernon FROM po p inner join mr_master mr on mr.mr_id=p.mr_idpo inner join mr_item mri on mr.mr_id=mri.mr_id inner join potable po on po.pordernon1=p.pordernon   WHERE ((mr.mr_IT_NONIT='it' OR mr.mr_IT_NONIT='IT') and  (p.pordernon like '%NEIN/20-%' or p.pordernon like '%NEIN/21-%' or p.pordernon like '%NEIN/88-%' or p.pordernon like '%NEIN/89-%' or p.pordernon like '%NEIN/51-%')) order by pordernon ASC";
						if(bno.equals("30"))
							query2 = "SELECT DISTINCT p.pordernon FROM po p inner join mr_master mr on mr.mr_id=p.mr_idpo inner join mr_item mri on mr.mr_id=mri.mr_id inner join potable po on po.pordernon1=p.pordernon   WHERE ((mr.mr_IT_NONIT='it' OR mr.mr_IT_NONIT='IT') and  (p.pordernon like '%NEIN/30-%' or p.pordernon like '%NEIN/31-%' or p.pordernon like '%NEIN/53-%')) order by pordernon ASC";
						if(bno.equals("40"))
							query2 = "SELECT DISTINCT p.pordernon FROM po p inner join mr_master mr on mr.mr_id=p.mr_idpo inner join mr_item mri on mr.mr_id=mri.mr_id inner join potable po on po.pordernon1=p.pordernon   WHERE ((mr.mr_IT_NONIT='it' OR mr.mr_IT_NONIT='IT') and  (p.pordernon like '%NEIN/40-%' or p.pordernon like '%NEIN/41-%' or p.pordernon like '%NEIN/52-%' ) ) order by pordernon ASC";
					 */
						st2 = con2.createStatement();
 						rs2 = st2.executeQuery(query2);
 					 	int rowcount=0;
 					 	String posno[]= new String[1000];
 					 	String pofin[]=new String[10000];
 					 	int i=0; 
	 						while(rs2.next())
							{
								rowcount++;
								posno[i++]=rs2.getString(1);
							 }
	 						i=0;
						rs3=st2.executeQuery("select cs.PoNo from csdb.`asset_inventory` cs");
						int rowcount1=0;
 						while(rs3.next())
						{
							rowcount1++;
							pofin[i++]=rs3.getString(1);
						}
						i=0;
						int x=0;
						int flagx=0;
						String OriginalPoNo[]=new String[rowcount];
						for(i=0;i<rowcount;i++)
						{
							flagx=0;
							for(int j =0; j<rowcount1;j++)
							{
								if(posno[i].equals(pofin[j]))
								{
									flagx=1;
									break;
								}
							}
							if(flagx==0)
							{
								OriginalPoNo[x++]=posno[i];
							}
						}%>
						
					    <select name="po" id="idpo" >
        					<option value="">Select</option>
							<%for(i=0;i<x;i++)
						{%>
							<option  value="<%=OriginalPoNo[i]%>"><%=OriginalPoNo[i]%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
						con2.close();
					   }%>	
	       	
	    </tr>	
		   
	  </table>

<br>
</center>
                           
	                          	 <br>
	                          	 <center>
			                       <input style="font-size:1" type="submit" value="SEARCH" name="save3" id="save1" />
	                               
		                          <input type="reset"  value="CANCEL" />
		                             </center>
		                             <br>
		                       <!-- </td>
		                      
	                         </table> -->
                         <!--  </table> -->
    </div>
</div>
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

<div id="resultFromAjax2" style="display:none;">
        
</div>



</body>
</html>