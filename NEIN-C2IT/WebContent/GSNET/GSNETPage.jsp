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

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>GSNET FORM</title>
	
  
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
        	  var empid=document.form.empid;
        	  var w=document.form.branch;
        	  var dpt=document.form.depart;
        	  var fn=document.form.full_name;
        	  var sw=document.form.scopeOfWork;
        	  var ec=document.form.emp_code;
        	  var desg=document.form.designation;
        	  var roff=document.form.reporting_officer;
        	  var rb = document.form.requestBy;
        	  var req=document.form.requestOption;
        	  var curNExAS=document.form.currentNExASID;
        	  var req_Branch=document.form.req_Branch;
        	  var compCode=document.form.compCode;
        	  var costCode=document.form.costCCode;
        	  var costName=document.form.costCName;
        	  var opRange=document.form.costOPRange;
        	
        	  var uk=document.form.userKind;
        	  var opmenu=document.getElementsByName("OptionalMenu[]");
        	
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
                 alert("Please Enter EmpID!");
                 empid.style.bkColor = empid.style.backgroundColor;
                 empid.style.backgroundColor = bkColor;
                 empid.focus();
                 return false;
                 }
            if ((w.value==null)||(w.value=="")||(w.value=="Null"))
                 {
                 alert("Please Select Branch!");
                 w.style.bkColor = w.style.backgroundColor;
                 w.style.backgroundColor = bkColor;
                 w.focus();
                 return false
                 }
           
           if ((dpt.value==null)||(dpt.value=="")||(dpt.value=="Null"))
                 {
                 alert("Please Enter Department!");
                 dpt.style.bkColor = dpt.style.backgroundColor;
                 dpt.style.backgroundColor = bkColor;
                 w.style.backgroundColor = bkColor2;
                 dpt.focus();
                 return false;
                 }
           if ((fn.value==null)||(fn.value==""))
                {
                alert("Please Enter Full Name!");
                fn.style.bkColor = fn.style.backgroundColor;
                fn.style.backgroundColor = bkColor;
                dpt.style.backgroundColor = bkColor2;
                fn.focus();
                return false;
                }
            
            if ((roff.value==null)||(roff.value==""))
                {
                alert("Please Enter Reporting Officer Name!");
                roff.style.bkColor = roff.style.backgroundColor;
                roff.style.backgroundColor = bkColor;
                desg.style.backgroundColor = bkColor2;
                roff.focus();
                return false;
                }
           
          if ((desg.value==null)||(desg.value=="")||(desg.value=="Null"))
                {
                alert("Please Enter Designation!");
                desg.style.bkColor = desg.style.backgroundColor;
                desg.style.backgroundColor = bkColor;
                sw.style.backgroundColor = bkColor2;
                desg.focus();
                return false;
                }
           
          if ((rb.value==null)||(rb.value==""))
                {
                alert("Please Enter Requested By whom!");
                rb.style.bkColor = rb.style.backgroundColor;
                rb.style.backgroundColor = bkColor;
                ec.style.backgroundColor = bkColor2;
                rb.focus();
                return false;
                }
           
           if ((req_Branch.value==null)||(req_Branch.value==""))
                {
                alert("Please select Requested branch!");
                req_Branch.style.bkColor = req_Branch.style.backgroundColor;
                req_Branch.style.backgroundColor = bkColor;
                req_Branch.focus();
                return false;
                } 
          if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false ) && (req[3].checked == false )  )
                {
                alert("Select  Request Type! \n \n New/Change/Reset/Delete");
                req[0].focus();
                return false;
                }
          if ((req[1].checked == true ) || (req[2].checked == true) || (req[3].checked == true )  )
                {
        	    if(curNExAS.value=="")
        	    	{
                    alert("Please enter the Current GSNET ID...");
                    curNExAS.style.bkColor = curNExAS.style.backgroundColor;
                    curNExAS.style.backgroundColor = bkColor;
                    curNExAS.focus();
                    return false;
        	    	}
                }

          var i,flag=0;
          chks = document.getElementsByName('gsnetBrCode[]');
         // alert("here :"+chks.length);
          for (i = 0; i < chks.length; i++)
             {
             if (chks[i].checked)
                {
                flag=1; 
                }
             }
          if(flag==0)
        	  {
        	  alert('Please select GSNET branch code..');
              return false;
        	  }
          
          var j,flag1=0;
          chks1 = document.getElementsByName('gsnetDiv[]');
         
          for (j = 0; j < chks1.length; j++)
             {
        	  if (chks1[j].checked)
                {
                flag1=1; 
                }
           }
         if(flag1==0)
      	    {
      	    alert('Please select division name..');
            return false;
      	    }
        
          var k,flag2=0;
          chks2 = document.getElementsByName('gsnetPdiv[]');
          //alert("herer..1.......");
          for (k = 0; k < chks2.length; k++)
            {
     	    if (chks2[k].checked)
             {
             flag2=1; 
             }
            }
         if(flag2==0)
   	       {
   	       alert('Please select primary division name..');
           return false;
   	       }
         
         
         var k3,flag3=0;
         chks3 = document.getElementsByName('role[]');
         //alert("herer..1.......");
         for (k3 = 0; k3 < chks3.length; k3++)
           {
    	    if (chks3[k3].checked)
            {
            flag3=1; 
            }
           }
        if(flag3==0)
  	       {
  	       alert('Please select role..');
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
function isNumber1(evt) 
    {
	evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
    return true;
    }
function sync1()
{
//alert("Here......."+v);
document.getElementById("idnextapproverchecked").value= "1";
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
                      		 document.getElementById("idempmailid").value =  document.getElementById("p6").value;
                     		 document.getElementById("idemp_mob").value =  document.getElementById("p7").value;
                       		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("fname").value = "";
                             document.getElementById("iddesg").value =""; 
      		                 document.getElementById("idbranch").value = "";
      		                 document.getElementById("iddept").value =  "";
      		                 document.getElementById("rofficer").value =  "";
      		                 document.getElementById("idemp_mob").value = "";
                   		     document.getElementById("idempmailid").value = "";
      		                 }
                 } 
</script>
                
 <script type="text/javascript"> //  body onloade()
  function showTR(val)
     {
	 //alert(val);
	 if(val=="New")
		 {
		 document.getElementById("currNExASID").style.visibility = "hidden";
		 document.getElementById("idcurrentNExASID").value ="";
		 }
	 else
		 {
		 document.getElementById("currNExASID").style.visibility = "visible";
		 document.getElementById("idcurrentNExASID").value ="";
		 }
     }
  function hidefields()
  {
	 document.getElementById("currNExASID").style.visibility = "hidden";
	 document.getElementById("idcurrentNExASID").value ="";
	 
	
  }

</script>               
</head>
<body onload="hidefields()">
<form action="GSNETPageBack.jsp" method="post" name="form" >
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
		<b><label>GSNET APPLICATION FORM</label>
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
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn11=null,cn6=null,cn5 = null;
Statement st1= null,st2=null,st3=null,st4=null,st11=null, st5 = null,st6=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs11=null,rs5 = null,rs6=null; 

try
  {


  cn6 = con.getConnection2();
  st6=cn6.createStatement();
  rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc"); 

 %>	 
		
<table  width="895">
   
   <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Emp ID :<input type="hidden" name="idextend" value="" /></td>
     <td align="left"><input type="text" name="empid" value="" id="idempid"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"><font color="red"> <div id="mydiv2"></div></font></td>
     <td></td><td></td>
    
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Full Name :</td>
    <td style="text-align:left;"><input type="text" name="full_name" size="29" id="fname" maxlength="44" readonly/></td>
    <td  style="text-align: right;width:23%;"><font color=red>*</font>Department :</td>
    <td style="text-align: left;"><input type="text" name="depart" id="iddept" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;width:23%;"><font color=red>*</font>Branch :<input type="hidden" name="idextend" value="" /></td>
     <td style="text-align: left;"><input type="text" name="branch" id="idbranch" size="28" maxlength="44" readonly/>	</td>
     <td  style="text-align: right;"><font color=red>*</font>Designation :</td>
     <td style="text-align: left;"><input type="text" name="designation" id="iddesg" size="28" maxlength="44" readonly/>	</td>
  </tr>
  <tr>
     <td  style="text-align: right;"><font color=red>*</font>Reporting Officer  :</td>
     <td style="text-align:left;"><input type="text" name="reporting_officer" id="rofficer" size="28" maxlength="44" readonly/></td>
     <td style="text-align: right;"><font color=red>*</font>Emails ID :</td>
	 <td style="text-align: left;"><input type="text" name="empmailid"	id="idempmailid" size="28" maxlength="44" readonly/></td>
  </tr>
  <tr>
    <td  style="text-align: right;"><font color=red>*</font>Mobile No :</td>
    <td style="text-align:left;"><input type="text" name="emp_mob" id="idemp_mob" maxlength="44" size="29"/ readonly></td>
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
  
  </tr>
  
  
  <tr>
    <td align="left"><font color=red>*</font>Request Type :</td>
    <td style="font-weight:bold;font-style:italic;width:23%;" colspan="2"> 
          <input style="" type ="radio" name = "requestOption" value ="New" id="" onclick="showTR(this.value);"/>New
          <input type ="radio" name = "requestOption" value ="Change" onclick="showTR(this.value);" />Change
          <input type ="radio" name = "requestOption" value ="Reset" onclick="showTR(this.value);" />Password Reset
          <input type ="radio" name = "requestOption" value ="Delete" onclick="showTR(this.value);" />Delete</td>
          <td style="font-weight:bold;font-style:italic;width:23%;" colspan="2"><div id="currNExASID">Enter Current GSNET ID:<input type ="text" name = "currentNExASID" id = "idcurrentNExASID" value ="" " /></div></td>
    
  </tr>
 
</table>
<br />







<table id="it" width="895">

  <tr >
     
          <td align="left"><font color=red>*</font>GSNET Branch Code:	</td>
          <td colspan=2>
          <%Connection con1 = null;
                     ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
                 	String userName = dbProperties.getString("csdb.username");
                 	String password = dbProperties.getString("csdb.password");
                 	String url = dbProperties.getString("csdb.url");
                 	String driver = dbProperties.getString("csdb.driverName");
                 	String dbName = dbProperties.getString("csdb.dbName");
                        //int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con1 = DriverManager.getConnection(url+dbName,userName,password); 
						String query = "select * from gsnetbranchcodemaster ORDER BY branchcode Asc";
						st = con1.createStatement();
 						rs = st.executeQuery(query);
 						int i=1;
						%>
							
							<%while(rs.next()){ 
							     if(i!=4)
							         {%>
								      <input type='checkbox'  name='gsnetBrCode[]' value="<%=rs.getString(2)%>"/><%=rs.getString(2)%>
    						         <%i++;}
							     else
							    	 {%><br />
							    	<%i=1;
							    	 }
    						}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con1.close();
					   }%>
                 </td>
              
     
  </tr>
  
    <tr >
     
          <td align="left"><font color=red>*</font>Division Name:	</td>
          <td colspan=2>
               <%       //Statement st1=null;
                        //ResultSet rs1=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con1 = DriverManager.getConnection(url+dbName,userName,password); 
						String query = "select * from gsntdivisionmaster ORDER BY divName Asc";
						st1 = con1.createStatement();
 						rs1 = st1.executeQuery(query);
						%>
								<%while(rs1.next()){%>
								<input type='checkbox' id='' name='gsnetDiv[]' value="<%=rs1.getString(2)%>"/><%=rs1.getString(2)%>
									
    						<%}%>
							
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con1.close();
					   }%>
                 </td>
              
     
  </tr>
    <tr >
     
          <td align="left"><font color=red>*</font>Primary Division:	</td>
            <td colspan=2>
            <%
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con1 = DriverManager.getConnection(url+dbName,userName,password); 
						String query = "select * from gsnetprimarydivmaster ORDER BY divName Asc";
						st2 = con1.createStatement();
 						rs2 = st2.executeQuery(query);
						%>
						    <%while(rs2.next()){%>
								 <input type='checkbox' id='' name='gsnetPdiv[]' value="<%=rs2.getString(2)%>"/><%=rs2.getString(2)%>
								<%}%>
							
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							con1.close();
					   }%>
                 </td>
              
     
  </tr>
  
  
   <tr>
      <td align="left"><font color=red>*</font>Role  :</td>
        <td><input type='checkbox' id='' name='role[]' value="USER"/>USER <input type='checkbox' name='role[]' value="MANAGER "/>MANAGER </td>
  </tr>
  
  
  
  
  
  
  
  
  <tr>
      <td align="left"><font color=red>*</font>Remarks  :</td>
      <td><textarea name="remarks" rows="3" cols="124" id="ta" maxlength="199" title="Remarks 200 characters"></textarea></td>
  </tr>
</table>
<!-- <font color=red><b><h3>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br /></h3>
</font>        -->
    <b><font color=red>*</font>Send To Branch IT:</b>
	<br />
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
 
          
        <tr> 
           <td> 
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
            <input  type="submit" value="SEND" name="save1" id="save1" onclick="return (validate() && ButtonClicked()) " />
        </div>
        <div id="buttonreplacement" style="display:none;">
	       <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	    </div> 
     </td>
     <td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
    <!--  <td style="font-size:1">&nbsp;&nbsp;<input  type="button"  value="UploadNExAS Form" onclick="window.location.href='NExASformUpload.jsp'"/> </td>
 -->
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
</body>

</html>