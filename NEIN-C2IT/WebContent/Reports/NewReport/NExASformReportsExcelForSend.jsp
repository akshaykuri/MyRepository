<%@page import="CON2.DbUtil"%>
<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<%response.setContentType("application/x-download"); 
response.setHeader("Content-Disposition", "attachment; filename=NExASExcelReport.xls");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<%-- <%@ include file="../../banner.jsp" %> --%>
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

function NXExcel(val)
{
//alert("her1111 :"+val);
document.form.action="NExASformReportsExcelForSend.jsp";
document.form.method="post";
document.form.submit();
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
String mailid=null,mobno=null,i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,group=null;
String req = request.getParameter("formno");

//System.out.println("form no  :"+req);
//String values[] = req.split(" -");
//System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
//System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
//req = values[0].replaceAll(" ", "");
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
	    requestBy = rs100.getString("requestBy");
	    mailid = rs100.getString("empmail");
	    mobno = rs100.getString("emp_mob");
        }
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<br />

<center>
<table  border="1" bgcolor="white">
                <tr >
                    <td colspan="6"><font size="3"><b><center><label>User Application(v04.2) for Asia</label> </center></b></font></td>
	           </tr>
               <tr>
                  <td rowspan="7" bgcolor="gray">Applicant Information</td>
                  <td bgcolor="gray">Name :</td>
                  <td><%=full_name%></td>
                  <td rowspan="7" bgcolor="gray">Manager Information</td>
                  <td bgcolor="gray">Name :</td>
                  <td>Biju M</td>
              </tr>
              <tr>
                 <td bgcolor="gray">Company</td>
                 <td>Nippon Express (India) Private Limited</td>
                 <td bgcolor="gray">Company</td>
                 <td>Nippon Express (India) Private Limited</td>
              </tr>
              <tr>
                   <td bgcolor="gray">Branch</td>
                   <td ><%=branch%>"</td>
                   <td bgcolor="gray">Branch</td>
                   <td >Head Office</td> 
              </tr>
              <tr>
                   <td bgcolor="gray">Division</td>
                    <td >Accounts</td>
                    <td bgcolor="gray">Division</td>
                    <td >General Affairs</td>
              </tr>
              <tr>
                    <td bgcolor="gray">Position</td>
                    <td><%=designation%></td>
                    <td bgcolor="gray">Position</td>
                    <td>GM</td>
             </tr>
             <tr>
                    <td bgcolor="gray">Email</td>
                    <td ><%=mailid%></td>
                    <td bgcolor="gray">Email</td>
                    <td >biju.m@nittsu.co.in</td>
             </tr>
             <tr>
                    <td bgcolor="gray">Phone</td>
                    <td><%=mobno%></td> 
                   <td bgcolor="gray">Phone</td>
                    <td>+91 8049475600</td>
             </tr>
      </table>
      
	 <%
String userid="",username="",compCode="",costCCode="",costCName="",email="",position="",userKind="",opval="",operationUnit="",operationRangeOptional="";
String dispUnit="",dispRange="",TVApp="",empType="",HRMenu="",date1="",opRange="";
st0=cn100.createStatement();
rsO= st0.executeQuery("select * from form12_nexas_otherval WHERE form_no='"+req+"'"); 
while(rsO.next())
        {
	   /*  userid = rsO.getString("userid");
	    username = rsO.getString("username"); */
	    compCode = rsO.getString("compCode");
	    costCCode = rsO.getString("costCCode");
	    costCName = rsO.getString("costCName");
	    opRange = rsO.getString("operationRangeOptional");
	    /* email = rsO.getString("email");
	    position = rsO.getString("position"); */
	
	    userKind = rsO.getString("userKind");
	    opval = rsO.getString("opval");
	   // System.out.println("OP VAlue :"+opval);
	    /* operationUnit = rsO.getString("operationUnit");
	    operationRangeOptional = rsO.getString("operationRangeOptional");
	    
	    dispUnit = rsO.getString("dispUnit");
	    dispRange = rsO.getString("userKind");
	    TVApp = rsO.getString("TVApp");
	    empType = rsO.getString("empType");
	    
	    HRMenu = rsO.getString("HRMenu");
	    date1 = rsO.getString("date1"); */
	   
	    
        }

String [] opval1 = opval.split(",");
int l=opval1.length;
//System.out.println("L :"+l);
String [] opval3= new String[12];
int k=0;
String [] opval2={"paymentProp","paymentAppr","openCloseSch","voidCheq","issueCheq","taxRepo","ExchangRateMa","offsetAc","addfreeMaster","paymentOpeBranch","batchInput","SEPABACS"};
for(int f=0;f<12;f++)
    {
    //System.out.println("k :"+k);
    //System.out.println("opval K :"+k+" :"+opval1[k]);
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

<table  bgcolor="whilte">
         <tr>
         <table   border="1">
             <tr>
                <td align="left" bgcolor="gray" >Request Type :</td>
                <td colspan="2">Create New User ID</td>
            </tr>
            <%-- <tr>
                <td align="left" bgcolor="gray" >(2)User ID(NExAS) :</td>
                <td colspan="2"><%=userid%> </td>
            </tr>
            <tr>
                <td align="left" bgcolor="gray" >(3)User Name  :</td>
                <td colspan="2"><%=username%></td>
           </tr> --%>
           <tr >
               <td align="left" bgcolor="gray">Company Code:	</td>
               <td colspan=2>
               <table>
                   <tr>
                      <td ><%=compCode%></td>
                      <td align="left" bgcolor="gray">Cost Center Code:</td>
                      <td style="text-align: left;"><%=costCCode%></td>
                      <td align="left" bgcolor="gray">Cost Center Name:</td>
                      <td style="text-align: left;"><%=costCName%></td>
                      <td align="left" bgcolor="gray">OPRange:</td>
                      <td style="text-align: left;"><%=opRange%></td>
                   </tr>
                </table>
                </td>
          </tr>
          <%-- <tr>
                <td align="left" bgcolor="gray">(7)E-mail address :</td>
                <td style="text-align: left;" colspan="2"><%=email%></td>
         </tr>
         <tr>
              <td align="left" bgcolor="gray">(8)Position :</td>
              <td style="text-align: left;" colspan="2"><%=position%></td>
         </tr> --%>
         <tr>
              <td align="left" bgcolor="gray">Authority :</td>
              <td colspan=2>
                   <table border=1>
                       <tr>
                          <td align="left">Accounting Menu</td>
                          <td colspan=2>
                          <table border=1>
                                 <tr>
                                     <td align="center">User kind </td>
                                     <td><table border="1"><tr>
                                     <%if(userKind.equals("HOAcUser")){%>                                    
                                        <td> <input type="radio" name="userKind" id="userKind1" value="HOAcUser" checked></input></td><td>HO Acounting User</td>
                                     <%}else{%>   
                                       <td> <input type="radio" name="userKind" id="userKind1" value="HOAcUser"></input></td><td>HO Acounting User</td>
                                     <%}if(userKind.equals("BRAcUser")){%>                                    
                                        <td> <input type="radio" name="userKind" id="userKind2" value="BRAcUser" checked></input></td><td>Branch Acounting User</td>
                                    <%}else{%>   
                                       <td>   <input type="radio" name="userKind" id="userKind2" value="BRAcUser" ></input></td><td>Branch Acounting User</td></tr>
                                    <%}if(userKind.equals("ITUser")){%>                                    
                                        <tr><td>  <input type="radio" name="userKind" id="userKind3" value="ITUser" checked></td><td></input>IT User</td>
                                    <%}else{%>   
                                         <td> <input type="radio" name="userKind" id="userKind3" value="ITUser" ></input></td><td>IT User</td>
                                    <%}if(userKind.equals("RepoDispOnly")){%>                                    
                                        <td>  <input type="radio" name="userKind" id="userKind4" value="RepoDispOnly" checked> </input></td><td>Report display only User </td>
                                    <%}else{%>  
                                         <td> <input type="radio" name="userKind" id="userKind4" value="RepoDispOnly"> </input></td><td>Report display only User </td></tr></table>   
                                    <%}%>
                                  </td>
                               </tr>
                               <tr>
                                   <td align="center">Optional menu</td>
                                   <td><table border="1"><tr>
                                     <%if(opval3[0].equals("paymentProp")){%>   
                                          <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" checked></input></td><td>Payment Proposal</td>
                                     <%}else{%>  
                                         <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" ></input></td><td>Payment Proposal</td>
                                     <%}if(opval3[1].equals("paymentAppr")){%>  
                                         <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr" checked></input></td><td>Payment Approval </td>
                                     <%}else{%>  
                                         <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr"></input></td><td>Payment Approval </td>
                                     <%}if(opval3[2].equals("openCloseSch")){%>      
                                         <td><input type="checkbox" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch" checked></input></td><td>Open/Close Schedule</td>
                                     <%}else{%>
                                        <td><input type="checkbox" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch"></input> </td><td>Open/Close Schedule </td></tr>
                                     <%}if(opval3[3].equals("voidCheq")){%>               
                                         <tr><td><input type="checkbox" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq" checked></input></td><td> Void Cheque </td>
                                     <%}else{%> 
                                        <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq"></input></td><td> Void Cheque  </td>
                                     <%}if(opval3[4].equals("issueCheq")){%>           
                                          <td><input type="checkbox" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" checked></input></td><td>Issue Cheque </td>
                                     <%}else{%> 
                                        <td>  <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" ></input></td><td>Issue Cheque </td>
                                     <%}if(opval3[5].equals("taxRepo")){%>       
                                         <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo" checked></input></td><td>Tax Report  </td>
                                     <%}else{%> 
                                           <td><input type="checkbox" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo"></input></td><td>Tax Report  </td></tr>
                                     <%}if(opval3[6].equals("ExchangRateMa")){%>               
                                         <tr> <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa" checked></input></td><td> Exchange Rate Maintainance </td> 
                                     <%}else{%> 
                                           <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa"></input></td><td> Exchange Rate Maintainance </td>       
                                     <%}if(opval3[7].equals("offsetAc")){%>
                                           <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc" checked></input></td><td>Offset Account  </td>
                                     <%}else{%>
                                           <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc"></input></td><td>Offset Account  </td>
                                    <%}if(opval3[8].equals("addfreeMaster")){%>
                                            <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" checked></input></td><td>Addfree master Maintainance </td>
                                    <%}else{%>
                                            <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" ></input> </td><td>Addfree master Maintainance </td></tr>
                                    <%}if(opval3[9].equals("paymentOpeBranch")){%>                     
                                           <tr> <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch" checked></input></td><td>Payment operation of branch </td>
                                    <%}else{%> 
                                            <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch"></input></td><td>Payment operation of branch  </td>       
                                    <%}if(opval3[10].equals("batchInput")){%> 
                                          <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput" checked></input></td><td> Batch Input </td>
                                   <%}else{%>
                                           <td><input type="checkbox" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput"></input></td><td>Batch Input </td>
                                    <%}if(opval3[11].equals("SEPABACS")){%>         
                                         <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS" checked></input></td><td>  SEPA.BACS data Download </td>
                                   <%}else{%> 
                                         <td> <input type="checkbox" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS"></input> </td><td> SEPA.BACS data Download </td></tr></table>
                                   <%}%>                    
                                 </td>
                          </tr>
                          <%-- <tr>
                           <td align="center">Operation unit</td>
                            <td><table><tr>
                                 <%if(operationUnit.equals("Company")){%>  
                                         <td> <input type="radio" name="operationUnit" id="operationUnit1" value="Company" checked></input></td><td> Company</td>
                                   <%}else{%>
                                        <td>  <input type="radio" name="operationUnit" id="operationUnit1" value="Company" ></input></td><td> Company</td>
                                    <%}if(operationUnit.equals("Branch")){%>
                                         <td><input type="radio" name="operationUnit" id="operationUnit2" value="Branch" checked></input></td><td> Branch</td>
                                  <%}else{%>
                                        <td> <input type="radio" name="operationUnit" id="operationUnit2" value="Branch"></input></td><td> Branch</td>
                                  <%}if(operationUnit.equals("Region")){%>
                                        <td> <input type="radio" name="operationUnit" id="operationUnit3" value="Region" checked></input></td><td> Region</td>
                                  <%}else{%>
                                        <td> <input type="radio" name="operationUnit" id="operationUnit3" value="Region"></input></td><td> Region</td></tr></table>
                                  <%}%>
                            </td>
                         </tr>
                         <tr>
                             <td align="center">Operation range</td>
                             <td align="left"><table><tr>
                            <td>1<input type="text" name="operationRangeOptional1" id="idoperationRangeOptional1" value="" size="10" maxlength="10" readonly/></td>
                            <td>2<input type="text" name="operationRangeOptional2" id="idoperationRangeOptional2" value="" size="10" maxlength="10"readonly/></td>
                            <td>3<input type="text" name="operationRangeOptional3" id="idoperationRangeOptional3" value="" size="10" maxlength="10"readonly/></td></tr>
                            <tr><td>4<input type="text" name="operationRangeOptional4" id="idoperationRangeOptional4" value="" size="10" maxlength="10"readonly/></td>
                            <td>5<input type="text" name="operationRangeOptional5" id="idoperationRangeOptional5" value="" size="10" maxlength="10" readonly/></td>
                            <td>6<input type="text" name="operationRangeOptional6" id="idoperationRangeOptional6" value="" size="10" maxlength="10" readonly/> </td></tr> </table>  
                             </td>
                         </tr>
                         <tr>
                            <td align="center">Display unit</td>
                            <td><table><tr>
                                 <%if(dispUnit.equals("Company")){%> 
                                      <td> <input type="radio" name="dispUnit" id="dispUnit1" value="Company" checked></input></td><td>Company</td> 
                                 <%}else{%>
                                     <td>  <input type="radio" name="dispUnit" id="dispUnit1" value="Company" ></input></td><td>Company </td> 
                                 <%}if(dispUnit.equals("Branch")){%> 
                                      <td> <input type="radio" name="dispUnit" id="dispUnit2" value="Branch" checked></input></td><td>Branch</td> 
                                 <%}else{%>
                                      <td> <input type="radio" name="dispUnit" id="dispUnit2" value="Branch"></input></td><td>Branch</td> 
                                 <%}if(dispUnit.equals("Region")){%> 
                                      <td> <input type="radio" name="dispUnit" id="dispUnit3" value="Region" checked></input></td><td>Region</td> 
                                 <%}else{%>
                                     <td>  <input type="radio" name="dispUnit" id="dispUnit3" value="Region"></input></td><td>Region</td></tr> </table>
                                  <%} %>     
                            </td>
                        </tr>
                        <tr>
                           <td align="center">Display range</td>
                           <td align="left"><table><tr>
                             <td> (1)<input type="text" name="dispRange1"	id="dispRange1" size="10" maxlength="44" /></td> 
                             <td> (2) <input type="text" name="dispRange2"	id="dispRange2" size="10" maxlength="44" /></td> 
                              <td>(3)<input type="text" name="dispRange3"	id="dispRange3" size="10" maxlength="44" /></td></tr> 
                             <tr> <td>(4)<input type="text" name="dispRange4"	id="dispRange4" size="10" maxlength="44" /></td> 
                             <td> (5) <input type="text" name="dispRange5"	id="dispRange5" size="10" maxlength="44" /></td> 
                             <td> (6)<input type="text" name="dispRange6"	id="dispRange6" size="10" maxlength="44" /></td> </tr></table>
                           
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
                             <td><table>
                                  <%if(TVApp.equals("ClaExpByUr")){%> 
                                     <tr><td>   <input type="radio" name="TVApp" id="TVApp1" value="ClaExpByUr" checked></td><td>Claiming Expense by yourself</input> </td></tr>
                                  <%}else{%>
                                      <tr><td>  <input type="radio" name="TVApp" id="TVApp1" value="ClaExpByUr" ></td><td>Claiming Expense by yourself</input> </td></tr>
                                  <%}if(TVApp.equals("ClaExpByOther")){%> 
                                      <tr><td>  <input type="radio" name="TVApp" id="TVApp2" value="ClaExpByOther" checked></td><td>Claiming Expense by others</input></td></tr> 
                                  <%}else{%>
                                      <tr><td>   <input type="radio" name="TVApp" id="TVApp2" value="ClaExpByOther"></td><td>Claiming Expense by others</input> </td></tr>
                                   <%}%></table>
                            </td>
                         </tr>
                         <tr>
                            <td align="left">Employee Type</td>
                            <td><table>
                                 <%if(empType.equals("localEmp")){%>
                                      <tr><td> <input type="radio" name="empType" id="empType1" value="localEmp" checked></td><td>Local employee</input> </td></tr>
                                  <%}else{%>
                                     <tr><td>  <input type="radio" name="empType" id="empType1" value="localEmp" ></td><td>Local employee</input> </td></tr>
                                 <%}if(empType.equals("transEmp")){%>
                                       <tr><td> <input type="radio" name="empType" id="empType2" value="transEmp" checked></td><td>Transfer employee</input></td></tr>
                                  <%}else{%>
                                       <tr><td> <input type="radio" name="empType" id="empType2" value="transEmp"></td><td>Transfer employee</input></td></tr>
                                  <%}%></table>
                            </td>
                        </tr>
                     </table>
                 </td>
               </tr>
               <tr>
                  <td align="left">HR menu</td>
                  <td align="left"><%=HRMenu%></td>
               </tr> --%>
            </table>
     </td>
  </tr>
  <%-- <tr>
      <td align="left" bgcolor="gray">(10)Use Date(dd,mm,yyyy) :</td>
      <td style="text-align: left;" colspan="2"><%=date1%></td>
  </tr>
  <tr>
      <td align="left" bgcolor="gray">(11)Remarks :</td>
      <td style="text-align: left;" colspan="2"><%=date1%></td>
  </tr> --%>
</table>

                                 
   </td>
		
	</tr>
</table> 
<!-- <font color=black><b><h5>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br />
       If you have any question about this application, e-mail to NExAS support.(nexas_support.nittsu.co.jp)</h5>
</font>  -->
 
</form>	

</body>

</html>