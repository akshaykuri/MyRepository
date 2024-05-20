<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.apache.poi.hssf.record.formula.functions.Replace"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>ASSET TRANSFER DISPLAY</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	
<style type="text/css">
@media print 
     {
     #printbtn
        {
        display :  none;
        }
     }
</style>
<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
<style type="text/css"> 
textarea.special 
      { 
      font-family:arial; 
      font-size:11px; 
      overflow: auto;
      }
select 
      {
      font-size:0.8em;
      /* border-color:#999;  without this, it won't work */
      }
input[type="text"][readonly],
textarea[readonly] 
      {
       background-color: #ccc;
      }
</style>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script> 

<script language="Javascript">

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
<script language="javascript">
function printit()
      {  
      if (window.print) 
              {
              window.print() ;  
              }
          else
              {
              var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
              document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
              WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
              }
       }
function popitup(url) 
      {
	  newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	  if (window.focus) {newwindow.focus();}
	  return false;
      } 
</script>

<%
		String ano=null;
		ano = request.getParameter("ano");//asset no    
		System.out.println("ano :"+ano);
		Connection conn = null;
		ResultSet rs = null,rs1 = null,rs2 = null,rs4=null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "csdb";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "";
%>
</head>
<body background="images/u.jpg">
<form name="form">  
<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">ASSET DISPLAY</font></b></center></td></tr>
</table>
<br />
<%-- <table id="invoicetable" width="1000" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">ADMIN NAME:<%=session.getAttribute("Nname")%><b></b></font></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2"> ADMIN DESG:<%=session.getAttribute("desg")%><b></b></font></td>
	</tr>
</table>  --%>
             <table class="dynatable" width="1000" border="" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			 
			    <%
			    System.out.println("------------------ Asset Trans Disp ---------------");  
			        PreparedStatement psmt1=null,psmt2=null,psmt4=null;
				    Statement st=null;
				    Class.forName("com.mysql.jdbc.Driver").newInstance();
	                conn = DriverManager.getConnection(url + dbName, userName,password);
	                Statement stmt = conn.createStatement();
	             
			        int flag=0,flag1=0,id=0,k=0;
			        String s_no=null;
			        String query1=null,query2=null,query3=null;
			        String assetno=null;
	                
	               
			        //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor 
	                // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
	                //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
	              //  query1 = "select * from asset_item where Asset_No='"+ano+"'"; 
	                      try
					         {
	                    	
	    						 query2 = "select * from asset_trans where (New_Asset_No='"+ano+"')";  
	    						 psmt1 = conn.prepareStatement(query2);
				                 rs1 = psmt1.executeQuery();
				                if(rs1.next())
				                      {
				                	  rs1 = psmt1.executeQuery();%>
				                	  <tr style="background-color:gray;">
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>Sr.No</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory no</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>AssetNo</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>FromBranch</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>FromEmp</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>ToBranch</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="2" ><b>ToEmp</b></font></td>
				                     </tr> 
				                  <%while(rs1.next())
				                     {
				                	 flag=1;
				                   	 k++;
				                     String inv = rs1.getString("Inventory_No");
					    		     String at = rs1.getString("AssetType");
					    		     String newano= rs1.getString("New_Asset_No");
					    		     String confi1 = rs1.getString("ConfigField");
					    	 	     String bran = rs1.getString("Branch");
					    	 	     String fuser  = rs1.getString("fromUser");
					    	 	     String tobran = rs1.getString("NewBranch");
					    		     String tuser= rs1.getString("toUser");
					    	 	     %>
					    	 	    
			                      <tr>
		                             <td align=center><font color="black" size="2"><%=k%></font></td>
			                         <td align=center><font color="black" size="2"><%=inv%></font></td>
			                         <td align=center><font color="black" size="2"><%=at%></font></td>
			                         <td align=center><font color="black" size="2"><%=newano%></font></td>
			                         <td align=center><font color="black" size="2"><%=confi1 %></font></td>
			                         <td align=center><font color="black" size="2"><%=bran %></font></td>
			                         <td align=center><font color="black" size="2"><%=fuser%></font></td>
			                         <td align=center><font color="black" size="2"><%=tobran%></font></td>
			                        <%if(tuser==null || tuser.equals("NULL")) tuser="Not Assigned"; %>
			                         <td align=center><font color="black" size="2"><%=tuser%></font></td>
			                         </tr>
	    						    <% }
	    					   }
				           else
				               {	 
	    			  	      //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor
	    				      query3 = "select * from asset_item where (Asset_No='"+ano+"' and assignStatus='0')";  
 						      psmt2 = conn.prepareStatement(query3);
			                  rs2 = psmt2.executeQuery();
			                  if(rs2.next())
	                             {
			                	  k++;
			                	  flag=1;%>
			                	  <tr style="background-color:gray;">
			                          <td width="67" align="center"  height="21" ><font size="2" ><b>Sr.No</b></font></td>
			                          <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory no</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="2" ><b>AssetNo</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="2" ><b>BranchCode</b></font></td>
			                         <td width="67" align="center"  height="21" ><font size="2" ><b>BranchName</b></font></td>
			                         <td width="67" align="center"  height="21" ><font size="2" ><b>AssignStatus</b></font></td>
			                         <td width="67" align="center"  height="21" ><font size="2" ><b>User Name</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="2" ><b>User Branch</b></font></td>
			                     </tr>
			                	
			                	<% String invno = rs2.getString("Inventory_No");
				    		     String asno = rs2.getString("Asset_No");
				    		     String confi2 = rs2.getString("ConfigField");
				    		     String atype = rs2.getString("AssetType");
				    	 	     String bcode = rs2.getString("Branch");
				    		     String bname= rs2.getString("BranchName");
				    		     String confi= rs2.getString("ConfigField");
				    		     String asgstatus= rs2.getString("assignStatus");
				    		     String asgto  = rs2.getString("assignedbraemp");
				    		     %>
		                        <tr>
	                             <td align=center><font color="black" size="2"><%=k%></font></td>
		                         <td align=center><font color="black" size="2"><%=invno%></font></td>
		                         <td align=center><font color="black" size="2"><%=asno%></font></td>
		                         <td align=center><font color="black" size="2"><%=confi%></font></td>
		                         <td align=center><font color="black" size="2"><%=atype %></font></td>
		                         <td align=center><font color="black" size="2"><%=bcode %></font></td>
		                         <td align=center><font color="black" size="2"><%=bname%></font></td>
		                         <td align=center><font color="black" size="2"><%=asgstatus%></font></td>
		                         <%-- <td align=center><font color="black" size="2"><%=asgto%></font></td>
		                         <td align=center><font color="black" size="2"><%=asgto%></font></td> --%>
		                         <td align=center><font color="black" size="2">Not Assigned</font></td>
		                         <td align=center><font color="black" size="2">Not Assigned</font></td>
		                         </tr>	 
			                	  <%}
			                  else
			                        {
			                 	  String invno=null,asno=null,confi2=null,atype=null,bname=null,sbname=null,asfor=null,empnm=null,empbra=null,query4=null;
			                	  query3 = "select * from asset_item where (Asset_No='"+ano+"' and assignStatus='1')";  
	 						      psmt2 = conn.prepareStatement(query3);
				                  rs2 = psmt2.executeQuery();
				                  if(rs2.next())
		                             {
				                	  flag1=1;
				                	  invno = rs2.getString("Inventory_No");
						    	      asno = rs2.getString("Asset_No");
						    	      confi2 = rs2.getString("ConfigField");
						    	      atype = rs2.getString("AssetType");
						    	      asfor = rs2.getString("Assignedfor");
						    	      if(asfor==null || asfor.equals("NULL"))
						    	    	  asfor="USER";
						    	     // System.out.println("Assign for"+asfor);
		                             }
				                  if(flag1==1){
				                	 if(asfor.equals("OFFICE"))
				                	     { 
				                	      k++;
				                	      flag=1;%>
				                	      <tr style="background-color:gray;">
				                             <td width="67" align="center"  height="21" ><font size="2" ><b>Sr.No</b></font></td>
				                             <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory no</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="2" ><b>AssetNo</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="2" ><b>BranchName</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned Branch</b></font></td>
				                         </tr>
				                      	<%
				                	     query4 = "select * from assignassetoffice where (AssetNo='"+ano+"' and assignStatus='1' )";  
		 						         psmt4 = conn.prepareStatement(query4);
					                     rs4 = psmt4.executeQuery();
					                    if(rs4.next())
			                                  {
				               	              bname = rs4.getString("BranchName");
					    		              sbname= rs4.getString("assignToBranch");
			                                  }
					    		         %>
			                               <tr>
		                                     <td align=center><font color="black" size="2"><%=k%></font></td>
			                                 <td align=center><font color="black" size="2"><%=invno%></font></td>
			                                 <td align=center><font color="black" size="2"><%=atype%></font></td>
			                                 <td align=center><font color="black" size="2"><%=asno%></font></td>
			                                 <td align=center><font color="black" size="2"><%=confi2 %></font></td>
			                                 <td align=center><font color="black" size="2"><%=bname%></font></td>
			                                 <td align=center><font color="black" size="2"><%=sbname%></font></td>
			                              </tr>	 
			                	 
			                	  <%}else{
			                		     k++;
				                	     flag=1;
				                  	     %>
				                	     <tr style="background-color:gray;">
				                            <td width="67" align="center"  height="21" ><font size="2" ><b>Sr.No</b></font></td>
				                            <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory no</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="2" ><b>AssetNo</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="2" ><b>UserName</b></font></td>
				                           <td width="67" align="center"  height="21" ><font size="2" ><b>User Branch</b></font></td>
				                        </tr>
				                	
				                	<%
				                	query4 = "select * from assignotherassetemp where (ano='"+ano+"' and statusIT='1' )";  
		 						    psmt4 = conn.prepareStatement(query4);
					                rs4 = psmt4.executeQuery();
					                if(rs4.next())
			                             {
				               	        empnm = rs4.getString("EmpName");
					    		        empbra= rs4.getString("empbranch");
			                             }
					    		     %>
			                        <tr>
		                             <td align=center><font color="black" size="2"><%=k%></font></td>
			                         <td align=center><font color="black" size="2"><%=invno%></font></td>
			                         <td align=center><font color="black" size="2"><%=atype%></font></td>
			                         <td align=center><font color="black" size="2"><%=asno%></font></td>
			                         <td align=center><font color="black" size="2"><%=confi2 %></font></td>
			                         <td align=center><font color="black" size="2"><%=empnm%></font></td>
			                         <td align=center><font color="black" size="2"><%=empbra%></font></td>
			                         </tr>	 
			                    <%}
				                  }
					                	  
			                      }
	             }
			     if(flag==0)
			           {
	    		 	   String msg="Asset -\b No- \b Not -\b Available..";
	    		  	   response.sendRedirect("assetTransfer.jsp?msg=" +msg);
				       }
	    			
		   }catch(SQLException ex)
		         {
		         ex.printStackTrace();
		         }
		   finally{ conn.close(); } %>
          </table> 

<font color="red" size="4"></font>
<br /><br /><br />
<table width="165" align ="center" id="hiderow">
<tr>
<td align="left" id="hiderow">
<input type="button" size="2" style="background-color:lightgrey;font-weight:bold;color:black;" value='BACK' onclick='history.go(-1)'>
</td>
<td align="right" id="hiderow">
<script language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:lightgrey;font-weight:bold;color:black;" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
</tr>
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>