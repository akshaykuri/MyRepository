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
    width: 80%;
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
function func(atype) 
      {
      var f=document.form;  
      //  alert(atype);
      f.method="post";   
	  f.action='assetConfigAddNONIT.jsp?atype='+atype;
	  f.submit();
	  }
</script>  
<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
	System.out.println("------------- NONIT Add Asset Config Field  -----------------");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","   ");
    //System.out.println(disp);
    %>
    msg = "<%=disp%>";
    if(msg!="1")
		{
        alert(msg);
        msg=null;
		}
</script>   

</head>
 <body>
 <form method="post" name="form" id="form" >
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
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>ADD NON-IT ASSET CONFIGURATION FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
      
      <input type="hidden" name="atype" maxlength="99" id="idatype" value="" size=20 />
	 <table width="100%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	   	     <tr><td colspan="7" align="center" bgcolor="grey">ADD NON-IT ASSET CONFIGURATION FORM</td></tr>
	   	     <tr>
	        <!-- <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp; No.  :</font> -->
	        <td  width=""  height="21" bgcolor="grey"><font size="2">Inventory_No</font></td>
	        <td width=""  height="21" bgcolor="grey"><font size="2">Asset_No</font></td>
	        <td width=""  height="21" bgcolor="grey"><font size="2">AssetType</font></td>
	        <td width=""  height="21" bgcolor="grey"><font size="2">BranchName</font></td>
	         <td width=""  height="21" bgcolor="grey"><font size="2">WarExpDate</font></td>
	       <!--  <td width=""  height="21" bgcolor="grey"><font size="2">Assigned By</font></td> -->
	        <td width=""  height="21" bgcolor="grey"><font size="2">Config</font></td>
	       
            </tr>  
              <%
              String ast=request.getParameter("msg");
              String result = ast.substring(16,28);
              //System.out.println("Inventory no:"+result);
              //String ast="<script>document.writeln(myParam)</script>";
              Connection con1 = null;
              String url1 = "jdbc:mysql://localhost:3306/";
              String db1 = "csdb";
              String driver1 = "com.mysql.jdbc.Driver";
              String userName1 ="root";
              String password1="";
              Statement st1=null,st2=null;
              ResultSet rs1=null,rs2=null;
              int k=0;
              try
                 {
                 Class.forName(driver1).newInstance();
	             //System.out.println("Asset type:"+ast);
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 String query1 = "select * from asset_item where Inventory_No='"+result+"' AND ConfigAddStatus=0";
                 String var ="";
                 st1 = con1.createStatement();
                 rs1 = st1.executeQuery(query1);
                 st2 = con1.createStatement();
                 rs2 = st2.executeQuery(query1);
                          while(rs1.next()){ k++;
                          var=var+rs1.getString(2)+","+rs1.getString(3)+","+rs1.getString(4);
                          %>
		                     <tr>
		                     
		                     <td width="" align="center"  height="21" ><input type="hidden" name="<%=k%>" value="<%=var%>" /><font size="2"><%=rs1.getString(2)%></font></td>
		                     <td width="" align="center"  height="21" ><font size="2"><%=rs1.getString(3)%></font></td>
		                     <td width="" align="center"  height="21" ><font size="2"><%=rs1.getString(4)%></font></td>
		                     <td width="" align="center"  height="21" ><font size="2"><%=rs1.getString(6)%></font></td>
		                     <td width="" align="center"  height="21" ><font size="2"><%=rs1.getString(8)%></font></td>
		                    <%--  <td width="" align="center"  height="21" ><font size="2"><%=rs1.getString(14)%></font></td> --%>
		                     <%-- <td><a href="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></a></td> --%>
		                     <td width=""><font color="white" size="2" ><a href="#" onclick="func(<%=k%>);"  title="Click for Add Configuration details"><font size="2"><%=rs1.getString(3)%></font></a></font> </td>
		                     </tr>   
	                      <%var="";}
	            }catch(SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
               
              try{
                if(!rs2.next())
                {
                	out.println("Sorry No Data..");
                }
              }catch(SQLException ex)
              {
               ex.printStackTrace();
              }	
              finally{
                  con1.close();		             
		           }
			           %>
			       
			          
      </table>
      </center> 	
      
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
</body>
</html>