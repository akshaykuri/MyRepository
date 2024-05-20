<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<%@page import="java.util.ResourceBundle"%>

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>TMS FORM</title>
	
  
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
  	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
    <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
 
  
                     <!--    Date Picker -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'dd,mm,yy' });
  } );
  </script>
 
                      <!--  Date Picker close-->
 
 
 <script type="text/javascript">  
function featchIT(v)  
          { 
	      document.getElementById("idempid1").value ="";
	      document.getElementById("idroname").value ="";
	      document.getElementById("idrodesg").value ="";
	      document.getElementById("idromail").value ="";
	       document.getElementById("idlevelno").value ="";
	      //alert("here"+v);
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
    	        var url="getITPerson.jsp";  
    		    url +="?loc="+v;
    		    xmlHttp.onreadystatechange = deptadmin;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
            }  
    function deptadmin()
            { //alert("here1");
    	          var str21=xmlHttp.responseText;
    	          if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                                 { 
                                 document.getElementById("resultFromAjaxdeptAdmin").innerHTML = str21;
                                 document.getElementById("iddeptadminP").value =  document.getElementById("approvP").value;
                                 document.getElementById("iddeptadminP11").value =  document.getElementById("approvP1").value;
                                 }
    	                      else
    	        	             {
    	                    	  document.getElementById("resultFromAjaxdeptAdmin").innerHTML = str2;
    	                    	  document.getElementById("iddeptadminP").value ="";
    	                    	  document.getElementById("iddeptadminP11").value ="";
    	                    	  }
    	          
             }
  function featchCustDetails(v)  
    { //custname,address,conperson,empmailid,emp_mob,
	document.getElementById("custname").value ="";
    document.getElementById("addresss").value ="";
    document.getElementById("conperson").value ="";
    document.getElementById("empmailid").value ="";
     document.getElementById("emp_mob").value ="";
   // alert("here"+v);
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
	        var url="getCustDetails.jsp";  
		    url +="?custid="+v;
		    xmlHttp.onreadystatechange = custdetails;  
		    xmlHttp.open("GET", url, true);   
		    xmlHttp.send(null);    
      }  
function custdetails()
      { //alert("here1");
	          var str2c=xmlHttp.responseText;
	          if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                           { //custname,address,conperson,empmailid,emp_mob,
                           document.getElementById("resultFromAjaxcustdetails").innerHTML = str2c;
                           document.getElementById("custname").value =  document.getElementById("custname1").value;
                           document.getElementById("addresss").value =  document.getElementById("address1").value;
                           document.getElementById("conperson").value =  document.getElementById("conperson1").value;
                           document.getElementById("empmailid").value =  document.getElementById("empmailid1").value;
                           document.getElementById("emp_mob").value =  document.getElementById("emp_mob1").value;
                           }
	                      else
	        	             {
	                    	  document.getElementById("resultFromAjaxcustdetails").innerHTML = str2c;
	                    	    document.getElementById("custname").value ="";
	                    	    document.getElementById("addresss").value ="";
	                    	    document.getElementById("conperson").value ="";
	                    	    document.getElementById("empmailid").value ="";
	                    	     document.getElementById("emp_mob").value ="";
	                    	  }
	          
       }
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
 
 

 
 
 
 
         <script language = "Javascript">
         function checkAddress(str)
              {
              var re = /[^[a-z][A-Z][0-9][/][#][[][]][,][.]/g
              if (re.test(str)) return false;
              return true;
              }
         function validate()
              {
        	 
        	  var empid=document.form.custCode;
        	  var w=document.form.custname;
        	  
        	  var req=document.form.requestOption;
        	  var deptType=document.form.deptType;
        	  var req_Branch=document.form.req_Branch;
        	 
        	  var remarks=document.form.remarks;
        	  var mail=document.form.mail;
        	  var desg1=document.form.desg;
          	  var emp=document.form.emp;
          	  var empid1=document.form.empid1;
        	  var levelno=document.form.levelno;
        	  var mail11=document.form.mail11;
        	  
        	      var bkColor = "red";
          	  var bkColor2 = "white";
          	  if ((empid.value==null)||(empid.value==""))
          	     {
                 alert("Please select Customer Code!");
                 empid.style.bkColor = empid.style.backgroundColor;
                 empid.style.backgroundColor = bkColor;
                 empid.focus();
                 return false;
                 }
            if ((w.value==null)||(w.value=="")||(w.value=="Null"))
                 {
                 alert("Please select Customer Code!");
                 w.style.bkColor = w.style.backgroundColor;
                 w.style.backgroundColor = bkColor;
                 w.focus();
                 return false
                 }
           
           
           
           if ((req_Branch.value==null)||(req_Branch.value==""))
                {
                alert("Please select Requested branch!");
                req_Branch.style.bkColor = req_Branch.style.backgroundColor;
                req_Branch.style.backgroundColor = bkColor;
                req_Branch.focus();
                return false;
                } 
          if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false )  )
                {
                alert("Select  Request Type! \n \n New/Delete/Change");
                req[0].focus();
                return false;
                }
          if ((deptType[0].checked == false ) && (deptType[1].checked == false )  )
                {
                alert("Select  Dept Type! \n \n Transport/Warehouse");
                deptType[0].focus();
                return false;
                } 
          
        
          
          
           if ((remarks.value==null)||(remarks.value==""))
                {
                alert("Enter Remarks!");
                remarks.style.bkColor = remarks.style.backgroundColor;
                remarks.style.backgroundColor = bkColor;
                remarks.focus();
                return false;
                } 
     
          if (mail11.value=="")
                {
                alert("Branch IT dosenot exists in master table ...");
                return false;
                } 
          if (empid1.value==""||emp.value==""||desg1.value==""||mail.value==""||levelno.value=="")
                {
                alert("Please select the next approver name ...");
                return false;
                } 
         
           else
               return true;
        }
   </script>
  
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
	
<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) 
    {
	evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    return true;
    }

</script>
     
              
</head>
<body >
<form action="TMSClientPageBack.jsp" method="post" name="form" >
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
/* System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------"); */
%>
<%-- <%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %> --%>
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
    <table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	 <tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>TMS CUSTOMER USER REQUEST FORM</label>
		</b></font></center></td> 
	</tr>
	<tr style="visibility: hidden;display: none;">
	   <td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
	    <%-- 	<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/> --%>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
	</tr>
    <tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<%-- <td width="165"><%= po_date.format(new java.util.Date())%></td> --%>
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
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn11=null,cn6=null,cn5 = null,con1c = null;
Statement st1= null,st2=null,st3=null,st4=null,st11=null, st5 = null,st6=null,st6c=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs11=null,rs5 = null,rs6=null,rs6c=null; 

    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userNamec = dbProperties.getString("csdb.username");
	String passwordc = dbProperties.getString("csdb.password");
	String urlc = dbProperties.getString("csdb.url");
	String driverc = dbProperties.getString("csdb.driverName");
	
	String dbNamec = dbProperties.getString("tmsdb.dbName");
	String urltmsdb = dbProperties.getString("tmsdb.url");

try
  {


  cn6 = con.getConnection2();
  st6=cn6.createStatement();
  if(b_no.equals("90"))
	  rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc"); 
  else
      rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main where 	m_b_no='"+b_no+"' ORDER BY m_b_name Asc"); 

  Class.forName(driverc).newInstance();
  con1c = DriverManager.getConnection(urltmsdb+dbNamec,userNamec,passwordc); 
  st6c=con1c.createStatement();
  rs6c = st6c.executeQuery("select * from customermasterdetails where branch_id='"+b_no+"' ORDER BY customer_Name Asc"); 
 %>	 
		
<table  width="895">
   
   <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Customer Code :<input type="hidden" name="idextend" value="" /></td>
     <td style="text-align:left;">
          <select name="custCode"  style="font-size : 8pt" onchange="featchCustDetails(this.value)">      
          <option value="">Select</option>
          <%while(rs6c.next()){%>     
              <option value="<%=rs6c.getString(4)%>"><%=rs6c.getString(4)%>-<%=rs6c.getString(6)%></option> 
              <%}%>   
         </select>  
     </td>   
     <td></td><td></td>
    
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Customer Name :</td>
    <td style="text-align:left;"><input type="text" name="custname" size="29" id="custname" maxlength="44" readonly/></td>
    <td  style="text-align: right;width:23%;"><font color=red>*</font>Address :</td>
    <td style="text-align: left;"><input type="text" name="addresss" id="addresss" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Contact Person Name:<input type="hidden" name="idextend" value="" /></td>
     <td style="text-align: left;"><input type="text" name="conperson" id="conperson" size="28" maxlength="44" readonly/>	</td>
      <td style="text-align: right;"><font color=red>*</font>Emails ID :</td>
	 <td style="text-align: left;"><input type="text" name="empmailid"	id="empmailid" size="28" maxlength="44" readonly/></td>
</tr>
  <tr>
      </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Mobile No :</td>
    <td style="text-align:left;"><input type="text" name="emp_mob" id="emp_mob" maxlength="44" size="29"/ readonly></td>
    <td style="text-align: right;"><font color=red>*</font>Requested By :</td>
    <td style="text-align:left;"><input type="text" name="requestBy" id="req" value='<%=Name%>' size="28" maxlength="44" readonly/></td>
  </tr>
  <tr>
     <td style="text-align: right;"><font color=red>*</font>Requested Branch :</td>
     <td style="text-align:left;">
          <select name="req_Branch"  style="font-size : 8pt" onchange="featchIT(this.value)">      
               <option value="">Select</option>
         <%while(rs6.next()){%>     
              <option value="<%=rs6.getString(1)%>"><%=rs6.getString(2)%></option> 
              <%}%>   
         </select>  
     </td>
   <td style="text-align: right;"><font color=red>*</font>Request Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;"> 
          <input style="" type ="radio" name = "requestOption" value ="New" id="" />New
          <input type ="radio" name = "requestOption" value ="Delete"  />Delete
          <input style="" type ="radio" name = "requestOption" value ="Change" id="" />Change</td>
  </tr>
  <tr>
    <td style="text-align: right;"><font color=red>*</font>Dept Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;"> 
          <input style="" type ="radio" name = "deptType" value ="Trans" id="" />Transport
          <input type ="radio" name = "deptType" value ="WH"  />Warehouse</td>
  </tr>
 
 
</table>
<br />









								
    
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
       <tr> 
      <td align="left"><font color=red>*</font>Remarks  :
      <textarea name="remarks" rows="3" cols="124" id="ta" maxlength="199" title="Remarks 200 characters"></textarea></td>
  </tr>
          
        <tr> 
           <td><b><font color=red>*</font>Send To Branch IT:</b>
                <input align="left" type="radio" value="" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
              <input type="text" name="mail11" id="iddeptadminP11" value="" size="50" readonly/>
              <input type="hidden" name="mail1" id="iddeptadminP" value="" size="30"/>
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
     <td style="size:1">
        <div id="formsubmitbutton">
            <input  type="submit" value="SEND" name="save1" id="save1" onClick="return validate();" />
        </div>
        <div id="buttonreplacement" style="display:none;">
	       <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	    </div> 
     </td>
     <td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	 <td style="font-size:1">&nbsp;&nbsp;<input  type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp?msg=1'"/> </td>
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

</form>	
       <div id="resultFromAjax2" style="display:none;">
       </div>
       <div id="resultFromAjax3" style="display:none;">
       </div>
       <div id="resultFromAjaxdeptAdmin" style="display:none;">
</div>
<div id="resultFromAjaxcustdetails" style="display:none;">
</div>
</body>

</html>