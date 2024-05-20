<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
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
<%@ include file="../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
			<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
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
<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
           //branch,depart,full_name,designation,emp_email,emp_contact,d_model,d_phone_no,owner,lotusAddress,remarks,emp,desg,mail ,reporting_officer
          function validate()
              {
        	  var w1=document.form.empid;
        	  var w=document.form.branch;
        	  var dpt=document.form.depart;
        	  var fn=document.form.full_name;
        	  var desg=document.form.designation;
        	  var ro=document.form.reporting_officer;
        	  var em=document.form.emp_email;
        	  var ec = document.form.emp_contact;
        	  var dm=document.form.d_model;
        	  var dpno =document.form.d_phone_no;
        	  var ow=document.form.owner;
        	  var ld =document.form.lotusAddress;
        	  var rm =document.form.remarks;
        	  var desgS=document.form.desg;
          	  var empS=document.form.emp;
          	  var mail=document.form.mail;
           	  var bkColor = "red";
          	  var bkColor2 = "white";
          	  if ((w1.value==null)||(w1.value=="")||(w1.value=="Null"))
          	    {
                alert("Please Enter Emp ID!");
                w1.style.bkColor = w1.style.backgroundColor;
                w1.style.backgroundColor = bkColor;
                w1.focus();
                return false
                }
              if (checkAddress(w1.value)==false)
                {
                w1.value=""
                alert("Invalid Selection!");
                w1.focus()
                return false
                }
             if ((fn.value==null)||(fn.value==""))
              {
          	  alert("Employee details should must be in HRMS app. !");
              fn.style.bkColor = fn.style.backgroundColor;
              fn.style.backgroundColor = bkColor;
              dpt.style.backgroundColor = bkColor2;
              fn.focus()
              return false
              }
           if (checkAddress(fn.value)==false)
              {
              fn.value=""
              alert("Invalid Name!");
              fn.focus()
              return false;
              }     
             if ((w.value==null)||(w.value=="")||(w.value=="Null"))
                {
                alert("Employee details should must be in HRMS app. !");
                w.style.bkColor = w.style.backgroundColor;
                w.style.backgroundColor = bkColor;
                w.focus();
                return false
                }
             if (checkAddress(w.value)==false)
                {
                w.value=""
                alert("Invalid Selection!");
                w.focus()
                return false
                }
            if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null"))
                {
            	alert("Employee details should must be in HRMS app. !");
                dpt.style.bkColor = dpt.style.backgroundColor;
                dpt.style.backgroundColor = bkColor;
                w.style.backgroundColor = bkColor2;
                dpt.focus()
                return false
                }
            if (checkAddress(dpt.value)==false)
                {
            	dpt.value=""
                alert("Invalid Department!");
            	dpt.focus();
                return false;
                }
            
             if ((desg.value==null)||(desg.value=="")||(desg.value=="Null"))
                {
            	 alert("Employee details should must be in HRMS app. !");
                desg.style.bkColor = desg.style.backgroundColor;
                desg.style.backgroundColor = bkColor;
                fn.style.backgroundColor = bkColor2;
                desg.focus()
                return false
                }
            if (checkAddress(desg.value)==false)
                {
               	desg.value=""
                alert("Invalid Designation!");
               	desg.focus()
                return false;
                } 
            if ((ro.value==null)||(ro.value=="")||(ro.value=="Null"))
            {
        	 alert("Employee details should must be in HRMS app. !");
            ro.style.bkColor = ro.style.backgroundColor;
            ro.style.backgroundColor = bkColor;
            ro.style.backgroundColor = bkColor2;
            ro.focus()
            return false
            }
        if (checkAddress(ro.value)==false)
            {
           	ro.value=""
            alert("Invalid Designation!");
           	ro.focus()
            return false;
            } 
                        if ((em.value==null)||(em.value=="")){
                        	alert("Employee details should must be in HRMS app. !");
                            em.style.bkColor = em.style.backgroundColor;
                            em.style.backgroundColor = bkColor;
                            desg.style.backgroundColor = bkColor2;
                            em.focus()
                            return false
                            }
                         if (checkAddress(em.value)==false){
                            	em.value=""
                            alert("Invalid Name!");
                            	em.focus()
                            return false;
                            } 
                         if ((ec.value==null)||(ec.value=="")){
                        	 alert("Employee details should must be in HRMS app. !");
                                ec.style.bkColor = ec.style.backgroundColor;
                                ec.style.backgroundColor = bkColor;
                                em.style.backgroundColor = bkColor2;
                                ec.focus()
                                return false
                                }
                                if (checkAddress(ec.value)==false){
                                	ec.value=""
                                alert("Invalid Contact Number!");
                                	ec.focus()
                                return false;
                                }
                           if ((dm.value==null)||(dm.value=="")){
                                    alert("Please Enter Device Model!");
                                    dm.style.bkColor = dm.style.backgroundColor;
                                    dm.style.backgroundColor = bkColor;
                                    ec.style.backgroundColor = bkColor2;
                                    dm.focus()
                                    return false
                                    }
                                    if (checkAddress(dm.value)==false){
                                    	dm.value="";
                                    alert("Invalid Device model!");
                                    	dm.focus()
                                    return false;
                                    }
                           /*  if ((req[0].checked == false ) && (req[1].checked == false )&& (req[2].checked == false ) ){
                            	alert("Select Status Of Request! \n \n New/Delete/Change");
                                req[0].focus();
                                return false;
                                }  */
                                     if((dpno.value==null)||(dpno.value=="")){
                                    	alert("Enter Phone number");
                                    	 dpno.style.bkColor = dpno.style.backgroundColor;
                                         dpno.style.backgroundColor = bkColor;
                                         dm.style.backgroundColor = bkColor2;
                                    	dpno.focus();
                                    	return false;
                                        }
                                    if ((ow[0].checked == false ) && (ow[1].checked == false) ){
                                    	alert("Select Status Of Request! \n \n Device Owner");
                                        ow[0].focus();
                                        return false;
                                        }
                                    if((ld.value==null)||(ld.value=="")){
                                    	alert("Enter Lotus notes address");
                                    	 ld.style.bkColor = dpno.style.backgroundColor;
                                         ld.style.backgroundColor = bkColor;
                                         dpno.style.backgroundColor = bkColor2;
                                    	ld.focus();
                                    	return false;
                                        }
                            if ((rm.value==null)||(rm.value=="")){
                                alert("Enter Remarks!");
                                rm.style.bkColor = rm.style.backgroundColor;
                                rm.style.backgroundColor = bkColor;
                                ld.style.backgroundColor = bkColor2;
                                rm.focus();
                                return false
                                } 
                            if ((mail.value==null)||(mail.value=="")){
                                alert("Select Employee Name and Designation!");
                                desgS.style.bkColor = desgS.style.backgroundColor;
                                desgS.style.backgroundColor = bkColor;
                                rm.style.backgroundColor = bkColor2;
                                empS.style.bkColor = empS.style.backgroundColor;
                                empS.style.backgroundColor = bkColor;

                                mail.focus();
                                return false
                                } 
                                        
	 else
       return true;
}
        </script>
<%-- 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null)
	
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("adminlinkHR.jsp?msg="+msg);
}
--%>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../adminlinkHR.jsp?msg="+msg2);
}
%>
	<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="../selEmpFormsUsers.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText    
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
                       }       var url="../selectMailId.jsp";  
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
                
    <script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) {
	//var x=document.getElementById("idempId").value;
    //alert(x);
    
   // alert("here");
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    
   /*  var l=x.toString().length();
  alert(l); */
    return true;
    }
</script>
<script type="text/javascript">  
 function sendInfo(v)  
           { // alert("empid :"+v);
    	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="getEmployee.jsp";  
    		    url +="?EMP_NO=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
  function getInfo()
             {     
	         var str2=xmlHttp.responseText;
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
                             // alert("here");//idname,iduid,idpass,idnmail
                             document.getElementById("resultFromAjax2").innerHTML = str2;//fname,branch,depart,designation,rofficer,ecode,req
                             document.getElementById("fname").value =  document.getElementById("p1").value;
                             document.getElementById("designation").value =  document.getElementById("p2").value;
                      		 document.getElementById("branch").value =  document.getElementById("p3").value;
                      		 document.getElementById("depart").value =  document.getElementById("p4").value;
                      		 document.getElementById("rofficer").value =  document.getElementById("p5").value;
                      		 document.getElementById("ecode").value =  document.getElementById("p6").value;
                     		 document.getElementById("req").value =  document.getElementById("p7").value;
                     		 
                     		document.getElementById("iddeptadminP").value =  document.getElementById("p8").value;
                   		     document.getElementById("iddeptadminP11").value =  document.getElementById("p9").value;
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("fname").value = "";
                             document.getElementById("designation").value =""; 
      		                 document.getElementById("branch").value = "";
      		                 document.getElementById("depart").value =  "";
      		                 document.getElementById("rofficer").value =  "";
      		                 document.getElementById("ecode").value =  "";
    		                 document.getElementById("req").value =  "";
    		                 
    		                 
    		                 document.getElementById("iddeptadminP").value = "";
                 		     document.getElementById("iddeptadminP11").value = "";
                 		     document.getElementById("idrodesg").value="";
              	             document.getElementById("idroname").value="";
              	             document.getElementById("idromail").value="";
              	             document.getElementById("idempid1").value="";
              	             document.getElementById("idlevelno").value="";
      		                 }
                 } 
</script>                      
                
   <script type="text/javascript">  

    function sync1(val)
      {
	  //alert(val);
	  var parts = val.split(",");
	  var part1 = parts[0]; 
	  var part2 = parts[1]; 
	  var part3 = parts[2]; 
	  var part4 = parts[3];  
	  var part5 = parts[4]; 
	  if(val!="")
		  {
	  	  document.getElementById("idrodesg").value=part1;
	      document.getElementById("idroname").value=part2;
	      document.getElementById("idromail").value=part3;
	      document.getElementById("idempid1").value=part4;
	      document.getElementById("idlevelno").value=part5;
		  }
	  else
		  {
		  document.getElementById("idrodesg").value="";
	      document.getElementById("idroname").value="";
	      document.getElementById("idromail").value="";
	      document.getElementById("idempid1").value="";
	      document.getElementById("idlevelno").value="";
		  }
    }
</script>                                      
                
                
</head>

<body>
<form action="LotusTravelerPageBack.jsp" method="post" name="form">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");

%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>
		LOTUS TRAVELER APPLICATION FORM</label>
		</b></font></center> 
		</td>
		</tr>
	<tr style="visibility: hidden;display: none;"><td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
		
	</tr>
		<tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<td width="165"><%= po_date.format(new java.util.Date())%></td>
		</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td>
<!-- <br />
<br />
<center>
<label><font color="black"><u><b>IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</b></u></font></label> <br />


</center>
	 <br /> -->
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
	 <br />
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null;
Statement st1= null,st2=null,st3=null,st4=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null;
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
try{
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

String new_id = null;
int id=0;
String id2=null;
cn3 = con.getConnection2();
st3=cn3.createStatement();
//rs3 = st3.executeQuery("SELECT max(idextend),substr(form1_it_clearance.form1_no,18,4),substr(form1_it_clearance.form1_no,1,17) From form1_it_clearance WHERE '"+b_no+"'=substr(form1_it_clearance.form1_no,15,2) GROUP BY form1_no");
rs3 = st3.executeQuery("SELECT max(idextend) FROM form8_lotus_traveler WHERE form8_no IN(SELECT form8_no FROM form8_lotus_traveler LEFT JOIN branch_master b ON(substr(form8_no,23,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form8_no)");
//rs3 = st3.executeQuery("SELECT MAX(idextend) FROM mr_master WHERE mr_id IN(SELECT mr_id FROM mr_master Left Join branch_master b ON (substr(mr_id,9,2)=b.b_no)  WHERE '"+city_no+"'=b.b_no GROUP BY idextend)");
/* while ( rs_id.next() )
{   */  
	 if(rs3.next()){
	
	try
	{
		id=rs3.getInt(1);
		if(id==0)
 			id=1;
		System.out.println("ID VALUE "+id);
		if(id2==null)
 			id2="NEIN/CS/LotusTraveler/"+b_no+"-";
		//id2= rs_id.getString(3);
		System.out.println("ID2 VALUE "+id2);
             id++;     
			//System.out.println("Gen id "  +rs_id.getInt(1));
			//new_id = "" +String.valueOf(id);
			new_id = id2+String.valueOf(id);
			System.out.println("MR HO "  +new_id);
		
	}
	catch(SQLException ex)
	{
		  System.out.println(ex.toString());
		 new_id = "NEIN/CS/LotusTraveler/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
%>	 
		
<table  width="895">
<tr >
	<td bgcolor="grey" style="text-align: right;width:23%;">
	<input name="form8_no" readonly="readonly" value="<%=new_id%>" size="30" />
	</td>
	</tr>
	
	

<tr><td align="" colspan="4"><b>Application's Information</b></td></tr>	
<tr>
<td  style="text-align: right;">Company Name :</td>
<td style="text-align:left;" colspan="3"><input type="text" name="co_name" size="60" id="cname" maxlength="84" value="NIPPON EXPRESS (INDIA) PRIVATE LIMITED"/></td>
</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Emp ID.:</td>
<td style="text-align:left;" ><input type="text" name="empid" size="10" id="empid" onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"/></td>
<td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" size="29" id="fname"  readonly/></td>
</tr>
<tr>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="<%=id%>" /></td>
<%-- <td style="text-align:left;width:33%;"><select name="branch"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("b_name")%> </option> 
					<%} %> </select></td>  --%>
<td style="text-align:left;"><input type="text" name="branch" size="29" id="branch" maxlength="44" readonly/></td>

<td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
<%-- <td style="text-align:left;"><select name="depart"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs2.next()){ %>
					<option> <%=rs2.getString(1)%> </option> 
					<%} %> </select></td>  --%>
<td style="text-align:left;"><input type="text" name="depart" size="29" id="depart" maxlength="44" readonly/></td>


</tr>

<tr>
<td  style="text-align: right;"><font color=red>*</font>Designation :</td>
<%-- <td style="text-align:left;"><select name="designation"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs4.next()){ %>
					<option> <%=rs4.getString(1)%> </option> 
					<%} %> </select></td> --%>
<td style="text-align:left;"><input type="text" name="designation" size="29" id="designation" maxlength="44" readonly/></td>
<td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" size="29" id="rofficer" maxlength="44" readonly/></td>				
</tr>

<tr>
<td  style="text-align: right;"><font color=red>*</font>Email Address :</td>
<td style="text-align:left;"><input type="text" name="emp_email" id="ecode" size="29" maxlength="44" readonly/></td>

  <td style="text-align: right;"><font color=red>*</font>Contact Number :</td>
<td style="text-align:left;"><input type="text" name="emp_contact" id="req" size="29" maxlength="44" readonly/></td>

</tr>
<tr><td align="" colspan="4"><b><font color=red>*</font>Mobile Device Information</b></td></tr>	
 
<!-- <tr>
<td style="text-align: right;width:23%;">Reason</td>
<td colspan="3" style="text-align:left;width:33%;"><textarea rows="2" cols="102" ></textarea></td>
</tr> -->
 <tr>
<td style="text-align: right;"><font color=red>*</font>Device Model :</td>
<td style="text-align:left;"><input type="text" name="d_model" id="id" size="29" maxlength="54"/></td>

<td  style="text-align: right;"><font color=red>*</font>Phone Number :</td>
<td style="text-align:left;"><input type="text" name="d_phone_no" size="29" value="" maxlength="24"/></td>


</tr> 

<tr>
<td align="right"><font color=red>*</font>Device Owner  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> 
     <input style="" type ="radio" name = "owner" value ="Provided by company" id=""/> Provided by company
     <input style="" type ="radio" name = "owner" value ="Owned by user" id=""/> Owned by user
     </td>
   
</tr>
<tr>
<td align="right"><font color=red>*</font>Lotus Notes Address  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" > 
    <input type="text" name="lotusAddress" size="49"  value="" maxlength="64"/>
     </td>
   <td  style="text-align: right;">Password :</td>
<td style="text-align:left;">Will be set by HO IT</td>
   
</tr>
</table>

<br />
<table id="it" width="895">
<tr><td id="ita"><b><font color=red>*</font>Remarks/Reason</b></td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199"></textarea></td></tr>
</table>

<br />
<b><font color=red>*</font>Send To RO:</b>
	<br />
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
 
          
        <tr> 
           <td> 
              <input align="left" type="radio" value="" id="iddeptadminP1" onclick="sync1(iddeptadminP.value);"/>
              <input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP" value="" size="100"/>
   	       </td>
       </tr>
        <tr>                           <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
      </tr>
      
                      
</table>  
</br>
</center>                                                                   
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     
      <td style="size:1"><div id="formsubmitbutton"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return (validate() && ButtonClicked())" />
          </div>
    <div id="buttonreplacement" style="display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
      </td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	<td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	      <td><a href="LotusTravelerRules.jsp" onclick="return popitup('LotusTravelerRules.jsp')" id="hiderow"><input type="button" id="btnShowSimple" value="RULES" /></a></td>
      	     	           <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp?msg=1'"/> </td></tr>
 
</table> 	

	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs3,st3,cn3);
	DbUtil.closeDBResources(rs4,st4,cn4);
	DbUtil.closeDBResources(rs5,st5,cn5);
  }
	%>
</center>
	<br /><br /><br />
	
</div>
<div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table><br />
        <label style="text-align:center;">HR/Admin (Local)</label>
<br />
<label style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>GA(Branch)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HO(IT)</label>
<br />

<br />
<br />
</div>
</form>	
<div id="resultFromAjax2" style="display:none;">
        
       </div>
</body>

</html>