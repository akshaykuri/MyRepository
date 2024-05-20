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
<%@page import="java.util.ResourceBundle"%>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../../../banner.jsp" %>
<%@ include file="../../../Session/SuperAdminSessionInSide3.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>

	<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<!-- 	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
		<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
        <script language="javascript"   type="text/javascript" src="../../js/onSubmitWait.js"></script>
	<!-- Help Page pop up ends -->
	<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
        	/*   var w=document.form.branch;
        	  var dpt=document.form.depart;
        	  var fn=document.form.full_name;
        	  var ec=document.form.emp_code;
        	  var desg=document.form.designation;
        	  var roff=document.form.r_officer;
        	  var dresig=document.form.d_resignation;
        	  var rel=document.form.d_reliving;
        	  var req=document.form.requestOption;
        	  var grd=document.form.grade; */
		  /*  var a=document.form.a_model;
        	  var b=document.form.a_data_card;
        	  var c=document.form.a_email;
        	  var d=document.form.a_newins;
        	  var e=document.form.a_domain;
        	  var f=document.form.a_mobile_model;
        	  var g=document.form.a_mobile_no;
        	  var h=document.form.a_access_card;
        	  var i=document.form.a_drive;
        	  var j=document.form.a_other_asset;
        	  var k=document.form.r_other_asset; */
        	  var l=document.form.a_remarks;
        	  var mail=document.form.mail;
        	  var desgS=document.form.desg;
        	  var empS=document.form.emp;
        	 var bkColor = "red";
        	 
  
                           /*  if ((l.value==null)||(l.value=="")){
                                alert("Enter Remarks!");
                                l.style.bkColor = l.style.backgroundColor;
                                l.style.backgroundColor = bkColor;
                                l.focus();
                                return false
                                } */ 
                            if ((mail.value==null)||(mail.value=="")){
                                alert("Select Employee Name and Designation \n To Send Mail!");
                                desgS.style.bkColor = desgS.style.backgroundColor;
                                desgS.style.backgroundColor = bkColor;
                                empS.style.bkColor = empS.style.backgroundColor;
                                empS.style.backgroundColor = bkColor;
                                mail.focus();
                                return false
                                } 
                                        
	 else
       return true;
}
        </script>
	<script language="javascript" type="text/javascript">     
     var xmlHttp;       
      var xmlHttp;    
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="selEmpFormsUsers.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText;    
                                                      } 
                                                              
            }  
            
            
     function Mail(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="selectMailId.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText   
                                                      } 
                                                              
            } 
            
/*  
function popupform(myform, windowname)
{
if (! window.focus)return true;
window.open('', windowname, 'height=200,width=400,scrollbars=yes');
myform.target=windowname;
return true;
}
 */

            
                </script> 
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<script language="javascript"   type="text/javascript">
function ItClearanceMail()
{
document.form.action="ITclearanceReminderBackMail.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function ItClearanceNormal()
{
document.form.action="ITclearanceReminderBack.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function onloadCheck()
{
	
	 var selectElement = document.getElementById("idit1aa");
	 var selectValue = selectElement.value;
	 var backColor = '#FFFFFF';
		    if(selectValue == 'Yes'){ backColor = 'red';}else backColor = 'green';selectElement.style.backgroundColor = backColor;
	 var selectElement2 = document.getElementById("idit2bb");
	 var selectValue2 = selectElement2.value;
	 var backColor2 = '#FFFFFF';
		   	if(selectValue2 == 'Yes'){ backColor2 = 'red';}else backColor2 = 'green';selectElement2.style.backgroundColor = backColor2;
	 var selectElement3 = document.getElementById("idit3cc");
	 var selectValue3 = selectElement3.value;
	 var backColor3 = '#FFFFFF';
			if(selectValue3 == 'Yes'){ backColor3 = 'red';}else backColor3 = 'green';selectElement3.style.backgroundColor = backColor3;
	 var selectElement4 = document.getElementById("idit4dd");
	 var selectValue4 = selectElement4.value;
	 var backColor4 = '#FFFFFF';
		    if(selectValue4 == 'Yes'){ backColor4 = 'red';}else backColor4 = 'green';selectElement4.style.backgroundColor = backColor4;
	 var selectElement5 = document.getElementById("idit5ee");
	 var selectValue5 = selectElement5.value;
	 var backColor5 = '#FFFFFF';
			if(selectValue5 == 'Yes'){ backColor5 = 'red';}else backColor5 = 'green';selectElement5.style.backgroundColor = backColor5;
	 var selectElement6 = document.getElementById("idit6ff");
	 var selectValue6 = selectElement6.value;
	 var backColor6 = '#FFFFFF';
			if(selectValue6 == 'Yes'){ backColor6 = 'red';}else backColor6 = 'green';selectElement6.style.backgroundColor = backColor6;
	 var selectElement7 = document.getElementById("idit7gg");
	 var selectValue7 = selectElement7.value;
	 var backColor7 = '#FFFFFF';
			if(selectValue7 == 'Yes'){ backColor7 = 'red';}else backColor7 = 'green';selectElement7.style.backgroundColor = backColor7;
	 var selectElement8 = document.getElementById("idit8hh");
	 var selectValue8 = selectElement8.value;
	 var backColor8 = '#FFFFFF';
			if(selectValue8 == 'Yes'){ backColor8 = 'red';}else backColor8 = 'green';selectElement8.style.backgroundColor = backColor8;
	 var selectElement9 = document.getElementById("idit9ii");
	 var selectValue9 = selectElement9.value;
	 var backColor9 = '#FFFFFF';
			if(selectValue9 == 'Yes'){ backColor9 = 'red';}else backColor9 = 'green';selectElement9.style.backgroundColor = backColor9;
	 var selectElement10 = document.getElementById("idit10jj");
	 var selectValue10 = selectElement10.value;
	 var backColor10 = '#FFFFFF';
		    if(selectValue10 == 'Yes'){ backColor10 = 'red';}else backColor10 = 'green';selectElement10.style.backgroundColor = backColor10;
}

</script>
	<%-- <script  type="text/javascript">

<% 
    String msg2[] = request.getQueryString().toString().split("=");
    String disp = msg2[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27"," ");
    disp = disp.replace("__","  ");
    %>
    msg2 = "<%=disp%>";

     if(msg2!="1")
		{
           alert(msg2);
		}
</script> --%>
<script  type="text/javascript">
function btnClick() { 
         close(); 
}
</script>
<!-- <script language="javascript"   type="text/javascript">
function onloadCheck(){
   	    if(!(document.getElementById("idit1aa").value=="" || document.getElementById("idit1aa").value=="NULL" || document.getElementById("idit1aa").value=="null" ))
   	    	 document.getElementById("idit1aa").checked = true; 
   	    //else document.getElementById("idit1aa").value="null"; 
   	    if(!(document.getElementById("idit2bb").value=="" || document.getElementById("idit2bb").value=="NULL" || document.getElementById("idit2bb").value=="null" ))
   	    	document.getElementById("idit2bb").checked = true; 
   	    //else { document.getElementById("idit2b").value="null"; document.getElementById("idit2bb").value="null"; } 
		if(!(document.getElementById("idit3cc").value=="" || document.getElementById("idit3cc").value=="NULL" || document.getElementById("idit3cc").value=="null"))
			document.getElementById("idit3cc").checked = true;
		//else { document.getElementById("idit3c").value="null"; document.getElementById("idit3cc").value="null"; }
		if(!(document.getElementById("idit4dd").value=="" || document.getElementById("idit4dd").value=="NULL" || document.getElementById("idit4dd").value=="null"))
			document.getElementById("idit4dd").checked = true;
		//else { document.getElementById("idit4d").value="null" document.getElementById("idit4dd").value="null"; }
		if(!(document.getElementById("idit5ee").value=="" || document.getElementById("idit5ee").value=="NULL" || document.getElementById("idit5ee").value=="null"))
			document.getElementById("idit5ee").checked = true; 
		//else { document.getElementById("idit5e").value="null" document.getElementById("idit5ee").value="null"; }
	    if(!(document.getElementById("idit6ff").value=="" || document.getElementById("idit6ff").value=="NULL" || document.getElementById("idit6ff").value=="null"))
	    	document.getElementById("idit6ff").checked = true; 
	    //else { document.getElementById("idit6f").value="null" document.getElementById("idit6ff").value="null"; }
		if(!(document.getElementById("idit7gg").value=="" || document.getElementById("idit7gg").value=="NULL" || document.getElementById("idit7gg").value=="null"))
			document.getElementById("idit7gg").checked = true; 
		//else { document.getElementById("idit7g").value="null" document.getElementById("idit7gg").value="null"; }
		if(!(document.getElementById("idit8hh").value=="" || document.getElementById("idit8hh").value=="NULL" || document.getElementById("idit8hh").value=="null"))
			document.getElementById("idit8hh").checked = true;
		//else { document.getElementById("idit8h").value="null" document.getElementById("idit8hh").value="null"; }
		if(!(document.getElementById("idit9ii").value=="" || document.getElementById("idit9ii").value=="NULL" || document.getElementById("idit9ii").value=="null"))
			document.getElementById("idit9ii").checked = true; 
		//else { document.getElementById("idit9i").value="null" document.getElementById("idit9ii").value="null"; }
		if(!(document.getElementById("idit10jj").value=="" || document.getElementById("idit10jj").value=="NULL" || document.getElementById("idit10jj").value=="null"))
			document.getElementById("idit10jj").checked = true; 
		//else { document.getElementById("idit10j").value="null" document.getElementById("idit10jj").value="null"; }
}
function toggle(chk , idit1aa)

{
  if((document.getElementById(idit1aa).value == 'null'))
    {    document.getElementById(chk).disabled = true;
         document.getElementById("idit1aa").value="yes";
         alert("1111");
    }
	else
	{
		document.getElementById(chk).disabled = false;
		 document.getElementById("idit1aa").value="yes";
		 alert("22222");
	 }
}
function check1(chk1, idit5ee)
{
	 alert("check1");
	if(document.getElementById("idit5ee").checked = true)
	{
		alert("1111-");
		 document.getElementById("idit5ee").value="yes";
		 document.getElementById(chk1).disabled = true;
		
	}
	else if (document.getElementById("idit5ee").checked = false)
		{
		alert("22222222");
		document.getElementById("idit5ee").value="yes";
		document.getElementById(chk1).disabled = true;
		alert("22");
	     
	     alert("22");
		}
	else{
		alert("2222223333333333333322");
	}
}
function check11()
{
	 alert("check11");
	if(document.getElementById("idit5ee").value="null")
	{	
		document.getElementById("idit5ee").checked = true;
	}
}
function check2()
{
	 alert("check2");
	if(document.getElementById("idit6ff").checked = true)
	{
	document.getElementById("idit6ff").value="yes";
	}
}
function check22()
{
	 alert("check22");
	if(document.getElementById("idit6ff").checked = false)
	{
	document.getElementById("idit6ff").value="null";
	}
}
</script> -->

<%--
session.setMaxInactiveInterval(1*30);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("Nname")=="null"||session.getAttribute("desg")==null||session.getAttribute("desg")=="null"||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
	//(Sessionb_no.equals("90") && Sessiondesg.equals("ASST. GENERAL MANAGER"))	
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../../adminlink.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}
System.out.println("NAME FROM SUPER ADMIN SESSION hereeeeeeeeeeeeeee : "+session.getAttribute("Nname"));
--%>
</head>
<body onload="onloadCheck();">

	<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn100 = null,cn1=null,cn101 = null;
Statement st100= null,st101=null,st1=null; 
ResultSet rs100 = null,rs101=null,rs1=null;
String req=null;
String empD=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,Session2b_no=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
Session2b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");
System.out.println("DESIG : "+Sessiondesg);
System.out.println("B NO  : "+Sessionb_no);
System.out.println("B NO 2 : "+Session2b_no);
%>
	

<%

/* String req = request.getParameter("form1_no");

String req2 = request.getParameter("second");
String req22 = request.getParameter("req2");
System.out.println("req22 "+req22);
String req3 = request.getParameter("req");
String req33 = request.getParameter("req3");
System.out.println("REQ 33 "+req33);
 */

String no=request.getParameter("rss");
System.out.println("wat is the getting value  :"+no); 
/* String req4 = request.getParameter(no);
System.out.println("wat is the getting value 2 req 4 :"+req4); */



System.out.println("IT CLEARANCE REMINDER "+SessionName+"   -- FOR THE REQUEST : "+no);
cn1 = con.getConnection2();
st1 = cn1.createStatement();
rs1 = st1.executeQuery("select * from form1_it_clearance WHERE form1_no='"+no+"'"); 
if(!rs1.next())
{
	System.out.println("LETS SEEEEEEEEEEEEEE");%>
<script  type="text/javascript">
	window.close();
	</script>
	<% 
}
else
{
	System.out.println("--------");
}

String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;

String form1_no=null,full_name=null,i_name=null,i_desg=null,i_city=null;
 
String it1a=null,it1aa=null,it2b=null,it2bb=null,it3c=null,it3cc=null,it4d=null,it4dd=null,it5e=null,it5ee=null,it6f=null,it6ff=null,it7g=null,it7gg=null,it8h=null,it8hh=null,it9i=null,it9ii=null,it10j=null,it10jj=null;
/* cn101 = con.getConnection2();
st101 = cn101.createStatement();
rs101 = st101.executeQuery("select * from form1_it_clearance WHERE form1_no !='"+no+"'");
String msgg=null;
if(rs101.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msgg = "...__IS__ALREADY EXIST.......";
} */

cn100 = con.getConnection2();
st100 = cn100.createStatement();
rs100 = st100.executeQuery("select * from form1_it_clearance WHERE form1_no='"+no+"'"); 
while(rs100.next())
{
	 
	form1_no = rs100.getString("form1_no");
	full_name = rs100.getString("full_name");
	i_name = rs100.getString("i_name");
	i_desg = rs100.getString("i_desg");
	i_city = rs100.getString("i_city");
	
	
	
	a_model = rs100.getString("a_model");
	 a_data_card = rs100.getString("a_data_card");
	 a_email = rs100.getString("a_email");
	 a_newins = rs100.getString("a_newins");
	 a_domain = rs100.getString("a_domain");
	 a_mobile_model = rs100.getString("a_mobile_model");
	 a_mobile_no = rs100.getString("a_mobile_no");
	 a_access_card = rs100.getString("a_access_card");
	 a_drive = rs100.getString("a_drive");
	 a_other_asset = rs100.getString("a_other_asset");
	 a_remarks = rs100.getString("a_remarks");

	
	 
	 r_model = rs100.getString("r_model");
	 r_data_card = rs100.getString("r_data_card");
	 r_email = rs100.getString("r_email");
	 r_newins = rs100.getString("r_newins");
	 r_domain = rs100.getString("r_domain");
	 r_mobile_model = rs100.getString("r_mobile_model");
	 r_mobile_no = rs100.getString("r_mobile_no");
	 r_access_card = rs100.getString("r_access_card");
	 r_drive = rs100.getString("r_drive");
	 r_other_asset = rs100.getString("r_other_asset");
	 
	 it1a = rs100.getString("it1a");
	 it1aa = rs100.getString("it1aa");//checkbox
	 it2b = rs100.getString("it2b");
	 it2bb = rs100.getString("it2bb");
	 it3c = rs100.getString("it3c");
	 it3cc = rs100.getString("it3cc");
	 it4d = rs100.getString("it4d");
	 it4dd = rs100.getString("it4dd");
	 it5e = rs100.getString("it5e");
	 it5ee = rs100.getString("it5ee");
	 it6f = rs100.getString("it6f");
	 it6ff = rs100.getString("it6ff");
	 it7g = rs100.getString("it7g");
	 it7gg = rs100.getString("it7gg");
	 it8h = rs100.getString("it8h");
	 it8hh = rs100.getString("it8hh");
	 it9i = rs100.getString("it9i");
	 it9ii = rs100.getString("it9ii");
	 it10j = rs100.getString("it10j");
	 it10jj = rs100.getString("it10jj");
	 
	 /* System.out.println("--------- FRONT END ----------");
	 System.out.println("it1a : "+it1a);
	 System.out.println("it1aa : "+it1aa);
	 System.out.println("it2b : "+it2b);
	 System.out.println("it2bb : "+it2bb);
	 System.out.println("it3c : "+it3c);
	 System.out.println("it3cc : "+it3cc);
	 System.out.println("it4d : "+it4d);
	 System.out.println("it4dd : "+it4dd);
	 System.out.println("it5e : "+it5e);
	 System.out.println("it5ee : "+it5ee);
	 System.out.println("it6f : "+it6f);
	 System.out.println("it6ff : "+it6ff);
	 System.out.println("it7g : "+it7g);
	 System.out.println("it7gg : "+it7gg);
	 System.out.println("it8h : "+it8h);
	 System.out.println("it8hh : "+it8hh);
	 System.out.println("it9i : "+it9i);
	 System.out.println("it9ii : "+it9ii);
	 System.out.println("it10j : "+it10j);
	 System.out.println("it10jj : "+it10jj);
	 System.out.println("--------- FRONT END rrrrrr ----------"); */
}
String ITdesg=null,ITbno=null;
String NONITName=null,NONITmailId=null;
PreparedStatement psmt=null,psmt2=null;

%> 
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<form name="form" action="ITclearanceReminderBack.jsp" method="post"  ><center>
<label> <font color="black"><u><b>IT ASSET PROVIDED</b></u></font> </label> 
<br/>
<br />



<table id="table3" cellspacing="1" border="1" style="border-color: lightgrey">
<tr>
<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
<input type="hidden" name="i_name" value="<%=SessionName %>"/>
<input type="hidden" name="i_email_id" value="<%=email_id %>"/>
<input type="hidden" name="i_desg" value="<%=Sessiondesg %>"/>

<td colspan="2" align="center" bgcolor="lightgrey"><font size="2"> FORM NUMBER</font></td>
<td colspan="2"><input type="text" name="form1_no" readonly="readonly" id="mod" maxlength="100" size="35" value="<%=form1_no%>"/></td></tr>
<tr><td colspan="2" align="center" bgcolor="lightgrey"><font size="2">INITIATOR FOR</font></td>
<td colspan="2"><input type="text" name="initiator_for" readonly="readonly" id="mod" maxlength="100" size="35" value="<%=full_name%>"/></td></tr>
<tr><td colspan="2" align="center" bgcolor="lightgrey"><font size="2">INITIATED BY</font></td>
<td colspan="2"><input type="text" name="initiator_by" readonly="readonly" id="mod" maxlength="100" size="35" value="<%=i_name%>"/></td></tr>
<tr>
<td bgcolor="lightgrey">Sl</td>
<td colspan="2" align="center" bgcolor="lightgrey">ITEM NAMES</td>
<td colspan="2" align="center" bgcolor="lightgrey">INITIATOR REMARKS</td>
<td colspan="2" align="center" bgcolor="lightgrey">ASST. GENERAL MANAGER REMARKS</td>
<td bgcolor="lightgrey">REMINDER</td>
</tr>

<tr>
<td class="it1" align="center">1  </td>
<td class="it2" style="text-align: right;width:19%;"> Laptop/Desktop Model :</td>
<td> <input type="text" name="a_model" readonly="readonly" id="mod" maxlength="100" value="<%=a_model%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_model" id="rem1" size="25" readonly="readonly" value="<%=r_model%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it1a" id="idit1a" size="25"  value="<%=it1a%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it1aa" id="idit1aa" value="<%=it1aa%>" onclick="return toggle()" /></td> --%>
  <td bgcolor="" width="60"><font color="white">
     <select name="it1aa" id="idit1aa">
			<option value="<%=it1aa%>"><%=it1aa%></option>
		    <option >Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">2  </td>
<td class="it2" style="text-align: right;width:15%;">Data Card :</td>
<td > <input type="text" name="a_datacard" readonly="readonly" value="<%=a_data_card%>" id="dc" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_datacard" id="rem2" size="25" readonly="readonly" value="<%=r_data_card%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it2b" id="idit2b" size="25"  value="<%=it2b%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it2bb" id="idit2bb" value="<%=it2bb%>"  /></td> --%>
  <td bgcolor="" width="60"><font color="white">
     <select name="it2bb" id="idit2bb">
			<option value="<%=it2bb%>"><%=it2bb%></option>
		    <option >Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">3  </td>
<td class="it2" style="text-align: right;width:15%;">Email Id :</td>
<td > <input type="text" name="a_email" id="eid" readonly="readonly" value="<%=a_email%>" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_email" id="rem3" size="25" readonly="readonly" value="<%=r_email%>" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it3c" id="idit3c" size="25"  value="<%=it3c%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it3cc" id="idit3cc" value="<%=it3cc%>"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it3cc" id="idit3cc">
			<option value="<%=it3cc%>"><%=it3cc%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">4  </td>
<td class="it2" style="text-align: right;width:15%;">Newins Id :</td>
<td > <input type="text" name="a_newins" readonly="readonly" value="<%=a_newins%>" id="nid" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_newins" id="rem4" size="25" readonly="readonly" value="<%=r_newins%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it4d" id="idit4d" size="25"  value="<%=it4d%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it4dd" id="idit4dd" value="<%=it4dd%>"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it4dd" id="idit4dd">
			<option value="<%=it4dd%>"><%=it4dd%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">5  </td>
<td class="it2" style="text-align: right;width:15%;">Domain User :</td>
<td > <input type="text" name="a_domain" readonly="readonly" value="<%=a_domain%>" id="du" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_domain" id="rem5" size="25" readonly="readonly" value="<%=r_domain%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it5e" id="idit5e" size="25"  value="<%=it5e%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it5ee" id="idit5ee" value="<%=it5ee%>" onclick="return check1(1);"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it5ee" id="idit5ee">
			<option value="<%=it5ee%>"><%=it5ee%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it2" style="text-align: right;width:15%;">Mobile Phone Model :</td>
<td > <input type="number" name="a_mobile_model" readonly="readonly" id="mpd" value="<%=a_mobile_model%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="r_mobile_model" id="rem6" size="25" readonly="readonly" value="<%=r_mobile_model%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it6f" id="idit6f" size="25"  value="<%=it6f%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it6ff" id="idit6ff" value="<%=it6ff%>" onchange="return (check2() && check22());" /></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it6ff" id="idit6ff">
			<option value="<%=it6ff%>"><%=it6ff%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it2" style="text-align: right;width:15%;">Mobile No :</td>
<td > <input type="text" readonly="readonly" name="a_mobile_no" id="mno" value="<%=a_mobile_no%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_mobile_no" id="rem7" readonly="readonly" size="25" value="<%=r_mobile_no%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it7g" id="idit7g" size="25"  value="<%=it7g%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it7gg" id="idit7gg"  value="<%=it7gg%>"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it7gg" id="idit7gg">
			<option value="<%=it7gg%>"><%=it7gg%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">8  </td>
<td class="it2" style="text-align: right;width:15%;">Access Card :</td>
<td > <input type="text" name="a_access_card" readonly="readonly" id="acard" value="<%=a_access_card%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_access_card" id="rem8" size="25" readonly="readonly" value="<%=r_access_card%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it8h" id="idit8h" size="25"  value="<%=it8h%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it8hh" id="idit8hh"  value="<%=it8hh%>"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it8hh" id="idit8hh">
			<option value="<%=it8hh%>"><%=it8hh%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>

<tr>
<td class="it1" align="center">9  </td>
<td class="it2" style="text-align: right;width:15%;">Hard Disk/Pen Drive :</td>
<td > <input type="text" name="a_drive" readonly="readonly" id="hp" value="<%=a_drive%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_drive" id="rem8" size="25" readonly="readonly" value="<%=r_drive%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it9i" id="idit9i" size="25"  value="<%=it9i%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it9ii" id="idit9ii"  value="<%=it9ii%>"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it9ii" id="idit9ii">
			<option value="<%=it9ii%>"><%=it9ii%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>


<tr>
<td class="it1" align="center">10  </td>
<td class="it2" style="text-align: right;width:15%;">Any Other Asset :</td>
<td > <input type="text" name="a_other_asset" readonly="readonly" value="<%=a_other_asset%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_other_asset" id="rem8" size="25" readonly="readonly" value="<%=r_other_asset%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it10j" id="idit10j" size="25"  value="<%=it10j%>" placeholder="Enter IT Remarks"/></td>
<%-- <td class="it1" align="center"><input type="checkbox" name="it10jj" id="idit10jj"  value="<%=it10jj%>"/></td> --%>
 <td bgcolor="" width="60"><font color="white">
     <select name="it10jj" id="idit10jj">
			<option value="<%=it10jj%>"><%=it10jj%></option>
		    <option>Yes</option> 
			<option >No</option>
	</select></font>
  </td>
</tr>
</table>
<br>

	<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
<% 
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
cn5 = con.getConnection2();
st5 = cn5.createStatement();

%>

   
                                    
                                
                       <select name="desg" onchange="showEmp(this.value)" style="font-size : 8pt">      
                       <option value="none">Select</option>
                          
                          <% 
                          ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
                      	String userName = dbProperties.getString("csdb.username");
                      	String password = dbProperties.getString("csdb.password");
                      	String url = dbProperties.getString("csdb.url");
                      	String driver = dbProperties.getString("csdb.driverName");
                      	String dbName = dbProperties.getString("csdb.dbName");
                          
                          
                      	Class.forName(driver).newInstance();
                        cn5 = DriverManager.getConnection(url+dbName,userName,password); 
                           st5 = cn5.createStatement();  
                           System.out.println("BRANCH NUMBER FOR SELECTION : "+b_no);
                          // rs5 = st5.executeQuery("Select * from desg");
                          // rs5 = st5.executeQuery("Select DISTINCT d.DESIGNATION,l.city from desg d,login l INNER JOIN branch_master b ON (l.city=b.b_name) WHERE  d.DESIGNATION=l.post  AND '"+b_no+"'=b.b_no ORDER BY d.DESIGNATION ASC");
                           rs5 = st5.executeQuery("Select DISTINCT DESIGNATION from desg ORDER BY DESIGNATION ASC");
                          // rs5 =  st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO) WHERE SUBSTR(emp.e_city,-2,2)='"+b_no+"' AND desg.DESIGNATION <> '"+desg+"' ");
                           //rs5 = st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO)");
                           
                          while(rs5.next()){     %>     
                          
                           <option value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>  
                                     
                                        <br>    
                                            <div id='emp'>      
                                              <select name="emp" style="font-size : 8pt">   
                                                   <option value='-1'></option>  
                                                         </select>     
                                                            </div>    
                                                            
                                                            
     <br />                                                 
  <label style="float: none;" id="idMailLabel"></label>  
       <input  type="hidden" name="mail" id="idMailValue" value="" />
                                 
</table>  




<table width="165" align ="center" id="hiderow">
<tr>
 
<!-- <td align="left" id="hiderow"><input id="hiderow" type='submit' size="2" style="background-color:white;font-weight:bold;color:black;" value='Save' onclick='btnClick();'></td> -->
 <td><input type="submit" name="Submit" value="Update"  onclick="return ( onloadCheck() && ItClearanceNormal());" style="background-color:white;font-weight:bold;color:black;" /></td>
<td><input type="submit" name="Submit" value="SEND MAIL" onclick="return ( validate() && ItClearanceMail());" style="background-color:white;font-weight:bold;color:black;" /></td>
<td align="left" id="hiderow">
<input id="hiderow" type="button" style="background-color:white;font-weight:bold;color:black;" value='Cancel' onclick='btnClick();'></td>
</tr>

</table>
</center>
</form>
</body>
</html>