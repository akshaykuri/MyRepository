<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>

<html>
    <head>
        <title>AddConfig</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
<script language = "Javascript">
function btnClick() 
     { 
     close(); 
     }
</script>
<script language = "Javascript">
function validate() 
      {
			// alert("Here");
		  var config = document.getElementById("idconfig").value;
		  var allconf="";
		  var inventory_no= document.getElementById("idinv").value;//request.getParameter("invno");
		  var asset_no=  document.getElementById("idano").value;//request.getParameter("assetno");
		  var atype = document.getElementById("idatype").value;
		  var branch_name=document.getElementById("idabranch").value;
		  
		//  alert("asset Details ::"+inventory_no+" ::: " + atype +" ::: "+ asset_no +" :::  "+ branch_name);
		  
		  //var branch_name=request.getParameter("branch");
		 // alert(atype);
	 	 var conf = config.split(",`");															
	 	 for(var i =1; i < conf.length; i++)
	 	 {
		  var field = document.getElementById(conf[i]).value;
		  // alert("Field :"+field); 
	 	  if(field=="")
		  {
		  	allconf=allconf+conf[i]+"="+"null"+",";
		  	alert("Enter the value");
	 		return false;
		  }
		  else
		  {		
			  allconf=allconf+conf[i]+"="+field+",";
	   	 }
	  }

	    // alert("test1:"+atype);
     	 if(atype=="DESKTOP")
    	 {
     			//	alert("inside If"+atype);
     		var f=document.form;  
   	 	    f.method="post";
      		f.action='assetDesktopConfigFieldAdd.jsp?allconf='+allconf+'&atype='+atype+'&inventory_no='+inventory_no+'&asset_no='+asset_no;
      		f.submit();
    	 }
     	 else if(atype=="CCVTV")
     		 {
     			var f=document.form;  
   	 	    	f.method="post";
      			f.action='assetCCVTVConfigFieldAdd.jsp?allconf='+allconf+'&atype='+atype+'&inventory_no='+inventory_no+'&asset_no='+asset_no;
	      		f.submit();
     		 }
     	 else if(atype=="UPS_SETUP")
     		 {
     			var f=document.form;  
	 	    	f.method="post";
  				f.action='assetUPSConfigFieldAdd.jsp?allconf='+allconf+'&atype='+atype+'&inventory_no='+inventory_no+'&asset_no='+asset_no;
      			f.submit();
     		 
     		 }
    	 else{
    		 //alert("inside else"+atype);
    		 var f=document.form;  
    	     f.method="post";
    		 f.action='assetConfigAddBack.jsp?allconf='+allconf+'&atype='+atype;
    		 f.submit();
     	} 
      
     }
</script>  
</head>
 <body>
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
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>CONFIGURATION FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
    <table width="100%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	   	     <tr><td colspan="7" align="center" bgcolor="grey">ADD CONFIGURATION FORM</td></tr>
	   	    <%
               String name=null,conf="";
               Connection conn = null;
               String url = "jdbc:mysql://localhost:3306/";
               String dbName = "csdb";
               String driver = "com.mysql.jdbc.Driver";
               String userName = "root"; 
               String password = "";
               String s=request.getParameter("atype");  
               String p=request.getParameter(s); 
               String invno=request.getParameter("invno"); 
               String ano=request.getParameter("assetno");
               String atype=request.getParameter("atype");
               System.out.println("In configuration Inventory No :"+invno);
            //   System.out.println("Asset No :"+ano);
         //      System.out.println("Asset Type :"+atype);
               ResultSet rs1,rs;
               try
                  {  
  	              Class.forName("com.mysql.jdbc.Driver").newInstance();  
                  conn = DriverManager.getConnection(url+dbName,userName,password);  
                  Statement stmt = conn.createStatement();  
                  rs = stmt.executeQuery("SELECT * FROM asset_item WHERE (Inventory_No='" + invno + "' AND Asset_No='" + ano + "');");
                    if(rs.next()) {%>
                    <tr>
                      <td>Inventory_No</td>
                      <td width="" align="center"  height="21" ><font size="2"><input type="text" name="inv" id="idinv" style="background-color:lightgrey;" value="<%=rs.getString(2)%>" readonly/></font></td>
                    </tr>   
                  <tr>
                      <td>Asset_No</td>
                      <td width="" align="center"  height="21" ><font size="2"><input type="text" name="ano" id="idano" style="background-color:lightgrey;" value="<%=rs.getString(3)%>" readonly/></font></td>
                    </tr>  
                    <tr>
                      <td>AssetType</td>
                      <td width="" align="center"  height="21" ><font size="2"><input type="text" name="atype" id="idatype" style="background-color:lightgrey;" value="<%=rs.getString(4)%>" readonly/></font></td>
                    </tr>  
                    <tr>
                      <td>BranchName</td>
                      <td width="" align="center"  height="21" ><font size="2"><input type="text" name="abranch" id="idabranch" style="background-color:lightgrey;" value="<%=rs.getString(6)%>" readonly/></font></td>
                    </tr>    
                  <% } rs1 = stmt.executeQuery("SELECT configname FROM assetconfgfield WHERE (assettype='" + atype + "');");
                  while(rs1.next())
                        {
                	 
                	 
                        	conf=conf+",`"+rs1.getString(1);
                       
                        
                        //System.out.println("Config :"+conf);%>
                        
                        
                             
                             <tr>
		                     <td ><font size="2"><font color="red" size="4">*</font><%=rs1.getString(1)%></font></td>
		                     <td width="" align="center"  height="21" ><font size="2"><input type="text" name="<%=rs1.getString(1)%>" id="<%=rs1.getString(1)%>" style="background-color:white;" value=""/></font></td>
		                       
		                     </tr>   
	                      <%}%>
	          <%}catch(SQLException ex)
                          {
	        	           ex.printStackTrace();
                          }	
                finally{
                        conn.close();		             
			           }%>
			     <table>
			     
			          <tr>
                        <td align=center><input type=submit name="button" value="Add" id="addbutton" onclick="return validate()" >
                         <input type="button" name="cancleBtn" value="CANCEL" onclick='btnClick();'/></td>
                      </tr>  
			     </table>     
			        
      </table>
     
      </center> 	
      
 </div>
</div>
<br>

    <input type="hidden" name="config" maxlength="500" id="idconfig" value="<%=conf%>" size=500 />	
    <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                              
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    </tr>
</table>
 <input type="hidden" name="config" maxlength="500" id="idconfig" value="<%=conf%>" size=500 />  
 </form>
 				   
</body>
</html>  
  
  
   