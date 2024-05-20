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
	  if (window.focus) {newwindow.focus()}
	  return false;
      } 
</script>
<!-- <script language="javascript">
function deleteRecord(id)
      {   
	  if(confirm('You are above to delete a Complaint'))
	          {
              var f=document.form;    
              f.method="post";    
              f.action='complaintDelete.jsp?id='+id;    
              f.submit();
              }
	        else{}
      }
</script>	 -->
</head>
<%

String ano=null;
ano = request.getParameter("ano");//asset no    
System.out.println("ano :"+ano);
Connection conn = null;
ResultSet rs = null,rs1 = null,rs2 = null,rs4=null,rsPO=null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "";

 %>
     
<body background="images/u.jpg">
<form name="form" >  
<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">DISPLAY RECORD </font></b></center></td></tr>
    
</table>
<br />
<%-- <table id="invoicetable" width="1000" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">ADMIN NAME:<%=session.getAttribute("Nname")%><b></b></font></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2"> ADMIN DESG:<%=session.getAttribute("desg")%><b></b></font></td>
	</tr>
</table>  --%>
                 <table class="dynatable" width="1000" border="1" style="height: 150;" cellspacing="0" cellpadding="0"  align="center">
        			    <tr style="background-color:gray;">
    				   	<td width="67" align="center"  height="21" colspan="5"><center><b><font size="3" style="font-size: medium;">LIST OF ASSET BY INVENTORY NO</font></b></center></td>
    					</tr>
    			   <%
			        
			        PreparedStatement psmt1=null,psmt2=null,psmt4=null,psmtPO=null;
				    Statement st=null;
				    Class.forName("com.mysql.jdbc.Driver").newInstance();
	                conn = DriverManager.getConnection(url + dbName, userName,password);
	                Statement stmt = conn.createStatement();
	             
			        int flag=0,flag1=0,id=0,k=0;
			        String s_no=null;
			        String query1=null,query2=null,query3=null,queryPO=null;
			        String assetno=null;
			        String pono=null,invoicno=null,vname=null,mrpath=null,popath=null,invpath=null,otherpath=null;
	               
			        //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor 
	                // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
	                //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
	                //  query1 = "select * from asset_item where Asset_No='"+ano+"'"; 
	                      try
					         {
	                    	
	                    	     queryPO = "select ai.PoNo,ai.InvNO,ai.VName,ai.mr_scan,ai.po_scan,ai.inv_scan,ai.other_scan from asset_inventory ai inner join asset_item ai1 on ai1.Inventory_No=ai.Inventory_No  where ai1.Inventory_No='"+ano+"' limit 1";  
	    						 psmtPO = conn.prepareStatement(queryPO);
				                 rsPO = psmtPO.executeQuery();
	                    	     if(rsPO.next())
	                    	         {
	                    	    	 pono = rsPO.getString(1);
					    		     invoicno = rsPO.getString(2);
					    		     vname= rsPO.getString(3);
					    		     mrpath=rsPO.getString(4);
					    		     popath=rsPO.getString(5);
					    		     invpath=rsPO.getString(6);
					    		     otherpath=rsPO.getString(7);	 
	                    	         }%>
	                    	  
	                    	  
	    					<%-- 	 query2 = "select * from asset_trans where (Inventory_No='"+ano+"')";  
	    						 psmt1 = conn.prepareStatement(query2);
				                 rs1 = psmt1.executeQuery();
				                if(rs1.next())
				                      {
				                	  rs1 = psmt1.executeQuery();%>
				                	   <tr style="background-color:gray;">
				                	  <td width="6" align="center"  height="21" ><font size="3" ><b>PO No</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice No.</b></font></td>
				                      <td width="6" align="center"  height="21" colspan=3><font size="3" ><b>Vendor Name</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>MR File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>PO File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Other File</b></font></td>
				                     
				                      </tr>
				                      <tr style="background-color:PALEGREEN;">
				                      <td align=center><font color="black" size="3"><%=pono%></font></td>
			                         <td align=center><font color="black" size="3"><%=invoicno%></font></td>
			                         <td align=center colspan=3><font color="black" size="3"><%=vname%></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=mrpath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=popath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=invpath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=otherpath%>">View</a></font></td>
			                         </tr>
				                	  <tr style="background-color:gray;">
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>Sr.No</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Inventory no</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>AssetType</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>AssetNo</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>Configuration</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>FromBranch</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>FromEmp</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>ToBranch</b></font></td>
				                      <td width="67" align="center"  height="21" ><font size="3" ><b>ToEmp</b></font></td>
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
					    	 	    
			                      <tr style="background-color:PaleGreen;">
		                             <td align=center><font color="black" size="3"><%=k%></font></td>
			                         <td align=center><font color="black" size="3"><%=inv%></font></td>
			                         <td align=center><font color="black" size="3"><%=at%></font></td>
			                         <td align=center><font color="black" size="3"><%=newano%></font></td>
			                         <td align=center><font color="black" size="3"><%=confi1 %></font></td>
			                         <td align=center><font color="black" size="3"><%=bran %></font></td>
			                         <td align=center><font color="black" size="3"><%=fuser%></font></td>
			                         <td align=center><font color="black" size="3"><%=tobran%></font></td>
			                        <%if(tuser==null || tuser.equals("NULL")) tuser="Not Assigned"; %>
			                         <td align=center><font color="black" size="3"><%=tuser%></font></td>
			                         </tr>
	    						    <% }
	    					   }
				           else
				               {	 --%> 
				               
				             <tr style="background-color:gray;">
				                	  <td width="6" align="center"  height="21" ><font size="3" ><b>PO No</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice No.</b></font></td>
				                      <td width="6" align="center"  height="21" colspan=2><font size="3" ><b>Vendor Name</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>MR File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>PO File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Other File</b></font></td>
				                      </tr>
				                      <tr style="background-color:PALEGREEN;">
				                      <td align=center><font color="black" size="3"><%=pono%></font></td>
			                         <td align=center><font color="black" size="3"><%=invoicno%></font></td>
			                         <td align=center colspan=2><font color="black" size="3"><%=vname%></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=mrpath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=popath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=invpath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=otherpath%>">View</a></font></td>
			                         </tr>
			                	  <tr style="background-color:gray;">
			                          <td width="67" align="center"  height="21" ><font size="3" ><b>Sr.No</b></font></td>
			                          <td width="6" align="center"  height="21" ><font size="3" ><b>Inventory no</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="3" ><b>AssetType</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="3" ><b>AssetNo</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="3" ><b>SerialNo</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="3" ><b>Configuration</b></font></td>
			                           <td width="67" align="center"  height="21" ><font size="3" ><b>BranchCode</b></font></td>
			                         <td width="67" align="center"  height="21" ><font size="3" ><b>BranchName</b></font></td>
			            <!--              <td width="67" align="center"  height="21" ><font size="3" ><b>AssignStatus</b></font></td> -->
			                         <!-- <td width="67" align="center"  height="21" ><font size="3" ><b>User Name</b></font></td>
			                          <td width="67" align="center"  height="21" ><font size="3" ><b>User Branch</b></font></td> -->
			                     </tr>  
				               
	    			  	    <%  /* Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor */
	    				      query3 = "select * from asset_item where (Inventory_No='"+ano+"' and AssetType not in('DESKTOP','CCVTV','UPS_SETUP')) ORDER BY Asset_No ASC ";  
						      psmt2 = conn.prepareStatement(query3);
			                  rs2 = psmt2.executeQuery();
			                  while(rs2.next())
	                             {
			                	  k++;
			                	  flag=1;%>
			                 	<% String invno = rs2.getString("Inventory_No");
				    		     String asno = rs2.getString("Asset_No");
				    		     String confi2 = rs2.getString("ConfigField");
				    		     String atype = rs2.getString("AssetType");
				    	 	     String bcode = rs2.getString("Branch");
				    		     String bname= rs2.getString("BranchName");
				    		     String confi= rs2.getString("ConfigField");
				    		     String serialno= rs2.getString("serial_no");
				    		     /* String asgstatus= rs2.getString("assignStatus");
				    		     String asgto  = rs2.getString("assignedbraemp"); */
				    		     %>
		                        <tr style="background-color:PaleGreen;">
	                             <td align=center><font color="black" size="3"><%=k%></font></td>
		                         <td align=center><font color="black" size="3"><%=invno%></font></td>
		                         <td align=center><font color="black" size="3"><%=atype %></font></td>
		                         <td align=center><font color="black" size="3"><%=asno%></font></td>
		                         <td align=center><font color="black" size="3"><%=serialno%></font></td>
		                         <td align=center><font color="black" size="3"><%=confi%></font></td>
		                         <td align=center><font color="black" size="3"><%=bcode %></font></td>
		                         <td align=center><font color="black" size="3"><%=bname%></font></td>
		                         <%-- <td align=center><font color="black" size="3"><%=asgstatus%></font></td> --%>
		                         <%-- <td align=center><font color="black" size="2"><%=asgto%></font></td>
		                         <td align=center><font color="black" size="2"><%=asgto%></font></td> --%>
		                         <!-- <td align=center><font color="black" size="3">Not Assigned</font></td>
		                         <td align=center><font color="black" size="3">Not Assigned</font></td> -->
		                         </tr>	 
			                	  <%}%>
			             
				       <%--  else
			                        {
			                 	  String invno=null,asno=null,confi2=null,atype=null,bname=null,sbname=null,asfor=null,empnm=null,empbra=null,query4=null;
			                	  query3 = "select * from asset_item where (Inventory_No='"+ano+"' and assignStatus='1')";  
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
						    	      System.out.println("Assign for :"+asfor);
						    	      if(asfor==null || asfor.equals("NULL"))
						    	    	  asfor="USER";
						    	      System.out.println("Assign for"+asfor);
		                             }
				                  if(flag1==1){%> 
				                  <tr style="background-color:gray;">
				                	  <td width="6" align="center"  height="21" ><font size="3" ><b>PO No</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice No.</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Vendor Name</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>MR File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>PO File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Invoice File</b></font></td>
				                      <td width="6" align="center"  height="21" ><font size="3" ><b>Other File</b></font></td>
				                      </tr>
				                      <tr style="background-color:PALEGREEN;">
				                      <td align=center><font color="black" size="3"><%=pono%></font></td>
			                         <td align=center><font color="black" size="3"><%=invoicno%></font></td>
			                         <td align=center><font color="black" size="3"><%=vname%></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=mrpath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=popath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=invpath%>">View</a></font></td>
			                         <td align=center><font color="black" size="3"><a href="download6.jsp?f=<%=otherpath%>">View</a></font></td>
			                         </tr>
				                	<% if(asfor.equals("OFFICE"))
				                	     { 
				                	      k++;
				                	      flag=1;%>
				                	      <tr style="background-color:gray;">
				                             <td width="67" align="center"  height="21" ><font size="3" ><b>Sr.No</b></font></td>
				                             <td width="6" align="center"  height="21" ><font size="3" ><b>Inventory no</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="3" ><b>AssetType</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="3" ><b>AssetNo</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="3" ><b>Configuration</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="3" ><b>BranchName</b></font></td>
				                             <td width="67" align="center"  height="21" ><font size="3" ><b>Assigned Branch</b></font></td>
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
			                               <tr style="background-color:PaleGreen;">
		                                     <td align=center><font color="black" size="3"><%=k%></font></td>
			                                 <td align=center><font color="black" size="3"><%=invno%></font></td>
			                                 <td align=center><font color="black" size="3"><%=atype%></font></td>
			                                 <td align=center><font color="black" size="3"><%=asno%></font></td>
			                                 <td align=center><font color="black" size="3"><%=confi2 %></font></td>
			                                 <td align=center><font color="black" size="3"><%=bname%></font></td>
			                                 <td align=center><font color="black" size="3"><%=sbname%></font></td>
			                              </tr>	 
			                	 
			                	  <%}else{
			                		     k++;
				                	     flag=1;
				                  	     %>
				                	     <tr style="background-color:gray;">
				                            <td width="67" align="center"  height="21" ><font size="3" ><b>Sr.No</b></font></td>
				                            <td width="6" align="center"  height="21" ><font size="3" ><b>Inventory no</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="3" ><b>AssetType</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="3" ><b>AssetNo</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="3" ><b>Configuration</b></font></td>
				                            <td width="67" align="center"  height="21" ><font size="3" ><b>UserName</b></font></td>
				                           <td width="67" align="center"  height="21" ><font size="3" ><b>User Branch</b></font></td>
				                        </tr>
				                	
				                	<%
				                	query4 = "select * from assignotherassetemp where (Inventory_No='"+ano+"' and statusIT='1' )";  
		 						    psmt4 = conn.prepareStatement(query4);
					                rs4 = psmt4.executeQuery();
					                if(rs4.next())
			                             {
				               	        empnm = rs4.getString("EmpName");
					    		        empbra= rs4.getString("empbranch");
			                             }
					    		     %>
			                        <tr style="background-color:PaleGreen;">
		                             <td align=center><font color="black" size="3"><%=k%></font></td>
			                         <td align=center><font color="black" size="3"><%=invno%></font></td>
			                         <td align=center><font color="black" size="3"><%=atype%></font></td>
			                         <td align=center><font color="black" size="3"><%=asno%></font></td>
			                         <td align=center><font color="black" size="3"><%=confi2 %></font></td>
			                         <td align=center><font color="black" size="3"><%=empnm%></font></td>
			                         <td align=center><font color="black" size="3"><%=empbra%></font></td>
			                         </tr>	 
			                    <%}
			                	  
				                  } --%>  	  
			               
			                <% 
	           
			   if(flag==0)
			           {
			    	   String msg="Asset -\b No- \b Not -\b Available..";
	    		  	   response.sendRedirect("searchAsset.jsp?msg=" +msg);
				       } 
	    			
		   }catch(SQLException ex)
		         {
		         ex.printStackTrace();
		         }
		   finally{ conn.close(); } %>
			    </table>     
			         
			         
			         
			         
			         
			         
          </table> 

<font color="red" size="4"></font>
<br /><br /><br />

</center>
	<br /><br /><br />

</form>	

</body>

</html>