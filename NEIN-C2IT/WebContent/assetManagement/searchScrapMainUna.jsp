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
<%@ include file="banner.jsp" %>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>ASSET DISPLAY</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
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
System.out.println("---------------  Search Scrap Main Un Assigned");
String ano="";
ano = request.getParameter("res");//scrap,main,unassigned    
//System.out.println("eid :"+ano);

String[] temp;
temp = ano.split(",");
String s=temp[0];
String m=temp[1];
String una=temp[2];
//System.out.println("eid :"+s);
//System.out.println("eid :"+m);
//System.out.println("eid :"+una);
Connection conn = null;
ResultSet rs = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "";
int flag=0;
int k=0,i=0;
String s_no=null;
String query1=null;
PreparedStatement psmt1=null;
/* String SessionName=null,Sessiondesg=null;
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
 */%>
     
<body background="images/u.jpg">
<form name="form" id="myform" action="<%=request.getContextPath()%>/assetManagement/Report/ReportsearchScrMain.jsp">  
<center>
<input type="hidden" value="<%=ano%>" id="idano1" name="res"></input>

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
			    if(s.equals("true")) {%>
			    
			         <tr style="background-color:gray;">
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
			          <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Serial No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset Type</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Branch</b></font></td>
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>SubBranch</b></font></td> -->
			          <td width="67" align="center"  height="21" ><font size="2" ><b>WarExpDate</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
		 	          <td width="67" align="center"  height="21" ><font size="2" ><b>Scrap</b></font></td>
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Maintanance</b></font></td> 
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned for</b></font></td> -->
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Edit</b></font></td> -->
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Delete</b></font></td> -->
			        </tr> 
			    <%
			      try
	                {
  	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	                conn = DriverManager.getConnection(url + dbName, userName,password);
	                Statement stmt = conn.createStatement();
	                //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor 
	                // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
	                //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
	                query1 = "select Inventory_No,Asset_No,AssetType,BranchName,WarExpDate,Scrap,ConfigField,serial_no from  asset_item WHERE (Scrap=1)";                                      
	                psmt1 = conn.prepareStatement(query1);
                    rs = psmt1.executeQuery();
			        //System.out.println("-----------------------------------");
			        //System.out.println(query1);
	                while(rs.next())
	                      {
	        	         //System.out.println(query2);
	           	          flag=1;
	    			      k++;
	    			      String invno = rs.getString("Inventory_No");
	    			      String ano1 = rs.getString("Asset_No");
	    			      String atype = rs.getString("AssetType");
	    	 		      String bran = rs.getString("BranchName");
	    			      //String atype1 = rs.getString("SubBranch");
	    			      String warexpd= rs.getString("WarExpDate");
	    			      String confi  = rs.getString("ConfigField");
	    	 		      String scr= rs.getString("Scrap");
	    	 		     String srno= rs.getString("serial_no");
	    			      //String main = rs.getString("Maintanance");
	    			      //String Asfor = rs.getString("Assignedfor");
	    			  
	    			 /*  System.out.println("-----------------------------------");
	    			  System.out.println("ano :"+ano);
	    			  System.out.println("Asset type :"+atype);
	    			  System.out.println("branch :"+bran);
	    			  */
	    			  //System.out.println("S brnch :"+Anum1);
	    			  //System.out.println("assignstatus :"+DoA1);
	    			  //System.out.println("S brnch :"+AbEid1);
	    			 
	        %>
	                <tr>
	                    <td align=center><font color="black" size="2"><%=k%></font></td>
		                <td align=center><font color="black" size="2"><%=invno%></font></td>
		                <td align=center><font color="black" size="2"><%=ano1%></font></td>
		                <td align=center><font color="black" size="2"><%=srno%></font></td>
		                <td align=center><font color="black" size="2"><%=atype %></font></td>
		                <td align=center><font color="black" size="2"><%=bran %></font></td>
		                <%-- <td align=center><font color="black" size="2"><%=atype1%></font></td> --%>
		                <td align=center><font color="black" size="2"><%=warexpd%></font></td>
		                <td align=center><font color="black" size="2"><%=confi%></font></td>
		                <td align=center><font color="black" size="2"><%=scr%></font></td>
		                <%-- <td align=center><font color="black" size="2"><%=main %></font></td>
		                <td align=center><font color="black" size="2"><%=Asfor %></font></td>
		                 --%>
		                 <!-- <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="EDIT" onclick="window.history.go(-1); return false;" /></td> -->
		               <!-- <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="DELETE" onclick="window.history.go(-1); return false;" /></td> -->
		           </tr>
	                   
	                   <%    }		             		    
	                   if(flag==0)
	                         {
	            	         out.println("Sorry...! Data Not Exist ");
	                         }
            }catch(SQLException ex)
                    {
                    ex.printStackTrace();
                    }
            finally{ }     
			    }
			    
			    
               if(m.equals("true")) { %>
			    
			    <tr style="background-color:gray;">
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
			          <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Serial No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset Type</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Branch</b></font></td>
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>SubBranch</b></font></td> -->
			          <td width="67" align="center"  height="21" ><font size="2" ><b>WarExpDate</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
		 	          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Scrap</b></font></td> -->
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Maintanance</b></font></td> 
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned for</b></font></td> -->
			         <!--  <td width="67" align="center"  height="21" ><font size="2" ><b>Edit</b></font></td> -->
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Delete</b></font></td> -->
			    </tr> 
			    <%
			      try
	                {
  	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	                conn = DriverManager.getConnection(url + dbName, userName,password);
	                Statement stmt = conn.createStatement();
	                //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor 
	                // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
	                //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
	                query1 = "select Inventory_No,Asset_No,AssetType,BranchName,WarExpDate,ConfigField,Maintanance,serial_no from  asset_item WHERE (Maintanance= 1)";                                      
	                psmt1 = conn.prepareStatement(query1);       
                    rs = psmt1.executeQuery();
			        //System.out.println("-----------------------------------");
			        //System.out.println(query1);
	                while(rs.next())
	                      {
	        	         //System.out.println(query2);
	           	          flag=1;
	    			      k++;
	    			      String invno = rs.getString("Inventory_No");
	    			      String ano1 = rs.getString("Asset_No");
	    			      String atype = rs.getString("AssetType");
	    	 		      String bran = rs.getString("BranchName");
	    			      //String atype1 = rs.getString("SubBranch");
	    			      String warexpd= rs.getString("WarExpDate");
	    			      String confi1  = rs.getString("ConfigField");
	    	 		      //String scr= rs.getString("Scrap");
	    			      String main = rs.getString("Maintanance");
	    			      String srno = rs.getString("serial_no");
	    			      //String Asfor = rs.getString("Assignedfor");
	    			  
	    			  /* System.out.println("-----------------------------------");
	    			  System.out.println("ano :"+ano);
	    			  System.out.println("Asset type :"+atype);
	    			  System.out.println("branch :"+bran);
	    			  */
	    			  // System.out.println("main :"+main);
	    			  //System.out.println("assignstatus :"+DoA1);
	    			  //System.out.println("S brnch :"+AbEid1);
	    			 
	        %>
	                <tr>
	                    <td align=center><font color="black" size="2"><%=k%></font></td>
		                <td align=center><font color="black" size="2"><%=invno%></font></td>
		                <td align=center><font color="black" size="2"><%=ano1%></font></td>
		                <td align=center><font color="black" size="2"><%=srno%></font></td>
		                <td align=center><font color="black" size="2"><%=atype %></font></td>
		                <td align=center><font color="black" size="2"><%=bran %></font></td>
		                <%-- <td align=center><font color="black" size="2"><%=atype1%></font></td> --%>
		                <td align=center><font color="black" size="2"><%=warexpd%></font></td>
		                <td align=center><font color="black" size="2"><%=confi1%></font></td>
		                <%-- <td align=center><font color="black" size="2"><%=scr%></font></td> --%>
		                <td align=center><font color="black" size="2"><%=main %></font></td>
		               <%--  <td align=center><font color="black" size="2"><%=Asfor %></font></td> --%>
		                
		                <!--  <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="EDIT" onclick="window.history.go(-1); return false;" /></td>
		               <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="DELETE" onclick="window.history.go(-1); return false;" /></td>
		      -->      </tr>
	                   
	                   <%    }		             		    
	                   if(flag==0)
	                         {
	            	         out.println("Sorry...! Data Not Exist ");
	                         }
            }catch(SQLException ex)
                    {
                    ex.printStackTrace();
                    }
            finally{ }     
			    }
			    
			    
               if(una.equals("true")) { Integer una1=0;%>
			    
			    <tr style="background-color:gray;">
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
			          <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset No</b></font></td>
			           <td width="67" align="center"  height="21" ><font size="2" ><b>Serial No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset Type</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Branch</b></font></td>
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>SubBranch</b></font></td> -->
			          <td width="67" align="center"  height="21" ><font size="2" ><b>WarExpDate</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Assign Status</b></font></td>
		 	          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Scrap</b></font></td> -->
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Maintanance</b></font></td> --> 
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned for</b></font></td> -->
			          <!-- <td width="67" align="center"  height="21" ><font size="2" ><b>Edit</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Delete</b></font></td> -->
	 		    </tr> 
			    <%
			      try
	                {
 	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	                conn = DriverManager.getConnection(url + dbName, userName,password);
	                Statement stmt = conn.createStatement();
	                //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor 
	                // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt                     Scrap=1,Maintanance= 1
	                //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
	                query1 = "select Inventory_No,Asset_No,AssetType,BranchName,WarExpDate,ConfigField,assignStatus,serial_no from  asset_item WHERE (assignStatus='+una1+' AND Scrap<>1 AND Maintanance<> 1 and AssetType not in('DESKTOP','CCVTV','UPS_SETUP'))";                                      
	                psmt1 = conn.prepareStatement(query1);
                    rs = psmt1.executeQuery();
			        //System.out.println("-----------------------------------");
			        //System.out.println(query1);
	                while(rs.next())
	                      {
	        	         //System.out.println(query2);
	           	          flag=1;
	    			      k++;
	    			      String invno = rs.getString("Inventory_No");
	    			      String ano1 = rs.getString("Asset_No");
	    			      String atype = rs.getString("AssetType");
	    	 		      String bran = rs.getString("BranchName");
	    			      
	    			      String warexpd= rs.getString("WarExpDate");
	    			      String confi2 = rs.getString("ConfigField");
	    			      String asstatus  = rs.getString("assignStatus");
	    			      String srno  = rs.getString("serial_no");
	    	 		      //String scr= rs.getString("Scrap");
	    			      //String main = rs.getString("Maintanance");
	    			      //String Asfor = rs.getString("Assignedfor");
	    			  
	    			 /*  System.out.println("-----------------------------------");
	    			  System.out.println("ano :"+ano);
	    			  System.out.println("Asset type :"+atype);
	    			  System.out.println("branch :"+bran);
	    			  */
	    			  //System.out.println("S brnch :"+Anum1);
	    			  //System.out.println("assignstatus :"+DoA1);
	    			  //System.out.println("S brnch :"+AbEid1);
	    			 
	        %>
	                <tr>
	                    <td align=center><font color="black" size="2"><%=k%></font></td>
		                <td align=center><font color="black" size="2"><%=invno%></font></td>
		                <td align=center><font color="black" size="2"><%=ano1%></font></td>
		                <td align=center><font color="black" size="2"><%=srno%></font></td>
		                <td align=center><font color="black" size="2"><%=atype %></font></td>
		                <td align=center><font color="black" size="2"><%=bran %></font></td>
		              
		                <td align=center><font color="black" size="2"><%=warexpd%></font></td>
		                  <td align=center><font color="black" size="2"><%=confi2%></font></td>
		                <td align=center><font color="black" size="2">AV</font></td>
		                <%-- <td align=center><font color="black" size="2"><%=asstatus%></font></td> --%>
		                <%-- <td align=center><font color="black" size="2"><%=scr%></font></td> --%>
		                <%-- <td align=center><font color="black" size="2"><%=main %></font></td> --%>
		               <%--  <td align=center><font color="black" size="2"><%=Asfor %></font></td> --%>
		                
		               <!--   <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="EDIT" onclick="window.history.go(-1); return false;" /></td>
		               <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="DELETE" onclick="window.history.go(-1); return false;" /></td>
		        -->    </tr>
	                   
	                   <%    }		             		    
	                   if(flag==0)
	                         {
	            	         out.println("Sorry...! Data Not Exist ");
	                         }
           }catch(SQLException ex)
                   {
                   ex.printStackTrace();
                   }
           finally{ }     
			    }
			    
			    %>
          </table> 

<font color="red" size="4"></font>
<br /><br /><br />
<table id="printbtn" width="" align=center bgcolor="lightgrey">
    <tr> 
       <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.location.href='searchAsset.jsp?msg=1'" /></td>
          <!-- <td align="right" >

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
 -->
<!-- <td><a href="HelpPageAdmin.jsp" onclick="return popitup('HelpPageAdmin.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td>
 -->
<td align="center"><input type="submit" value="EXCEL" id="submit1" class="hollow" style="background-color:lightgrey;font-weight:bold;color:black;"></input></td>

</tr>
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>

