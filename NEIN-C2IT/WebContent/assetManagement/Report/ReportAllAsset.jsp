<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.apache.poi.hssf.record.formula.functions.Replace"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
 <%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%response.setHeader("Content-Disposition", "attachment; filename=ReportAllAsset.xls");%>
<%@ page import="java.sql.*" %>

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>ASSET DISPLAY</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />

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



</head>
<%
String form9_no,SessionName,Created_date,from_date,to_date,Approval_status,Approval_remarks,branchI=null;
String asgfor="Select",at="Select",branch="Select",df="",dt="",ano="";

Connection conn = null;
ResultSet rs = null,rs2 = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "";
int flag=0;
int k=0,i=0;
String s_no=null;
String queryemp,query1=null,query2=null;
PreparedStatement psmt2=null,psmt1=null,psmt3=null,psmt4=null,psmt5=null,psmt6=null,psmt7=null;

%>

     
<body background="images/u.jpg">
<form name="form">  
<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
     <tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">ASSET DISPLY</font></b></center></td></tr>
     <tr style="visibility: hidden; display: none"></tr>
</table>

                  		             
               <table class="dynatable" width="1000" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			       <tr style="background-color:gray;">
			       <tr style="background-color:gray;">
				   <td width="67" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
				   <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory_No</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>PONo</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>InoviceNo</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>InvoiceAmount</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>InventoryDate</b></font></td>
                   <td width="67" align="center"  height="21" ><font size="2" ><b>Asset_No</b></font></td>
                   <td width="67" align="center"  height="21" ><font size="2" ><b>Serial_No</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>BranchCode</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>BranchName</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>Warranty</b></font></td>
			 	   <td width="67" align="center"  height="21" ><font size="2" ><b>WarExpDate</b></font></td>
			 	   <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
			 	   <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned To</b></font></td>
			 	   <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned Branch</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>assignStatus</b></font></td>
				    <td width="67" align="center"  height="21" ><font size="2" ><b>Scrap</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>InventoryDoneBy</b></font></td>
				    <!-- <td width="6" align="center"  height="21" ><font size="3" ><b>MR File</b></font></td>
				    <td width="6" align="center"  height="21" ><font size="3" ><b>PO File</b></font></td>
				    <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice File</b></font></td>
				    <td width="6" align="center"  height="21" ><font size="3" ><b>Other File</b></font></td> -->
				   <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Edit</b></font></td>
				   <td width="67" align="center"  height="21" ><font size="2" ><b>Delete</b></font></td>
				   --> </tr> 
			   	  <%try
		             {
	    	         Class.forName("com.mysql.jdbc.Driver").newInstance();
		             conn = DriverManager.getConnection(url + dbName, userName,password);
		             Statement stmt = conn.createStatement();
		             //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
		             //,assignassetemp,assignassetoffice
		             // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
		             //Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,assignStatus
		             query1 = "select i.Inventory_No,i.PoNo,i.InvNo,i.InvAmount,i.InventoryDate,ai.Asset_No,ai.AssetType,ai.Branch,ai.BranchName,ai.Waranty,ai.WarExpDate,ai.ConfigField,ai.assignStatus,ai.Scrap,i.InventoryDoneBy,ai.Assignedfor,ai.serial_no,i.mr_scan,i.po_scan,i.inv_scan,i.other_scan from  asset_item ai,asset_inventory i "+
                              "WHERE "+
			                  "(ai.Inventory_No=i.Inventory_No)";
			         psmt1 = conn.prepareStatement(query1);
		    	     		    	     
		    	     rs = psmt1.executeQuery();
		             System.out.println("-----------------------------------");
		             //System.out.println(query1);
		             while(rs.next())
		                  {
		        	     // System.out.println(query2);
		           	      flag=1;
		    			  k++;
		    			  //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
		    	 	      //BranchName,ai.Waranty,ai.WarExpDate,ai.assignStatus,i.InventoryDoneBy
		    			  String inveno = rs.getString("Inventory_No");
		    			  String pono = rs.getString("PoNo");
		    			  String invono = rs.getString("InvNo");
		    			  String invamt = rs.getString("InvAmount");
		    			  String invda= rs.getString("InventoryDate");
		    			  String asno  = rs.getString("Asset_No");
		    			  String srno  = rs.getString("serial_no");
		    	 		  String astype = rs.getString("AssetType");
		    			  String bcode = rs.getString("Branch");
		    			  String bname = rs.getString("BranchName");
		    			  String war= rs.getString("Waranty");
		    			  String warexpd  = rs.getString("WarExpDate");
		    			  String confi  = rs.getString("ConfigField");
		    	 		  String astatus = rs.getString("assignStatus");
		    	 		  String sc= rs.getString("Scrap");
		    	 		  String invdoneby = rs.getString("InventoryDoneBy");
		    	 		  String asfor = rs.getString("Assignedfor");
		    	 		  String mrscan = rs.getString("mr_scan");
		    	 		  String poscan = rs.getString("po_scan");
		    	 		  String invscan = rs.getString("inv_scan");
		    	 		  String otherscan = rs.getString("other_scan");
		    	 		
		    	 		  
		    	 		  
		    			  System.out.println("-----------------------------------");
		    			  System.out.println("inventory no :"+inveno);
		    			  System.out.println("po no :"+pono);
		    			  System.out.println("invoice no :"+invono);
		    			  System.out.println("invoice amount :"+invamt);
		    			  System.out.println("branch name :"+bname);
		    			  System.out.println("asset no :"+asno);
		    			  System.out.println("asset name :"+astype);
		    			  System.out.println("inventory done by :"+invdoneby);
		    			  System.out.println("assigned for :"+asfor);
		    			  
		    			  if((asfor==null || asfor.equals("NULL"))&& astatus.equals("1"))
		    				  asfor="USER";
		    			  System.out.println("assigned for :"+asfor);
		    			  String empname=null,empbranch=null;
		    			  
		    			  if(astatus.equals("1") && asfor.equals("USER"))
	    			         {
	    				     query2 = "select EmpName,empbranch from  assignotherassetemp WHERE (ano='"+asno+"')"; 
	    				     psmt2 = conn.prepareStatement(query2);
	                         rs2 = psmt2.executeQuery();
	    				     while(rs2.next())
		                         {
	    				    	
	    				    	 empname=rs2.getString(1);
	    				    	 empbranch=rs2.getString(2);
	    				    
		                         }
	    			  
	    			         }
	    			  
	    			   else if(astatus.equals("1") && asfor.equals("OFFICE"))
			                 {
	    				     query2 = "select BranchName,assignToBranch from  assignassetoffice WHERE (AssetNo='"+asno+"')"; 
	    				     psmt2 = conn.prepareStatement(query2);
	                         rs2 = psmt2.executeQuery();
	    				     while(rs2.next())
	                            {
	    				    	
	    				    	 empname=rs2.getString(1);
	    				    	 empbranch=rs2.getString(2);
	    				    	
	                            }
			  
			                 } 
	    			   else
	    			         {
	    				      empname="Not assigned";
  				    	      empbranch="Not assigned";
	    			         }
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    			  
		    %>
		    <tr>
		    <td align=center><font color="black" size="2"><%=k%></font></td>
			<td align=center><font color="black" size="2"><%=inveno%></font></td>
  		<td align=center><font color="black" size="2"><%=pono%></font></td>
			<td align=center><font color="black" size="2"><%=invono %></font></td>
			<td align=center><font color="black" size="2"><%=invamt %></font></td>
			<td align=center><font color="black" size="2"><%=invda%></font></td>
			<td align=center><font color="black" size="2"><%=asno%></font></td>
			<td align=center><font color="black" size="2"><%=srno%></font></td>
			<td align=center><font color="black" size="2"><%=astype%></font></td>
		    <td align=center><font color="black" size="2"><%=bcode%></font></td>
			<td align=center><font color="black" size="2"><%=bname %></font></td>
			<td align=center><font color="black" size="2"><%=war%></font></td>
			<td align=center><font color="black" size="2"><%=warexpd%></font></td>
			<td align=center><font color="black" size="2"><%=confi%></font></td>
			<td align=center><font color="black" size="2"><%=empname%></font></td>
			<td align=center><font color="black" size="2"><%=empbranch%></font></td>
		    <td align=center><font color="black" size="2"><%=astatus%></font></td>
		    <td align=center><font color="black" size="2"><%=sc %></font></td>
			<td align=center><font color="black" size="2"><%=invdoneby %></font></td>
			<%-- <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=mrscan%>">View</a></font></td>
		    <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=poscan%>">View</a></font></td>
			<td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=invscan%>">View</a></font></td>
			<td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=otherscan%>">View</a></font></td> --%>
			<!-- <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="EDIT" onclick="window.history.go(-1); return false;" /></td>
			<td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="DELETE" onclick="window.history.go(-1); return false;" /></td>
			 -->
			 </tr>
		                   <%}		             		    
	             }catch(SQLException ex)
                       {
                       ex.printStackTrace();
                       }
	              finally{ }
      %>
 	</table> 
	 <font color="red" size="4">
				</font>

</center>
	<br /><br /><br />

</form>	

</body>

</html>