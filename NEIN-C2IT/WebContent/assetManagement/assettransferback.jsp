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

<script language="javascript">
function editRecord(id)
    {  
	//alert(id); //7
	var res = id.substring(62,63);
	
	//alert(res);
	/* if(document.getElementById("idatatus").value==0)
		alert("New Assset will be not transfer. ");
	else
        { */
		var f=document.form;    
	    f.method="post";    
	    f.action='assetTransferEdit.jsp?id='+id;    
	    f.submit();
      // }
    }
</script>
</head>
<%
System.out.println("-------------- Asset Transform Back -----------------");
String ano="",empid=null,empnm=null,empbra=null,asBy=null;
ano = request.getParameter("assetno");//asset no    
System.out.println("ano :"+ano);
Connection conn = null;
ResultSet rs = null,rs1 = null,rs2 = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "";
int flag=0;
int k=0,i=0;
String s_no=null;
String query1=null,query2=null;
PreparedStatement psmt1=null,psmt2=null;
Statement st=null;
Integer ast=0;
/* String SessionName=null,Sessiondesg=null;
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
 */%>
     
<body background="images/u.jpg">
<form name="form">  
<center>
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
<br/>
<%-- <table id="invoicetable" width="1000" bgcolor="" cellpadding="4" cellspacing="6" align="center" border=1>
	<tr>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2">ADMIN NAME:<%=session.getAttribute("Nname")%><b></b></font></td>
	<td   height="21" bgcolor="lightgrey" style="font-size: 1" width="10" align="center"><font size="2"> ADMIN DESG:<%=session.getAttribute("desg")%><b></b></font></td>
	</tr>
</table>  --%>
                <table class="dynatable" width="1000" border="" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			    <%
			      try
	                {
  	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	                conn = DriverManager.getConnection(url + dbName, userName,password);
	                Statement stmt = conn.createStatement();
	                //Inventory_No,Asset_No,AssetType,Branch,SubBranch,WarExpDate,assignStatus,Scrap,Maintanance ,Assignedfor 
	                // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
	                //BranchCode,BranchName,SubBranch,BranchPHNo,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByEmpId,AssignedByName
	                %>
	                  
			          
			         
			   
	                  <% query1 = "select Inventory_No,Asset_No,AssetType,Branch,BranchName,WarExpDate,ConfigField,assignStatus,Scrap,Maintanance,Assignedfor,assignedbraemp from  asset_item WHERE (Asset_No='"+ano+"')";                                      
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
	    	 		      String bran = rs.getString("Branch");
	    			      String brname = rs.getString("BranchName");
	    			      String warexpd= rs.getString("WarExpDate");
	    			      String confi= rs.getString("ConfigField");
	    			      String asstatus  = rs.getString("assignStatus");
	    	 		      String scr= rs.getString("Scrap");
	    			      String main = rs.getString("Maintanance");
	    			      String Asfor = rs.getString("Assignedfor");
	    			      String Asuser = rs.getString("assignedbraemp");
	    			  if((Asfor==null || Asfor.equals("NULL"))&& asstatus.equals("1"))
	    				  Asfor="USER";
	    			  else
	    				  Asfor="Not Assigned";
/* 	    			  System.out.println("-----------------------------------"+Asfor);
	    			  System.out.println("ano :"+ano);
	    			  System.out.println("Asset type :"+atype);
	    			  System.out.println("branch :"+bran);
	    			  System.out.println("brnch name:"+brname);
 */	    			  //System.out.println("assignstatus :"+DoA1);
	    			  //System.out.println("S brnch :"+AbEid1);
	    			  
	    			                                       
	                  
			          //System.out.println("-----------------------------------");
			          //System.out.println(query1);
	                 
	    			   if(asstatus.equals("1") && Asfor.equals("USER"))
	    			         {
	    				     query2 = "select  EmpId,EmpName,empbranch,AssignedByName from  assignotherassetemp WHERE (ano='"+ano+"')"; 
	    				     psmt2 = conn.prepareStatement(query2);
	                         rs2 = psmt2.executeQuery();
	    				     while(rs2.next())
		                         {
	    				    	 empid=rs2.getString(1);
	    				    	 empnm=rs2.getString(2);
	    				    	 empbra=rs2.getString(3);
	    				    	 asBy=rs2.getString(4);
		                         }
	    			  
	    			         }
	    			  
	    			   else if(asstatus.equals("1") && Asfor.equals("OFFICE"))
  			                 {
	    				     query2 = "select BranchCode,BranchName,BranchAddress,AssignedByName from  assignassetoffice WHERE (AssetNo='"+ano+"')"; 
	    				     psmt2 = conn.prepareStatement(query2);
	                         rs2 = psmt2.executeQuery();
	    				     while(rs2.next())
	                            {
	    				    	 empid=rs2.getString(1);
	    				    	 empnm=rs2.getString(2);
	    				    	 empbra=rs2.getString(3);
	    				    	 asBy=rs2.getString(4);
	                            }
  			  
  			                 }
	    			   else
	    			         {
	    				     empid="Not Assigned";
  				    	     empnm="Not Assigned";
  				    	     empbra="Not Assigned";
  				    	     asBy="Not Assigned"; 
	    			         }
	    			  
	    			  
	    			  
	    			  
	    			  
	    			  
	    			  
	    			  %>
	    			  <tr style="background-color:PaleGreen ;">
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Sl No</b></font></td>
			          <td width="6" align="center"  height="21" ><font size="2" ><b>Inventory no</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Asset_No</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>BranchCode</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>BranchName</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>WarExpDate</b></font></td>
			          <td width="67" align="center"  height="21" ><font size="2" ><b>Configuration</b></font></td>
			          </tr>
	                 <tr style="background-color:white;">
	                    <td align=center ><font color="black"  size="2"><%=k%></font></td>
		                <td align=center><font color="black" size="2"><%=invno%></font></td>
		                <td align=center><font color="black" size="2"><%=ano%></font></td>
		                <td align=center><font color="black" size="2"><%=atype %></font></td>
		                <td align=center><font color="black" size="2"><%=bran %></font></td>
		                <td align=center><font color="black" size="2"><%=brname%></font></td>
		                <td align=center><font color="black" size="2"><%=warexpd%></font></td>
		                <td align=center><font color="black" size="2"><%=confi%></font></td>
		              </tr>
		              <tr style="background-color:PaleGreen ;">
			            <td width="67" align="center"  height="21" ><font size="2" ><b>assignStatus</b></font></td>
		 	            <td width="67" align="center"  height="21" ><font size="2" ><b>Scrap</b></font></td>
			            <td width="67" align="center"  height="21" ><font size="2" ><b>Maintenance</b></font></td>
			            <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned For</b></font></td>
			            <td width="67" align="center"  height="21" ><font size="2" ><b>Empid/BranchCode</b></font></td>
			            <td width="67" align="center"  height="21" ><font size="2" ><b>EmpName/BranchName</b></font></td>
			            <td width="67" align="center"  height="21" ><font size="2" ><b>Location</b></font></td>
			            <td width="67" align="center"  height="21" ><font size="2" ><b>Assigned BY</b></font></td>
			          </tr>
		              <tr style="background-color:white;">
		                <td align=center><font color="black" size="2"><%=asstatus%></font></td>
		                <td align=center><font color="black" size="2"><%=scr%></font></td>
		                <td align=center><font color="black" size="2"><%=main %></font></td>
		                <td align=center><font color="black" size="2"><%=Asfor %></font></td>
		                <td align=center><font color="black" size="2"><%=empid %></font></td>
		                <td align=center><font color="black" size="2"><%=empnm %></font></td>
		                <td align=center><font color="black" size="2"><%=empbra %></font></td>
		                 <td width="67" align="center"  height="21" ><%=asBy %></td>
		                <input type="hidden" name="atatus" maxlength="30" id="idatatus" value="<%=asstatus%>" size=20 />
		              </tr>
		              
		              <tr>
		                 <td style="font-size: 1" colspan=8>
		                     <center>
		                         <input style="size: 1;" type="button" title="Back To Selection Date Page" value="TRANSFER" onclick='editRecord("<%=rs.getString(1)%>,<%=rs.getString(2)%>,<%=rs.getString(3)%>,<%=rs.getString(4)%>,<%=rs.getString(5)%>,<%=rs.getString(6)%>,<%=rs.getString(8)%>,<%=rs.getString(9)%>,<%=rs.getString(12)%>,<%=empid%>,<%=empnm%>,<%=empbra%>,<%=Asfor%>");' />
		                         <input style="size: 1;" type="button" title="Back To Selection Date Page" value="CANCEL" onclick="window.history.go(-1); return false;" />
		                    </center>
		                </td>
		              </tr>
	                  <% }
	                  
	                   if(flag==0)
	                         {
	            	         out.println("Sorry...! Data Not Exist ");
	                         }
            }catch(SQLException ex)
                    {
                    ex.printStackTrace();
                    }
            finally{ }     
		    %>
          </table> 

<font color="red" size="4"></font>
<br /><br /><br />
<!-- <table id="printbtn" width="" align=center bgcolor="lightgrey">
    <tr> 
       <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="window.location.href='assetTransfer.jsp?msg=1'" /></td>
  
</tr>
</table> -->
<br/>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="assetTransfer.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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