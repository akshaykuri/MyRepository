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

<form  name="form">
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

String filepath=null,fileName=null,mailid=null,mobno=null,i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,group=null;
String req = request.getParameter("req");
String values[] = req.split(" -");
//System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
//System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
req = values[0].replaceAll(" ", "");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form13_ccdreport WHERE form_no='"+req+"'"); 
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
          <td><font size="4"><b><center><label>CCD REPORT VIEW FORM </label> </center></b></font></td>
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

</table>
<br >
<br>
<!-- //////////////////////////////// /////////////////////////////////////////////////////////////-->

<%

String selOption1="",selOption1Txt="",selOption2="",selOption2Txt="",fromDate="",toDate="",opvalo="";
st0=cn100.createStatement();
rsO= st0.executeQuery("select * from form13_ccdreport_otherval WHERE form_no='"+req+"'"); 
while(rsO.next())
        {
	    selOption1 = rsO.getString("selOption1");
		selOption1Txt = rsO.getString("selOption1Txt");
	    selOption2 = rsO.getString("selOption2");
		selOption2Txt = rsO.getString("selOption2Txt");
		fromDate = rsO.getString("fromDate");
		toDate = rsO.getString("toDate");
	    opvalo = rsO.getString("selBranch");
	    System.out.println("OP VAlue1 :"+opvalo);
	   
        }
//System.out.println("OP value :"+opval);
String opval="";
if(!opvalo.equals("All_branch"))
     opval = opvalo.substring(1);
else
	  opval=opvalo;
System.out.println("OP value value:"+opval);
String [] opval1 = opval.split(",");
int l=opval1.length;
System.out.println("L :"+l);
String [] opval3= new String[14];
int k=0;
String [] opval2={"All_branch","BANGALORE_Air_IMP","BANGALORE_Icon","DELHI","CHENNAI_Air_Imp","CHENNAI_Sea_Imp","MUMBAI_Air","MUMBAI_Sea","AHMEDABAD","KOLKATA","COCHIN","COIMBATORE","HYDERABAD","PUNE"};
for(int f=0;f<14;f++)
    {
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
<table width="895" border="1" bgcolor="lightgrey">
  
             <tr>
                <td align="left"><font color=red>*</font>Select Branch :</td>
                <td>
                <table width="100%">
                <tr>
                <td width="50%">
                   <%if(opval3[0].equals("All_branch")){%>   
                          <input name="linc_branh" type="checkbox" id="All" onclick="showCheckboxes(this.id)" class="group1" value="All_branch" checked/>ALL BRANCH<br>
                    <%}else{%>  
                          <input name="linc_branh" type="checkbox" id="All" onclick="showCheckboxes(this.id)" class="group1" value="All_branch" />ALL BRANCH<br>
                  <%}if(opval3[1].equals("BANGALORE_Air_IMP")){%>   
                         <input name="linc_branh" type="checkbox" id="one" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Air_IMP" checked/>BANGALORE_Air_IMP<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="one" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Air_IMP" />BANGALORE_Air_IMP<br>
                  <%}if(opval3[2].equals("BANGALORE_Icon")){%>   
                        <input name="linc_branh" type="checkbox" id="two" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Icon" checked/>BANGALORE_Icon<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="two" onclick="showCheckboxes(this.id)" class="group" value="BANGALORE_Icon"/>BANGALORE_Icon<br>
                   <%}if(opval3[3].equals("DELHI")){%>   
                        <input name="linc_branh" type="checkbox" id="three" onclick="showCheckboxes(this.id)" class="group" value="DELHI" checked/>DELHI<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="three" onclick="showCheckboxes(this.id)" class="group" value="DELHI"/>DELHI<br>
                   <%}if(opval3[4].equals("CHENNAI_Air_Imp")){%>   
                         <input name="linc_branh" type="checkbox" id="four" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Air_Imp" checked/>CHENNAI_Air_Imp<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="four" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Air_Imp"/>CHENNAI_Air_Imp<br>
                   <%}if(opval3[5].equals("CHENNAI_Sea_Imp")){%>   
                        <input name="linc_branh" type="checkbox" id="five" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Sea_Imp" checked/>CHENNAI_Sea_Imp<br>
                   <%}else{%>
                       <input name="linc_branh" type="checkbox" id="five" onclick="showCheckboxes(this.id)" class="group" value="CHENNAI_Sea_Imp"/>CHENNAI_Sea_Imp<br>  
                      <%} %>
                </td>
                <td width="50%">
                <%if(opval3[6].equals("MUMBAI_Air")){%>   
                       <input name="linc_branh" type="checkbox" id="six" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Air" checked/>MUMBAI_Air<br>
                   <%}else{%>  
                       <input name="linc_branh" type="checkbox" id="six" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Air"/>MUMBAI_Air<br>
                   <%}if(opval3[7].equals("MUMBAI_Sea")){%>   
                       <input name="linc_branh" type="checkbox" id="seven" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Sea" checked/>MUMBAI_Sea<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="seven" onclick="showCheckboxes(this.id)" class="group" value="MUMBAI_Sea"/>MUMBAI_Sea<br>
                   <%}if(opval3[8].equals("AHMEDABAD")){%>   
                        <input name="linc_branh" type="checkbox" id="eight" onclick="showCheckboxes(this.id)" class="group" value="AHMEDABAD" checked/>AHMEDABAD<br>
                   <%}else{%>
                        <input name="linc_branh" type="checkbox" id="eight" onclick="showCheckboxes(this.id)" class="group" value="AHMEDABAD"/>AHMEDABAD<br>  
                   <%}if(opval3[9].equals("KOLKATA")){%>   
                        <input name="linc_branh" type="checkbox" id="nine" onclick="showCheckboxes(this.id)" class="group" value="KOLKATA" checked/>KOLKATA<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="nine" onclick="showCheckboxes(this.id)" class="group" value="KOLKATA"/>KOLKATA<br>
                   <%}if(opval3[10].equals("COCHIN")){%>   
                        <input name="linc_branh" type="checkbox" id="ten" onclick="showCheckboxes(this.id)" class="group" value="COCHIN" checked/>COCHIN<br>
                   <%}else{%>
                        <input name="linc_branh" type="checkbox" id="ten" onclick="showCheckboxes(this.id)" class="group" value="COCHIN"/>COCHIN<br>  
                   <%}if(opval3[11].equals("COIMBATORE")){%>   
                        <input name="linc_branh" type="checkbox" id="eleven" onclick="showCheckboxes(this.id)" class="group" value="COIMBATORE" checked/>COIMBATORE<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="eleven" onclick="showCheckboxes(this.id)" class="group" value="COIMBATORE" />COIMBATORE<br>
                   <%}if(opval3[12].equals("HYDERABAD")){%>   
                        <input name="linc_branh" type="checkbox" id="twelve" onclick="showCheckboxes(this.id)" class="group" value="HYDERABAD" checked/>HYDERABAD<br>
                   <%}else{%>  
                        <input name="linc_branh" type="checkbox" id="twelve" onclick="showCheckboxes(this.id)" class="group" value="HYDERABAD"/>HYDERABAD<br>
                   <%}if(opval3[13].equals("PUNE")){%>   
                       <input name="linc_branh" type="checkbox" id="thirteen" onclick="showCheckboxes(this.id)" class="group" value="PUNE" checked/>PUNE
                   <%}else{%>
                       <input name="linc_branh" type="checkbox" id="thirteen" onclick="showCheckboxes(this.id)" class="group" value="PUNE"/>PUNE
                    <%}%>
              </td>
                </tr>
             </table>
             </td>
              <input type="hidden" name="dbName" id="iddbName" value="">
	    </tr>
              </tr>
             <tr>
                 <td align="left"><font color=red>*</font>Search On1 :</td>
                 <td>
                    <select name="se1" id="se1">
                        <option value=""><%=selOption1%></option>
                        <option value="IECode">IECODE NO</option>
                        <option value="JobNO">JOB NO</option>
                        <option value="ImpName">IMPORTER NAME</option>
                    </select>
                    <input type="text" name="se1text" id="se1text" value="<%=selOption1Txt%>" size=50></input>
                 </td>
                <!--  <td>
                     <input type="radio" name="se1" id="se11" value="IECode" onclick="active(this.value)"></input>IECODE NO.
                     <input type="radio" name="se1" id="se12" value="JobNO" onclick="active(this.value)"></input>JOB NO
                     <input type="radio" name="se1" id="se13" value="ImpName" onclick="active(this.value)"></input>IMPORTER NAME</br>
                     <input type="text" name="se1text" id="se1text" value="" size=100></input>
                 </td> -->
            </tr>
             <tr>
                 <td align="left"><font color=red>*</font>Search On2 :</td>
                 <td>
                    <select name="se2" id="se2">
                        <option value=""><%=selOption2 %></option>
                        <option value="ProDesc">PRODUCT DESCRIPTION</option>
                        <option value="CTHNo">CTH NO</option>
                    </select>
                    <input type="text" name="se2text" id="se2text" value="<%=selOption2Txt %>" size=50></input>
                 </td>
                <!--  <td>
                     <input type="radio" name="se2" id="se21" value="ProDesc" onclick="active(this.value)"></input>PRODUCT DESCRIPTION
                     <input type="radio" name="se2" id="se22" value="CthNo" onclick="active(this.value)"></input>CTH NO</br>
                     <input type="text" name="se2text" id="se2text" value="" size=100></input>
                 </td> -->
            </tr>
             <tr>
                 <td align="left"><font color=red>*</font>Clearance Date :</td>
                 <td>
                     From :<input type="text" name="date_time" maxlength="99" id="iddate_time" class="date_time" value="<%=fromDate %>" size=15 />
                     To :<input type="text" name="date_time1" maxlength="99" id="iddate_time1" class="date_time1" value="<%=toDate %>" size=15 />
                 </td>
            </tr>
        
</table>
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
	  rs1 = st1.executeQuery("select form_no,desg,emp,status,remarks,DATE_FORMAT(form_date,'%d/%m/%Y'),mail from form13_ccdreport_item WHERE form_no='"+req+"'"); 
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