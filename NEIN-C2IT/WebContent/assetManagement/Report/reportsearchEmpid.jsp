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

String ano="";
ano = request.getParameter("eid");//asset no    
System.out.println("eid :"+ano);
Connection conn,conn1 = null;
ResultSet rs,rs1 = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "";
int flag=0,flag1=0;
int k=0,i=0;
String s_no=null;
String query1=null,query2=null;
PreparedStatement psmt1,psmt2=null;
/* String SessionName=null,Sessiondesg=null;
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
 */%>
     
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
    				   	<td width="67" align="center"  height="21" colspan="5"><center><b><font size="3" style="font-size: medium;">LIST OF ASSET ASSIGNED TO USER</font></b></center></td>
    					</tr>
    			   <%try
				      {
                      //EmpId,EmpName,emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,AssignedByName,DateOfAssigned
			          //query2 = "select EmpName,empdesg,empbranch,dept,ano,asdoi,aconf,atype, emailid,epass,nopcode,npass,dscpin,dsccin,douname,dopass,dcardno,acard,AssignedByName,DateOfAssigned from  assignotherassetemp WHERE  (EmpId = '"+ano+"')";
				      query2 = "select * from  assignotherassetemp WHERE  (EmpId = '"+ano+"')";
                      Class.forName("com.mysql.jdbc.Driver").newInstance();
				      conn1 = DriverManager.getConnection(url + dbName, userName,password);
				      Statement stmt1 = conn1.createStatement();
				      System.out.println(query2);  				     
				      psmt2 = conn1.prepareStatement(query2);
				      rs1 = psmt2.executeQuery();
				      System.out.println("-----------------------------------");
				      // System.out.println(query2);
				      String emaild,epass,opcode,oppass,dscpin,dsccin,doname,dopass,dcardno,acard,asgbyname,asgdt=null;
				      String empnm=null,empdesg=null,empbranch=null,empdept=null,ano1=null,asdoi=null,asconf=null,atype=null;
				      String acarddoi=null,acardABtype=null,mobmodno=null,mobsrno=null,mobdoi=null,mobaccessonmob=null,hardmodno=null,hardsrno=null,harddoi=null;
			          String hardcap=null,hardcap1=null,sfolde=null,sfolderdoi=null,apcr=null,apcrdoi=null,other=null,otherdoi=null;
			    	  String edoi=null,ndoi=null,dscdoi=null,dscpass=null,dodoi=null,dcarddoi=null,demie=null,disp=null,dcardtype=null;	 
			     	   String simno=null,mobbycomp=null,level=null,ipadd=null,ipdoa=null,devno=null,owner=null,ldoa=null;
				      if(rs1.next())
				             {
				             //EmpId,EmpName,EmpDesig,EmpBranch,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByName(Employee field assignassetemp)
	              		     // at,ano,branch,,sbranch,eid,aid,asgtype,asgfor,scm,df,dt
	                	     //System.out.println(queryemp);
				           	 flag1=1;
				    		 k++;
				    		 empnm=rs1.getString(2);
				    	     empdesg=rs1.getString(38);
				    	     empbranch=rs1.getString(39);
				    	     empdept=rs1.getString(36);
				    	     
				    	     ano1=rs1.getString(69);
				    	     asdoi=rs1.getString(70);
				    	     asconf= rs1.getString(71);
				    	     atype= rs1.getString(68);
				    	     
				    		 emaild = rs1.getString(3);
				    	 	 epass = rs1.getString(4);
				    	 	 edoi=rs1.getString(5);
				    	 	 
				    	 	 
				    	 	 opcode = rs1.getString(7);
				    	 	 oppass = rs1.getString(8);
				    	 	level = rs1.getString(30);
				    	 	 ndoi= rs1.getString(9);
				    	 	
				    	    
				    	 	 dscpin = rs1.getString(11);
				    	     dsccin = rs1.getString(12);
				    	     dscdoi= rs1.getString(13);
				    	     dscpass= rs1.getString(31);
				    	     
				    	     
				    	     doname = rs1.getString(15);
				    	     dopass = rs1.getString(16);
				    	     dodoi = rs1.getString(17);
				    	    
				    	     
				             dcardno = rs1.getString(19);
				             dcarddoi = rs1.getString(20);
				             demie = rs1.getString(32);
				             disp = rs1.getString(33);
				             dcardtype = rs1.getString(34);
				            
				             
				             acard = rs1.getString(22);
				    	     acarddoi = rs1.getString(23);
				    	     acardABtype = rs1.getString(35);
				    	     
				    	     devno = rs1.getString(51);
				    	     owner = rs1.getString(52);
				    	     ldoa = rs1.getString(53);
				    	     
				    	     mobmodno=rs1.getString(43);
				    	     mobsrno=rs1.getString(44);
				    	     mobdoi=rs1.getString(45);
				    	     mobaccessonmob=rs1.getString(46);
				    	     simno=rs1.getString(47);
				    	     mobbycomp=rs1.getString(48);
				    	    
				    	     
				    	     hardmodno=rs1.getString(57);
				    	     hardsrno=rs1.getString(58);
				    	     harddoi=rs1.getString(59);
				    	     hardcap=rs1.getString(60);
				    	     hardcap1=rs1.getString(61); 
				    	     String hrcap=hardcap+" "+hardcap1;
				    	    
				    	     ipadd=rs1.getString(54); 
				    	     ipdoa=rs1.getString(55); 
				    	     
				    	     sfolde=rs1.getString(73); 
				    	     sfolderdoi=rs1.getString(74); 
				    	     
				    	     
				    	     apcr=rs1.getString(76); 
				    	     apcrdoi= rs1.getString(77); 	 
				    	    
				    	     other=rs1.getString(63); 
				    	     otherdoi= rs1.getString(64);
				    	    
				    	     
			           %>
			       	 <tr bgcolor="Aqua">
     				  
     					<td width="6" align="center"  height="21" ><font size="2" ><b>EMP ID</b></font></td>
     					<td width="67" align="center"  height="21" ><font size="2" ><b>Emp Name</b></font> </td>	
     					<td width="67" align="center"  height="21" ><font size="2" ><b>Emp Desig</b></font></td>
     					<td width="67" align="center"  height="21" ><font size="2" ><b>Emp Branch</b></font></td>
     					<td width="67" align="center"  height="21" ><font size="2" ><b>Emp Dept</b></font></td>
     					
     				   </tr>  
    		        	<tr>
				    
				
	         		<td align=center><font color="black" size="4"><%=ano%></font></td>
					<td align=center><font color="black" size="4"><%=empnm %></font></td>
					<td align=center><font color="black" size="4"><%=empdesg %></font></td>
					<td align=center><font color="black" size="4"><%=empbranch%></font></td>
					<td align=center><font color="black" size="4"><%=empdept %></font></td>
					</tr> 
    		        	 
    		        	 
    		        	 
    		        	 
    		        	 
        			   
    					<tr style="background-color:PaleGreen;">
    					    <td width="67" align="center"  height="21" ><font size="2" ><b>AssetType</b></font></td>
     					    <td width="67" align="center"  height="21" ><font size="2" ><b>AssetNo</b></font></td>
     					    <td width="67" align="center"  height="21" colspan=2><font size="2" ><b>Asset Config</b></font></td>
     					    <td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
     				    </tr>
        		    	<tr>
				           <td align=center><font color="black" size="3"><%=atype%></font></td>
				       	   <td align=center><font color="black" size="3"><%=ano1%></font></td>
				       	    <td align=center colspan=2><font color="black" size="3"><%=asconf %></font></td>
					       <td align=center><font color="black" size="3"><%=asdoi%></font></td>
					      
			  		    </tr> 
    		        	 
    				   	<tr style="background-color:PaleGreen;">
    					   <td width="6" align="center"  height="21" colspan=3><font size="2" ><b>EMAIL ID</b></font></td>
    					   <td width="67" align="center"  height="21" ><font size="2" ><b>PASSWORD</b></font> </td>
                           <!--  <td width="6" align="center"  height="21" ><font size="2" ><b>ID FILE</b></font></td> -->
    					   <td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font> </td>
                        </tr>
                        <tr>
                           <%if(emaild.equals("")){emaild="Not Assigned";epass="Not assigned";edoi="Not Assigned";%>
                           <td align=center colspan=3><font color="red" size="3" ><%=emaild%></font></td>
	         		       <td align=center ><font color="red" size="3" ><%=epass%></font></td>
	         		       <td align=center ><font color="red" size="3" ><%=edoi%></font></td>
	         		       <%}else{ %>
	         		        <td align=center colspan=3><font color="black" size="3" ><%=emaild%></font></td>
	         		       <td align=center ><font color="black" size="3" ><%=epass%></font></td>
	         		       <td align=center ><font color="black" size="3" ><%=edoi%></font></td>
	         		       <%}%>
                        </tr>
                        <tr style="background-color:PaleGreen;">
    					    <td width="67" align="center"  height="21" colspan=2><font size="2" ><b>OPCODE</b></font></td>
    					    <td width="67" align="center"  height="21" ><font size="2" ><b>PASSWORD</b></font></td>
    					    <td width="67" align="center"  height="21" ><font size="2" ><b>LEVEL</b></font></td>
    					    <td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    				  </tr>
    				   <tr ><%if(opcode.equals("")){opcode="Not Assigned";oppass="Not assigned";ndoi="Not Assigned"; %>
    					    <td align=center colspan=2><font color="red" size="3"><%=opcode %></font></td>
					        <td align=center ><font color="red" size="3"><%=oppass %></font></td>
					         <td align=center><font color="black" size="2"><%=level %></font></td>
					        <td align=center ><font color="red" size="3"><%=ndoi %></font></td>
					       
					        <%}else{ %>
					        <td align=center colspan=2><font color="black" size="3"><%=opcode %></font></td>
					        <td align=center ><font color="black" size="3"><%=oppass %></font></td>
					        <td align=center><font color="black" size="2"><%=level %></font></td>
					        <td align=center ><font color="black" size="3"><%=ndoi %></font></td>
					        
					        <%}%>
    				 </tr>
    				 <tr style="background-color:PaleGreen;">
    					   <td width="67" align="center"  height="21" colspan=2><font size="2" ><b>DSCPIN</b></font></td>
    					   <td width="67" align="center"  height="21" ><font size="2" ><b>DSCCIN</b></font></td>
    					   <td width="67" align="center"  height="21" ><font size="2" ><b>PASSWORD</b></font></td>
    				   	   <td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    			   </tr>
    				<tr>   <!-- dscpin,dsccin,dscpass,dscdoi -->
    				       <%if(dscpin.equals("")){dscpin="Not Assigned";dsccin="Not assigned";dscdoi="Not Assigned";dscpass="Not Assigned"; %>
    				        <td align=center colspan=2><font color="red" size="3" ><%=dscpin%></font></td>
					        <td align=center><font color="red" size="3"><%=dsccin %></font></td>
					        <td align=center><font color="red" size="3"><%=dscpass%></font></td>
					        <td align=center><font color="red" size="3"><%=dscdoi %></font></td>
					         <%}else{ %>
					         <td align=center colspan=2><font color="black" size="3" ><%=dscpin%></font></td>
					        <td align=center><font color="black" size="3"><%=dsccin %></font></td>
					        <td align=center><font color="black" size="3"><%=dscpass%></font></td>
					        <td align=center><font color="black" size="3"><%=dscdoi %></font></td>
					           <%}%>
    					</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=3 ><font size="2" ><b>DOMAIN_NAME</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DOMAIN_PASS</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr>  <!-- doname,dopass,dodoi -->
    					<% if(doname.equals("")){doname="Not Assigned";dopass="Not assigned";dodoi="Not Assigned"; %>
    					<td align=center colspan=3><font color="red" size="3"><%=doname%></font></td>
					     <td align=center><font color="red" size="3"><%=dopass%></font></td>
				      	<td align=center><font color="red" size="3"><%=dodoi%></font></td>
				      	 <%}else{ %>
				      	 <td align=center colspan=3><font color="black" size="3"><%=doname%></font></td>
					     <td align=center><font color="black" size="3"><%=dopass%></font></td>
				      	<td align=center><font color="black" size="3"><%=dodoi%></font></td>
				      	 <%}%>
    					</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATACARD_NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>IMEI NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>ISP</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATACARD TYPE</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr ><!-- dcardno,demie,disp,dcardtype,dcarddoi -->
    					<% if(dcardno.equals("")){dcardno="Not Assigned";dcarddoi="Not assigned";demie="Not Assigned";disp="Not Assigned";dcardtype="Not Assigned"; %>
    					<td align=center><font color="red" size="3"><%=dcardno%></font></td>
    					<td align=center><font color="red" size="3"><%=demie%></font></td>
    					<td align=center><font color="red" size="3"><%=disp%></font></td>
    					<td align=center><font color="red" size="3"><%=dcardtype%></font></td>
    					<td align=center><font color="red" size="3"><%=dcarddoi%></font></td>
    						 <%}else{ %>
    						 <td align=center><font color="black" size="3"><%=dcardno%></font></td>
    					<td align=center><font color="black" size="3"><%=demie%></font></td>
    					<td align=center><font color="black" size="3"><%=disp%></font></td>
    					<td align=center><font color="black" size="3"><%=dcardtype%></font></td>
    					<td align=center><font color="black" size="3"><%=dcarddoi%></font></td>
    						  <%}%>
    					</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=3><font size="2" ><b>ACCESS_CARD No</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>CARD TYPE</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr ><!-- acard,acarddoi,acardABtype -->
    					<%if(acard.equals("")){acard="Not Assigned";acarddoi="Not assigned";acardABtype="Not Assigned"; %>
    					<td align=center colspan=3><font color="red" size="3"><%=acard %></font></td>
    					<td align=center><font color="red" size="3"><%=acardABtype %></font></td>
    					<td align=center><font color="red" size="3"><%=acarddoi %></font></td>
    					 <%}else{ %>
    					 <td align=center colspan=3><font color="black" size="3"><%=acard %></font></td>
    					<td align=center><font color="black" size="3"><%=acardABtype %></font></td>
    					<td align=center><font color="black" size="3"><%=acarddoi %></font></td>
    					 <%}%>
    					</tr>
    					
    					
    					
    					
    				    <tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" ><font size="2" ><b>MODEL NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>SR NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>MOB NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>SIM NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>MOB COMP/OWN</b></font></td>
    					
    					</tr>
    					<tr>  <!--  mobmodno,mobsrno,mobaccessonmob,mobdoi -->
    					<%if(mobmodno.equals("")){mobmodno="Not Assigned";mobsrno="Not assigned";mobaccessonmob="Not Assigned";%>
    					    <td align=center ><font color="red" size="3"><%=mobmodno%></font></td>
					        <td align=center><font color="red" size="3"><%=mobsrno %></font></td>
					        <td align=center><font color="red" size="3"><%=mobaccessonmob%></font></td>
					       <td align=center><font color="black" size="3"><%=simno %></font></td>
					        <td align=center><font color="black" size="3"><%=mobbycomp%></font></td>
					         <%}else{ %>
					          <td align=center ><font color="black" size="3"><%=mobmodno%></font></td>
					        <td align=center><font color="black" size="3"><%=mobsrno %></font></td>
					        <td align=center><font color="black" size="3"><%=mobaccessonmob%></font></td>
					        <td align=center><font color="black" size="3"><%=simno %></font></td>
					        <td align=center><font color="black" size="3"><%=mobbycomp%></font></td>
					       
					         	 <%}%>
					         
    					</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=2><font size="2" ><b>LOTUS TRAVELER DEVICE NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DEVICE OWNER</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>LOTUS NOTS ADDRESS</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr ><!-- acard,acarddoi,acardABtype -->
    					<%if(devno.equals("")){devno="Not Assigned";owner="Not assigned";ldoa="Not Assigned"; mobdoi="Not Assigned";%>
    					<td align=center colspan=2><font color="red" size="3"><%=devno %></font></td>
    					<td align=center><font color="red" size="3"><%=owner %></font></td>
    					<td align=center><font color="red" size="3"><%=ldoa %></font></td>
    					 <td align=center><font color="black" size="3"><%=mobdoi %></font></td>
    					 <%}else{ %>
    					 <td align=center colspan=2><font color="black" size="3"><%=devno %></font></td>
    					<td align=center><font color="black" size="3"><%=owner %></font></td>
    					<td align=center><font color="black" size="3"><%=ldoa %></font></td>
    					 <td align=center><font color="black" size="3"><%=mobdoi %></font></td>
    					 <%}%>
    					</tr>
				        <tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=2><font size="2" ><b>H/D MODEL NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>SR NO</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>CAPACITY</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr> <!--  hardsrno,harddoi,hardcap,hardcap1 -->
    					<% if(hardmodno.equals("")){hardmodno="Not Assigned";hardsrno="Not assigned";harddoi="Not Assigned";hrcap="Not Assigned"; %>
    					    <td align=center colspan=2><font color="red" size="3"><%=hardmodno%></font></td>
					        <td align=center><font color="red" size="3"><%=hardsrno %></font></td>
					        <td align=center><font color="red" size="3"><%=hrcap%></font></td>
					        <td align=center><font color="red" size="3"><%=harddoi %></font></td>
					        <%}else{ %>
					         <td align=center colspan=2><font color="black" size="3"><%=hardmodno%></font></td>
					        <td align=center><font color="black" size="3"><%=hardsrno %></font></td>
					        <td align=center><font color="black" size="3"><%=hrcap%></font></td>
					        <td align=center><font color="black" size="3"><%=harddoi %></font></td>
					        	 <%}%>
    					</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=4><font size="2" ><b>INTERNET/FTP IP ADD.</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr ><%if(sfolde.equals("")){sfolde="Not Assigned";sfolderdoi="Not assigned"; %>
    					    <td align=center colspan=4><font color="red" size="3"><%=ipadd%></font></td>
					        <td align=center><font color="red" size="3"><%=ipdoa %></font></td>
					        <%}else{ %>
					        <td align=center colspan=4><font color="black" size="3"><%=ipadd%></font></td>
					        <td align=center><font color="black" size="3"><%=ipdoa %></font></td>
					         <%}%>
						</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=4><font size="2" ><b>SHAIRED FOLDER</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr ><%if(sfolde.equals("")){sfolde="Not Assigned";sfolderdoi="Not assigned"; %>
    					    <td align=center colspan=4><font color="red" size="3"><%=sfolde%></font></td>
					        <td align=center><font color="red" size="3"><%=sfolderdoi %></font></td>
					        <%}else{ %>
					        <td align=center colspan=4><font color="black" size="3"><%=sfolde%></font></td>
					        <td align=center><font color="black" size="3"><%=sfolderdoi %></font></td>
					         <%}%>
						</tr>
    					<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=4><font size="2" ><b>APP CREDENTIAL</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr >
    					<%
    					 if(apcr.equals("Select")){apcr="Not Assigned";apcrdoi="Not assigned";%>
			    	    
    					    <td align=center colspan=4><font color="red" size="3"><%=apcr%></font></td>
					        <td align=center><font color="red" size="3"><%=apcrdoi %></font></td>
					          <%}else{ %>
					          <td align=center colspan=4><font color="black" size="3"><%=apcr%></font></td>
					        <td align=center><font color="black" size="3"><%=apcrdoi %></font></td>
					           <%}%>
						</tr>
						<tr style="background-color:PaleGreen;">
    					<td width="67" align="center"  height="21" colspan=4><font size="2" ><b>OTHER ASSET</b></font></td>
    					<td width="67" align="center"  height="21" ><font size="2" ><b>DATE_OF_ASSIGNED</b></font></td>
    					</tr>
    					<tr>
    					<%if(other.equals("")){other="Not Assigned";otherdoi="Not assigned";
    					%>
    					    <td align=center colspan=4><font color="red" size="3"><%=other%></font></td>
					        <td align=center><font color="red" size="3"><%=otherdoi %></font></td>
						</tr>
						  <%}else{ %>
						   <td align=center colspan=4><font color="black" size="3"><%=other%></font></td>
					        <td align=center><font color="black" size="3"><%=otherdoi %></font></td>
						   <%}%>
				     
				         <%}		             		    
				         if(flag1==0)
				                 {
				            	 out.println("Sorry...!  Asset Not Assigned... ");
				                 }
                   }catch(SQLException ex)
                       {
	                         ex.printStackTrace();
                       }
			         finally{}
			         %>
			         
			         
			    </table>     
			         
			         
			         
			         
			         
			         
          </table> 

<font color="red" size="4"></font>
<br /><br /><br />

</center>
	<br /><br /><br />

</form>	

</body>

</html>