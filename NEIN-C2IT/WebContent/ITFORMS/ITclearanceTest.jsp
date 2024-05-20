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
<%@page import="CON2.ConnectionLMS" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
		<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
	 <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
	 <script language="javascript"   type="text/javascript" src="../js/jquery.1.11.1.min.js" ></script>
	<!-- Help Page pop up starts  -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script> -->
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->

<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
function backPage() {
	alert("Working");
	  //var initialPage = location.pathname;
	  location.replace('../adminHR.jsp');
	}
</script>
<script type="text/javascript">

$(document).ready(function() {
$('.check').click(function(){
    $("#text").val('');
    $(".check").each(function(){
        if($(this).prop('checked')){
            
            $("#text").val($("#text").val()+$(this).val()+">");
        }
    });
});
});
</script>
  <script language="javascript" type="text/javascript">
                 function validateHR1()
                 {
                	 var status = document.getElementById('idstatus1').value;
                		
                		//alert("status is  "+status);
                		if (status!="true")
                		  {
                		    alert("you are not authorized person");
                		
                		    return false;
                		  }
                	

                	 else
                	 return true;
                	    
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
        	  var ec=document.form.emp_code;
        	  var desg=document.form.designation;
        	  var roff=document.form.r_officer;
        	  var dresig=document.form.d_resignation;
        	  var rel=document.form.d_reliving;
        	  var req=document.form.requestOption;
        	  var grd=document.form.grade;
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
        	/*   var mail=document.form.mail;
        	  var desgS=document.form.desg;
        	  var empS=document.form.emp; */
        	  //r_document_hr,a_co_car_hr,a_calculator_hr,a_conn_mobile_hr,a_mobile_handset_hr
        	  var h1 = document.form.r_document_hr;
        	  var h2 = document.form.a_co_car_hr;
        	  var h3 = document.form.a_calculator_hr;
        	  var h4 = document.form.a_conn_mobile_hr;
        	  var h5 = document.form.a_mobile_handset_hr;
        	  var flg = document.form.flaggg; // Account local not found
        	  var chh = document.form.CheckValues //Mail id is check
        	 var bkColor = "red";
        	 
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
                fn.focus()
                return false
                }
                if (checkAddress(fn.value)==false){
                	fn.value=""
                alert("Invalid Name!");
                	fn.focus()
                return false;
                }
                if ((ec.value==null)||(ec.value=="")){
                    alert("Please Enter Employee Code!")
                    ec.style.bkColor = ec.style.backgroundColor;
                    ec.style.backgroundColor = bkColor;
                    ec.focus()
                    return false
                    }
                    if (checkAddress(ec.value)==false){
                    	ec.value=""
                    alert("Invalid Code!");
                    	ec.focus()
                    return false;
                    }
                    if ((desg.value==null)||(desg.value=="")||(desg.value=="Null")){
                        alert("Please Enter Designation!");
                        desg.style.bkColor = desg.style.backgroundColor;
                        desg.style.backgroundColor = bkColor;
                        desg.focus();
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
                            roff.focus()
                            return false
                            }
                            if (checkAddress(roff.value)==false){
                            	roff.value=""
                            alert("Invalid Name!");
                            	roff.focus()
                            return false;
                            } 
                            if ((dresig.value==null)||(dresig.value=="")){
                                alert("Please Enter Date Of Resignation!");
                                dresig.style.bkColor = dresig.style.backgroundColor;
                                dresig.style.backgroundColor = bkColor;
                                dresig.focus()
                                return false
                                }
                            if ((rel.value==null)||(rel.value=="")){
                                alert("Please Enter Date of Relieving!")
                                rel.style.bkColor = rel.style.backgroundColor;
           						rel.style.backgroundColor = bkColor;
                                rel.focus()
                                return false
                                }
                            if ((req[0].checked == false ) && (req[1].checked == false ) && (req[2].checked == false ) && (req[3].checked == false ) ){
                                alert("Select Status Of Employement!");
                                req[0].style.bkColor = req[0].style.backgroundColor;
                                req[0].style.backgroundColor = bkColor;
                                req[0].focus();
                                return false;
                                } 
                            if ((grd.value==null)||(grd.value=="")){
                                alert("Enter Grade of Employee!");
                                grd.style.bkColor = grd.style.backgroundColor;
                                grd.style.backgroundColor = bkColor;
                                grd.focus();
                                return false
                                } 
                            if (((h1.value==null)||(h1.value=="")) && ((h2.value==null)||(h2.value=="")) && ((h3.value==null)||(h3.value=="")) && ((h4.value==null)||(h4.value=="")) && ((h5.value==null)||(h5.value==""))){
                            	
                                alert("\t Enter Employee details \n \n Should be entered by HR local!");
                                h1.style.bkColor = h1.style.backgroundColor;
                                h1.style.backgroundColor = bkColor;
                                h1.focus();
                                return false
                                }
                            if ((l.value==null)||(l.value=="")){
                                alert("Enter Remarks!");
                                l.style.bkColor = l.style.backgroundColor;
                                l.style.backgroundColor = bkColor;
                                l.focus();
                                return false;
                                } //
                          /*   if ((flg.value=="0")){
                                alert("Mail Id not Found!");
                                flg.focus();
                                return false;
                                } */
                                //
                            if ((chh.value==null)||(chh.value=="")){
                                alert("SELECT  Mail ID!");
                                chh.style.bkColor = chh.style.backgroundColor;
                                chh.style.backgroundColor = bkColor;
                                chh.focus();
                                return false;
                                }
                       /*      if ((mail.value==null)||(mail.value=="")){
                                alert("Select Employee Name and Designation \n To Send Mail!");
                                desgS.style.bkColor = desgS.style.backgroundColor;
                                desgS.style.backgroundColor = bkColor;
                                empS.style.bkColor = empS.style.backgroundColor;
                                empS.style.backgroundColor = bkColor;
                                mail.focus();
                                return false
                                }  */
                                        
	 else
       return true;
}
        </script>
     <!--    <script language="javascript" type="text/javascript">
        
         function CheckLikes() {
        	 alert("ALert");
         var flg = document.form.flaggg; // Account local not found
		 var elem=document.forms['form'].elements['mailingCheck'];
		 
		 //alert("Element :"+elem);
		 len=elem.length-1;
		 chkvalue='';
		 for(i=0; i<=len; i++)
		 {
		 if(elem[i].checked)chkvalue=elem[i].value; 
		 }
		 if((flg=="0") && (chkvalue=='') )
		 {
		 alert('Please Check the Check box for selecting mail id:');
		 return false;
		 }
		 //alert ('Mail will be sent To: '+chkvalue);
		 return true;
	          
		}
        </script> -->
<%-- 
session.setMaxInactiveInterval(3*10);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "city" )==null||session.getAttribute( "desg" )==null)
	
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("adminlinkHR.jsp?msg="+msg);
}
--%>
<%--
session.setMaxInactiveInterval(2*6);

if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("city")=="null")
{	
	String msg=null;
	msg="Session__Time__Out \\n__ __ Login__Again";
	response.sendRedirect("adminlinkHR.jsp?msg="+msg);
}
System.out.println("session.getAttribute Nname :"+session.getAttribute("Nname"));
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
      function showEmpByDepart(str){ 
	// branch = $(this.branch).val(); 
	 var branch = document.getElementById("branch").value;
	 alert("BRanch "+branch);
	   if ((branch=="Null")||(branch=="")){
           alert("Please Select Branch!");
           branch.focus();
           return false;
           }
	
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="selEmpLms.jsp";  
                           url +="?count=" +str+"--"+branch;   
                              xmlHttp.onreadystatechange = stateChange2;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange2(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById('fname').innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
            


</script>
	<script language="javascript" type="text/javascript">  
	//emp_id,type_of_employee,emp_grade
     var xmlHttp;       
      var xmlHttp;    
      function getItem(str){ 
    	 // alert("getItem working"+str);
    	  var full_name = document.getElementById("fname").value;
    	 // alert("getItem working"+full_name);
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="selEmpUSerDetails.jsp";  
                           url +="?count=" +full_name;   
                              xmlHttp.onreadystatechange = stateChange3;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange3(){                 
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                                                     {   
			                                        	  // document.getElementById("ecode").innerHTML=xmlHttp.responseText;    
			                                        	 //  document.getElementById("type_of_employee").innerHTML=xmlHttp.responseText;    
			                                        	  // document.getElementById("grade").innerHTML=xmlHttp.responseText;  
			                                        	     document.getElementById("selectMailIDvalue").innerHTML=xmlHttp.responseText;  
			                                        	     var b = document.getElementById("selectMailIDvalue").value=xmlHttp.responseText;
			                                        /* 	     var ec = document.getElementById('ecode');
			                                        		    var on = document.getElementById('grade');
			                                        		    var soE = document.getElementById('requestOption'); */
			                                        	 	   // var se = document.getElementById('requestOption');
			                                        	     
			                                        	     var newValue = b.split('--');

			                                        	     var empCode = newValue[0];
			                                        	     var status = newValue[1];
			                                        	     var gradee = newValue[2];
			                                        	     var bran_name = newValue[3];
			                                        	     var department_name = newValue[4];
			                                        	     document.getElementById('ecode').value=empCode;
			                                        	     document.getElementById('grade').value=gradee;
			                                        	     document.getElementById('requestOption').value=status;
			                                        	     document.getElementById('hidden_branch').value=bran_name;
			                                        	     document.getElementById('hidden_depart').value=department_name;
			                                        	   
                                        	          } 
                                                              
                                                        } 
                                       </script>
    	<script language="javascript" type="text/javascript">  
    	 var xmlHttp;       
         var xmlHttp;    
         function getItemr(str){  
        	// alert("r officers");
        	 var ecode = document.getElementById("ecode").value;
          if (typeof XMLHttpRequest != "undefined"){    
            xmlHttp= new XMLHttpRequest();    
              }      else if (window.ActiveXObject){    
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                    }      if (xmlHttp==null){   
                       alert("Browser does not support XMLHTTP Request");    
                         return;     
                          }       var url="selEmpCodeRO.jsp";  
                              url +="?count=" +ecode;   
                                 xmlHttp.onreadystatechange = stateChangey;  
                                     xmlHttp.open("GET", url, true);   
                                        xmlHttp.send(null);    
                                          }      function stateChangey(){     
                                              if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                    document.getElementById("r_officer").innerHTML=xmlHttp.responseText;    
                                                         } 
                                                                 
               } 
                                       </script>      
                                       <script language="javascript" type="text/javascript">     
     var xmlHttp;       
      var xmlHttp;    
      function getSubBranch(str){    
    	  var sub_branch = document.getElementById("branch").value;
    	//  alert("Sub branch :"+sub_branch);
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="select_sub_branch.jsp";  
                           url +="?count=" +sub_branch;   
                              xmlHttp.onreadystatechange = stateChangeSB;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChangeSB(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("sub_branch").innerHTML=xmlHttp.responseText;    
                                                      } 
                                                              
            } </script>                             
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
                       }       var url="../selEmpFormsUsers.jsp";  
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
<!--                 <script language="javascript" type="text/javascript">  
function getItem(full_named)
{
	  //emp_id,type_of_employee,emp_grade
	  
alert("Called");
		  var item = full_named.value;
		 alert("All fields :"+item);
	    var ec = document.getElementById('emp_code');
	    var on = document.getElementById('grade');//owner_name
/* 	    var bn = document.getElementById('branch');
	    var dn = document.getElementById('department');
	    var sw = document.getElementById('scopeWork');
	    var d = document.getElementById('Designation');
	    var ro = document.getElementById('rofficer');
	    var cn = document.getElementById('cin_no') */
	    
         var divided = item.split("---");
		 var cin=divided[0];
		 var emp = divided[1];
	/* 	 var owner = divided[2];
		 var branch = divided[3];
		 var depart = divided[4];
		 var sow = divided[5];
		 var desg = divided[6];
		 var roo = divided[7]; */
		 
		 /* alert("cin: "+cin);
		 alert("emp : "+emp);
		 alert("owner : "+owner); */

		// cn.value = cin;
		 ec.value = emp;
		 on.value = owner;
		/*  bn.value = branch;
		 dn.value = depart;
		 sw.value = sow;
		 d.value = desg;
		 ro.value = roo; */
    
		 ec.value = selOption.innerHTML;  
		 
}
</script> -->
                      <script  type="text/javascript">
           function myFunctionHR()
            {
        	 
              var deis=document.form.i_desg;
              var admin2 = document.form.i_admin;
              var acc = deis.value;
              //alert("HR : "+acc);
              var hrrvalue = acc.match(/.*HR.*/);
             // alert("HRvalue with HR  : "+hrrvalue);
              var a =document.form.a_document_hr;
              var ar = document.form.r_document_hr;
              var b = document.form.a_co_car_hr;
              var br = document.form.r_co_car_hr;
              var c = document.form.a_calculator_hr;
              var cr = document.form.r_calculator_hr;
              var d = document.form.a_conn_mobile_hr;
              var dr = document.form.r_conn_mobile_hr;
              var e = document.form.a_mobile_handset_hr;
              var er = document.form.r_mobile_handset_hr;
              var f = document.form.a_id_card_hr;
              var fr = document.form.r_id_card_hr;
              var g = document.form.a_work_key_hr;
              var gr = document.form.r_work_key_hr;
              var h = document.form.a_any_other_hr;
              var hr = document.form.r_any_other_hr;
              var i = document.form.a_leave_card_hr;//SELECTION
              var ir = document.form.r_leave_card_hr;
              var j = document.form.a_resignation_letter_hr;//SELECTION
              var jr = document.form.r_resignation_letter_hr;
              var k = document.form.a_identity_card_hr;//SELECTION
              var kr = document.form.r_identity_card_hr;
                if (deis.value!=hrrvalue){
                  //  alert("If not equal!");//can not edit values
                   a.readOnly = true;ar.readOnly = true;b.readOnly = true;br.readOnly = true;
                   c.readOnly = true;cr.readOnly = true;d.readOnly = true;dr.readOnly = true;
                   e.readOnly = true;er.readOnly = true;f.readOnly = true;fr.readOnly = true;
                   g.readOnly = true;gr.readOnly = true;h.readOnly = true;hr.readOnly = true;
                   //i.readOnly = true;
                   i.disabled = true;
                   ir.readOnly = true;
                   //j.readOnly = true;
                   j.disabled = true;
                   jr.readOnly = true;
                   //k.readOnly = true;
                   k.disabled = true;
                   kr.readOnly = true;
                  
                    return false;
                    }
                else if ((deis.value==hrrvalue) || (admin2.value=="SuperAdmin")){
                   // alert("If Equallll!"); // can be entered
                    a.readOnly = false;ar.readOnly = false;b.readOnly = false;br.readOnly = false;
                    c.readOnly = false;cr.readOnly = false;d.readOnly = false;dr.readOnly = false;
                    e.readOnly = false;er.readOnly = false;f.readOnly = false;fr.readOnly = false;
                    g.readOnly = false;gr.readOnly = false;h.readOnly = false;hr.readOnly = false;
                    i.readOnly = false;ir.readOnly = false;j.readOnly = false;jr.readOnly = false;
                    k.readOnly = false;kr.readOnly = false;
                  
                     return false;
                     }
           	 else
                 return true;
                }
                </script>
                
                
            <!--     <script  type="text/javascript">
                function myFunctionAccounts()
                {
                  var deis=document.form.subDept;
                  var admin2 = document.form.i_admin;//i_desg
                  var itsup = document.form.i_desg;
                  var acc = deis.value;
                  var hrrvalue = acc.match(/.*Acc.*/);
                  var adminval = itsup.value;
                  var adminFinal = adminval.match(/.*SUPPORT.*/);
                  var a =document.form.a_document_ac;
                    var ar = document.form.r_document_ac;
                    if ((deis.value!=hrrvalue)||(itsup.value==adminFinal)){
                       // alert("If not equal!");//can not edit values
                        a.readOnly = true;ar.readOnly = true;
                        return false;
                        }
                    else if ((deis.value==hrrvalue) || (admin2.value=="SuperAdmin")){
                        // alert("If Equallll!"); // can be entered
                       a.readOnly = false;ar.readOnly = false;
                         return false;
                         }
               	 else
                     return true;
                    }
                </script> -->
               <!--  <script  type="text/javascript">
            
                
                
                function myFunctionVal()
                {
                var deis=document.form.i_desg;
                var admin = document.form.i_admin;
              //s.match(/hello.*/)
              var hrr = deis.value;
             // alert("HR"+hrr);
              var hrrvalue = hrr.match(/.*IT.*/);
            //  alert("VALUE OF HR "+hrrvalue);
                var a =document.form.a_model;
                var ar = document.form.r_model;
                var b = document.form.a_model_info;
                var br = document.form.r_model_info;
                var c = document.form.a_data_card;
                var cr = document.form.r_data_card;
                var d = document.form.a_email;
                var dr = document.form.r_email;
                var e = document.form.a_newins;
                var er = document.form.r_newins;
                var f = document.form.a_domain;
                var fr = document.form.r_domain;
                var g = document.form.a_mobile_model;
                var gr = document.form.r_mobile_model;
                var h = document.form.a_mobile_no;
                var hr = document.form.r_mobile_no;
                var i = document.form.a_access_card
                var ir = document.form.r_access_card;
                var j = document.form.a_drive;
                var jr = document.form.r_drive;
                var k = document.form.a_other_asset;
                var kr = document.form.r_other_asset;
                
                
                //if ((deis.value!=null)&&((deis.value=="IT SUPPORT") || (admin.value=="SuperAdmin"))){
                if (deis.value!=hrrvalue){
                   // alert("Please Enter Designation!");//can not edit values
                   a.readOnly = true;ar.readOnly = true;b.readOnly = true;br.readOnly = true;
                   c.readOnly = true;cr.readOnly = true;d.readOnly = true;dr.readOnly = true;
                   e.readOnly = true;er.readOnly = true;f.readOnly = true;fr.readOnly = true;
                   g.readOnly = true;gr.readOnly = true;h.readOnly = true;hr.readOnly = true;
                   i.readOnly = true;ir.readOnly = true;j.readOnly = true;jr.readOnly = true;
                   k.readOnly = true;kr.readOnly = true;
                    return false;
                    }
                else if ((deis.value==hrrvalue) || (admin.value=="SuperAdmin")){
                    // alert("Please Enter Designation!");//can be edit values
                    a.readOnly = false;ar.readOnly = false;b.readOnly = false;br.readOnly = false;
                    c.readOnly = false;cr.readOnly = false;d.readOnly = false;dr.readOnly = false;
                    e.readOnly = false;er.readOnly = false;f.readOnly = false;fr.readOnly = false;
                    g.readOnly = false;gr.readOnly = false;h.readOnly = false;hr.readOnly = false;
                    i.readOnly = false;ir.readOnly = false;j.readOnly = false;jr.readOnly = false;
                    k.readOnly = false;kr.readOnly = false;
                     return false;
                     }
           	 else
                 return true;
                }
                </script> -->
</head>

<body >
<form  method="post" name="form" action="ITclearanceBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null,subDept=null; %>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
subDept = (String) session.getAttribute("subDept");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("subDept Name :"+subDept);
System.out.println("------------------------------------");

%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<textarea id="selectMailIDvalue" name="selectMailIDvalue" rows="1" cols="30" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="90%"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;" colspan="4"><center><font size="3" >
		<b><label >
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label>
		</b></font></center>
		</td> 
		</tr>
	<tr style="visibility: hidden;display: none;"><td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="text" name="i_admin" value="<%=admin%>" />
		<input type="text" name="subDept" value="<%=subDept%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
	    <input type="text" name="branch" value="" id="hidden_branch"/> 
		<input type="hidden" name="depart" value="" id="hidden_depart"/>
		</td>
		
	</tr>
		<tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<td width="165"><%= po_date.format(new java.util.Date())%></td>
		</tr>
</table>
<table width="90%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
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
Connection cn1 = null,cn3=null,cn4=null,cn4r=null,cnD=null;
Connection cn2=null;
Statement st1= null,st2=null,st3=null,st4=null,st4r=null,stD=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs4r=null,rsD=null;
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
String tot_val=null;
try{
cn1 = conlms.getConnectionlms();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select branch_id,branch_name from branchmaster ORDER BY branch_name Asc"); 

cn2 = conlms.getConnectionlms();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select department_id,department_name from department ORDER BY department_name Asc"); 

cnD = conlms.getConnectionlms();
stD=cnD.createStatement();
rsD = stD.executeQuery("SELECT emp_id,type_of_employee,emp_grade FROM `user` ORDER BY full_name Asc"); 


cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

cn4r = con.getConnection2();
st4r =cn4r.createStatement();
rs4r = st4r.executeQuery("select DISTINCT Nname from  formuser_master WHERE Npost <> 'IT SUPPORT' AND Npost <> 'SOFTWARE ENGINEER' AND Npost <> 'EXECUTIVE' ORDER BY Nname Asc"); 
%>
<%--
String new_id = null;
int id=0;
String id2=null;
cn3 = con.getConnection2();
st3=cn3.createStatement();
//rs3 = st3.executeQuery("SELECT max(idextend),substr(form1_it_clearance.form1_no,18,4),substr(form1_it_clearance.form1_no,1,17) From form1_it_clearance WHERE '"+b_no+"'=substr(form1_it_clearance.form1_no,15,2) GROUP BY form1_no");
rs3 = st3.executeQuery("SELECT max(idextend) FROM form1_it_clearance WHERE form1_no IN(SELECT form1_no FROM form1_it_clearance LEFT JOIN branch_master b ON(substr(form1_no,12,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY form1_no)");
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
 			id2="NEIN/CS/IT/"+b_no+"-";
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
		 new_id = "NEIN/CRM/S/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
--%>	 
		
	<table width="100%" align="center">
	
<tr>
<td  style="text-align: right;" width="180">Branch :</td>
<td style="text-align:left;" width="220" colspan="3"><!-- <select id="branch"><option value="">Select</option><option>Testing</option></select></td> --> 
 <select name="branch" id="branch" style="font-size : 8pt;width: 190px" >
					<option value="Null" style="background: lightgrey;" > ---Select---</option>
					<%while(rs1.next()){ %>
					<option value="<%=rs1.getString("branch_id")%>"> <%=rs1.getString("branch_name")%> </option> 
					<%} %> </select>
					</td>
</tr>					
<tr>
<td  style="text-align: right;" width="180">Sub Branch :</td>
<td style="text-align:left;" width="220" ><!-- <select id="branch"><option value="">Select</option><option>Testing</option></select></td> --> 
<%--  <select   name="branch"  id="hidden_branch" style="font-size : 8pt;width: 190px" >
					<option value="Null" style="background: lightgrey;" > ---Select---</option>
					<%while(rs1.next()){ %>
					<option value="<%=rs1.getString("branch_id")%>"> <%=rs1.getString("branch_name")%> </option> 
					<%} %> </select> --%>
					<div id='sub_branch'>      
                                              <select name="sub_branch" onclick="getSubBranch(this);" style="font-size : 8pt;width: 190px">   
                                                   <option value='-1'></option>  
                                                         </select>     
                                                            </div>
					</td>
<td  style="text-align: right;" width="180">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;" width="220"><!-- <select id="branch"><option value="">Select</option><option>Testing</option></select></td> --> 
 <select   onchange="showEmpByDepart(this.value)" id="hiderow" style="font-size : 8pt;width: 190px">
					<option value="Null" style="background: lightgrey;" > ---Select---</option>
					<%while(rs2.next()){ %>
					<option value="<%=rs2.getString("department_id")%>"> <%=rs2.getString("department_name")%> </option> 
					<%} %> </select>
					</td> 
</tr>
<tr>
<td  style="text-align: right;" width="180">Full Name : </td>
<td style="text-align:left;" width="220">     
                                              <select name='full_name' id="fname" class="a" onchange="getItem(this);" style="font-size : 8pt;width: 190px">   
                                                <!--    <option value='-1' class="a"></option>   -->
                                                <%while(rsD.next()){ %>
                                                <%tot_val = rsD.getString("emp_id")+"---"+rsD.getString("type_of_employee")+"---"+rsD.getString("emp_grade");%>
					                            <option  value="<%=tot_val%>"></option>
                                                     <%} %>    </select>     
                                                           
                     <!-- <input type="text"  name="full_name" id="fname" size="28" maxlength="44" /> --></td>
<td  style="text-align: right;" width="180">Employee Code :</td>
<td style="text-align:left;" width="220"><input type="text" name="emp_code" id="ecode" size="28" value="" maxlength="15" readonly="readonly" style="font-size : 8pt;width: 190px" /></td>
</tr>

<tr>
<td  style="text-align: right;" width="180">Designation :</td>
<td style="text-align:left;" width="220"><!-- <select id="design"><option value="">Select</option><option>Testing</option></select> -->
<select name="designation" id="hiderow" style="font-size : 8pt;width: 190px">
					<option value="Null" style="background: lightgrey;" > ---Select---</option>
					<%while(rs4.next()){ %>
					<option> <%=rs4.getString(1)%> </option> 
					<%} %> </select>


<!-- <a href="../NewDesignation.jsp?msg=1"  onclick="return popitup('../NewDesignation.jsp?msg=1')">New</a> -->
</td>

<td  style="text-align: right;" width="180">Reporting Officer  :</td>
<td style="text-align:left;" width="220"><!-- <input type="text" name="r_officer" id="rofficer" size="28" maxlength="25" onclick="getItemr(this);"/> -->

<%--  <select name="r_officer" id="rofficer" style="font-size : 8pt;width: 190px">
					<option value="Null" style="background: lightgrey;" > ---Select---</option>
					<%while(rs4r.next()){ %>
					<option> <%=rs4r.getString(1)%> </option> 
					<%} %> </select> --%> 
					 <div id='r_officer'>      
                                              <select name="r_officer" onclick="getItemr(this);" style="font-size : 8pt;width: 190px">   
                                                   <option value='-1'></option>  
                                                         </select>     
                                                            </div>  
</td>


</tr>
<tr>
<td  style="text-align: right;" width="180">Date Of Resignation :</td>
<td style="text-align:left;" width="220">

<input type="text"  style="width: 6em"  name="d_resignation" id="idCalendar" onclick="showCalendarControl(this)" onkeypress="showCalendarControl(this)" readonly="readonly" />
		 <img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar'))">					        
		</img>
</td>

<td  style="text-align: right;" width="180">Date of Relieving / Relieved:</td>
<td style="text-align:left;" width="220">
<input type="text"  style="width: 6em"  name="d_reliving" id="idCalendar2" onclick="showCalendarControl(this)" onkeypress="showCalendarControl(this)" readonly="readonly" />
		<img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></img>
		</td> 					        
</tr>




<tr>
<td  style="text-align: right;" width="180">Date Of Relieving requested by the employee :</td>
<td style="text-align:left;" width="220">

<input type="text"  style="width: 6em"  name="d_new_relieved_request" id="idCalendar3" onclick="showCalendarControl(this)" onkeypress="showCalendarControl(this)" readonly="readonly" />
		 <img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar3'))">					        
		</img>
</td>

<td  style="text-align: right;" width="180">Date of Relieving as per co. policy:</td>
<td style="text-align:left;" width="220">
<input type="text"  style="width: 6em"  name="d_new_reliving_co" id="idCalendar4" onclick="showCalendarControl(this)" onkeypress="showCalendarControl(this)" readonly="readonly" />
		<img src="../images/cal.gif" id="idForDay"  name="imgForDate" width="12em" height="12em"  onclick="showCalendarControl(document.getElementById('idCalendar4'))"></img>
		</td> 					        
</tr>
<tr>
	  <td align="right" width="180">Grade :</td>
<td style="font-weight:bold;font-style:italic;" width="220" > 
     <input style="" type ="text" name = "grade" value ="" id="grade" size="28" maxlength="44" readonly="readonly"/></td> 				        
</tr>

<tr>
<td align="right" width="180">Status Of Employement  :</td>
<td style="font-weight:bold;font-style:italic;" colspan="3" > 
     <input type ="text"  name = "requestOption" value ="" id="requestOption" readonly="readonly"/><!-- Probationary

     <input type ="radio" name = "requestOption" value ="Confirmation" />Confirmation
     <input type ="radio" name = "requestOption" value ="Trainee" />Trainee
     <input type ="radio" name = "requestOption" value ="Contract" />Contract --></td>
 <!--  <td align="right" width="180">Grade :</td>
<td style="font-weight:bold;font-style:italic;" width="220" > 
     <input style="" type ="text" name = "grade" value ="" id="" size="28" maxlength="44"/></td>  -->
</tr>
</table>
<br>
<%--
String DesignationSc = desg;
String itsupport = "IT SUPPORT";
if((DesignationSc!=null) && (!DesignationSc.matches(itsupport))) //desg!=IT SUPPORT
{--%>
<label><center> <font color="black"><u><b>ONLY FOR HR DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="100%" align="center">
<tr>

<td class="it1" align="center">1  </td>


<td class="it2" style="text-align: right;width:23%;"> All document taken overby:</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_document_hr" id="mod" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_document_hr" id="rem1" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>


<td class="it2" style="text-align: right;width:23%;">Company Car :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_co_car_hr" id="dc" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>


<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_co_car_hr" id="rem2" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>



<td class="it2" style="text-align: right;width:23%;">Calculators :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_calculator_hr" id="eid" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_calculator_hr" id="rem3" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>



<td class="it2" style="text-align: right;width:23%;"> Connection surrendered :</td>
<!-- <td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_conn_mobile_hr" id="nid" maxlength="44" placeholder="Mobile Connection" readonly="readonly"  onfocus="myFunctionHR();"/></td> -->
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em"  name="a_conn_mobile_hr" id="nid" onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_conn_mobile_hr" id="rem4" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>



<td class="it2" style="text-align: right;width:23%;">Mobile handset :</td>
<!-- <td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_mobile_handset_hr" id="du" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td> -->
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em"  name="a_mobile_handset_hr" id="du" onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_mobile_handset_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>



<td class="it2" style="text-align: right;width:23%;">ID card :</td>
<!-- <td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_id_card_hr" id="du" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td> -->
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em"  name="a_id_card_hr" id="du" onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_id_card_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>



<td class="it2" style="text-align: right;width:23%;">Workstation keys :</td>
<!-- <td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_work_key_hr" id="du" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td> -->
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em"  name="a_work_key_hr" id="du" onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_work_key_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>



<td class="it2" style="text-align: right;width:23%;">Any Other:</td>
<!-- <td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_any_other_hr" id="du" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td> -->
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em"  name="a_any_other_hr" id="du" onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_any_other_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>


<tr>
<td class="it1" align="center">9  </td>



<td class="it2" style="text-align: right;width:23%;"> Leave card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em"  name="a_leave_card_hr"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_leave_card_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>


<tr>
<td class="it1" align="center">10  </td>



<td class="it2" style="text-align: right;width:23%;">Resignation letter enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em" name="a_resignation_letter_hr" readonly="readonly"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_resignation_letter_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>


<tr>
<td class="it1" align="center">11  </td>



<td class="it2" style="text-align: right;width:23%;">Identity card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<select style="width: 5em" name="a_identity_card_hr" readonly="readonly"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="NA">NA</option>
</select>

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_identity_card_hr" id="rem5" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>
<!-- <tr>
<td colspan="5">
<textarea name="a_remarks" rows="3" cols="140" id="ta" maxlength="199" placeholder="HR / ADMIN REMARKS"></textarea>
</td>
</tr> -->
</table>
<br>

<label><center> <font color="black"><u><b>ONLY FOR A / C DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="100%" align="center">
<tr>

<td class="it1" align="center" style="width:3%;"> 1   </td>


<td class="it2" style="text-align: right;width:23%;"> Accounts - Advance / Imprest Balance:</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_document_ac" id="mod" maxlength="44"  readonly="readonly"  onfocus="myFunctionAccounts();" /></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_document_ac" id="rem1" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionAccounts();" /></td>
</tr>
<!-- <tr>
<td colspan="5">
<textarea name="account_remarks" rows="3" cols="140" id="ta" maxlength="199" placeholder="ACCOUNT REMARKS"></textarea>
</td>
</tr> -->
</table>

<%--}else{ --%>
<br>

<label><center> <font color="black"><u><b>ONLY FOR IT DEPT. : ASSET PROVIDED</b></u></font></center> </label> 
<br>
<table id="table3" align="center" width="100%" align="center" onclick="">
<tr>

<td class="it1" align="center">1  </td>


<td class="it2" style="text-align: right;width:23%;"> Laptop/Desktop Model :</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_model" id="id_d_mod" maxlength="44" readonly="readonly"  onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_model" id="rem1" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionVal();"/></td>
</tr>
<tr>

<td class="it1" align="center">1a  </td>


<td class="it2" style="text-align: right;width:23%;"> Password info passed on to:</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_model_info" readonly="readonly" id="mod_info"  maxlength="44" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_model_info" id="rem1_info" size="40" maxlength="44" readonly="readonly"  onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>


<td class="it2" style="text-align: right;width:23%;">Data Card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_data_card" id="dc" readonly="readonly" maxlength="44" onfocus="myFunctionVal();"/></td>


<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_data_card" id="rem2" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>



<td class="it2" style="text-align: right;width:23%;">Email Id :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_email" id="eid" readonly="readonly" maxlength="44" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_email" id="rem3" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>



<td class="it2" style="text-align: right;width:23%;">Newins Id :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_newins" id="nid" readonly="readonly" maxlength="44" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_newins" id="rem4" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>



<td class="it2" style="text-align: right;width:23%;">Domain User :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_domain" id="du" readonly="readonly" maxlength="44" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_domain" id="rem5" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>



<td class="it2" style="text-align: right;width:23%;">Mobile Phone Model :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_mobile_model" id="mpd" readonly="readonly" maxlength="44" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="r_mobile_model" id="rem6" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>



<td class="it2" style="text-align: right;width:23%;">Mobile No :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_mobile_no" id="mno" readonly="readonly" maxlength="24" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_mobile_no" id="rem7" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>



<td class="it2" style="text-align: right;width:23%;">Access Card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_access_card" id="acard" readonly="readonly" maxlength="24" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_access_card" id="rem8" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>

<tr>
<td class="it1" align="center">9  </td>



<td class="it2" style="text-align: right;width:23%;">Hard Disk/Pen Drive :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_drive" id="hp" readonly="readonly" maxlength="24" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_drive" id="rem8" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>


<tr>
<td class="it1" align="center">10  </td>



<td class="it2" style="text-align: right;width:23%;">Any Other Asset :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_other_asset" id="asset1" readonly="readonly" maxlength="24" onfocus="myFunctionVal();"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_other_asset" id="rem8" size="40" maxlength="44" readonly="readonly" onfocus="myFunctionVal();"/></td>
</tr>
<!-- <tr>
<td colspan="5"><textarea name="a_remarks" rows="3" cols="140" id="ta" maxlength="199" placeholder="IT REMARKS"></textarea></td>
</tr> -->
</table>

<%--} --%>
<br />
<table id="it" align="center">
<tr><td id="ita">Remarks(Above Assets Are Handed Over To)</td></tr>
<tr><td><textarea name="a_remarks" rows="3" cols="110" id="ta" maxlength="199"></textarea></td></tr>
</table> 
<br />
<p>HR Department Need to send back to Accounts department ( local )</p>  
		<!-- <label style="font-style:italic;font-weight:bold;  ">Send To: </label> -->
		<!-- <b>Send To:</b> -->
		
	<table width="100%" border="1" cellspacing="0" cellpadding="0" align="left">  
<% 

cn5 = con.getConnection2();
st5 = cn5.createStatement();

%>

   
                                    
                     <%--            
                       <select name="desg" onchange="showEmp(this.value)" style="font-size : 8pt">      
                       <option value="none">Select</option>
                          
                          <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                       cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                           st5 = cn5.createStatement();  
                           System.out.println("BRANCH NUMBER FOR SELECTION : "+b_no);
                          // rs5 = st5.executeQuery("Select * from desg");
                          // rs5 = st5.executeQuery("Select DISTINCT d.DESIGNATION,l.city from desg d,login l INNER JOIN branch_master b ON (l.city=b.b_name) WHERE  d.DESIGNATION=l.post  AND '"+b_no+"'=b.b_no ORDER BY d.DESIGNATION ASC");
                           //rs5 = st5.executeQuery("Select DISTINCT DESIGNATION from desg ORDER BY DESIGNATION ASC");
                           rs5 =  st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO) WHERE SUBSTR(emp.e_city,-2,2)='"+b_no+"' AND desg.DESIGNATION <> '"+desg+"' ");
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
  <label style="float: left;" id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" /> --%>
       
       
       <tr>
<td align="left" width="">

	<!-- 	<label style="font-style:italic;font-weight:bold;">Send To: </label> -->
	<b>Send To:</b><!-- </td><td width="5" align="center">	 -->
		<%
		int flag=0;
		String Mailing=null,Nname=null,Npost=null;
		System.out.println("CITY ------------------------:"+city);
	/* 	String substring = city.substring(Math.max(city.length() - 2, 0));
		System.out.println("CITY ------------------------:"+city); */
		  //rs5 = st5.executeQuery("SELECT Nname,Npost,Nmail FROM formuser_master WHERE NpostingCo LIKE '%"+city+"%' AND subDept LIKE '%Accounts%'"); 
		  rs5 = st5.executeQuery("SELECT Nname,Npost,Nmail FROM formuser_master WHERE Substring(NpostingCo,-2)='"+b_no+"' AND subDept LIKE '%Accounts%'");
		  while(rs5.next())
		  {
			  flag=1;
			  Mailing=rs5.getString("Nmail");
			  Nname=rs5.getString("Nname");
			  Npost =rs5.getString("Npost");
			  String fullSendingDetails = Nname +","+Npost +","+Mailing;
			  System.out.println("fullSendingDetails ------------------------------------------------------------------:"+fullSendingDetails);
		%>
		
	
		<input class="check" type="radio" name="mailingCheck" value="<%=fullSendingDetails%>" /><%=Mailing%>
		
	
		
		<%}%> 
		<input type="hidden" name="CheckValues" id="text" value=""/> 
		<font color="red" size="2">
				           <%
				            if(flag==0){
				            	
				            int flagg =0;
				            	out.println("Sorry...! Account Local does not exist for '"+city+"' location");
				            	System.out.println("query not equal to flag q");
				            	%>
				            	
				            <input type="hidden" name="flaggg" value="<%=flagg%>"/>	
				           <% }
				 %></font>
		<%-- <input type="hidden" name="NONITName" value="<%=NONITName%>"/>
		<input type="checkbox" name="NONITmailing" value="<%=NONITmailId%>"/><%=NONITmailId%>  --%>

	</td>
	</tr>

       <tr>
       <td>
       <label><b>Note:</b><font>Date Difference will be calculated Automatically</font> </label>    
       </td>
       </tr>                           
</table>  
</br>
</center>                                                                   
   </td>
		
	</tr>
</table> 

 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
<!--      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.history.go(-1); return false;"/> </td> -->
<%--if(desg=="HR"){                                                             CheckLikes()      &&--%>
      <td style="size:1"><div id="formsubmitbutton"> <input  type="submit" value="SEND" name="save1" id="save1" onclick="return ( validate() && ButtonClicked())" />
       </div>
      <div id="buttonreplacement" style="display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
      </td><%--} --%>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	<td style="size:1">&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="APPROVAL ROUTINE" />
   	</td>
   <!-- 	<td style="size:1">
     <input type="button" name="button" style="size:1;font-size: 1.1em;" type="button"  value="BACK" id="button" onclick="window.location.href='../adminHR.jsp'" />
     <input type="button" name="button" style="size:1;font-size: 1.1em;" type="button"  value="BACK" id="button" onclick="return backPage();" />
           	  <input style="size: 1;" title="Back Page"  value="BACK" type="button" onclick="window.location.href='../adminHR.jsp'" />
      </td> -->
      <td><a href="ITclearanceHelp.jsp" onclick="return popitup('ITclearanceHelp.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
         	     	           <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='../adminHR.jsp'"/> </td>
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
<label style="font-size: 30px;">&#x21d3;</label>
<br />
<label>A/C (Local)</label>
<br />
<label style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (Local)</label>
<br />
<label style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>Reporting Officer</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>VP/MD</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT(HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>ACCOUNT (HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (HO)</label>
<br />
<br />
<br />
</div>
</form>	

</body>

</html>