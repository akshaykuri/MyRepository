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
       <title>updateConfig</title>
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
		  var f=document.form;  
	      f.method="post";   
		  f.action='assetConfigUpdatformBackNONIT.jsp?msg=1';
		  f.submit();
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
<tr> <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DEPARTMENT :<%=session.getAttribute("department")%> </font></font></td>
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
     <input type="hidden" name="atype" maxlength="99" id="idatype" value="" size=20 />
	 <table width="100%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	   	     <tr><td colspan="7" align="center" bgcolor="grey">UPDATE CONFIGURATION FORM</td></tr>
	   	    <%
	   	 	   
	   	    	System.out.println("------------- NONIT  Asset Config Update Form  -----------------");
               String name=null,conf="";
               Connection conn = null;
               String url = "jdbc:mysql://localhost:3306/";
               String dbName = "csdb";
               String driver = "com.mysql.jdbc.Driver";
               String userName = "root"; 
               String password = "";
               String s=request.getParameter("ano");  
               String atype=null,conffield=null,allconf=null;
               int i=0;
               String[] tokens;
               String proper=null;
              // String p=request.getParameter(s); 
               //String invno=p.split(",")[0];
               //String ano=p.split(",")[1];
               //String atype=p.split(",")[2];
               //System.out.println("Inventory No :"+invno);
               //System.out.println("Asset No :"+ano);
               //System.out.println("Asset Type :"+atype);
               ResultSet rs1,rs;
               try
                  {  
  	              Class.forName("com.mysql.jdbc.Driver").newInstance();  
                  conn = DriverManager.getConnection(url+dbName,userName,password);  
                  Statement stmt = conn.createStatement();  
                  //rs = stmt.executeQuery("SELECT * FROM asset_item WHERE (Asset_No='" + s + "');");
               	   rs = stmt.executeQuery("SELECT ai.* FROM asset_item ai, asset_type at WHERE ai.Asset_No='" + s + "' and at.item_name = ai.AssetType and at.it_nonit='NON IT'");   
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
                      <td width="" align="center"  height="21" ><font size="2"><input type="text" name="atype1" id="idatype1" style="background-color:lightgrey;" value="<%=rs.getString(4)%>" readonly/></font></td>
                    </tr>  
                    <tr>
                      <td>BranchName</td>
                      <td width="" align="center"  height="21" ><font size="2"><input type="text" name="branch" id="idbranch" style="background-color:lightgrey;" value="<%=rs.getString(6)%>" readonly/></font></td>
                    </tr>    
                    
                  <%atype=rs.getString(4);
                    conffield=rs.getString(18);
                    //System.out.println("Asset type :"+ atype );
                    //System.out.println("Config Field 1:"+ conffield );
                    }
                    System.out.println("Config Field :"+ conffield );
                    if(conffield==null)
                            {
                             rs1 = stmt.executeQuery("SELECT configname FROM assetconfgfield WHERE (assettype='" + atype + "');");
                             while(rs1.next())
                                   {
                	               //System.out.println("Config Field :"+ conffield );
                                   conf=conf+",`"+rs1.getString(1);
                                  //System.out.println("Config :"+conf);%> 
                                  <tr>
		                             <td ><font size="2"><font color="red" size="4">*</font><%=rs1.getString(1)%></font></td>
		                             <td width="" align="center"  height="21" ><font size="2"><input type="text" name="<%=rs1.getString(1)%>" id="<%=rs1.getString(1)%>" style="background-color:white;" value="null"/></font></td>
		                          </tr>   
	                             <%}} else {
	                            	 rs1 = stmt.executeQuery("SELECT configname FROM assetconfgfield WHERE (assettype='" + atype + "');");
	                            	 //System.out.println("Config Field :"+ conffield );
                   	                 String delimiter = ",";
                  	                 /* given string will be split by the argument delimiter provided. */
                  	                 tokens = conffield.split(delimiter);
                  	                 /*  for(int i =0; i < tokens.length ; i++)
                  	                 System.out.println(tokens[i]); */
	                           	     while(rs1.next())
	                                       {
	                            	       conf=conf+",`"+rs1.getString(1);
	                                       //System.out.println("Token  :"+tokens[i]);
	                                       if(i<tokens.length){
	                                       String[] split = tokens[i].split("=");
	                                       if(split[1]=="")
	                                    	   proper=null;
	                                       else
	                                           proper = split[1];
	                                       }
	                                       %> 
	                                       <tr>
	    		                             <td ><font size="2"><font color="red" size="4">*</font><%=rs1.getString(1)%></font></td>
	    		                             <td width="" align="center"  height="21" ><font size="2"><input type="text" name="<%=rs1.getString(1)%>" id="<%=rs1.getString(1)%>" style="background-color:white;" value="<%=proper%>"/></font></td>
	    		                           </tr>  
	    		                 <% i++;proper=null;}} %>
	                           
	          <%}catch(SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        conn.close();		             
			           }%>
			        
      </table>
        <table>
			     
			          <tr>
                        <td align=center><input type=submit name="button" value="UPDATE" id="addbutton" onclick='validate();' >
                         <input type="button" name="cancleBtn" value="CANCEL" onclick='btnClick();'/></td>
                      </tr>  
			     </table>     
			   
     
      </center> 	
      
 </div>
</div>
<br/>

    <input type="hidden" name="config" maxlength="500" id="idconfig" value="<%=conf%>" size=500 />	
    <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
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
 <input type="hidden" name="config" maxlength="500" id="idconfig" value="<%=conf%>" size=500 />  
 </form>
 				   
</body>
</html>  
  
  
   