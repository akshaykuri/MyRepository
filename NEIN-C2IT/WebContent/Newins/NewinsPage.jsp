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
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
			<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
 <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
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
function showTR()
{
	  document.getElementById('idDelete').style.display="table-row";
	  document.getElementById('idDelete').style.visibility="visible";
	  document.getElementById('idDelete2').style.display="table-row";
	  document.getElementById('idDelete2').style.visibility="visible";
 }
function hideTR()
{
	 document.getElementById('idDelete').style.hidden="table-row";
	 document.getElementById('idDelete').style.visibility="hidden";
	 document.getElementById('idDelete2').style.hidden="table-row";
	 document.getElementById('idDelete2').style.visibility="hidden";
 }
</script>

<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
        	  var w=document.form.branch;
        	  var dpt=document.form.depart;
        	  var fn=document.form.full_name;
        	  var sw=document.form.scopeOfWork;
        	  var ec=document.form.emp_code;
        	  var desg=document.form.designation;
        	  var roff=document.form.reporting_officer;
        	  var rb = document.form.requestBy;
        	  var req=document.form.requestOption;
        	 
        	  var l=document.form.remarks;
        	 var mail=document.form.mail;
        	 var desgS=document.form.desg;
          	  var empS=document.form.emp;
          	  var empid=document.form.empid;
       	     var reqbrcode=document.form.reqBrCode;
          	  
          	 var bkColor = "red";
          	 var bkColor2 = "white";
          	 
          	 if ((empid.value==null)||(empid.value=="")){
                 alert("Please Enter EmpID!");
                 empid.style.bkColor = empid.style.backgroundColor;
                empid.style.backgroundColor = bkColor;
                empid.focus();
                 return false;
                 }
          	 if ((reqbrcode.value==null)||(reqbrcode.value=="")){
                 alert("Please Select Requested Branch Code!");
                 reqbrcode.style.bkColor = reqbrcode.style.backgroundColor;
                 reqbrcode.style.backgroundColor = bkColor;
                 reqbrcode.focus();
                 return false;
                 }
          	 
            if ((w.value==null)||(w.value=="")||(w.value=="Null")){
            alert("Please Select Branch!");
            w.style.bkColor = w.style.backgroundColor;
            w.style.backgroundColor = bkColor;
           
            w.focus();
            return false
            }
            if (checkAddress(w.value)==false){
            w.value="";
            alert("Invalid Selection!");
            w.focus();
            return false
            }
           
               if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null")){
            alert("Please Enter Department!");
            dpt.style.bkColor = dpt.style.backgroundColor;
            dpt.style.backgroundColor = bkColor;
            w.style.backgroundColor = bkColor2;
            dpt.focus();
            return false;
            }
            if (checkAddress(dpt.value)==false){
            	dpt.value="";
            alert("Invalid Department!");
            	dpt.focus();
            return false;
            }
            if ((fn.value==null)||(fn.value=="")){
                alert("Please Enter Full Name!");
                fn.style.bkColor = fn.style.backgroundColor;
                fn.style.backgroundColor = bkColor;
                dpt.style.backgroundColor = bkColor2;
                fn.focus();
                return false;
                }
                if (checkAddress(fn.value)==false){
                	fn.value="";
                alert("Invalid Name!");
                	fn.focus();
                return false;
                }  
                if ((roff.value==null)||(roff.value=="")){
                    alert("Please Enter Reporting Officer Name!");
                    roff.style.bkColor = roff.style.backgroundColor;
                    roff.style.backgroundColor = bkColor;
                    desg.style.backgroundColor = bkColor2;
                    roff.focus();
                    return false;
                    }
                    if (checkAddress(roff.value)==false){
                    	roff.value="";
                    alert("Invalid Name!");
                    	roff.focus();
                    return false;
                    } 
                
                
                if ((sw.value==null)||(sw.value=="")){
                    alert("Please Scope Of Work!");
                    sw.style.bkColor = sw.style.backgroundColor;
                    sw.style.backgroundColor = bkColor;
                    fn.style.backgroundColor = bkColor2;
                    sw.focus();
                    return false;
                    }
                    if (checkAddress(sw.value)==false){
                    	sw.value="";
                    alert("Invalid Name!");
                    	sw.focus();
                    return false;
                    }
                    if ((desg.value==null)||(desg.value=="")||(desg.value=="Null")){
                        alert("Please Enter Designation!");
                        desg.style.bkColor = desg.style.backgroundColor;
                        desg.style.backgroundColor = bkColor;
                        sw.style.backgroundColor = bkColor2;
                        desg.focus();
                        return false;
                        }
                        if (checkAddress(desg.value)==false){
                        	desg.value="";
                        alert("Invalid Designation!");
                        	desg.focus();
                        return false;
                        } 
                        
                            if ((ec.value==null)||(ec.value=="")){
                                alert("Please Enter Operator Code!");
                                ec.style.bkColor = ec.style.backgroundColor;
                                ec.style.backgroundColor = bkColor;
                                roff.style.backgroundColor = bkColor2;
                                ec.focus();
                                return false;
                                }
                                if (checkAddress(ec.value)==false){
                                	ec.value="";
                                alert("Invalid Code!");
                                	ec.focus();
                                return false;
                                }
                                if ((rb.value==null)||(rb.value=="")){
                                    alert("Please Enter Requested By whom!");
                                    rb.style.bkColor = rb.style.backgroundColor;
                                    rb.style.backgroundColor = bkColor;
                                    ec.style.backgroundColor = bkColor2;
                                    rb.focus();
                                    return false;
                                    }
                                    if (checkAddress(rb.value)==false){
                                    	rb.value="";
                                    alert("Invalid Request!");
                                    	rb.focus();
                                    return false;
                                    }
                    
                       
                            
                            if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false ) && (req[3].checked == false ) ){
                            	 alert("Select Status Of Request! \n \n New/Delete/Change/Reset");
                                req[0].focus();
                                return false;
                                } 
                             
                            if ((l.value==null)||(l.value=="")){
                                alert("Enter Remarks!");
                               l.style.bkColor = l.style.backgroundColor;
                                l.style.backgroundColor = bkColor;
                                rb.style.backgroundColor = bkColor2;
                                l.focus();
                                return false;
                                } 
                            if ((mail.value==null)||(mail.value=="")){
                                alert("Select Employee Name and Designation!");
                                desgS.style.bkColor = desgS.style.backgroundColor;
                                desgS.style.backgroundColor = bkColor;
                                l.style.backgroundColor = bkColor2;
                                empS.style.bkColor = empS.style.backgroundColor;
                                empS.style.backgroundColor = bkColor;

                                mail.focus();
                                return false;
                                } 
                                        
	 else
       return true;
}
        </script>
   <script type="text/javascript">
	var expanded = false;
	function checkBoxValidation()
	{
		var vijayVal=null;
		//alert("i am in checkboxvalidation");
		for(var i=0; i < document.form.approverslist.length; i++)
		{
			if(!document.form.approverslist[i].checked)
			{
			
			}
			else
			{
				alert(document.form.approverslist[i].value);
				vijayVal=vijayVal+ document.form.approverslist[i].value+",";
				alert("inside else part"+vijayVal);
			}
		}
	}

	function showCheckboxes() 
		{
			//alert("I came here");
		  var checkboxes = document.getElementById("checkboxes");
		  if (!expanded) {
		    checkboxes.style.display = "block";
		    expanded = true;
		    var values = $('input:checkbox:checked.group1').map(function () {
				   return this.value;
				 }).get(); 
		   
		    } else {
		    checkboxes.style.display = "none";
		    expanded = false;
		  }
		
		  // alert(values);
	  }
	 function sync(val) 
		{
			 var vijayVal="";
				for(var i1=0; i1 < document.form.approverslist.length; i1++)
				{
				
					if(document.form.approverslist[i1].checked)
					{
					//	alert(document.form.approverslist[i1].value);
						vijayVal=vijayVal+ document.form.approverslist[i1].value+",";
					//	alert("i1:"+i1+" :"+vijayVal);
					}
				}
			document.getElementById("idreqBranch").value=vijayVal;
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
                             document.getElementById("resultFromAjax2").innerHTML = str2;//fname,iddept,idbranch,iddesg
                             document.getElementById("fname").value =  document.getElementById("p1").value;
                             document.getElementById("iddesg").value =  document.getElementById("p2").value;
                      		 document.getElementById("idbranch").value =  document.getElementById("p3").value;
                      		 document.getElementById("iddept").value =  document.getElementById("p4").value;
                      		 document.getElementById("rofficer").value =  document.getElementById("p5").value;
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("fname").value = "";
                             document.getElementById("iddesg").value =""; 
      		                 document.getElementById("idbranch").value = "";
      		                 document.getElementById("iddept").value =  "";
      		               document.getElementById("rofficer").value =  "";
      		                 }
                 } 
</script>
                
 <script type="text/javascript"> //  body onloade()
function cleartext()
    {
    var checkboxes = document.getElementById("checkboxes");
    checkboxes.style.display = "none";
    }
</script>               
                
                
                
                
</head>

<body onload="cleartext()">
<form action="NewinsPageBack.jsp" method="post" name="form">
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
		NEWINS USERS APPLICATION FORM</label>
		</b></font></center></td> </tr>
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

<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
	 <br />
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn11=null;
Statement st1= null,st2=null,st3=null,st4=null,st11=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs11=null;Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
try{
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

cn11 = con.getConnection2();
st11=cn11.createStatement();
rs11 = st11.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_no Asc"); 

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
rs3 = st3.executeQuery("SELECT max(idextend) FROM form7_newins WHERE form7_no IN(SELECT form7_no FROM form7_newins LEFT JOIN branch_master b ON(substr(form7_no,16,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form7_no)");
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
 			id2="NEIN/CS/NEWINS/"+b_no+"-";
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
		 new_id = "NEIN/CS/NEWINS/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
%>	 
		
<table  width="895">
<tr >
	<td bgcolor="grey" style="text-align: right;width:23%;">
	<input name="form7_no" readonly="readonly" value="<%=new_id%>" size="25" />
	</td>
	</tr>
	
	<tr>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Emp ID :<input type="hidden" name="idextend" value="<%=id%>" /></td>
<td align="left"><input type="text" name="empid" value="" id="idempid"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"><font color="red"> <div id="mydiv2"></div></font></td>
<!-- <td style="text-align:left;width:33%;"><input type="text" name="empid" size="10" id="idempid" maxlength="44" value="" /></td>  -->

<td  style="text-align: right;width:23%;"><font color=red>*</font>Requested Branch Code :</td>
<td ><%-- <select name="reqBrCode"  id="hiderow" style="width:55px;">
					<option value="" style="background: lightgrey;" >Select</option>
					<%while(rs11.next()){ %>
					<option> <%=rs11.getString(1)%> </option> 
					<%} %> </select> --%>
	
	                        <div class="multiselect">
                                   <div class="selectBox" onclick="showCheckboxes()" >
                                         <select style="max-width:30%;">
                                              <option value="">Select</option>
                                        </select>
                                        <input type="text" name="reqBrCode" size=20 id="idreqBranch" readonly/>
                                        <div class="overSelect"></div>
                                   </div>
                                   <div id="checkboxes"  onclick="showCheckboxes()">
                                        <%while(rs11.next()){%> 
     	                                     <label for="<%=rs11.getString(1)%>" style="width:80%; text-align: left;">
      			                             <input type="checkbox" name="approverslist" onclick="sync(this),showCheckboxes()" id="<%=rs11.getString(1)%>" class="group1" value="<%=rs11.getString(1)%>" /><%=rs11.getString(1)%> -- (<%=rs11.getString(2)%>)</label>
     	      	                        <%}%>
                                  </div>
                             </div>
	
					
</td> 


</tr>
	
	
	
<tr>
<td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" size="29" id="fname" maxlength="44" readonly/></td>



<td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
<td style="text-align: left;"><input type="text" name="depart" id="iddept" size="28" maxlength="44" readonly/>	</td>
<%-- <td style="text-align:left;"><select name="depart"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs2.next()){ %>
					<option> <%=rs2.getString(1)%> </option> 
					<%} %> </select></td>  --%>


</tr>
<tr>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="<%=id%>" /></td>
<td style="text-align: left;"><input type="text" name="branch" id="idbranch" size="28" maxlength="44" readonly/>	</td>
<%-- <td style="text-align:left;width:33%;"><select name="branch"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("b_name")%> </option> 
					<%} %> </select></td>  --%>
<td  style="text-align: right;"><font color=red>*</font>Designation :</td>
<td style="text-align: left;"><input type="text" name="designation" id="iddesg" size="28" maxlength="44" readonly/>	</td>
<%-- <td style="text-align:left;"><select name="designation"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs4.next()){ %>
					<option> <%=rs4.getString(1)%> </option> 
					<%} %> </select></td> --%>

				

				
</tr>
<tr>

<td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer" size="28" maxlength="44" readonly/></td>
<td style="text-align: right;"><font color=red>*</font>Scope Of Work :</td>
				<td style="text-align: left;"><input type="text" name="scopeOfWork"
					id="sow" size="28" maxlength="44"/>
				</td>
</tr>
<tr>


<td  style="text-align: right;"><font color=red>*</font>Requested NEWIN's ID / Operator Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" maxlength="44" size="29"/></td>

  <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
<td style="text-align:left;"><input type="text" name="requestBy" id="req" value='<%=Name%>' size="28" maxlength="44" readonly/></td>

</tr>

<tr>
<td align="right"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" colspan="3"> 
     <input style="" type ="radio" name = "requestOption" value ="New" id="" onclick="hideTR();"/>New
    <!--  <input type ="radio" name = "requestOption" value ="Delete" onclick="hideTR();"/>Delete -->
     <input type ="radio" name = "requestOption" value ="Change" onclick="showTR();" />Change
     <input type ="radio" name = "requestOption" value ="Reset" onclick="showTR();" />Reset</td>
   
</tr>
<tr style="visibility: hidden;display: none;" id="idDelete">

<td align="right"><font color=red>*</font>Remarks :</td>
<td colspan="3"><textarea name="deleteremarks" rows="2" cols="80" id="ta" maxlength="99" title="Remarks 100 characters"></textarea></td>
</tr>
<!-- <tr>
<td style="text-align: right;width:23%;">Reason</td>
<td colspan="3" style="text-align:left;width:33%;"><textarea rows="2" cols="102" ></textarea></td>
</tr> -->
</table>

<br />
<table id="it" width="895">
<tr><td id="ita"><font color=red>*</font>Remarks/Reason</td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199" title="Remarks 200 characters"></textarea></td></tr>
</table>

<br />
<b><font color=red>*</font>Send To:</b>
		<br />
	<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
<% 

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
                          //rs5 = st5.executeQuery("Select * from desg");
                          // rs5 = st5.executeQuery("Select DISTINCT d.DESIGNATION,l.city from desg d,login l INNER JOIN branch_master b ON (l.city=b.b_name) WHERE  d.DESIGNATION=l.post  AND '"+b_no+"'=b.b_no ORDER BY d.DESIGNATION ASC");
                          rs5 = st5.executeQuery("Select DISTINCT DESIGNATION from desg where DESG_NO  in('28','2','40','7','5','15','41','20','19','45') ORDER BY DESIGNATION ASC");
                            //  rs5 =  st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO) WHERE SUBSTR(emp.e_city,-2,2)='"+b_no+"'");
                            //  rs5 =  st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO) WHERE SUBSTR(emp.e_city,-2,2)='"+b_no+"'");
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
  <label style="float: left;" id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" />                               
</table>  
</br>
</center>                                                                   
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
   <td style="size:1"><div id="formsubmitbutton"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return (validate() && ButtonClicked()) " />
    </div>
    <div id="buttonreplacement" style="display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
   </td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
     <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	     	     	           <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp?msg=1'"/> </td>
   	</tr>
 
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
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>HR/Admin (Local)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>VP</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>SR.MANAGER IT (HO)</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>HO(Finance/Accounts) - 1 & 2 Approval</label>
<br />
<label  style="font-size: 20px;">&#x21d3;</label>
<br />
<label>SR.MANAGER IT (HO)</label>
<br /><br />
<br />
<label>---------------------------------------------------</label>
<br />
<br />
<label>IF INITIATED BY HO </label>
<br />
<label>HR -> IT support -> HR -> GM/VP -> IT Manager </label>
<br />
<label> -> Arun Bhat -> IT </label>



<br />
<br />
<br />
</div>
</form>	
<div id="resultFromAjax2" style="display:none;">
        
       </div>
</body>

</html>