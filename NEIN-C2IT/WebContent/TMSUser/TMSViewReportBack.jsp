<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>TMS USER Form</title>
	
    <link rel='stylesheet' type='text/css' href="../../css/style.css" />
	<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->

 <script language="javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}</script>
<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>

</head>
<body onload="checkForm()">

<form  name="form" method="post"  >
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,st0=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rsO=null;
String req=null;
String empD=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");

%>

<%String form2_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;

String currNExASID="",filepath=null,fileName=null,mailid=null,mobno=null,i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,group=null;
String req = request.getParameter("req");
String address="",conperson="",req_gsnetPdiv="",req_gsnetRole="",emptype="",ftype="";
String values[] = req.split(" -");
//System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
//System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
req = values[0].replaceAll(" ", "");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form16_tmsuser WHERE form_no='"+req+"'"); 
while(rs100.next())
        {
	    form2_no = rs100.getString("form_no");
	    emp_code = rs100.getString("empid");
        full_name = rs100.getString("full_name");
	    branch = rs100.getString("empBranch");
	    depart = rs100.getString("depart");
	    designation = rs100.getString("designation");
	    reporting_officer = rs100.getString("r_officer");
	    requestOption = rs100.getString("requestOption");
	    emptype = rs100.getString("emptype");
	     ftype=rs100.getString("ftype");

	    requestBy = rs100.getString("requestBy");
	    mailid = rs100.getString("empmail");
	    mobno = rs100.getString("emp_mob");
	    
		address= rs100.getString("address");
		conperson= rs100.getString("conperson");
	    
		}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<br /><br /><br /><br />
<center>
 <table width="900" border="1" align="center" style="border-color: white;">
<tr>
<td align="center" style="border-color: white;">
<img src="../images/nip.gif" height="25" width="25" /> 
<font size="5" style="position: static;">
NIPPON EXPRESS (INDIA) PRIVATE LIMITED
</font>
</td>
</tr>
</table>
</center>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>

<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
       <tr>
          <td><font size="4"><b><center><label>TMS USER REQUEST FORM</label> </center></b></font></td>
	  </tr>
	  <tr>
	  <td>
	  <table width="895" border="1" bgcolor="lightgrey">
      <tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" id="hiderow">NAME:</td>
<td style="text-align:left;" bgcolor="grey" id="hiderow"><input name="branch" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" id="hiderow">DESIGNATION :</td>
<td style="text-align:left;" bgcolor="grey" id="hiderow"><input name="branch" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=form2_no%>" size="31" readonly="readonly"/> </td>
</tr>	


<%if(address==null){%>
<tr>
<td  style="text-align: right;">Employee Type :</td>
<td style="text-align:left;" colspan="3"><font color=red><%=emptype%></font></td>
</tr>
<tr>
<td  style="text-align: right;">Emp Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="31" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" size="31" value="<%=depart%>" readonly="readonly"/>
 
					</td> 
</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Emp Mail ID :</td>
<td style="text-align:left;"><input name="branch" value="<%=mailid%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Emp Contact No :</td>
<td style="text-align:left;"><input name="depart" size="31" value="<%=mobno%>" readonly="readonly"/>
 
					</td> 
</tr>

<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" size="31" value="<%=designation%>" readonly="readonly"/></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" size="31" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>


</tr>
<%}else{ %>
<tr>
<td  style="text-align: right;">Customer Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="31" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Customer Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Contact Person Name :</td>
<td style="text-align:left;"><input name="branch" value="<%=conperson%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Address:</td>
<td style="text-align:left;"><input name="depart" size="31" value="<%=address%>" readonly="readonly"/>
 
					</td> 
</tr>



<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >EMail ID :</td>
<td style="text-align:left;"><input name="branch" value="<%=mailid%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Contact No :</td>
<td style="text-align:left;"><input name="depart" size="31" value="<%=mobno%>" readonly="readonly"/>
 
					</td> 
</tr>


<%} %>




<tr>

<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  name="d_reliving" size="31"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
	
		</td> 	
		<td align="right">Request  :</td>
<td > 
     <input style="" type ="text" name = "requestOption" size="31" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
 
						        
</tr>
 <tr>
      <td  style="text-align: right;">Requested Dept:</td>
      <td style="text-align:left;"><input type="text"  style="width: 15em"  name="d_reliving"  value="<%=ftype%>" readonly="readonly" readonly="readonly" /></td> 	
  </tr>
</table>
<br >
  <%
  Connection con1 = null,con2 = null;
  ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	
	String dbName = dbProperties.getString("tmsdb.dbName");
	String urltmsdb = dbProperties.getString("tmsdb.url");
	String csdbName = dbProperties.getString("csdb.dbName");
  
  
  if(requestOption.equals("Change"))
        {
	  %>
	    	
                    <%
                    String query="",queryfinduser="",oldformno="";
                    Statement st=null,st1=null,stfu=null;
                    ResultSet rs=null,rs1=null,rsfu=null; 
                    try
                       {
                       // id="idBranch"
					   Class.forName(driver).newInstance();
					   con1 = DriverManager.getConnection(urltmsdb+dbName,userName,password); // tms db
					   con2 = DriverManager.getConnection(url+csdbName,userName,password); // c2it db
					   //System.out.println("Addresss ssssssssssssss :"+address);	
					   queryfinduser="select form_no from form16_tmsuser where empid='"+emp_code+"' and requestOption='New' ORDER BY id Asc"; 
					   stfu = con2.createStatement();
 					   rsfu = stfu.executeQuery(queryfinduser);
 					   if(rsfu.next())
 					     {
					     oldformno=rsfu.getString("form_no");
 					     }
					   
 					  //System.out.println("oldformno ********************************** :"+oldformno);
					   if(address==null)
						     query="select * from applicationmodule ORDER BY id Asc"; 
						  else
							query="select * from applicationmodule where applicationModule_id in (11,12) ORDER BY id Asc"; 
					   st = con1.createStatement();
 					   rs = st.executeQuery(query);
 					   int i=1;%>
 					    <table id="it" width="100%" border="1">
                        <tr align="center" >
				         <td colspan=3 bgcolor="#7FB3D5">OLD RIGHTS GIVEN FOR USER </td>
			            </tr>
			            <tr align="center" >
				        <td width="5%">SL.No</td>
				        <td width="20%">Module</td>
				        <td width="75%" >Feature Name</td>
			            </tr>
 					   
					   <%while(rs.next()){ %>
						   <tr>
						       <td ><%=i++%></td>
							   <%
							   String query1 = "select requestedModule,requestedFeture from form16_tmsuser_modul_feture where form_no='"+oldformno+"' and requestedModule='"+rs.getString("applicationModule_id")+"'"; 
							   st1 = con2.createStatement();
			 				   rs1 = st1.executeQuery(query1);
							   if(rs1.next())
							         {%>
							         <td ><input type='checkbox'  name="moduleidddd[]" id="moduleddd<%=rs.getString("applicationModule_id")%>"  value="<%=rs.getString("applicationModule_id")%>" checked/><%=rs.getString("applicationModule_name")%> </td>
								     <td align="center" >
								     <table  id='viewTableId' align='center' border='1'>
								            <tr><th>SL.No</th> <th>Feature Name</th><th colspan=6>User Rights </th> </tr>
       			                     <%
       			                     String query3= " SELECT * FROM `applicationfeatures` WHERE `applicationModule_id`=? ";
       			                     PreparedStatement prep = con1.prepareStatement(query3);
            	                     prep.setInt(1,Integer.parseInt(rs.getString("applicationModule_id")));
             	                     ResultSet rs2 = prep.executeQuery();
             	                     int ii=1;
             	                     String reqFeture=rs1.getString("requestedFeture");
             	                     String reqmodule=null;
       		    	                 String modFetu="";
                                     int ife=0; 
             	                     String strArray[] = reqFeture.split(",");
       			                     while (rs2.next())
       			                     { 
       			  	                 String fetuID=rs2.getString("applicationFeatures_id");
       			                     String all="all"+fetuID,create="create"+fetuID,view="view"+fetuID,update="update"+fetuID,delete="delete"+fetuID,export="export"+fetuID;
       			                     %>
       				                 <tr>
       				                    <td align="center"><%=ii%></td>
           			                    <td align='center'><%=rs2.getString("applicationFeatures_name")%></td>
           			                 <%
	                                 if(ife<strArray.length){
           		                        if(ife<strArray.length && all.equals(strArray[ife])){ife=ife+1;%>
           			                       <td align='center'><input type="checkbox" checked>All</td>
           			                    <%}else{%>
           			                       <td align='center'><input type="checkbox">All</td>
           			                    <%}%>
           			                 <%
           			                     if(ife<strArray.length && create.equals(strArray[ife])){ife=ife+1;%>
           			                         <td align='center'><input type='checkbox' checked>Create</td>
           			                    <%}else{%>
           			                         <td align='center'><input type='checkbox'>Create</td>
           			                    <%}%>
           			                    <% 	  
           			                    if(ife<strArray.length && view.equals(strArray[ife])){ife=ife+1;%>
          			                         <td align='center'><input type='checkbox' checked>View</td>
          			                    <%}else{%>
          			                         <td align='center'><input type='checkbox'>View</td>
          			                     <%}%>
          			                     <% 	  
          		 	                     if(ife<strArray.length && update.equals(strArray[ife])){ife=ife+1;%>
          			                         <td align='center'><input type='checkbox' checked>Update</td>
          			                     <%}else{%>
          			                          <td align='center'><input type='checkbox'>Update</td>
          			                      <%}%>
          			                      <% 	 
          			                      if(ife<strArray.length && delete.equals(strArray[ife])){ife=ife+1;%>
          			                          <td align='center'><input type='checkbox' checked>Delete</td>
          			                      <%}else{%>
          			                          <td align='center'><input type='checkbox'>Delete</td>
          			                      <%}%>
          		                       	  <% 	 
          			                      if(ife<strArray.length && export.equals(strArray[ife])){ife=ife+1;%>
          			                          <td align='center'><input type='checkbox' checked>Export</td>
          			                      <%}else{%>
          			                          <td align='center'><input type='checkbox'>Export</td>
          			                     <%}}else
          			                          {%>
          			                         <td align='center'><input type="checkbox">All</td>
          			                         <td align='center'><input type='checkbox'>Create</td>
          			                         <td align='center'><input type='checkbox' >View</td>
          			                         <td align='center'><input type='checkbox'>Update</td>
          			                         <td align='center'><input type='checkbox'>Delete</td>
          			                         <td align='center'><input type='checkbox'>Export</td>
          		 	                </tr>
          			            <%}ii++;
          			            }%>
       			                </table>
			                  </td> 
						    	 <%}else{%> 
							    	 <td ><input type='checkbox'  name="moduleidddd[]" id="moduleddd<%=rs.getString("applicationModule_id")%>"  value="<%=rs.getString("applicationModule_id")%>" /><%=rs.getString("applicationModule_name")%> </td>
								     <td align="center" ></td>
								     <%}%>
						  	</tr>
    						<%}%>
				   	   <%}catch (SQLException ex) {
    						ex.printStackTrace();
							}	
						  finally{
							con1.close();
					     }%>
              </table>
	        <%}
         %>
   
   
 <!-- /////////////////////////////////////// Change //////////////////////////////////////////   -->




<br>
<%if(!requestOption.equals("Delete")){ %>
            <table id="it" width="100%" border="1">
            <tr align="center" >
				<td colspan=3>APPLICATION RIGHTS FOR USER </td>
			</tr>
			<tr align="center" >
				<td width="5%">SL.No</td>
				<td width="20%">Module</td>
				<td width="75%" >Feature Name</td>
			</tr>
  
                    <%
                    Statement st=null,st1=null;
                    ResultSet rs=null,rs1=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con1 = DriverManager.getConnection(urltmsdb+dbName,userName,password); 
						con2 = DriverManager.getConnection(url+csdbName,userName,password); 
						
 						 
						
						
						
						
						String query = null;
						if(address==null)
						     query="select * from applicationmodule ORDER BY id Asc"; 
						else
							query="select * from applicationmodule where applicationModule_id in (11,12) ORDER BY id Asc"; 
						
						st = con1.createStatement();
 						rs = st.executeQuery(query);
 						int i=1;
						while(rs.next()){ %>
							   <tr>
							      <td ><%=i++%></td>
							      <%
							      String query1 = "select requestedModule,requestedFeture from form16_tmsuser_modul_feture where form_no='"+req+"' and requestedModule='"+rs.getString("applicationModule_id")+"'"; 
								  st1 = con2.createStatement();
			 					  rs1 = st1.executeQuery(query1);
							      if(rs1.next())
							         {%>
							         <td ><input type='checkbox'  name="moduleid[]" id="module<%=rs.getString("applicationModule_id")%>"  value="<%=rs.getString("applicationModule_id")%>" checked/><%=rs.getString("applicationModule_name")%> </td>
								     <td align="center" >
								         
								         
								         
								         <table  id='viewTableId' align='center' border='1'>
								            <tr><th>SL.No</th> <th>Feature Name</th><th colspan=6>User Rights </th> </tr>
       			<%
       			String query3= " SELECT * FROM `applicationfeatures` WHERE `applicationModule_id`=? ";
       			PreparedStatement prep = con1.prepareStatement(query3);
            	prep.setInt(1,Integer.parseInt(rs.getString("applicationModule_id")));
             	ResultSet rs2 = prep.executeQuery();
             	int ii=1;
             	String reqFeture=rs1.getString("requestedFeture");
             	String reqmodule=null;
       			
             	
             	String modFetu="";
               
             	
             	int ife=0; 
             	String strArray[] = reqFeture.split(",");
       			while (rs2.next())
       			    { 
       				
       				String fetuID=rs2.getString("applicationFeatures_id");
       			    String all="all"+fetuID,create="create"+fetuID,view="view"+fetuID,update="update"+fetuID,delete="delete"+fetuID,export="export"+fetuID;
       			    %>
       				<tr>
       				<td align="center"><%=ii%></td>
           			
           			<td align='center'><%=rs2.getString("applicationFeatures_name")%></td>
           			<%
           			  
                      /*       			  
           			  System.out.println("**********************************************");
           			  System.out.println("reqFeture of string  :"+reqFeture);
         			  System.out.println("Lengthe of string  :"+strArray.length);
           			  System.out.println("reqFeture of string  :"+all);
         			  System.out.println("Lengthe of string  :"+create);
         			  System.out.println("reqFeture of string  :"+view);
          			  System.out.println("Lengthe of string  :"+update);
          			  System.out.println("reqFeture of string  :"+delete);
         			  System.out.println("Lengthe of string  :"+export);
         			  System.out.println("**********************************************");
          			   */
           		      
           		    	  
           			     if(ife<strArray.length){
           		             if(ife<strArray.length && all.equals(strArray[ife])){ife=ife+1;%>
           			              <td align='center'><input type="checkbox" checked>All</td>
           			         <%}else{%>
           			             <td align='center'><input type="checkbox">All</td>
           			         <%}%>
           			         
           			         
           			       <%
           			      
           			        if(ife<strArray.length && create.equals(strArray[ife])){ife=ife+1;%>
           			             <td align='center'><input type='checkbox' checked>Create</td>
           			        <%}else{%>
           			             <td align='center'><input type='checkbox'>Create</td>
           			        <%}%>
           			        
           			        
           			<% 	  
           			
           			if(ife<strArray.length && view.equals(strArray[ife])){ife=ife+1;%>
           			     <td align='center'><input type='checkbox' checked>View</td>
           			<%}else{%>
           			     <td align='center'><input type='checkbox'>View</td>
           			<%}%>
           			<% 	  
           			
           			if(ife<strArray.length && update.equals(strArray[ife])){ife=ife+1;%>
           			    <td align='center'><input type='checkbox' checked>Update</td>
           			<%}else{%>
           			    <td align='center'><input type='checkbox'>Update</td>
           			<%}%>
           			<% 	 
           			
           			if(ife<strArray.length && delete.equals(strArray[ife])){ife=ife+1;%>
           			    <td align='center'><input type='checkbox' checked>Delete</td>
           			<%}else{%>
           			    <td align='center'><input type='checkbox'>Delete</td>
           			<%}%>
           			<% 	 
           			if(ife<strArray.length && export.equals(strArray[ife])){ife=ife+1;%>
           			    <td align='center'><input type='checkbox' checked>Export</td>
           			<%}else{%>
           			    <td align='center'><input type='checkbox'>Export</td>
           			<%}}else{%>
           			<td align='center'><input type="checkbox">All</td>
           			<td align='center'><input type='checkbox'>Create</td>
           			 <td align='center'><input type='checkbox' >View</td>
           			<td align='center'><input type='checkbox'>Update</td>
           			<td align='center'><input type='checkbox'>Delete</td>
           			<td align='center'><input type='checkbox'>Export</td>
           			</tr>
           			<%}ii++;
           			
       			}%>
       			</table>
				                 </td> 
							    	 <%}else{%> 
							    	 <td ><input type='checkbox'  name="moduleid[]" id="module<%=rs.getString("applicationModule_id")%>"  value="<%=rs.getString("applicationModule_id")%>" /><%=rs.getString("applicationModule_name")%> </td>
								     <td align="center" ></td>
								     <%}%>
						    	</tr>
    						   
    						<%}%>
							
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							con1.close();
					   }%>
 </table>
<%} %>

<br />
<table id="tableData" name="tableData" width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
		
	  </tr>
	  <%
	  String mailD=null;
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  String statusD=null;
	  rs1 = st1.executeQuery("select form_no,desg,emp,status,remarks,DATE_FORMAT(form_date,'%d/%m/%Y'),mail from form16_tmsuser_item WHERE form_no='"+req+"'"); 
	  while(rs1.next())
	  {
		  String form2_noD= rs1.getString(1);
		  String desgD= rs1.getString(2);
		  empD= rs1.getString(3);
		  statusD= rs1.getString(4);
		  String remarksD= rs1.getString(5);
		  String f_dateD= rs1.getString(6);
		  mailD= rs1.getString(7);
		  String m = "";
		   if(rs1.getString("mail")!=null)
		   {
		    m =  rs1.getString("mail").trim();
		   }
		 
		 %>
	   <tr>
	   
		<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
		<input id="idStatus" type="hidden" value="<%=statusD%>"/>
		</td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
		<td bgcolor="white" width="100" class="fonter"><%=statusD%></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
	
	  </tr>
	  <%} %>
</table>
                                                                
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1" id="hiderow">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='DomainUserSelectAdmin.jsp?msg=1'"/> --> 
     <a href="javascript:history.back()">BACK</a>
     </td>
    <td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
     
   	</tr>
 
</table> 	

</center>
	<br /><br /><br />
	
</div>

</form>	

</body>

</html>