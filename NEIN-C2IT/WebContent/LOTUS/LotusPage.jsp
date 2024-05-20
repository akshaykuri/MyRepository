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
<%@page import="java.util.ResourceBundle"%>
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
			<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
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
        	  var req_Branch=document.form.req_Branch;
        	 var ema =document.form.email;
        	  var l=document.form.remarks;
        	  
        	 var mail=document.form.mail1;
        	 var desgS=document.form.desg;
          	  var empS=document.form.emp;
          	 var bkColor = "red";
          	 var bkColor2 = "white";
          	 
           	 
          	 var ed=document.form.emaildomain;
          	 var et=document.form.emptype;
          	 
          	var intu=document.form.intune;
        	 
            if ((w.value==null)||(w.value=="")||(w.value=="Null")){
            alert("Please Select Branch!");
            w.style.bkColor = w.style.backgroundColor;
            w.style.backgroundColor = bkColor;
           
            w.focus();
            return false
            }
            if (checkAddress(w.value)==false){
            w.value=""
            alert("Invalid Selection!");
            w.focus()
            return false
            }
           
               if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null")){
            alert("Please Enter Department!");
            dpt.style.bkColor = dpt.style.backgroundColor;
            dpt.style.backgroundColor = bkColor;
            w.style.backgroundColor = bkColor2;
            dpt.focus()
            return false
            }
            if (checkAddress(dpt.value)==false){
            	dpt.value=""
            alert("Invalid Department!");
            	dpt.focus()
            return false;
            }
            if ((fn.value==null)||(fn.value=="")){
                alert("Please Enter Full Name!");
                fn.style.bkColor = fn.style.backgroundColor;
                fn.style.backgroundColor = bkColor;
                dpt.style.backgroundColor = bkColor2;
                fn.focus()
                return false
                }
                if (checkAddress(fn.value)==false){
                	fn.value=""
                alert("Invalid Name!");
                	fn.focus()
                return false;
                }     if ((sw.value==null)||(sw.value=="")){
                    alert("Please Scope Of Work!")
                     sw.style.bkColor = sw.style.backgroundColor;
                     sw.style.backgroundColor = bkColor;
                     fn.style.backgroundColor = bkColor2;
                    sw.focus()
                    return false
                    }
                    if (checkAddress(sw.value)==false){
                    	sw.value=""
                    alert("Invalid Name!");
                    	
                    	sw.focus()
                    return false;
                    }
                    if ((desg.value==null)||(desg.value=="")||(desg.value=="Null")){
                        alert("Please Enter Designation!");
                        desg.style.bkColor = desg.style.backgroundColor;
                        desg.style.backgroundColor = bkColor;
                        sw.style.backgroundColor = bkColor2;
                        desg.focus()
                        return false
                        }
                        if (checkAddress(desg.value)==false){
                        	desg.value=""
                        alert("Invalid Designation!");
                        	desg.focus()
                        return false;
                        } 
                        if ((roff.value==null)||(roff.value=="")){
                            alert("Please Enter Reporting Officer Name!");
                            roff.style.bkColor = roff.style.backgroundColor;
                            roff.style.backgroundColor = bkColor;
                            desg.style.backgroundColor = bkColor2;
                            roff.focus()
                            return false
                            }
                            if (checkAddress(roff.value)==false){
                            	roff.value=""
                            alert("Invalid Name!");
                            	roff.focus()
                            return false;
                            } 
                            if ((ec.value==null)||(ec.value=="")){
                                alert("Please Enter Employee Code!");
                                ec.style.bkColor = ec.style.backgroundColor;
                                ec.style.backgroundColor = bkColor;
                                roff.style.backgroundColor = bkColor2;
                                ec.focus()
                                return false
                                }
                                if (checkAddress(ec.value)==false){
                                	ec.value=""
                                alert("Invalid Code!");
                                	ec.focus()
                                return false;
                                }
                                if ((rb.value==null)||(rb.value=="")){
                                    alert("Please Enter Requested By whom!");
                                    rb.style.bkColor = rb.style.backgroundColor;
                                    rb.style.backgroundColor = bkColor;
                                    ec.style.backgroundColor = bkColor2;
                                    rb.focus()
                                    return false
                                    }
                                    if (checkAddress(rb.value)==false){
                                    	rb.value=""
                                    alert("Invalid Request!");
                                    	rb.focus()
                                    return false;
                                    }
                    
                       
                            
                            if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false ) && (req[3].checked == false ) ){
                            	alert("Select Status Of Request! \n \n New/Delete/Change/Reset");
                                req[0].focus();
                                return false;
                                } 
                            if ((req_Branch.value==null)||(req_Branch.value=="")){
                                alert("Please Select Requested Branch!");
                                req_Branch.style.bkColor = req_Branch.style.backgroundColor;
                                req_Branch.style.backgroundColor = bkColor;
                                rb.style.backgroundColor = bkColor2;
                                req_Branch.focus();
                                return false;	
                                }     
                            
                            
                            
                            
                            if ((ed.value==null)||(ed.value=="")||(ed.value=="Null")){
                                alert("Please Select Email Domain!");
                                ed.style.bkColor = ed.style.backgroundColor;
                                ed.style.backgroundColor = bkColor;
                                ed.focus()
                                return false
                                }
                            
                            
                            
                            if ((et.value==null)||(et.value=="")||(et.value=="Null")){
                                alert("Please Select Employee Type!");
                                et.style.bkColor = et.style.backgroundColor;
                                et.style.backgroundColor = bkColor;
                              
                                et.focus()
                                return false
                                }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            if((ema.value==null)||(ema.value=="")){
                            	alert("Enter Requested Mail id");
                            	 ema.style.bkColor = ema.style.backgroundColor;
                                 ema.style.backgroundColor = bkColor;
                                 rb.style.backgroundColor = bkColor2;
                            	ema.focus();
                            	return false;
                                }
                            if(intu.value==""){
                            	alert("Please select mobile access intune.");
                            	
                            	intu.focus();
                            	return false;
                                }
                            if ((l.value==null)||(l.value=="")){
                                alert("Enter Remarks!");
                                l.style.bkColor = l.style.backgroundColor;
                                l.style.backgroundColor = bkColor;
                                ema.style.backgroundColor = bkColor2;
                                l.focus();
                                return false
                                } 
                            if ((mail.value==null)||(mail.value=="")){
                                alert("Select next approver!");
                                desgS.style.bkColor = desgS.style.backgroundColor;
                                desgS.style.backgroundColor = bkColor;
                                l.style.backgroundColor = bkColor2;
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
                                       function fetchBranchIT(brcode)
                                       {
                                    	alert(brcode);   
                                    	   
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
 function sync(val)
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
 	  document.getElementById("idrodesg").value=part3;
     document.getElementById("idroname").value=part2;
     document.getElementById("idromail").value=part4;
     document.getElementById("idempid1").value=part1;
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
<form action="LotusPageBack.jsp" method="post" name="form">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null,empno1=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
empno1 = (String) session.getAttribute("EmpNo");
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
		EMAIL ID REQUEST FORM</label>
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
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn6=null;
Statement st1= null,st2=null,st3=null,st4=null,st6=null,st12=null,st12n=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs6=null,rs51=null,rs51n=null;
Connection cn5 = null; 
Statement st5 = null,stED=null,stET=null; 
ResultSet rs5 = null,rsED=null,rsET=null; 
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

cn6 = con.getConnection2();
st6=cn6.createStatement();
rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc"); 

stED=cn6.createStatement();
rsED = stED.executeQuery("select emaildomain from emaildomainmaster ORDER BY emaildomain Asc"); 

stET=cn6.createStatement();
rsET = stET.executeQuery("select employeetype from employeeTypeMaster ORDER BY employeetype Asc"); 

String new_id = null;
int id=0;
String id2=null;
cn3 = con.getConnection2();
st3=cn3.createStatement();
//rs3 = st3.executeQuery("SELECT max(idextend),substr(form1_it_clearance.form1_no,18,4),substr(form1_it_clearance.form1_no,1,17) From form1_it_clearance WHERE '"+b_no+"'=substr(form1_it_clearance.form1_no,15,2) GROUP BY form1_no");
rs3 = st3.executeQuery("SELECT max(idextend) FROM form3_lotus WHERE form3_no IN(SELECT form3_no FROM form3_lotus LEFT JOIN branch_master b ON(substr(form3_no,15,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form3_no)");
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
 			id2="NEIN/CS/Lotus/"+b_no+"-";
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
		 new_id = "NEIN/CS/Lotus/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
%>	 
<input name="form3_no" readonly="readonly" value="<%=new_id%>" size="25" type="hidden"/>		
<table  width="895">
<!-- <tr >
	<td bgcolor="grey" style="text-align: right;width:23%;"> -->
	
	<!-- </td>
	</tr> -->
<tr>
<td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="<%=id%>" /></td>
<td style="text-align:left;width:33%;"><select name="branch"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs1.next()){ %>
					<option> <%=rs1.getString("b_name")%> </option> 
					<%} %> </select></td> 

<td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
<td style="text-align:left;"><select name="depart"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs2.next()){ %>
					<option> <%=rs2.getString(1)%> </option> 
					<%} %> </select></td> 


</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" size="29" id="fname" maxlength="44"></td>


				<td style="text-align: right;"><font color=red>*</font>Scope Of Work :</td>
				<td style="text-align: left;"><input type="text" size="29" name="scopeOfWork"
					id="sow" maxlength="44"/>
				</td>

				
</tr>
<tr>
<td  style="text-align: right;"><font color=red>*</font>Designation :</td>
<td style="text-align:left;"><select name="designation"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs4.next()){ %>
					<option> <%=rs4.getString(1)%> </option> 
					<%} %> </select></td>
<td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="reporting_officer" size="29" id="rofficer" maxlength="44"/></td>
</tr>
<tr>


<td  style="text-align: right;"><font color=red>*</font>Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="29" maxlength="44"/></td>

  <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
<td style="text-align:left;"><input type="text" name="requestBy" id="req" size="29" maxlength="44"/></td>

</tr>

<tr>
<td align="right"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:23%;" > 
     <input style="" type ="radio" name = "requestOption" value ="New" id=""/>New
     <input type ="radio" name = "requestOption" value ="Delete" />Delete
     <input type ="radio" name = "requestOption" value ="Change" />Change
     <input type ="radio" name = "requestOption" value ="Reset" />Reset
     </td>
 <td style="text-align: right;"><font color=red>*</font>Requested Branch :</td>
 <td style="text-align:left;">
          <select name="req_Branch"  style="font-size : 8pt" >      
               <option value="">Select</option>
         <%while(rs6.next()){%>     
              <option value="<%=rs6.getString(1)%>"><%=rs6.getString(2)%></option> 
              <%}%>   
         </select>  
 
 
 
 </td>  
</tr>







<tr>
	<td align="right"><font color=red>*</font>Email Domain :</td>
	<td style="font-weight:bold;font-style:italic;width:23%;" > 
	     <select name="emaildomain"  style="font-size : 8pt" >      
	              <option value="">Select</option>
	         <%while(rsED.next()){%>     
	              <option value="<%=rsED.getString(1)%>"><%=rsED.getString(1)%></option> 
	              <%}%>   
	         </select>  
	 </td>
	 <td style="text-align: right;"><font color=red>*</font>Employee Type :</td>
	 <td style="text-align:left;">
	          <select name="emptype"  style="font-size : 8pt" >      
	               <option value="">Select</option>
	         <%while(rsET.next()){%>     
	              <option value="<%=rsET.getString(1)%>"><%=rsET.getString(1)%></option> 
	              <%}%>   
	         </select>  
	 </td>  
</tr>
























<tr>
<td style="text-align: right;"><font color=red>*</font>Requested E-Mail Id :</td>
<td style="text-align:left;"><input type="text" name="email" id="id" size="29" maxlength="54"/></td>

<td style="text-align: right;"><font color=red>*</font>Mobile Access (Intune)  </td>
<td style="text-align:left;">
<select id="intune" name="intune">
    <option value="">Select</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
</select>

<input type="hidden" name="password" size="29" readonly="readonly" value="pass1234" />
</td>


</tr>
</table>

<br />
<table id="it" width="895">
<tr><td id="ita"><font color=red>*</font>Remarks/Reason</td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199"></textarea></td></tr>
</table>

<br />
<b>Send To:</b>

		<br />
	<table width="895" border="1" cellspacing="0" cellpadding="0" align="left">  
	
	
	 <tr id="idApproved" >
     <% 
     ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
 	String userName = dbProperties.getString("csdb.username");
 	String password = dbProperties.getString("csdb.password");
 	String url = dbProperties.getString("csdb.url");
 	String driver = dbProperties.getString("csdb.driverName");
 	String dbName = dbProperties.getString("csdb.dbName");
     
     
 	Class.forName(driver).newInstance();
    cn5 = DriverManager.getConnection(url+dbName,userName,password); 
     Connection connhrms = null;
    
     ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
 	String userNamel = dbPropertiesl.getString("leavemanagement.username");
 	String passwordl = dbPropertiesl.getString("leavemanagement.password");
 	String urll = dbPropertiesl.getString("leavemanagement.url");
 	String driverl = dbPropertiesl.getString("leavemanagement.driverName");
 	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
 	
     String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
     connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);  
     Statement nstmt = connhrms.createStatement();  
    
     String maxlevel="";
     String empno="",l="1";
      cn1 = con.getConnection2();
	  st12=cn1.createStatement();
	  st12n=cn1.createStatement();
	 // System.out.println("HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+b_no);
	  	     rs51 = st12.executeQuery("SELECT * FROM formapproval WHERE branch='"+b_no+"' and levelno='"+l+"' and formtype='LOTUS_NOTES' ORDER BY levelno ASC");
    	     if(rs51.next())
                {
    	    	 empno=rs51.getString(5);
                }
    	     if(empno1.equals(empno))
    	           {
    	    	   l="2";
    	    	   rs51n = st12n.executeQuery("SELECT * FROM formapproval WHERE branch='"+b_no+"' and levelno='"+l+"' and formtype='LOTUS_NOTES' ORDER BY levelno ASC");
    	    	   if(rs51n.next())
    	                {
    	    		    empno=rs51n.getString(5); 
    	                }
    	    	  
    	           }
    	    	 //System.out.println("HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% empno :"+empno);
    	    	 //System.out.println("HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% empno1 :"+empno1);
    	    	 ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + empno + "' ) AND u.employee_status = 'yes' ");
    		     if(nrs.next())
    		            { 
    		  	         nuname=nrs.getString(1);
    		             ndesg=nrs.getString(2);
    		             nmailid=nrs.getString(6);
    		            }
    		     napproval=empno+","+nuname+","+ndesg+","+nmailid+","+l;
    		     napproval1=nuname+" ("+nmailid+")";
    		     System.out.println("Next approval :"+napproval); 
               %><input type="hidden" name="senddirect" id="senddirect" value="sendonly" readonly/>
                  <td> 
                      <input align="left" type="radio" value="<%=napproval%>" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
                      <input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
                      <input type="hidden" name="mail12" id="iddeptadminP" value="<%=napproval%>" size="30"/>
   	              </td>
            
                                       <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail1" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
                
             

	
	
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
	<br />
	
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

</body>

</html>