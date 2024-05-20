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
	<title>NExAS Form</title>
	
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

<form  name="form" method="post"  action="DomainUserAdminBack.jsp">
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
String values[] = req.split(" -");
//System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
//System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
req = values[0].replaceAll(" ", "");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form12_nexas WHERE form_no='"+req+"'"); 
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
	    currNExASID = rs100.getString("curr_NExASID");
	    requestBy = rs100.getString("requestBy");
	    mailid = rs100.getString("empmail");
	    mobno = rs100.getString("emp_mob");
	    filepath = rs100.getString("filepath");
	    fileName = rs100.getString("fileName");
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
          <td><font size="4"><b><center><label>NExAS USER FORM</label> </center></b></font></td>
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
<tr>
<td  style="text-align: right;">Employee Code :</td>
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
<tr>


<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  name="d_reliving" size="31"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
	
		</td> 	
		<td align="right">Request  :</td>
<td > 
     <input style="" type ="text" name = "requestOption" size="31" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
 
						        
</tr>
<%if(!requestOption.equals("New")) { %>
    <tr>
        <td  style="text-align: right;">Current NExAS ID:</td> 
        <td style="text-align:left;">
              <input type="text"  name="d_reliving" size="31"  value="<%=currNExASID%>" readonly="readonly" readonly="readonly" />
		</td> 	
		<td align="right"></td>
        <td > 
              
        </td>
   </tr>
   <%}%>
</table>
<br >
<br>
<!-- //////////////////////////////// /////////////////////////////////////////////////////////////-->

<%
String userid="",username="",compCode="",costCCode="",costCName="",email="",position="",userKind="",opval="",operationUnit="",operationRangeOptional="";
String dispUnit="",dispRange="",TVApp="",empType="",HRMenu="",date1="",oprange="";
st0=cn100.createStatement();
rsO= st0.executeQuery("select * from form12_nexas_otherval WHERE form_no='"+req+"'"); 
while(rsO.next())
        {
	    userid = rsO.getString("userid");
	    username = rsO.getString("username");
	    if(userid==null){userid="Still not Created";username="Still not Created";}
	    compCode = rsO.getString("compCode");
	    costCCode = rsO.getString("costCCode");
	    costCName = rsO.getString("costCName");
	    oprange = rsO.getString("operationRangeOptional");
	    /* email = rsO.getString("email");
	    position = rsO.getString("position"); */
	
	    userKind = rsO.getString("userKind");
	    opval = rsO.getString("opval");
	    System.out.println("OP VAlue :"+opval);
	    /* operationUnit = rsO.getString("operationUnit");
	    operationRangeOptional = rsO.getString("operationRangeOptional");
	    
	    dispUnit = rsO.getString("dispUnit");
	    dispRange = rsO.getString("userKind");
	    TVApp = rsO.getString("TVApp");
	    empType = rsO.getString("empType");
	    
	    HRMenu = rsO.getString("HRMenu");
	    date1 = rsO.getString("date1"); */
	   
	    
        }
//System.out.println("OP value :"+opval);
String [] opval1 = opval.split(",");
int l=opval1.length;
System.out.println("L :"+l);
String [] opval3= new String[12];
int k=0;
String [] opval2={"paymentProp","paymentAppr","openCloseSch","voidCheq","issueCheq","taxRepo","ExchangRateMa","offsetAc","addfreeMaster","paymentOpeBranch","batchInput","SEPABACS"};
for(int f=0;f<12;f++)
    {
    //System.out.println("k :"+k);
   // System.out.println("opval K :"+k+" :"+opval1[k]);
    //System.out.println("opval2 F :"+f+" :"+opval2[f]);
    //System.out.println("opval2 :"+opval2[f]);
	if((opval1[k].equals(opval2[f]))  )
	   {
	   opval3[f]=opval1[k];	
	  // System.out.println("opval3 :"+opval3[f]);
	   if(k<l-1)
	       ++k;
	   }
	else
	   {
		opval3[f]=" ";
		//System.out.println("opval3 :"+opval3[f]);
	   }
   }
	


%>



<table id="it" width="895" border=1>
  
  <%-- <tr>
      <td align="left"><font color=red>*</font>User ID(NExAS)  :</td>
      <td style="font-weight:bold;font-style:italic;width:23%;"  ><input type="text" name="userid"	id="iduserid" value="<%=userid%>" size="28" maxlength="44" readonly/></td>
  </tr> --%>
  <%-- <tr>
      <td align="left"><font color=red>*</font>(2)User Name  :</td>
      <td style="font-weight:bold;font-style:italic;width:23%;" ><input type="text" name="username"	value="<%=username%>" id="idusername" size="28" maxlength="44" readonly/></td>
  </tr> --%>
  <tr >
     
          <td align="left"><font color=red>*</font>Company Code:	</td>
          <td colspan=2>
             <table>
                <tr>
                  <td >
                    <input type="text" name="username"	value="<%=compCode%>" id="idusername" size="10" maxlength="44" />
                   </td>
                  <td align="left"><font color=red>*</font>Cost Center Code:</td>
                  <td style="text-align: left;"><input type="text" name="costCCode"	id="idcostCCode" size="10" maxlength="44" value="<%=costCCode%>"readonly/></td>
                  <td align="left"><font color=red>*</font>Cost Center Name:</td>
                  <td style="text-align: left;"><input type="text" name="costCName"	id="idcostCName" size="20" maxlength="44" value="<%=costCName%>"readonly/></td>
                  <td align="left"><font color=red>*</font>OPRange:</td>
                  <td style="text-align: left;"><input type="text" name="costCName"	id="idcostCName" size="10" maxlength="44" value="<%=oprange%>"readonly/></td>
         
               </tr>
            </table>
         </td>
     
  </tr>
  
  <tr>
     <td align="left"><font color=red>*</font>Authority  :</td>
     <td colspan=2>
             <table border=1>
                <tr>
                  <td align="left">Accounting Menu</td>
                   <td colspan=2>
                   
                 
                      <table border=1>
                         <tr>
                             <td align="center">User kind </td>
                             <td>
                                <%if(userKind.equals("HOAcUser")){%>                                    
                                     <input type="radio" name="userKind" id="userKind1" value="HOAcUser" checked></input>HO Acounting User</br>
                                  <%}else{%>   
                                     <input type="radio" name="userKind" id="userKind1" value="HOAcUser"></input>HO Acounting User</br>
                                 <%}if(userKind.equals("BRAcUser")){%>                                    
                                     <input type="radio" name="userKind" id="userKind2" value="BRAcUser" checked></input>Branch Acounting User</br>
                               <%}else{%>   
                                     <input type="radio" name="userKind" id="userKind2" value="BRAcUser" ></input>Branch Acounting User</br>
                                  <%}if(userKind.equals("ITUser")){%>                                    
                                     <input type="radio" name="userKind" id="userKind3" value="ITUser" checked></input>IT User</br>
                                  <%}else{%>   
                                    <input type="radio" name="userKind" id="userKind3" value="ITUser" ></input>IT User</br>
                                  <%}if(userKind.equals("RepoDispOnly")){%>                                    
                                     <input type="radio" name="userKind" id="userKind4" value="RepoDispOnly" checked> </input>Report display only User </br>
                                 <%}else{%>  
                                    <input type="radio" name="userKind" id="userKind4" value="RepoDispOnly"> </input>Report display only User </br>   
                                 <%}%>
                                 
                                 
                             </td>
                         </tr>
                         <tr>
                            <td align="center">Optional menu</td>
                            <td>
                                <%if(opval3[0].equals("paymentProp")){%>   
                                   <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" checked></input>&nbsp;Payment Proposal<br/>
                                 <%}else{%>  
                                   <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" ></input>&nbsp;Payment Proposal<br/>
                                 <%}if(opval3[1].equals("paymentAppr")){%>  
                                     <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr" checked></input>&nbsp;Payment Approval <br/>
                                 <%}else{%>  
                                      <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr"></input>&nbsp;Payment Approval <br/>
                                  <%}if(opval3[2].equals("openCloseSch")){%>      
                                        <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch" checked></input>&nbsp; Open/Close Schedule<br/>
                                  <%}else{%>
                                        <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch"></input> &nbsp;Open/Close Schedule <br/>
                                   <%}if(opval3[3].equals("voidCheq")){%>               
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq" checked></input>&nbsp; Void Cheque <br/>
                                   <%}else{%> 
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq"></input>&nbsp; Void Cheque <br/> 
                                   <%}if(opval3[4].equals("issueCheq")){%>           
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" checked></input>&nbsp;Issue Cheque<br/>
                                   <%}else{%> 
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" ></input>&nbsp;Issue Cheque<br/>
                                  <%}if(opval3[5].equals("taxRepo")){%>       
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo" checked></input>&nbsp;Tax Report <br/>
                                 <%}else{%> 
                                          <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo"></input>&nbsp;Tax Report <br/> 
                                  <%}if(opval3[6].equals("ExchangRateMa")){%>               
                                          <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa" checked></input>&nbsp; Exchange Rate Maintainance<br/>
                                  <%}else{%> 
                                           <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa"></input>&nbsp; Exchange Rate Maintainance <br/>       
                                  <%}if(opval3[7].equals("offsetAc")){%>
                                           <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc" checked></input>&nbsp;Offset Account  <br/>
                                  <%}else{%>
                                           <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc"></input>&nbsp;Offset Account  <br/> 
                                 <%}if(opval3[8].equals("addfreeMaster")){%>
                                            <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" checked></input>&nbsp; Addfree master Maintainance<br/>
                                  <%}else{%>
                                            <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" ></input> &nbsp;Addfree master Maintainance<br/>
                                  <%}if(opval3[9].equals("paymentOpeBranch")){%>                     
                                            <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch" checked></input>&nbsp;Payment operation of branch </br>
                                   <%}else{%> 
                                            <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch"></input>&nbsp;Payment operation of branch </br>        
                                 <%}if(opval3[10].equals("batchInput")){%> 
                                          <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput" checked></input>&nbsp; Batch Input<br/>
                                 <%}else{%>
                                          <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput"></input>&nbsp; Batch Input<br/>
                                  <%}if(opval3[11].equals("SEPABACS")){%>         
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS" checked></input>&nbsp;  SEPA.BACS data Download<br/>
                                 <%}else{%> 
                                         <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS"></input> &nbsp; SEPA.BACS data Download
                                 <%}%>                    
                             </td>
                        </tr>
                        <%-- <tr>
                           <td align="center">Operation unit</td>
                            <td>
                                 <%if(operationUnit.equals("Company")){%>  
                                          <input type="radio" name="operationUnit" id="operationUnit1" value="Company" checked></input> Company
                                   <%}else{%>
                                          <input type="radio" name="operationUnit" id="operationUnit1" value="Company" ></input> Company
                                    <%}if(operationUnit.equals("Branch")){%>
                                         <input type="radio" name="operationUnit" id="operationUnit2" value="Branch" checked></input> Branch
                                  <%}else{%>
                                         <input type="radio" name="operationUnit" id="operationUnit2" value="Branch"></input> Branch
                                  <%}if(operationUnit.equals("Region")){%>
                                         <input type="radio" name="operationUnit" id="operationUnit3" value="Region" checked></input> Region
                                  <%}else{%>
                                         <input type="radio" name="operationUnit" id="operationUnit3" value="Region"></input> Region
                                  <%}%>
                            </td>
                         </tr>
                         <tr>
                             <td align="center">Operation range(If Additional comp)</td>
                             <td align="left">
                             (1)<input type="text" name="operationRangeOptional1" id="idoperationRangeOptional1" value="" size="10" maxlength="10"/>
                             (2)<input type="text" name="operationRangeOptional2" id="idoperationRangeOptional2" value="" size="10" maxlength="10"/><br>
                             (3)<input type="text" name="operationRangeOptional3" id="idoperationRangeOptional3" value="" size="10" maxlength="10"/>
                             (4)<input type="text" name="operationRangeOptional4" id="idoperationRangeOptional4" value="" size="10" maxlength="10"/><br>
                             (5)<input type="text" name="operationRangeOptional5" id="idoperationRangeOptional5" value="" size="10" maxlength="10"/>
                             (6)<input type="text" name="operationRangeOptional6" id="idoperationRangeOptional6" value="" size="10" maxlength="10"/>    
                             </td>
                         </tr>
                         <tr>
                            <td align="center">Display unit</td>
                            <td>
                                 <%if(dispUnit.equals("Company")){%> 
                                       <input type="radio" name="dispUnit" id="dispUnit1" value="Company" checked></input>Company 
                                 <%}else{%>
                                       <input type="radio" name="dispUnit" id="dispUnit1" value="Company" ></input>Company 
                                 <%}if(dispUnit.equals("Branch")){%> 
                                       <input type="radio" name="dispUnit" id="dispUnit2" value="Branch" checked></input>Branch
                                 <%}else{%>
                                       <input type="radio" name="dispUnit" id="dispUnit2" value="Branch"></input>Branch
                                 <%}if(dispUnit.equals("Region")){%> 
                                       <input type="radio" name="dispUnit" id="dispUnit3" value="Region" checked></input>Region
                                 <%}else{%>
                                       <input type="radio" name="dispUnit" id="dispUnit3" value="Region"></input>Region
                                  <%} %>     
                            </td>
                        </tr>
                        <tr>
                           <td align="center">Display range(If Additional comp)</td>
                           <td align="left">
                              (1)<input type="text" name="dispRange1"	id="dispRange1" size="10" maxlength="44" />
                              (2) <input type="text" name="dispRange2"	id="dispRange2" size="10" maxlength="44" /><br/>
                              (3)<input type="text" name="dispRange3"	id="dispRange3" size="10" maxlength="44" />
                              (4)<input type="text" name="dispRange4"	id="dispRange4" size="10" maxlength="44" /><br/>
                              (5) <input type="text" name="dispRange5"	id="dispRange5" size="10" maxlength="44" />
                              (6)<input type="text" name="dispRange6"	id="dispRange6" size="10" maxlength="44" />
                           
                           </td>
                        </tr> --%>
                      </table>
                    </td>
               </tr>
               <%-- <tr>
                  <td align="left">TV</td>
                  <td colspan=2>
                      <table border=1>
                         <tr>
                             <td align="left">TV Application</td>
                             <td>
                                  <%if(TVApp.equals("ClaExpByUr")){%> 
                                        <input type="radio" name="TVApp" id="TVApp1" value="ClaExpByUr" checked>Claiming Expense by yourself</input> <br/>
                                  <%}else{%>
                                        <input type="radio" name="TVApp" id="TVApp1" value="ClaExpByUr" >Claiming Expense by yourself</input> <br/>
                                  <%}if(TVApp.equals("ClaExpByOther")){%> 
                                        <input type="radio" name="TVApp" id="TVApp2" value="ClaExpByOther" checked>Claiming Expense by others</input> 
                                  <%}else{%>
                                         <input type="radio" name="TVApp" id="TVApp2" value="ClaExpByOther">Claiming Expense by others</input> 
                                   <%}%>
                            </td>
                         </tr>
                         <tr>
                            <td align="left">Employee Type</td>
                            <td>
                                 <%if(empType.equals("localEmp")){%>
                                       <input type="radio" name="empType" id="empType1" value="localEmp" checked>Local employee</input> <br/>
                                  <%}else{%>
                                       <input type="radio" name="empType" id="empType1" value="localEmp" >Local employee</input> <br/>
                                 <%}if(empType.equals("transEmp")){%>
                                        <input type="radio" name="empType" id="empType2" value="transEmp" checked>Transfer employee</input>
                                  <%}else{%>
                                        <input type="radio" name="empType" id="empType2" value="transEmp">Transfer employee</input>
                                  <%}%>
                            </td>
                        </tr>
                     </table>
                 </td>
               </tr>
               <tr>
                  <td align="left">HR menu</td>
                  <td align="left"><input type="text" name="HRMenu"	id="idHRMenu" size="50" maxlength="44" value="<%=HRMenu%>"/></td>
               </tr> --%>
            </table>
     </td>
  </tr>
  <%-- <tr>
      <td align="left"><font color=red>*</font>(10)Use Date(dd,mm,yyyy)  :</td>
       <td style="text-align: left;" colspan="3"><input type="text" name ="date1" id="datepicker" placeholder="Date" value="<%=date1%>"></td>
  </tr> --%>
 <%--  <tr>
       <td  align="left"><font color=red>*</font>NExAS file :</td>
       <%if(fileName!=null) {%>
       <td align="left" ><a href="viewNExASExcelFile.jsp?f=<%=filepath%>"><%=fileName%></a></td>
       <%}else{%>
       <td align="left" >Not Uploaded</td>
       <%} %>
  </tr> --%>

</table>







<!-- <font color=red><b><h5>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br /></h3>
</font> 
 -->













<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->




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
	  rs1 = st1.executeQuery("select form_no,desg,emp,status,remarks,DATE_FORMAT(form_date,'%d/%m/%Y'),mail from form12_nexas_item WHERE form_no='"+req+"'"); 
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