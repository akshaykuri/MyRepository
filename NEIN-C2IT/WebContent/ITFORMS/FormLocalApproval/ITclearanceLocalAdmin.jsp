<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="CON2.Connection2"%>
<%@page import="CON2.CurrentTime"%>
<%@ include file="../../banner.jsp"%>
<%@ include file="../../../Session/NormalAdminSessionInSide2.jsp"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<jsp:useBean id="currentTime" class="CON2.CurrentTime" />
<jsp:useBean id="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Check List</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />

<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css"
	title="style" />

<script language="javascript" type="text/javascript"
	src="../../js/Calendar.js"></script>
<script language="javascript" type="text/javascript"
	src="../../js/jquery.1.11.1.min.js"></script>
<!-- Help Page pop up starts  -->

<script language="javascript" type="text/javascript"
	src="../../js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css"
	title="style" />
<script language="javascript" type="text/javascript"
	src="../../js/FormsHelp.js"></script>
<!-- Help Page pop up ends -->

<script language="javascript" type="text/javascript">
function onloadCheck()
{
	var frm=document.forms[0],flds=[frm['idaa'],frm['idaa2']];
	for (var z0=0;z0<flds[0].length;z0++)
	         {
	   		   	if(flds[0][z0].value=="Initiator"||flds[0][z0].value=="Approved")
	   		   		{
	   		   		flds[1][z0].style.display = 'none';
	   		   		}
	   		  }
}
</script>
<script type="text/javascript">
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
             return true;
            }
                </script>


<script type="text/javascript">
           function myFunctionAccounts()
              {//alert("here "+val);
              var deis=document.form.subDept;
              var admin2 = document.form.i_admin;//i_desg
              var itsup = document.form.i_desg;
              var acc = deis.value;
              var hrrvalue = acc.match(/.*Acc.*/);
              var adminval = itsup.value;
              var adminFinal = adminval.match(/.*SUPPORT.*/);
              var a =document.form.a_document_ac;
              var ar = document.form.r_document_ac;
              var levelno = document.form.levelno1; 
             // alert("here "+levelno.value);
              if (levelno.value!="1")
                      {
                      a.readOnly = true;ar.readOnly = true;
                      return false;
                      }
                else if (levelno.value=="1")
                      {
                      a.readOnly = false;ar.readOnly = false;
                      return false;
                      }
           	      else
                      return true;
                 }
                </script>
<script type="text/javascript">
         function myFunctionVal()
                {
                var deis=document.form.i_desg;
                var admin = document.form.i_admin;
              	var hrr = deis.value;
              	var hrrvalue = hrr.match(/.*IT.*/);
                var a =document.form.a_model;
                var ar = document.form.r_model;
                var b = document.form.a_model_info;
                var br = document.form.r_model_info;
                var c = document.form.a_datacard;
                var cr = document.form.r_datacard;
                var d = document.form.a_email;
                var dr = document.form.r_email;
                var g = document.form.a_mobile_model;
                var gr = document.form.r_mobile_model;
                var h = document.form.a_mobile_no;
                var hr = document.form.r_mobile_no;
                var hcomp = document.form.a_compmobile_no;
                var hrcomp = document.form.r_compmobile_no;
                var f = document.form.a_domain;
                var fr = document.form.r_domain;
                var i = document.form.a_access_card
                var ir = document.form.r_access_card;
                var e = document.form.a_newins;
                var er = document.form.r_newins;
                var k1 = document.form.a_nexas;
                var kr1 = document.form.r_nexas;
                var j = document.form.a_drive;
                var jr = document.form.r_drive;
                var k = document.form.a_other_asset;
                var kr = document.form.r_other_asset;
                var air = document.form.airLin;
                var rair = document.form.r_airLin;

                var asop = document.form.sophos;
                var rsop = document.form.r_sophos;
                var afor = document.form.forti;
                var rfor = document.form.r_forti;
                
                //VPN
                var vp = document.form.vpn;
                var rvp = document.form.r_vpn;
                
                var sa = document.form.a_shared_card
                var sr = document.form.r_shared_card;
                var ina= document.form.a_internet;
                var inr= document.form.r_internet;
                var gsa = document.form.a_gsnet;
                var gsr = document.form.r_gsnet;
                var inta = document.form.a_internal;
                var intr = document.form.r_internal;
                var dsa= document.form.a_dsc;
                var dsr= document.form.r_dsc;
                var gla= document.form.a_glow;
                var glr= document.form.r_glow;
                
                var levelno = document.form.levelno1; 
                var levelno2 = document.form.levelno2;
                if (levelno.value!="2"){
                   a.readOnly = true;ar.readOnly = true;b.readOnly = true;br.readOnly = true;
                   c.readOnly = true;cr.readOnly = true;d.readOnly = true;dr.readOnly = true;
                   e.readOnly = true;er.readOnly = true;f.readOnly = true;fr.readOnly = true;
                   g.readOnly = true;gr.readOnly = true;h.readOnly = true;hr.readOnly = true;
                   i.readOnly = true;ir.readOnly = true;j.readOnly = true;jr.readOnly = true;
                   k.readOnly = true;kr.readOnly = true;k1.readOnly = true;kr1.readOnly = true;
                   air.readOnly = true;rair.readOnly = true;vp.readOnly = true;rvp.readOnly = true;
                   hcomp.readOnly = true;hrcomp.readOnly = true;sa.readOnly = true;sr.readOnly = true;
                   ina.readOnly = true;inr.readOnly = true;gsa.readOnly = true;gsr.readOnly = true;
                   dsr.readOnly = true;dsa.readOnly = true;intr.readOnly = true;inta.readOnly = true;
                   gla.readOnly = true;glr.readOnly = true;
                   asop.readOnly = true;rsop.readOnly = true;afor.readOnly = true;rfor.readOnly = true;
                   return false;
                    }
                else if (levelno2.value=="0"){
                     a.readOnly = true;ar.readOnly = true;b.readOnly = true;br.readOnly = true;
                     c.readOnly = true;cr.readOnly = true;d.readOnly = true;dr.readOnly = true;
                     e.readOnly = true;er.readOnly = true;f.readOnly = true;fr.readOnly = true;
                     g.readOnly = true;gr.readOnly = true;h.readOnly = true;hr.readOnly = true;
                     i.readOnly = true;ir.readOnly = true;j.readOnly = true;jr.readOnly = true;
                     k.readOnly = true;kr.readOnly = true;k1.readOnly = true;kr1.readOnly = true;
                     air.readOnly = true;rair.readOnly = true;vp.readOnly = true;rvp.readOnly = true;
                     hcomp.readOnly = true;hrcomp.readOnly = true;sa.readOnly = true;sr.readOnly = true;
                     ina.readOnly = true;inr.readOnly = true;gsa.readOnly = true;gsr.readOnly = true;
                     dsr.readOnly = true;dsa.readOnly = true;intr.readOnly = true;inta.readOnly = true;
                     gla.readOnly = true;glr.readOnly = true;
                     asop.readOnly = true;rsop.readOnly = true;afor.readOnly = true;rfor.readOnly = true;
                     return false;
                      }
                else if(levelno.value=="2")
                    {
                    a.readOnly = false;ar.readOnly = false;b.readOnly = false;br.readOnly = false;
                    c.readOnly = false;cr.readOnly = false;d.readOnly = false;dr.readOnly = false;
                    e.readOnly = false;er.readOnly = false;f.readOnly = false;fr.readOnly = false;
                    g.readOnly = false;gr.readOnly = false;h.readOnly = false;hr.readOnly = false;
                    i.readOnly = false;ir.readOnly = false;j.readOnly = false;jr.readOnly = false;
                    k.readOnly = false;kr.readOnly = false;k1.readOnly = false;kr1.readOnly = false;
                    air.readOnly = false;rair.readOnly = false;vp.readOnly = false;rvp.readOnly = false;
                    hcomp.readOnly = false;hrcomp.readOnly = false;sa.readOnly = false;sr.readOnly = false;
                    ina.readOnly = false;inr.readOnly = false;gsa.readOnly = false;gsr.readOnly = false;
                    dsr.readOnly = false;dsa.readOnly = false;intr.readOnly = false;inta.readOnly = false;
                    gla.readOnly = false;glr.readOnly = false;
                    asop.readOnly = false;rsop.readOnly = false;afor.readOnly = false;rfor.readOnly = false;
                     return false;
                     }
           	 else{
           		 return true;
           	 }
                }
                
                
                
                function ITmangerfields()
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
                var c = document.form.a_datacard;//a_datacard
                var cr = document.form.r_datacard;
                var d = document.form.a_email;
                var dr = document.form.r_email;
                var g = document.form.a_mobile_model;
                var gr = document.form.r_mobile_model;
                var h = document.form.a_mobile_no;
                var hr = document.form.r_mobile_no;
                var hcomp = document.form.a_compmobile_no;
                var hrcomp = document.form.r_compmobile_no;
                var f = document.form.a_domain;
                var fr = document.form.r_domain;
                var i = document.form.a_access_card
                var ir = document.form.r_access_card;
                var e = document.form.a_newins;
                var er = document.form.r_newins;
                var j = document.form.a_drive;
                var jr = document.form.r_drive;
                var k = document.form.a_other_asset;
                var kr = document.form.r_other_asset;
                var levelno = document.form.levelno1; 
                
                var air = document.form.airLin;
                var rair = document.form.r_airLin;

                var asop = document.form.sophos;
                var rsop = document.form.r_sophos;
                var afor = document.form.forti;
                var rfor = document.form.r_forti;
           
                //VPN
                var vp = document.form.vpn;
                var rvp = document.form.r_vpn;

                var k1 = document.form.a_nexas;
                var kr1 = document.form.r_nexas;
                var sa = document.form.a_shared_card
                var sr = document.form.r_shared_card;
                var ina= document.form.a_internet;
                var inr= document.form.r_internet;
                var gsa = document.form.a_gsnet;
                var gsr = document.form.r_gsnet;
                var inta = document.form.a_internal;
                var intr = document.form.r_internal;
                var dsa= document.form.a_dsc;
                var dsr= document.form.r_dsc;
                var gla= document.form.a_glow;
                var glr= document.form.r_glow;
                
                //if ((deis.value!=null)&&((deis.value=="IT SUPPORT") || (admin.value=="SuperAdmin"))){
                if (levelno.value!="8"){
                   // alert("Please Enter Designation!");//can not edit values
                   a.readOnly = true;ar.readOnly = true;b.readOnly = true;br.readOnly = true;
                   c.readOnly = true;cr.readOnly = true;d.readOnly = true;dr.readOnly = true;
                   e.readOnly = true;er.readOnly = true;f.readOnly = true;fr.readOnly = true;
                   g.readOnly = true;gr.readOnly = true;h.readOnly = true;hr.readOnly = true;
                   i.readOnly = true;ir.readOnly = true;j.readOnly = true;jr.readOnly = true;
                   air.readOnly = true;rair.readOnly = true;vp.readOnly = true;rvp.readOnly = true;
                   hcomp.readOnly = true;hrcomp.readOnly = true;sa.readOnly = true;sr.readOnly = true;
                   ina.readOnly = true;inr.readOnly = true;gsa.readOnly = true;gsr.readOnly = true;
                   dsr.readOnly = true;dsa.readOnly = true;intr.readOnly = true;inta.readOnly = true;
                   k.readOnly = true;kr.readOnly = true;gla.readOnly = true;glr.readOnly = true;
                   k1.readOnly = true;kr1.readOnly = true;
                   asop.readOnly = true;rsop.readOnly = true;afor.readOnly = true;rfor.readOnly = true;
                   return false;
                    }
                else if(levelno.value=="8")
                    {
                    // alert("Please Enter Designation!");//can be edit values
                    a.readOnly = false;ar.readOnly = false;b.readOnly = false;br.readOnly = false;
                    c.readOnly = false;cr.readOnly = false;d.readOnly = false;dr.readOnly = false;
                    e.readOnly = false;er.readOnly = false;f.readOnly = false;fr.readOnly = false;
                    g.readOnly = false;gr.readOnly = false;h.readOnly = false;hr.readOnly = false;
                    i.readOnly = false;ir.readOnly = false;j.readOnly = false;jr.readOnly = false;
                    air.readOnly = false;rair.readOnly = false;vp.readOnly = false;rvp.readOnly = false;
                    hcomp.readOnly = false;hrcomp.readOnly = false;sa.readOnly = false;sr.readOnly = false;
                    ina.readOnly = false;inr.readOnly = false;gsa.readOnly = false;gsr.readOnly = false;
                    dsr.readOnly = false;dsa.readOnly = false;intr.readOnly = false;inta.readOnly = false;
                    k.readOnly = false;kr.readOnly = false;gla.readOnly = false;glr.readOnly = false;
                    k1.readOnly = false;kr1.readOnly = false;
                    asop.readOnly = false;rsop.readOnly = false;afor.readOnly = false;rfor.readOnly = false;
                    return false;
                     }
           	 else{
           		 return true;
           	 }
                }
                
                
                
                </script>



<script type="text/javascript">
           function myFunctionRO()
              {//alert("here ");
             
              
              var du =document.form.duty;
              var ke = document.form.keyJob;
              var no = document.form.noticePeriod;
              
              var levelno2 = document.form.levelno2;
          // alert("here "+levelno2.value);
              if (levelno2.value!="0")
                      {
                      du.readOnly = true;
                      ke.readOnly = true;
                      no.readOnly = true;
                      return false;
                      }
                else if (levelno2.value=="0")
                      {
                      du.readOnly = false;
                      ke.readOnly = false;
                      no.readOnly = false;
                      return false;
                      }
           	      else
                      return true;
                 }
                </script>



















<script language="javascript" type="text/javascript">
	 function checkAddress(str)
	      {
          var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
          if (re.test(str)) return false;
          return true;
          }
 function checkNumber(string)
     {
     var numericExpression = /^[0-9]+$/;
     if(string.match(numericExpression)) {
      return true;
     } else {
     return false;
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
   function validate(levelno)
      { 
	  var d1 = document.form.txtmail_msg;
      var d2 = document.form.mail1;
      var bkColor = "red";
   	  var bkColor2 = "white";

   	var v1 = document.form.a_document_ac;
   	var v2 = document.form.r_document_ac;
   	
   	var a =document.form.a_model;
    var ar = document.form.r_model;
    var b = document.form.a_model_info;
    var br = document.form.r_model_info;
    var c = document.form.a_datacard;
    var cr = document.form.r_datacard;
    var d = document.form.a_email;
    var dr = document.form.r_email;
    var g = document.form.a_mobile_model;
    var gr = document.form.r_mobile_model;
    var h = document.form.a_mobile_no;
    var hr = document.form.r_mobile_no;
    var hcomp = document.form.a_compmobile_no;
    var hrcomp = document.form.r_compmobile_no;
    var f = document.form.a_domain;
    var fr = document.form.r_domain;
    var i = document.form.a_access_card
    var ir = document.form.r_access_card;
    var e = document.form.a_newins;
    var er = document.form.r_newins;
    var k1 = document.form.a_nexas;
    var kr1 = document.form.r_nexas;
    var j = document.form.a_drive;
    var jr = document.form.r_drive;
    var k = document.form.a_other_asset;
    var kr = document.form.r_other_asset;
    var air = document.form.airLin;
    var rair = document.form.r_airLin;

    var asop = document.form.sophos;
    var rsop = document.form.r_sophos;
    var afor = document.form.forti;
    var rfor = document.form.r_forti;

    //VPN
    var vp = document.form.vpn;
    var rvp = document.form.r_vpn;
    
    var sa = document.form.a_shared_card
    var sr = document.form.r_shared_card;
    var ina= document.form.a_internet;
    var inr= document.form.r_internet;
    var gsa = document.form.a_gsnet;
    var gsr = document.form.r_gsnet;
    var inta = document.form.a_internal;
    var intr = document.form.r_internal;
    var dsa= document.form.a_dsc;
    var dsr= document.form.r_dsc;
    var gla= document.form.a_glow;
    var glr= document.form.r_glow;
    
    
    var du =document.form.duty;
    var ke = document.form.keyJob;
    var no = document.form.noticePeriod;
    var levelno2 = document.form.levelno2;
    
   	if (((v1.value==null)||(v1.value=="NULL")||(v1.value==""))&&(levelno=="1"))
   	         {
   	         alert("Enter Accounts - Advance / Impres !");
   	         v1.focus();
   	         v1.style.bkColor = v1.style.backgroundColor;
   			 v1.style.backgroundColor = bkColor;
   	         return false;
   	         }
   	if (((v2.value==null)||(v2.value=="NULL")||(v2.value==""))&&(levelno=="1"))
   	         {
   	         alert("Enter Accounts - Advance / Impres Remarks !");
   	         v2.focus();
   	         v2.style.bkColor = v2.style.backgroundColor;
   			 v2.style.backgroundColor = bkColor;
   			 v1.style.bkColor2 = v1.style.backgroundColor;
   			 v1.style.backgroundColor = bkColor2;
   	         return false;
   	         }
   	
   	
	if (((du.value=='null')||(du.value=="NULL")||(du.value==""))&&(levelno2.value=="0"))
       {
       alert("Enter DUTIES RESPONSIBILITES Remarks !");
       du.value="";
       du.focus();
       du.style.bkColor = du.style.backgroundColor;
		du.style.backgroundColor = bkColor;
	   return false;
       }
	if (((ke.value=='null')||(ke.value=="NULL")||(ke.value==""))&&(levelno2.value=="0"))
       {
       alert("Enter KEY JOB CONTACTS Remarks !");
       ke.value='';
       ke.focus();
       ke.style.bkColor = ke.style.backgroundColor;
		 ke.style.backgroundColor = bkColor;
	   return false;
       }
	if (((no.value=='null')||(no.value=="NULL")||(no.value==""))&&(levelno2.value=="0"))
       {
       alert("Enter NOTICE PERIOD WAIVE OFF Remarks !");
       no.value='';
       no.focus();
       no.style.bkColor =no.style.backgroundColor;
		 no.style.backgroundColor = bkColor;
		return false;
       }
   	
   	

    if ((a.value==null||a.value=="NULL"||a.value==""   ||  ar.value==null||ar.value=="NULL"||ar.value=="")&&(levelno=="2"))
    {
    alert("Enter Laptop/Desktop Model and remarks !");
    return false;
    }

    if ((b.value==null||b.value=="NULL"||b.value==""   ||  br.value==null||br.value=="NULL"||br.value=="")&&(levelno=="2"))
    {
    alert("Enter Password info passed on to and remarks !");
    return false;
    }
    
    if ((c.value==null||c.value=="NULL"||c.value==""   ||  cr.value==null||cr.value=="NULL"||cr.value=="")&&(levelno=="2"))
    {
    alert("Enter Data Card and remarks !");
    return false;
    }
    
    if ((d.value==null||d.value=="NULL"||d.value==""   ||  dr.value==null||dr.value=="NULL"||dr.value=="")&&(levelno=="2"))
    {
    alert("Enter Email Id and remarks !");
    return false;
    }
    
    if ((g.value==null||g.value=="NULL"||g.value==""   ||  gr.value==null||gr.value=="NULL"||gr.value=="")&&(levelno=="2"))
    {
    alert("Enter Mobile Phone Model and remarks !");
    return false;
    }
    
    if ((h.value==null||h.value=="NULL"||h.value==""   ||  hr.value==null||hr.value=="NULL"||hr.value=="")&&(levelno=="2"))
    {
    alert("Enter Mobile No (Intune) and remarks !");
    return false;
    }
    
    if ((hcomp.value==null||hcomp.value=="NULL"||hcomp.value==""   ||  hrcomp.value==null||hrcomp.value=="NULL"||hrcomp.value=="")&&(levelno=="2"))
    {
    alert("Enter Mobile No (Company Provided SIM) and remarks !");
    return false;
    }
    
    if ((f.value==null||f.value=="NULL"||f.value==""   ||  fr.value==null||fr.value=="NULL"||fr.value=="")&&(levelno=="2"))
    {
    alert("Enter Domain User and remarks !");
    return false;
    }
    
    if ((i.value==null||i.value=="NULL"||i.value==""   ||  ir.value==null||ir.value=="NULL"||ir.value=="")&&(levelno=="2"))
    {
    alert("Enter Access Card/Biometric and remarks !");
    return false;
    }
    
    if ((sa.value==null||sa.value=="NULL"||sa.value==""   ||  sr.value==null||sr.value=="NULL"||sr.value=="")&&(levelno=="2"))
    {
    alert("Enter Shared Folder and remarks !");
    return false;
    }

    if ((ina.value==null||ina.value=="NULL"||ina.value==""   ||  inr.value==null||inr.value=="NULL"||inr.value=="")&&(levelno=="2"))
    {
    alert("Enter Internet Access / FTP Access and remarks !");
    return false;
    }
    
    if ((e.value==null||e.value=="NULL"||e.value==""   ||  er.value==null||er.value=="NULL"||er.value=="")&&(levelno=="2"))
    {
    alert("Enter Newins Id  and remarks !");
    return false;
    }
    
    if ((k1.value==null||k1.value=="NULL"||k1.value==""   ||  kr1.value==null||kr1.value=="NULL"||kr1.value=="")&&(levelno=="2"))
    {
    alert("Enter NExAS/SAP ID  and remarks !");
    return false;
    }
    
    if ((gsa.value==null||gsa.value=="NULL"||gsa.value==""   ||  gsr.value==null||gsr.value=="NULL"||gsr.value=="")&&(levelno=="2"))
    {
    alert("Enter GS-NET ID and remarks !");
    return false;
    }
    
    if ((inta.value==null||inta.value=="NULL"||inta.value==""   ||  intr.value==null||intr.value=="NULL"||intr.value=="")&&(levelno=="2"))
    {
    alert("Enter Internal Application and remarks !");
    return false;
    }
    
    if ((dsa.value==null||dsa.value=="NULL"||dsa.value==""   ||  dsr.value==null||dsr.value=="NULL"||dsr.value=="")&&(levelno=="2"))
    {
    alert("Enter DSC Dongle Received and remarks !");
    return false;
    }
    
    if (( vp.value==null||vp.value=="NULL"||vp.value==""   ||  rvp.value==null||rvp.value=="NULL"||rvp.value=="")&&(levelno=="2"))
    {
    alert("Enter VPN and remarks !");
    return false;
    }
    
    if ((j.value==null||j.value=="NULL"||j.value==""   ||  jr.value==null||jr.value=="NULL"||jr.value=="")&&(levelno=="2"))
    {
    alert("Enter Hard Disk/Pen Drive and remarks !");
    return false;
    }
    
    if ((k.value==null||k.value=="NULL"||k.value==""   ||  kr.value==null||kr.value=="NULL"||kr.value=="")&&(levelno=="2"))
    {
    alert("Enter Any Other Asset  and remarks !");
    return false;
    }

    if ((gla.value==null||gla.value=="NULL"||gla.value==""   ||  glr.value==null||glr.value=="NULL"||glr.value=="")&&(levelno=="2"))
    {
    alert("Enter NEx-GLOW and remarks !");
    return false;
    }
    
    if ((air.value==null||air.value=="NULL"||air.value==""   ||  rair.value==null||rair.value=="NULL"||rair.value=="")&&(levelno=="2"))
    {
    alert("Enter Airline / Liner Login  and remarks !");
    return false;
    }

    if ((asop.value==null||asop.value=="NULL"||asop.value==""   ||  rsop.value==null||rsop.value=="NULL"||rsop.value=="")&&(levelno=="2"))
    {
    alert("Enter Sophos & Manage Engine Access  and remarks !");
    return false;
    }

    if ((afor.value==null||afor.value=="NULL"||afor.value==""   ||  rfor.value==null||rfor.value=="NULL"||rfor.value=="")&&(levelno=="2"))
    {
    alert("Enter Fortinet VPN Access and remarks !");
    return false;
    }
 
       
      
      if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	       {
           alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
           document.getElementsByName("mmdradio")[0].focus();
           return false;
           } 
      if(levelno=="8")
 	      {
          //alert("Herer.1..."+document.getElementsByName("higherAuthority")[0].checked);
          if (document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("higherAuthority")[0].checked )//senddirect
               {
 	           alert("Select Radio Button For Form and File close..");
               return false;
               }
 	      }
      // alert("Herer.1...");
       if (document.getElementsByName("mmdradio")[0].checked  && ((d2.value==null)||(d2.value=="NULL")||(d2.value=="")) &&(levelno!="8"))
             {
             alert("Select next approvaer name ..");
             return false;
             }
     
          
     if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	      {
	      alert("Enter Remarks !");
	      d1.focus();
	      return false;
	      }
      else{
    	  return true;
      }
   }
   
</script>


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
<script type="text/javascript">
function showTR()
	{
	var status = document.getElementById('idstatus1').value;
	
	//alert("status is  "+status);
	if (status!="true")
	  {
	    alert("you are not authorized person");
	
	    return false;
	  }
	
	else{
	    // alert("Select Direct Approved Or Higher Authority");
		 document.getElementById('idApproved').style.display="table-row";
	   	 document.getElementById('idApproved').style.visibility="visible";
	 	 document.getElementById('idPwd').style.display="table-row";
		 document.getElementById('idPwd').style.visibility="visible";
		 return true;
	 }
	}
function hideTR()
{

var status = document.getElementById('idstatus').value;

//alert("status is  "+status);

if (status!="true")
{
alert("you are not authorized person");

return false;
}
else
 {
 document.getElementById('idApproved').style.hidden="table-row";
 document.getElementById('idApproved').style.visibility="hidden";
 document.getElementById('idApproved1').style.hidden="table-row";
 document.getElementById('idApproved1').style.visibility="hidden";
 document.getElementById('idApprovedd').style.hidden="table-row";
 document.getElementById('idApprovedd').style.visibility="hidden";
 
 return true;
 
 }
}
function hideHigherTR()
{
 document.getElementById('idApproved1').style.display="none";
 document.getElementById('idApproved1').style.visibility="hidden";
/*  document.getElementById('idPwd1').style.display="none";
 document.getElementById('idPwd1').style.visibility="hidden"; */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.visibility="visible";
 alert("Select Designation And Name");
}
function showHigherTR()
{
 document.getElementById('idApproved1').style.display="table-row";
 document.getElementById('idApproved1').style.visibility="visible";
/*  document.getElementById('idPwd1').style.display="table-row";
 document.getElementById('idPwd1').style.visibility="visible" */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.display="none";
                                        //alert("Select IT Or NON IT");
}
</script>

<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    String dispAr[]=disp.split("&");
    disp=dispAr[0].toString();
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
                       }       var url="../../selEmpForms.jsp";  
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
                       }       var url="../../selectMailId.jsp";  
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
<script language="javascript" type="text/javascript"> 
function resendMail(email_id,form1_no,mail,name)
  		 {
	 //alert("Working"); 
	 //alert("Name : "+name);
	 //alert("mail :"+mail);
	//alert("form1_no :"+form1_no);
	//alert("email_id :"+email_id);
  		if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){
           //alet("Creating html http object");    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){    
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="../../ResendMailItClearance?mail="+email_id+","+form1_no+","+mail+","+name+"";  
                          // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                           //url +="?mail="+mailId;   
                              xmlHttp.onreadystatechange = mailStateChange;  
                             //alert("before sending mail");
                                  xmlHttp.open("POST", url, true); 
                                  
                                 // alert("MAIL SENT");
                                     xmlHttp.send(null);
                                     
                                    // alert("MAIL RESENT");
                                       } 
		function mailStateChange()
		{ 
 		//alert("mail state change");    
 		  if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
  		 {   
    	  // document.getElementById("idmailStatus").innerHTML=xmlHttp.responseText
   			 //  alert("xmlHttp.responseText      :"+xmlHttp.responseText);
   			   document.getElementById("idmailStatus").value=xmlHttp.responseText;
   		 } 
  	    }                               
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
<script language="javascript" type="text/javascript"> 

$(document).ready(function() {
$('.check').click(function(){
    $("#text").val('');
    $(".check").each(function(){
        if($(this).prop('checked')){
            
            $("#text").val($("#text").val()+$(this).val()+"");
        }
    });
});
});

//ITclearanceLocalAdminBack.jsp
</script>
</head>
<body onload="onloadCheck();">
	<!-- <body onload="start()" onunload="stop()"> -->
	<!-- <form  name="form" method="post"  action="ITclearanceAdminBack.jsp">//ITclearanceLocalAdminBack.jsp -->
	<form name="form" method="post" action="ITclearanceLocalAdminBack.jsp">
		<%!String Name = null, desg = null, city = null, b_no = null, email_id = null, Initiator = null, admin = null;
	Connection cn1 = null, cn2 = null, cn3 = null, cn4 = null, cn100 = null;
	Statement st1 = null, st2 = null, st3 = null, st4 = null, st100 = null, str = null;
	ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs100 = null, rsr = null;
	String req = null;
	String empD = null;
	String Sessiondesg = null, SessionName = null, Sessioncity = null, Sessionb_no = null, subDept = null;%>
		<%
		SessionName = (String) session.getAttribute("Nname");
		Sessiondesg = (String) session.getAttribute("desg");
		Sessioncity = (String) session.getAttribute("city");
		Sessionb_no = (String) session.getAttribute("b_no");
		admin = (String) session.getAttribute("admin");
		//String nammeeeee = session.getAttribute("Nname").toString();
		//String desgggg = session.getAttribute("desg").toString();
		email_id = (String) session.getAttribute("Nmail");
		subDept = (String) session.getAttribute("subDept") == null ? "" : (String) session.getAttribute("subDept");
		/* System.out.println("-------------------------------------");
		System.out.println("Name Number :"+SessionName);
		System.out.println("desg Number :"+Sessiondesg);
		System.out.println("city Number :"+Sessioncity);
		System.out.println("Branch Number :"+Sessionb_no);
		System.out.println("admin Number :"+admin);
		System.out.println("email_id Number :"+email_id);
		System.out.println("subDept :"+subDept);
		System.out.println("------------------------------------"); */
		Connection cn5 = null, cn11 = null, cn2r = null;
		Connection cnt1 = null, cnt2 = null, cnt3 = null, cnt4 = null, cnt5 = null, cnt6 = null, cnt112 = null, cnt312 = null,
				cnt111 = null, cnt1112 = null;
		Statement stt1 = null, stt2 = null, stt3 = null, stt4 = null, stt5 = null, stt6 = null, stt112 = null, stt312 = null,
				stt111 = null, stt1112 = null;
		ResultSet rst1 = null, rst2 = null, rst3 = null, rst4 = null, rst5 = null, rst6 = null, rst112 = null, rst312 = null,
				rst111 = null, rst1112 = null;
		Statement st5 = null, st11 = null, stl = null, st12 = null, stnext = null, stlro = null;
		ResultSet rs5 = null, rs11 = null, rsl = null, rs12 = null, rsnext = null, rslro = null;
		PreparedStatement psmt = null;
		try {
		%>

		<%
		//form1_it_clearance
		String form1_no = null, f_date = null, idextend = null, branch = null, depart = null, full_name = null, emp_code = null,
				designation = null, r_officer = null, d_resignation = null, d_reliving = null;
		String a_model = null, a_data_card = null, a_email = null, a_newins = null, a_domain = null, a_mobile_model = null,
				a_mobile_no = null, a_access_card = null, a_drive = null, a_other_asset = null, a_remarks = null;
		String r_model = null, r_data_card = null, r_email = null, r_newins = null, r_domain = null, r_mobile_model = null,
				r_mobile_no = null, r_access_card = null, r_drive = null, r_other_asset = null, r_remarks = null;
		String i_name = null, i_desg = null, i_city = null, i_b_no = null, i_admin = null, i_email_id = null, desg = null,
				emp = null, mail = null;
		String notServed = null, grade = null, requestOption = null;
		String a_nexas = null, r_nexas = null;
		String rduty = "", rkeyJob = "", rnoticePeriod = "";
		String airLin = null, rairLin = null;
		String sophos = null, rsophos = null;
		String forti = null, rforti = null;
		//VPN
String vpn=null,r_vpn=null,a_dsc=null,r_dsc=null,a_internet=null,r_internet=null,a_internal=null,r_internal=null,a_gsnet=null,r_gsnet=null,a_shared_card=null,r_shared_card=null,a_glow=null,r_glow=null;
		String a_document_hr = null, r_document_hr = null, a_co_car_hr = null, r_co_car_hr = null, a_calculator_hr = null,
				r_calculator_hr = null, a_conn_mobile_hr = null, r_conn_mobile_hr = null, a_mobile_handset_hr = null,
				r_mobile_handset_hr = null;
		String a_id_card_hr = null, r_id_card_hr = null, a_work_key_hr = null, r_work_key_hr = null, a_any_other_hr = null,
				r_any_other_hr = null, a_leave_card_hr = null, r_leave_card_hr = null, a_resignation_letter_hr = null,
				r_resignation_letter_hr = null, a_identity_card_hr = null, r_identity_card_hr = null;
		String a_model_info = null, r_model_info = null, a_document_ac = null, r_document_ac = null,
				d_new_relieved_request = null, d_new_reliving_co = null, a_compmobile_no = null, r_compmobile_no = null;
		String req = request.getParameter("req");
		cn100 = con.getConnection2();
		st100 = cn100.createStatement();
		rs100 = st100.executeQuery("select * from form1_it_clearance WHERE form1_no='" + req + "'");
		while (rs100.next()) {
			form1_no = rs100.getString("form1_no");
			f_date = rs100.getString("f_date");
			idextend = rs100.getString("idextend");
			branch = rs100.getString("branch");
			depart = rs100.getString("depart");
			full_name = rs100.getString("full_name");
			emp_code = rs100.getString("emp_code");
			designation = rs100.getString("designation");
			r_officer = rs100.getString("r_officer");
			d_resignation = rs100.getString("d_resignation");
			d_reliving = rs100.getString("d_reliving");
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
			notServed = rs100.getString("notServed");
			grade = rs100.getString("grade");
			requestOption = rs100.getString("requestOption");
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
			//r_remarks = rs100.getString("r_remarks");
			a_nexas = rs100.getString("a_nexas");
			r_nexas = rs100.getString("r_nexas");
			i_name = rs100.getString("i_name");
			i_desg = rs100.getString("i_desg");
			i_city = rs100.getString("i_city");
			i_b_no = rs100.getString("i_b_no");
			i_admin = rs100.getString("i_admin");
			i_email_id = rs100.getString("i_email_id");
			desg = rs100.getString("desg");
			emp = rs100.getString("emp");
			mail = rs100.getString("mail");
			a_document_hr = rs100.getString("a_document_hr");
			r_document_hr = rs100.getString("r_document_hr");
			a_co_car_hr = rs100.getString("a_co_car_hr");
			r_co_car_hr = rs100.getString("r_co_car_hr");
			a_calculator_hr = rs100.getString("a_calculator_hr");
			r_calculator_hr = rs100.getString("r_calculator_hr");
			a_conn_mobile_hr = rs100.getString("a_conn_mobile_hr");
			r_conn_mobile_hr = rs100.getString("r_conn_mobile_hr");
			a_mobile_handset_hr = rs100.getString("a_mobile_handset_hr");
			r_mobile_handset_hr = rs100.getString("r_mobile_handset_hr");
			a_id_card_hr = rs100.getString("a_id_card_hr");
			r_id_card_hr = rs100.getString("r_id_card_hr");
			a_work_key_hr = rs100.getString("a_work_key_hr");
			r_work_key_hr = rs100.getString("r_work_key_hr");
			a_any_other_hr = rs100.getString("a_any_other_hr");
			r_any_other_hr = rs100.getString("r_any_other_hr");
			a_leave_card_hr = rs100.getString("a_leave_card_hr");
			r_leave_card_hr = rs100.getString("r_leave_card_hr");
			a_resignation_letter_hr = rs100.getString("a_resignation_letter_hr");
			r_resignation_letter_hr = rs100.getString("r_resignation_letter_hr");
			a_identity_card_hr = rs100.getString("a_identity_card_hr");
			r_identity_card_hr = rs100.getString("r_identity_card_hr");
			a_model_info = rs100.getString("a_model_info");
			r_model_info = rs100.getString("r_model_info");
			if (a_model_info == null) {
				a_model_info = "";
				r_model_info = "";
			}
			a_document_ac = rs100.getString("a_document_ac");
			r_document_ac = rs100.getString("r_document_ac");
			d_new_relieved_request = rs100.getString("d_new_relieved_request");
			d_new_reliving_co = rs100.getString("d_new_reliving_co");
			rduty = rs100.getString("rduty") == null ? "" : rs100.getString("rduty");
			rkeyJob = rs100.getString("rkeyJob") == null ? "" : rs100.getString("rkeyJob");
			rnoticePeriod = rs100.getString("rnoticePeriod") == null ? "" : rs100.getString("rnoticePeriod");
			//company provided sim
			a_compmobile_no = rs100.getString("a_compmobile_no") == null ? "" : rs100.getString("a_compmobile_no");
			r_compmobile_no = rs100.getString("r_compmobile_no") == null ? "" : rs100.getString("r_compmobile_no");

			airLin = rs100.getString("airLin");
			rairLin = rs100.getString("rairLin");
			sophos = rs100.getString("a_sophos");
			rsophos = rs100.getString("r_sophos");
			forti = rs100.getString("a_forti");
			rforti = rs100.getString("r_forti");
			
		     a_shared_card= rs100.getString("a_shared_card");
		     r_shared_card=rs100.getString("r_shared_card");
		     a_internet= rs100.getString("a_internet");
		     r_internet=rs100.getString("r_internet");
		     a_gsnet= rs100.getString("a_gsnet");
		     r_gsnet=rs100.getString("r_gsnet");
		     a_internal= rs100.getString("a_internal");
		     r_internal=rs100.getString("r_internal");
		     a_dsc= rs100.getString("a_dsc");
		     r_dsc=rs100.getString("r_dsc");
		     vpn= rs100.getString("vpn");
		     r_vpn=rs100.getString("rvpn");
		     a_glow= rs100.getString("a_nexglow");
		     r_glow=rs100.getString("r_nexglow");

		}
		String empid = "", levelno = "", levelno2 = "";
		int flagro = 0;
		empid = (String) session.getAttribute("EmpNo");
		System.out.println("empid :" + empid);
		cn2 = con.getConnection2();

		str = cn2.createStatement();
		rsr = str.executeQuery("select levelno from form1_it_clearance_item where form1_no='" + req + "' and status='Pending'");
		while (rsr.next()) {
			levelno2 = rsr.getString(1);
			System.out.println("Level ro no :" + levelno2);
		}

		stl = cn2.createStatement();
		rsl = stl.executeQuery("select max(levelno) from form1_it_clearance_item where form1_no='" + req + "'");
		while (rsl.next()) {
			levelno = rsl.getString(1);
			System.out.println("Level no :" + levelno);
		}

		stlro = cn2.createStatement();
		rslro = stlro.executeQuery("select levelno from form1_it_clearance_item where form1_no='" + req + "' and levelno='0'");
		if (rslro.next()) {
			flagro = 1;
			System.out.println("flagro  :" + flagro);
		}
		%>
		<%
		java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy");
		String flag1=request.getParameter("fg");
		%>
		
		<input type="hidden" name="flag" value="<%=flag1%>" />

		<textarea id="hiderow" name="theName" rows="1" cols="30"
			readonly="readonly"
			style="color: BLUE value:WELCOME; visibility: hidden; display: none;"></textarea>
		<br /> <br />
		<div id="page-wrap">
			<center>
				<table width="907" cellspacing="0" cellpadding="0" bgcolor="grey"
					align="center">
					<tr>
						<td style="height: 40px;"><center>
								<font size="5"> <b><label> Outstanding Dues &
											Handover Report</label> </b></font>
							</center></td>
					</tr>
					<tr>
						<td><input type="text" name="i_name" value="<%=SessionName%>" />
							<input type="text" name="i_desg" value="<%=Sessiondesg%>" /> <input
							type="text" name="i_city" value="<%=Sessioncity%>" /> <input
							type="hidden" name="i_b_no" value="<%=Sessionb_no%>" /> <input
							type="hidden" name="i_admin" value="<%=admin%>" /> <input
							type="hidden" name="subDept" value="<%=subDept%>" /> <input
							type="text" name="i_email_id" value="<%=email_id%>" /> <input
							type="text" name="f_date"
							value="<%=po_date.format(new java.util.Date())%>" /> <input
							type="hidden" name="r_remarks" value="extra_value" /> <input
							type="hidden" name="form1_no" value="<%=form1_no%>" /> <input
							type="hidden" name="levelno1" id="levelno1" value="<%=levelno%>" />
							<input type="hidden" name="levelno2" id="levelno2"
							value="<%=levelno2%>" /> <%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
						</td>

					</tr>
				</table>
				<table width="895" cellspacing="0" cellpadding="0"
					bgcolor="lightgrey">
					<tr>
						<td>
							<%
							String b_no = null;
							b_no = (String) session.getAttribute("b_no");

							System.out.println("b_no :" + b_no);
							%>
 <%
 cn2 = con.getConnection2();
 st2 = cn2.createStatement();
 rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc");

 cn4 = con.getConnection2();
 st4 = cn4.createStatement();
 rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc");
 %>

							<table width="895">

								<tr>
									<td align="center" bgcolor="grey" colspan="4"><b> <font
											size="5"><%=form1_no%></font></b></td>
								</tr>
								<tr>
									<td style="text-align: right;">Employee Code :</td>
									<td style="text-align: left;"><input type="text"
										name="emp_code" id="ecode" value="<%=emp_code%>"
										readonly="readonly" /></td>
									<td style="text-align: right;">Full Name :</td>
									<td style="text-align: left;"><input type="text"
										name="full_name" id="fname" value="<%=full_name%>"
										readonly="readonly" /></td>
								</tr>
								<tr>
									&nbsp;&nbsp;&nbsp;
									<td style="text-align: right; width: 215px;">Branch :</td>
									<td style="text-align: left;"><input name="branch"
										value="<%=branch%>" readonly="readonly" /></td>
									<td style="text-align: right; width: 175px;">Department :</td>
									<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
									<td style="text-align: left;"><input name="depart"
										value="<%=depart%>" readonly="readonly" /></td>
								</tr>

								<tr>
									<td style="text-align: right;">Designation :</td>
									<td style="text-align: left;"><input name="designation"
										value="<%=designation%>" readonly="readonly" /></td>

									<td style="text-align: right;">Reporting Officer :</td>
									<td style="text-align: left;"><input type="text"
										name="r_officer" id="rofficer" value="<%=r_officer%>"
										readonly="readonly" /></td>


								</tr>
								<tr>
									<td style="text-align: right;">Date Of Resignation :</td>
									<td style="text-align: left;"><input type="text"
										style="width: 6em" name="d_resignation"
										value="<%=d_resignation%>" readonly="readonly" /></td>

									<td style="text-align: right;">Last Served Date :</td>
									<td style="text-align: left;"><input type="text"
										style="width: 6em" name="d_reliving" value="<%=d_reliving%>"
										readonly="readonly" /></td>
								</tr>
								<tr>
									<td style="text-align: right;">Date Of Relieving requested
										by the employee :</td>
									<td style="text-align: left;"><input type="text"
										style="width: 6em" name="d_resignation"
										value="<%=d_new_relieved_request%>" readonly="readonly" /></td>

									<td style="text-align: right;">Date of Relieving as per co
										policy:</td>
									<td style="text-align: left;"><input type="text"
										style="width: 6em" name="d_reliving"
										value="<%=d_new_reliving_co%>" readonly="readonly" /></td>
								</tr>
								<tr>
									<td style="text-align: right;">Status Of Employement :</td>
									<td style="text-align: left;"><input type="text"
										style="width: 6em" name="d_resignation"
										value="<%=requestOption%>" readonly="readonly"
										readonly="readonly" /></td>

									<td style="text-align: right;">Grade :</td>
									<td style="text-align: left;"><input type="text"
										style="width: 6em" name="d_reliving" value="<%=grade%>"
										readonly="readonly" readonly="readonly" /></td>
								</tr>
								<tr>
									<td style="text-align: right;">Not Served:</td>
									<td style="text-align: left;" colspan="3"><input
										type="text" style="width: 6em" name="d_resignation"
										value="<%=notServed%>" readonly="readonly" readonly="readonly" />
										days</td>
								</tr>
							</table> <br> <label><center>
									<font color="black"><u><b>ONLY FOR HR DEPT. </b></u></font>
								</center> </label> <br>
							<table id="table3a" align="center" width="895" align="center">
								<tr>

									<td class="it1" align="center">1</td>


									<td class="it2" style="text-align: right; width: 23%;">
										All document taken overby:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_document_hr" value="<%=a_document_hr%>"
										id="mod" maxlength="44" readonly="readonly"
										onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_document_hr"
										id="rem1" size="40" value="<%=r_document_hr%>" maxlength="44"
										readonly="readonly" onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">2</td>


									<td class="it2" style="text-align: right; width: 23%;">Company
										Car :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" value="<%=a_co_car_hr%>" name="a_co_car_hr"
										id="dc" maxlength="44" readonly="readonly"
										onfocus="myFunctionHR();" /></td>


									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_co_car_hr"
										id="rem2" size="40" value="<%=r_co_car_hr%>" maxlength="44"
										readonly="readonly" onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">3</td>



									<td class="it2" style="text-align: right; width: 23%;">Calculators
										:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_calculator_hr"
										value="<%=a_calculator_hr%>" id="eid" maxlength="44"
										readonly="readonly" onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_calculator_hr"
										id="rem3" size="40" maxlength="44"
										value="<%=r_calculator_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">4</td>



									<td class="it2" style="text-align: right; width: 23%;">
										Connection surrendered :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_conn_mobile_hr" id="nid"
										value="<%=a_conn_mobile_hr%>" maxlength="44"
										readonly="readonly" onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_conn_mobile_hr"
										id="rem4" size="40" maxlength="44"
										value="<%=r_conn_mobile_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">5</td>



									<td class="it2" style="text-align: right; width: 23%;">Mobile
										handset :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_mobile_handset_hr" id="du"
										value="<%=a_mobile_handset_hr%>" maxlength="44"
										readonly="readonly" onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text"
										name="r_mobile_handset_hr" id="rem5" size="40" maxlength="44"
										value="<%=r_mobile_handset_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">6</td>



									<td class="it2" style="text-align: right; width: 23%;">ID
										card :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_id_card_hr" id="du"
										value="<%=a_id_card_hr%>" maxlength="44" readonly="readonly"
										onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_id_card_hr"
										id="rem5" size="40" maxlength="44" value="<%=r_id_card_hr%>"
										readonly="readonly" onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">7</td>



									<td class="it2" style="text-align: right; width: 23%;">Workstation
										keys :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_work_key_hr" id="du"
										value="<%=a_work_key_hr%>" maxlength="44" readonly="readonly"
										onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_work_key_hr"
										id="rem5" size="40" maxlength="44" value="<%=r_work_key_hr%>"
										readonly="readonly" onfocus="myFunctionHR();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">8</td>



									<td class="it2" style="text-align: right; width: 23%;">Any
										Other:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_any_other_hr" id="du"
										value="<%=a_any_other_hr%>" maxlength="44" readonly="readonly"
										onfocus="myFunctionHR();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_any_other_hr"
										id="rem5" size="40" maxlength="44" value="<%=r_any_other_hr%>"
										readonly="readonly" onfocus="myFunctionHR();" /></td>
								</tr>


								<tr>
									<td class="it1" align="center">9</td>



									<td class="it2" style="text-align: right; width: 23%;">
										Leave card enclosed:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_leave_card_hr" size="10" maxlength="44"
										value="<%=a_leave_card_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /> <!-- <select style="width: 5em"  name="a_leave_card_hr"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> --></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_leave_card_hr"
										id="rem5" size="40" maxlength="44"
										value="<%=r_leave_card_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /></td>
								</tr>


								<tr>
									<td class="it1" align="center">10</td>



									<td class="it2" style="text-align: right; width: 23%;">Resignation
										letter enclosed:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_resignation_letter_hr" size="10"
										maxlength="44" value="<%=a_resignation_letter_hr%>"
										readonly="readonly" onfocus="myFunctionHR();" /> <!-- <select style="width: 5em" name="a_resignation_letter_hr" readonly="readonly"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> --></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text"
										name="r_resignation_letter_hr" id="rem5" size="40"
										maxlength="44" value="<%=r_resignation_letter_hr%>"
										readonly="readonly" onfocus="myFunctionHR();" /></td>
								</tr>


								<tr>
									<td class="it1" align="center">11</td>



									<td class="it2" style="text-align: right; width: 23%;">Identity
										card enclosed:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_identity_card_hr" size="10" maxlength="44"
										value="<%=a_identity_card_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /> <!-- <select style="width: 5em" name="a_identity_card_hr" readonly="readonly"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> --></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text"
										name="r_identity_card_hr" id="rem5" size="40" maxlength="44"
										value="<%=r_identity_card_hr%>" readonly="readonly"
										onfocus="myFunctionHR();" /></td>
								</tr>
								<!-- <tr>
<td colspan="5">
<textarea name="a_remarks" rows="3" cols="140" id="ta" maxlength="199" placeholder="HR / ADMIN REMARKS"></textarea>
</td>
</tr> -->
							</table> <br> <label><center>
									<font color="black"><u><b>ONLY FOR A / C DEPT. </b></u></font>
								</center> </label> <br> <%

 %>
							<table id="table3a" align="center" width="895" align="center">
								<tr>

									<td class="it1" align="center" style="width: 3%;">1</td>


									<td class="it2" style="text-align: right; width: 23%;">
										Accounts - Advance / Imprest Balance:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_document_ac" id="mod" maxlength="44"
										value="<%=a_document_ac%>" readonly="readonly"
										onfocus="myFunctionAccounts();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_document_ac"
										id="rem1" size="40" maxlength="44" readonly="readonly"
										value="<%=r_document_ac%>" onfocus="myFunctionAccounts();" /></td>
								</tr>

							</table> <%--}else{ --%> <br> <label><center>
									<font color="black"><u><b>ONLY FOR IT DEPT. :
												ASSET PROVIDED</b></u></font>
								</center> </label> <br>
							<table id="table3" width="895">
								<tr>

									<td class="it1" align="center">1</td>


									<td class="it2" style="text-align: right; width: 23%;">
										Laptop/Desktop Model :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_model" id="mod" maxlength="100"
										value="<%=a_model%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_model"
										id="rem1" size="40" value="<%=r_model%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>
								</tr>
								<tr>

									<td class="it1" align="center">1a</td>


									<td class="it2" style="text-align: right; width: 23%;">
										Password info passed on to:</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_model_info" value="<%=a_model_info%>"
										id="mod_info" maxlength="44" readonly="readonly"
										onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_model_info"
										id="rem1_info" size="40" value="<%=r_model_info%>"
										maxlength="44" readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>
								<tr>
									<td class="it1" align="center">2</td>


									<td class="it2" style="text-align: right; width: 23%;">Data
										Card :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_datacard" value="<%=a_data_card%>" id="dc"
										maxlength="100" readonly="readonly" onfocus="myFunctionVal();" /></td>


									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_datacard"
										id="rem2" size="40" value="<%=r_data_card%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">3</td>



									<td class="it2" style="text-align: right; width: 23%;">Email
										Id :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_email" id="eid" value="<%=a_email%>"
										maxlength="100" readonly="readonly" onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_email"
										id="rem3" size="40" value="<%=r_email%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>
								</tr>

								<tr>
								<td class="it1" align="center">3a</td>



								<td class="it2" style="text-align: right; width: 23%;">Mobile
									Phone Model :</td>
								<td class="it2" style="text-align: left; width: 25%;"><input
									name="a_mobile_model" id="mpd" value="<%=a_mobile_model%>"
									readonly="readonly" onfocus="myFunctionVal();" /></td>

								<td class="it2">Remarks :</td>
								<td class="it2"><input type="text" name="r_mobile_model"
									id="rem6" size="40" value="<%=r_mobile_model%>"
									readonly="readonly" onfocus="myFunctionVal();" /></td>
							</tr>

							<tr>
									<td class="it1" align="center">3b</td>



									<td class="it2" style="text-align: right; width: 23%;">Mobile
										No (Intune) :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_mobile_no" id="mno"
										value="<%=a_mobile_no%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_mobile_no"
										id="rem7" size="40" value="<%=r_mobile_no%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">3c</td>



									<td class="it2" style="text-align: right; width: 23%;">Mobile
										No (Company Provided SIM) :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_compmobile_no" id="mnocomp"
										value="<%=a_compmobile_no%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_compmobile_no"
										id="rem7comp" size="40" value="<%=r_compmobile_no%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>

								
								<tr>
									<td class="it1" align="center">4</td>



									<td class="it2" style="text-align: right; width: 23%;">Domain
										User :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_domain" value="<%=a_domain%>" id="du"
										readonly="readonly" onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_domain"
										id="rem5" size="40" value="<%=r_domain%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>
								</tr>


								<tr>
									<td class="it1" align="center">5</td>



									<td class="it2" style="text-align: right; width: 23%;">Access
										Card/Biometric :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_access_card" id="acard"
										value="<%=a_access_card%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_access_card"
										id="rem8" size="40" value="<%=r_access_card%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it2" style="text-align: right;width:15%;">Shared Folder :</td>
<td > <input type="text" name="a_shared_card" readonly="readonly" id="acard" value="<%=a_shared_card%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_shared_card" id="rem8" size="40" readonly="readonly" value="<%=r_shared_card%>"/></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it2" style="text-align: right;width:15%;">Internet Access / FTP Access :</td>
<td > <input type="text" name="a_internet" readonly="readonly" id="acard" value="<%=a_internet%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_internet" id="rem8" size="40" readonly="readonly" value="<%=r_internet%>"/></td>
</tr>
								<tr>
									<td class="it1" align="center">8</td>



									<td class="it2" style="text-align: right; width: 23%;">Newins
										Id :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_newins" value="<%=a_newins%>" id="nid"
										maxlength="100" readonly="readonly" onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_newins"
										id="rem4" size="40" value="<%=r_newins%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>
								</tr>


								<tr>
									<td class="it1" align="center">9</td>
									<td class="it2" style="text-align: right; width: 23%;">NEXAS\SAP
										ID :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_nexas" value="<%=a_nexas%>" id="asset1"
										readonly="readonly" maxlength="24" onfocus="myFunctionVal();" /></td>
									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_nexas"
										id="rem8" size="40" maxlength="44" value="<%=r_nexas%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>
								
								<tr>
								<td class="it1" align="center">10  </td>
								<td class="it2" style="text-align: right;width:15%;">GS-NET :</td>
								<td > <input type="text" name="a_gsnet" readonly="readonly" value="<%=a_gsnet%>" id="asset1"/></td>
								<td class="it2">Remarks :</td>
								<td class="it2"   ><input type="text" name="r_gsnet" id="rem8" size="40" readonly="readonly" value="<%=r_gsnet%>"/></td>
								</tr>

								<tr>
								<td class="it1" align="center">11  </td>
								<td class="it2" style="text-align: right;width:15%;">Internal Application :</td>
								<td > <input type="text" name="a_internal" readonly="readonly" value="<%=a_internal%>" id="asset1"/></td>
								<td class="it2">Remarks :</td>
								<td class="it2"   ><input type="text" name="r_internal" id="rem8" size="40" readonly="readonly" value="<%=r_internal%>"/></td>
								</tr>
								
								<tr>
								<td class="it1" align="center">12  </td>
								<td class="it2" style="text-align: right;width:15%;">DSC Dongle Received :</td>
								<td > <input type="text" name="a_dsc" readonly="readonly" value="<%=a_dsc%>" id="asset1"/></td>
								<td class="it2">Remarks :</td>
								<td class="it2"   ><input type="text" name="r_dsc" id="rem8" size="40" readonly="readonly" value="<%=r_dsc%>"/></td>
								</tr>
							
								<tr>
								<td class="it1" align="center">13</td>
								<td class="it2" style="text-align: right; width: 23%;">VPN
									:</td>
								<td class="it2" style="text-align: left; width: 25%;"><input
									type="text" name="vpn" id="vpn" readonly="readonly"
									maxlength="24" value="<%=vpn%>" onfocus="myFunctionVal();" /></td>
								<td class="it2">Remarks :</td>
								<td class="it2"><input type="text" name="r_vpn" id="r_vpn"
									size="40" maxlength="44" readonly="readonly" value="<%=r_vpn%>"
									onfocus="myFunctionVal();" /></td>
							</tr>

								<tr>
									<td class="it1" align="center">14</td>



									<td class="it2" style="text-align: right; width: 23%;">Hard
										Disk/Pen Drive :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_drive" id="hp" value="<%=a_drive%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>

									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_drive"
										id="rem8" size="40" value="<%=r_drive%>" readonly="readonly"
										onfocus="myFunctionVal();" /></td>
								</tr>




								<tr>
									<td class="it1" align="center">15</td>
									<td class="it2" style="text-align: right; width: 23%;">Any
										Other Asset :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="a_other_asset" value="<%=a_other_asset%>"
										id="asset1" readonly="readonly" onfocus="myFunctionVal();" /></td>
									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_other_asset"
										id="rem8" size="40" value="<%=r_other_asset%>"
										readonly="readonly" onfocus="myFunctionVal();" /></td>
								</tr>

								<tr>
<td class="it1" align="center">16  </td>
<td class="it2" style="text-align: right;width:15%;">NEx-GLOW :</td>
<td > <input type="text" name="a_glow" readonly="readonly" value="<%=a_glow%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_glow" id="rem8" size="40" readonly="readonly" value="<%=r_glow%>"/></td>
</tr>

								<tr>
									<td class="it1" align="center">17</td>
									<td class="it2" style="text-align: right; width: 23%;">Airline
										/ Liner Login :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="airLin" id="airLin" readonly="readonly"
										maxlength="24" value="<%=airLin%>" onfocus="myFunctionVal();" /></td>
									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_airLin"
										id="r_airLin" size="40" maxlength="44" readonly="readonly"
										value="<%=rairLin%>" onfocus="myFunctionVal();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">18</td>
									<td class="it2" style="text-align: right; width: 23%;">Sophos & Manage Engine Access :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="sophos" id="sophos" readonly="readonly"
										maxlength="24" value="<%=sophos%>" onfocus="myFunctionVal();" /></td>
									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_sophos"
										id="r_sophos" size="40" maxlength="44" readonly="readonly"
										value="<%=rsophos%>" onfocus="myFunctionVal();" /></td>
								</tr>

								<tr>
									<td class="it1" align="center">19</td>
									<td class="it2" style="text-align: right; width: 23%;">Fortinet VPN Access :</td>
									<td class="it2" style="text-align: left; width: 25%;"><input
										type="text" name="forti" id="forti" readonly="readonly"
										maxlength="24" value="<%=forti%>" onfocus="myFunctionVal();" /></td>
									<td class="it2">Remarks :</td>
									<td class="it2"><input type="text" name="r_forti"
										id="r_forti" size="40" maxlength="44" readonly="readonly"
										value="<%=rforti%>" onfocus="myFunctionVal();" /></td>
								</tr>






							</table> <br> <label><center>
									<font color="black"><u><b>ONLY FOR REPORTING
												OFFICER</b></u></font>
								</center> </label> <br>
							<table id="table4" width="895">
								<tr>
									<td class="ro1" align="center">1</td>
									<td class="ro2" style="text-align: right; width: 23%;">DUTIES
										RESPONSIBILITES DOCUMENTS AND FILES:</td>
									<td class="ro2">Remarks :</td>
									<td class="ro2"><input type="text" name="duty" id="duty"
										size="45" value="<%=rduty%>" readonly="readonly"
										onfocus="myFunctionRO();" /></td>
								</tr>
								<tr>
									<td class="ro1" align="center">2</td>
									<td class="ro2" style="text-align: right; width: 23%;">KEY
										JOB CONTACTS:</td>
									<td class="ro2">Remarks :</td>
									<td class="ro2"><input type="text" name="keyJob"
										id="keyJob" size="45" value="<%=rkeyJob%>" maxlength="44"
										readonly="readonly" onfocus="myFunctionRO();" /></td>
								</tr>
								<tr>
									<td class="ro1" align="center">3</td>
									<td class="ro2" style="text-align: right; width: 23%;">NOTICE
										PERIOD WAIVE OFF:</td>
									<td class="ro2">Remarks :</td>
									<td class="ro2"><input type="text" name="noticePeriod"
										id="noticePeriod" size="45" value="<%=rnoticePeriod%>"
										readonly="readonly" onfocus="myFunctionRO();" /></td>
								</tr>
							</table> <br />
							<table width="895" border="1" align="center" bgcolor="#F0F0F0"
								bordercolor="grey">
								<tr>
									<td height="20" bgcolor="grey" width="120" align=center><font
										size="2" color="black"><b>NAME</b></font></td>
									<td bgcolor="grey" width="120" align=center><font size="2"
										color="black"><b>DESIGNATION</b></font></td>
									<td bgcolor="grey" width="120" align=center><font size="2"
										color="black"><b>STATUS</b></font></td>
									<td bgcolor="grey" width="120" align=center><font size="2"
										color="black"><b>REMARKS</b></font></td>
									<td bgcolor="grey" width="120" align=center><font size="2"
										color="black"><b>DATE</b></font></td>
									<td bgcolor="grey" width="120" align=center><font size="2"
										color="black"><b>RESEND</b></font></td>
								</tr>
								<%
								cn1 = con.getConnection2();
								st1 = cn1.createStatement();
								rs1 = st1.executeQuery(
										"select form1_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y') as f_date,mail,empMail from form1_it_clearance_item WHERE form1_no='"
										+ req + "' ORDER BY id ASC");
								while (rs1.next()) {
									String form1_noD = rs1.getString("form1_no");
									String desgD = rs1.getString("desg");
									empD = rs1.getString("emp");
									String statusD = rs1.getString("status");
									String remarksD = rs1.getString("remarks");
									String f_dateD = rs1.getString("f_date");
									String mailD = rs1.getString("mail");
									String empMail = rs1.getString("empMail");
									String m = "";
									//   System.out.println("The sseecccoonndd mr_master ");

									if (rs1.getString("mail") != null) {
										m = rs1.getString("mail").trim();
									}
									System.out.println("m value " + m);
									System.out.println("form1  value " + form1_no);
									System.out.println("empD value " + empD);
								%>
								<tr>

									<td bgcolor="white" width="100"><font size="2"
										color="black"><%=empD%></font> <%-- 	<font size="2" color="black"><%=m%></font> --%>
										<input id="idStatus" type="hidden" value="<%=statusD%>" /></td>
									<td bgcolor="white" width="100"><font size="2"
										color="black"><%=desgD%></font></td>
									<%-- <td bgcolor="white" width="100"><font size="2" color="black"><%=statusD%></font></td> --%>
									<td bgcolor="white" width="100"><font size="2"
										color="black"><input id="idaa" readonly="readonly"
											size="10" value="<%=statusD%>" /> </font></td>
									<td bgcolor="white" width="100"><font size="2"
										color="black"><%=remarksD%></font></td>
									<td bgcolor="white" width="100"><font size="2"
										color="black"><%=f_dateD%></font></td>

									<td><input type="button" style="size: 1"
										value="RE-SEND MAIL" id="idaa2"
										onclick="resendMail('<%=email_id%>','<%=form1_no%>','<%=m%>','<%=SessionName%>');" /></td>
								</tr>
								<%
								}
								%>
							</table> <%
 cn5 = con.getConnection2();
 st5 = cn5.createStatement();

 String ITdesg = null, ITbno = null;

 psmt = cn2.prepareStatement("SELECT post,b_no FROM login WHERE b_no=? AND post=?");
 psmt.setString(1, "90");
 psmt.setString(2, "ASST. GENERAL MANAGER");
 ResultSet itmang = psmt.executeQuery();
 while (itmang.next()) {
 	ITdesg = itmang.getString(1);
 	ITbno = itmang.getString(2);

 }

 System.out.println("Name e-------------------------- query : " + ITdesg);
 System.out.println("Name ------------------------sessoin   : " + Sessiondesg);
 System.out.println("branch no ---------------------------  : " + ITbno);
 System.out.println("b_no ------------------------session   : " + Sessionb_no);
 %> <%
 String flag = c2ITUtil1.getAuthorizedName(form1_no, session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(), session.getAttribute("EmpNo").toString());
 %> <input type="hidden" id="idstatus1" value="<%=flag%>" />


							<table align="center" class="dynatable" width="895" border="1"
								style="height: 150;" cellspacing="0" cellpadding="0"
								bgcolor="lightgrey">

								<input type="hidden" value="<%=session.getAttribute("Nname")%>"
									id="idsession" />
								<input type="hidden" value="<%=session.getAttribute("desg")%>"
									id="iddesg" />
								<input type="hidden"
									value="<%=session.getAttribute("form2_no")%>" id="idmrId" />
								<input type="hidden" id="idstatus" value="<%=flag%>" />


								<tr>
									<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										align="left" type="radio" name="mmdradio" id="idmrapproved"
										value="Approved" onclick="return(showTR());" />Approved
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio"
										name="mmdradio" id="idmrapproved" value="Not Approved"
										onclick="return(hideTR());" />Not Approved

									</td>


								</tr>
								<tr style="display: none;" id="idApproved">
									<%
									ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
									String userName = dbProperties.getString("csdb.username");
									String password = dbProperties.getString("csdb.password");
									String url = dbProperties.getString("csdb.url");
									String driver = dbProperties.getString("csdb.driverName");
									String dbName = dbProperties.getString("csdb.dbName");

									Class.forName(driver).newInstance();
									cn5 = DriverManager.getConnection(url + dbName, userName, password);
									Connection connhrms = null;

									ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
									String userNamel = dbPropertiesl.getString("leavemanagement.username");
									String passwordl = dbPropertiesl.getString("leavemanagement.password");
									String urll = dbPropertiesl.getString("leavemanagement.url");
									String driverl = dbPropertiesl.getString("leavemanagement.driverName");
									String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");

									String napproval = "", nuname = null, ndesg = null, nmailid = null, napproval1 = "";
									connhrms = DriverManager.getConnection(urll + dbNamel, userNamel, passwordl);
									Statement nstmt = connhrms.createStatement();

									String maxlevel = "";

									cn1 = con.getConnection2();
									st12 = cn1.createStatement();

									String i_b_no1 = form1_no.substring(11, 13);
									System.out.println("i_b_no1 :" + i_b_no1);

									rs12 = st12.executeQuery("SELECT max(levelno) FROM formapproval WHERE branch='" + i_b_no1
											+ "' and formtype='IT_CLS'  ORDER BY levelno ASC");
									if (rs12.next()) {
										maxlevel = rs12.getString(1);
									}
									System.out.println("Max Level no :" + maxlevel);
									String allopt = "", dirappro = "", ro = "", ro1 = "";
									st11 = cn1.createStatement();
									//rs5 = st5.executeQuery("Select * from desg");emp_no,levelno
									System.out.println("i_b_no  :" + i_b_no1);
									System.out.println("emp_no  :" + empid);
									rs11 = st11.executeQuery("SELECT alloptions,directApprove FROM formapproval WHERE branch='" + i_b_no1 + "' and empid='"
											+ empid + "' and formtype='IT_CLS'");
									if (rs11.next()) {
										allopt = rs11.getString(1);
										dirappro = rs11.getString(2);
									}
									int nextlevel = 0;
									st5 = cn5.createStatement();
									System.out.println("Current Level no :" + levelno);
									if (!levelno.equals("Creater")) {
										nextlevel = Integer.parseInt(levelno) + 1;
									} else {
										nextlevel = Integer.parseInt(maxlevel);
										levelno = maxlevel;
									}
									System.out.println("All option  :" + allopt);
									System.out.println("dirappro  :" + dirappro);

									//System.out.println("dirappro  :"+nextlevel);
									/* ////////////////////////// Skeeping level code  ////////////////////////////////// */
									String nextemp = "";
									stnext = cn5.createStatement();
									rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='" + i_b_no1 + "' and levelno='" + nextlevel
											+ "' and formtype='IT_CLS' ORDER BY levelno ASC");
									if (rsnext.next()) {
										nextemp = rsnext.getString(5);
									}
									if (empid.equals(nextemp)) {
										if (!levelno.equals("Creater"))
											nextlevel++;
									}
									/* ////////////////////////// end Skeeping level code  ////////////////////////////////// */

									//System.out.println("dirappro  :"+nextlevel);
									//System.out.println("dirappro  :"+levelno);
									//System.out.println("dirappro  :"+maxlevel);
									if (allopt.equals("0") || allopt.equals("")) {
										if (!levelno.equals(maxlevel) && !dirappro.equals("1")) {
											System.out.println("Next  Level no111 :" + nextlevel);
											System.out.println("Next  Level no111 :" + i_b_no1);

											Statement stmtro = connhrms.createStatement();
											Statement stmtro1 = connhrms.createStatement();
											if (levelno.equals("2") && flagro == 0)//find the RO of resigned employed.......
											{
										System.out.println("Next  Level no111 :" + emp_code);
										ResultSet rsro = stmtro.executeQuery(
												"SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,m3.email,m3.emp_id FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id in ('"
														+ emp_code + "') ) ");
										System.out.println("Next  Level no111 :" + emp_code);
										while (rsro.next()) {
											System.out.println("RO EMP IDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD :" + rsro.getString(7));
											ResultSet rsro1 = stmtro1
													.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, "
															+ "m3.user_name AS manager_name FROM user u Inner Join user_role ur on ur.user_id=u.user_id "
															+ "INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id  "
															+ "INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON "
															+ "d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id "
															+ "INNER JOIN user m4 ON m4.user_id = m1.manager2_id " + "WHERE ( m1.emp_id in ('"
															+ rsro.getString(7) + "' ) ) AND u.employee_status = 'yes' ");
											if (rsro1.next()) {
												desg = rsro1.getString(2);
											}

											ro = rsro.getString(7) + "," + rsro.getString(5) + "," + desg + "," + rsro.getString(6) + "," + "0";
											ro1 = rsro.getString(5) + "(" + rsro.getString(6) + ")";
											System.out.println("RO :" + ro);
											System.out.println("RO1 :" + ro1);
										}
									%>

									<input type="hidden" name="senddirect" id="senddirect"
										value="sendonly" readonly />
									<td>Send to RO : <input align="left" type="radio"
										value="<%=ro%>" id="iddeptadminP1"
										onclick="sync(iddeptadminP.value);" /> <input type="text"
										name="mail11" id="iddeptadminP11" value="<%=ro1%>" size="50"
										readonly /> <input type="hidden" name="mail12"
										id="iddeptadminP" value="<%=ro%>" size="30" />
									</td>

									<input type="hidden" name="empid1" id="idempid1" value=""
										readonly />
									<input type="hidden" name="emp" id="idroname" value="" readonly />
									<input type="hidden" name="desg" id="idrodesg" value=""
										readonly />
									<input type="hidden" name="mail1" id="idromail" value=""
										readonly />
									<input type="hidden" name="levelno" id="idlevelno" value=""
										readonly />


									<%
									} else {
									rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='" + i_b_no1 + "' and levelno='" + nextlevel
											+ "' and formtype='IT_CLS' ORDER BY levelno ASC");
									if (rs5.next()) {
										ResultSet nrs = nstmt.executeQuery(
										"SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id in ('"
												+ rs5.getString(5) + "') ) AND u.employee_status = 'yes' ");
										if (nrs.next()) {
											nuname = nrs.getString(1);
											ndesg = nrs.getString(2);
											nmailid = nrs.getString(6);
										}
										napproval = rs5.getString(5) + "," + nuname + "," + ndesg + "," + nmailid + "," + nextlevel;
										napproval1 = nuname + " (" + nmailid + ")";
										System.out.println("Next approval :" + napproval);
									%><input type="hidden" name="senddirect" id="senddirect"
										value="sendonly" readonly />
									<td>Send to Next approver level : <input align="left"
										type="radio" value="<%=napproval%>" id="iddeptadminP1"
										onclick="sync(iddeptadminP.value);" /> <input type="text"
										name="mail11" id="iddeptadminP11" value="<%=napproval1%>"
										size="50" readonly /> <input type="hidden" name="mail12"
										id="iddeptadminP" value="<%=napproval%>" size="30" />
									</td>

									<input type="hidden" name="empid1" id="idempid1" value=""
										readonly />
									<input type="hidden" name="emp" id="idroname" value="" readonly />
									<input type="hidden" name="desg" id="idrodesg" value=""
										readonly />
									<input type="hidden" name="mail1" id="idromail" value=""
										readonly />
									<input type="hidden" name="levelno" id="idlevelno" value=""
										readonly />
									<%
									}
									}
									} else {
									System.out.println("Direct approve section...Close forms..........");
									String app_name = null, developer_name = null, developer_mail = null, napprovalsw = "", napprovalsw1 = "";
									st2 = cn2.createStatement();
									rs2 = st2.executeQuery(
											"select app_name,developer_name,developer_mail from software_owner_master where app_name='NEIN-P2P'");
									if (rs2.next()) {
									app_name = rs2.getString("app_name");
									developer_name = rs2.getString("developer_name");
									developer_mail = rs2.getString("developer_mail");
									}
									napprovalsw = developer_name + "(" + developer_mail + ")";
									napprovalsw1 = "1945" + "," + developer_name + "," + "Asst Manager" + "," + developer_mail + "," + "Creater";
									%>
									<input type="hidden" name="senddirect" id="senddirect"
										value="direct" readonly />
									<td><input type="hidden" name="mail1" id="idromail"
										value="chintu.kumar@nittsu.co.in" readonly />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio"
										name="higherAuthority" value="direct" id="idmNon"
										onclick="showHigherTR(this.value);" />Close File & Forms</td>
									<%
									}
									} else {
									int curlev = Integer.parseInt(levelno);
									int next = 0;
									while (curlev <= Integer.parseInt(maxlevel)) {
									next = curlev + 1;
									rs5 = st5.executeQuery(
											"SELECT * FROM formapproval WHERE branch='" + i_b_no1 + "' and levelno='" + next + "'  ORDER BY levelno ASC");
									if (rs5.next()) {
										ResultSet nrs = nstmt.executeQuery(
										"SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id in ('"
												+ rs5.getString(5) + "' )) AND u.employee_status = 'yes' ");
										if (nrs.next()) {
											nuname = nrs.getString(1);
											ndesg = nrs.getString(2);
											nmailid = nrs.getString(6);
										}
										napproval = rs5.getString(5) + "," + nuname + "," + ndesg + "," + nmailid + "," + next;
										napproval1 = nuname + " (" + nmailid + ")";
										// System.out.println("Next approval :"+napproval);
									%>
									<td><input align="left" name="approver" type="radio"
										value="<%=napproval%>" id="iddeptadminP1"
										onclick="sync(iddeptadminP<%=next%>.value);" /> <input
										type="text" name="mail11" id="iddeptadminP11"
										value="<%=napproval1%>" size="50" readonly /> <input
										type="hidden" name="mail12" id="iddeptadminP<%=next%>"
										value="<%=napproval%>" size="30" /></td>
									<%
									}
									curlev++;
									}
									%>

									<input type="hidden" name="empid1" id="idempid1" value=""
										readonly />
									<input type="hidden" name="emp" id="idroname" value="" readonly />
									<input type="hidden" name="desg" id="idrodesg" value=""
										readonly />
									<input type="hidden" name="mail1" id="idromail" value=""
										readonly />
									<input type="hidden" name="levelno" id="idlevelno" value=""
										readonly />
									<%
									}
									%>






								</tr>
								<tr style="display: none;" id="idApproved1">

									<td>Mail will be send to All approver.</td>
								</tr>

								<tr>
									<td colspan="6">REMARKS:
										<div style="overflow: auto;">
											<textarea name="txtmail_msg" rows="2" cols="100"></textarea>
										</div>
									</td>
								</tr>


							</table> </br>

						</td>

					</tr>
				</table>
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>
							<div id="formsubmitbutton">
								<input type="submit"
									style="background-color: #2f4377; font-weight: bold; color: white;"
									value="SUBMIT" name=button1
									onclick="return (validate(levelno1.value));" />
							</div>
							<div id="buttonreplacement"
								style="margin-left: 30px; display: none;">
								<img src="http://www.willmaster.com/images/preload.gif"
									alt="loading..." />
							</div>
						</td>
						<td style="size: 1">&nbsp;&nbsp;<input type="reset"
							value="RESET" /></td>
						<td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
							<input type="button" id="btnShowSimple" value="APPROVAL ROUTINE" />
						</td>
						<td><a href="../ITclearanceHelp.jsp"
							onclick="return popitup('../ITclearanceHelp.jsp')" id="hiderow"><font
								size=2>HELP</font></a></td>
						<td style="font-size: 1">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='ITclearanceSelectAdmin.jsp?msg=1'"/> -->
							<a href="javascript:history.back()">BACK</a>
						</td>
					</tr>

				</table>



































				<%-- 
<%
System.out.println("FLAG value --------------------- : "+flag);

%><%
	String StringOfrst2 = null,StringOfrst4=null,StringOfrst111=null,StringOfrst1=null,Stringrst3=null,StringOfrst112=null;

cnt1 = con.getConnection2();
stt1=cnt1.createStatement();
cnt111 = con.getConnection2();
stt111=cnt111.createStatement();
cnt1112 = con.getConnection2();
stt1112=cnt1112.createStatement();
	  cnt2 = con.getConnection2();
	  stt2=cnt2.createStatement();
	  cnt3 = con.getConnection2();
	  stt3=cnt3.createStatement();
	  cnt4 = con.getConnection2();
	  stt4=cnt4.createStatement();
	  cnt5 = con.getConnection2();
	  stt5=cnt5.createStatement();
	  cnt6 = con.getConnection2();
	  stt6=cnt6.createStatement();
	  cnt112 = con.getConnection2();
	  stt112=cnt112.createStatement();
	  cnt312 = con.getConnection2();
	  stt312=cnt312.createStatement();
	  //rst1 to check if its IT SUPPORT  
	  rst1 = stt1.executeQuery("select form1_no,i_name,i_desg,i_email_id from form1_it_clearance WHERE form1_no='"+req+"' AND i_name='"+SessionName+"' ORDER BY id ASC");
	  if(rst1.next())
	  {
		  StringOfrst1 = rst1.getString(1);
	  }
	  rst111 = stt111.executeQuery("select a.form1_no,a.i_name,a.i_desg,a.i_email_id,a.r_officer from form1_it_clearance a INNER JOIN form1_it_clearance_item b ON (a.form1_no=b.form1_no)  WHERE a.form1_no='"+req+"'  AND a.r_officer=b.emp AND b.status LIKE '%Approved%'");
	  if(rst111.next())
	  {
		  StringOfrst111 = rst111.getString(1);
	  }
	//rst1112 = stt1112.executeQuery("select a.form1_no,a.i_name,a.i_desg,a.i_email_id,a.r_officer from form1_it_clearance a INNER JOIN form1_it_clearance_item b ON (a.form1_no=b.form1_no)  WHERE a.form1_no='"+req+"'  AND a.r_officer=b.emp AND b.status='Approved'");
	  //rst2 to check present person is Accounts 
	  rst2 = stt2.executeQuery("select t.form1_no from form1_it_clearance_item t INNER JOIN formuser_master u ON(t.emp=u.Nname) WHERE t.form1_no='"+req+"' AND t.emp='"+SessionName+"' AND t.id IN(SELECT MAX(id) FROM form1_it_clearance_item WHERE form1_no='"+req+"' GROUP BY desg) ORDER BY t.id ASC");
	  if(rst2.next())
	  {
		  StringOfrst2 = rst2.getString(1);
	  }
	  rst6 = stt6.executeQuery("select t.form1_no from form1_it_clearance_item t INNER JOIN formuser_master u ON(t.emp=u.Nname) WHERE t.form1_no='"+req+"' AND t.emp='"+SessionName+"' AND desg LIKE '%IT SUPPORT%' AND t.id IN(SELECT MAX(id) FROM form1_it_clearance_item WHERE form1_no='"+req+"' GROUP BY desg) ORDER BY t.id ASC");
	  //rst3 to check present person  is IT SUPPORT
	  System.out.println("I_city :"+i_city);
	  rst3 = stt3.executeQuery("SELECT Nname,Npost,Nmail FROM formuser_master WHERE substr(NpostingCo,-2,2)='"+i_city.substring(i_city.length()-2,i_city.length())+"' AND Npost LIKE '%IT SUPPORT%' LIMIT 1");
	  if(rst3.next())
	  {
		  Stringrst3 = rst3.getString(1);
	  }
	  //
	  //rst4 = stt4.executeQuery("select t.form1_no from form1_it_clearance_item t INNER JOIN formuser_master u ON(t.emp=u.Nname) WHERE t.form1_no='"+req+"' AND t.emp='"+SessionName+"' AND t.id IN(SELECT MAX(id) FROM form1_it_clearance_item WHERE form1_no='"+req+"' GROUP BY desg) ORDER BY t.id ASC");
	    rst4 = stt4.executeQuery("select NotHRThenEnterINTable from form1_it_clearance WHERE NotHRThenEnterINTable LIKE '%Accounts%' AND HRvalidateIT='IT entered' AND form1_no='"+req+"'");//IT SUPPORT
	    //rst4 = stt4.executeQuery("select NotHRThenEnterINTable from form1_it_clearance WHERE NotHRThenEnterINTable LIKE '%Accounts%' AND form1_no='"+req+"'");//IT SUPPORT
	  //rst4 = stt4.executeQuery("select f.NotHRThenEnterINTable from form1_it_clearance f INNER JOIN form1_it_clearance_item i ON (f.form1_no=i.form1_no) WHERE NotHRThenEnterINTable LIKE '%Accounts%' AND i.desg LIKE '%IT SUPPORT%' AND f.form1_no='"+req+"'");//IT SUPPORT
	     if(rst4.next())
		  {
			  StringOfrst4 = rst4.getString(1);
			 
		  }  System.out.println("IT approved then it shows to reporting officer : "+StringOfrst4);
	  //showing HR guys for that IT clearance form
	  rst5 = stt5.executeQuery("select form1_no,i_name,i_desg,i_email_id from form1_it_clearance WHERE form1_no='"+req+"' AND i_desg LIKE '%HR%' ORDER BY id ASC");
	  
	  rst112 = stt112.executeQuery("select form1_no,i_name,i_desg,i_email_id,r_officer  from form1_it_clearance WHERE form1_no='"+req+"' ORDER BY id ASC");
	  if(rst112.next())
	  {
		  StringOfrst112 = rst112.getString(1);
	  }
	  int flag31=0;%>
	  <%//if(rst111.next())
 if(StringOfrst111!=null)
{		  
		  %>
	<table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
 
 <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
 <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
  <input type="hidden" value="<%= session.getAttribute("form1_no") %>" id="idmrId"/>
<input type="hidden" id="idstatus" value="<%= flag %>" />

  
  <tr>
    <td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(showTR());"/>Approved 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR());" />Not Approved
       
    </td>
    
   
  </tr>  
  <tr style="visibility: hidden;display: none;" id="idApproved" >
   <td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="higherAuthority" id="idIT" onclick="hideHigherTR();" />Send To Higher Authority 
       
       
       
       
   
    
       </td>
       <td style="visibility: hidden;display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="directApprove" id="idmNon" onclick="showHigherTR();"/>Direct Approve</td>
  </tr>
  <tr style="visibility: hidden;display: none;" id="idApprovedd" >
   <td>
  <select name="desg" onchange="showEmp(this.value)" class="a" style="font-size : 8pt">      
                       <option value="none" class="a">Select</option>
                          
                          <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                          cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                          st5 = cn5.createStatement();  
                          //rs5 = st5.executeQuery("Select * from desg");
                          rs5 = st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO)");
                          while(rs5.next()){     %>     
                          
                           <option class="a" value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>     
                                        <br>    
                                            <div id='emp' class="a">      
                                              <select name="emp" style="font-size : 8pt">   
                                                   <option value='-1'></option>  
                                                         </select>   
                                                            </div> 
                                                         
     
   <br />                                                 
  <label style="float: left;" id="idMailLabel"></label>  
       <input type="hidden" name="mail1" id="idMailValue" value="" />
         </td>
  </tr>
  <tr style="visibility: hidden;display: none;" id="idApproved1" >
   <!-- <td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Itradio" value="IT" id="idIT" checked='checked'/>IT 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Itradio" value="NON" id="idmNon" />NON IT
   </td> -->
<!--    <td style="display: none;">
   
   </td> -->
   <td>
   <input align="left" type="radio" name="Itradio" value="IT" id="idIT" />IT 
   <label>Mail will be send to HO-IT department</label>
   </td>
  </tr>

  <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="90" maxlength="199"></textarea></div></td>
  </tr>
  
 
 </table>  
<%}else{ %>	  
	  	<table align="center" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	  <tr><td>
	  <div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="140" maxlength="199" placeholder="Enter Your Remarks"></textarea></div>
	  <% if(StringOfrst1!=null) 
	  { String i__namee=rst1.getString("i_name");
	  
	  System.out.println("Am Initiator");
	   %>
	  <p>Am Initiator </p>  
	
	<input type="checkbox" name="fullSendingDetails" value="<%=i__namee%>"/><%=i__namee%>
	          <%   if(StringOfrst4==null)//(rst4.next())
	            {
	            // String NotHRThenEnterINTable = rst4.getString("NotHRThenEnterINTable");
	             //System.out.println("NotHRThenEnterINTable TRUE "+NotHRThenEnterINTable);//If Accounts is present in field , then need to send IT support as per the routine.
	             
	             %><p>HR Department Need to send back to IT local department</p>  
					 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(validateHR1());"/>Approved 
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(validateHR1());" />Not Approved
				     </p>
				 
						<% if(Stringrst3!=null)
						{String emp_name = rst3.getString("Nname");
						String emp_desg = rst3.getString("Npost");
						String emp_mail_id = rst3.getString("Nmail");
						String fullSendingDetails = emp_name +","+emp_desg +","+emp_mail_id;
						System.out.println("fullSendingDetails ------------------------------------------------------------------:"+fullSendingDetails);
						flag31=1;
						%><b>Send to :</b> &nbsp;&nbsp;
						<input class="check" type="radio" name="mailingCheck" value="<%=fullSendingDetails%>" /><%=emp_mail_id%>
					    <input type="text" name="CheckValuesHRtoIT" readonly="readonly" id="text" value="" size="55"/> 
							     <font color="red" size="2">
						           <%
						            if(flag31==0){
						            	
						            int flag31g =0;
						            	out.println("Sorry...! IT Local does not exist for '"+city+"' location");
						            	System.out.println("query not equal to flag31 IT LOCAL does not exist");
						            	%>
						            	
						            <input type="hidden" name="flaggg" value="<%=flag31g%>"/>	
						           <% }%></font>
						</td></tr></table>
						<% }%>
	            <%}else{
	            	
		            	if(StringOfrst112 != null)
						{String r_officer_name = rst112.getString("r_officer");
						 System.out.println("Am Initiator : Check for Reporting Officer :"+r_officer_name);
						rst312 = stt312.executeQuery("SELECT Nname,Npost,Nmail FROM formuser_master WHERE Nname='"+r_officer_name+"' ");
						if(rst312.next()){
						String emp_name = rst312.getString("Nname");
						String emp_desg = rst312.getString("Npost");
						String emp_mail_id = rst312.getString("Nmail");
						String fullSendingDetails = emp_name +","+emp_desg +","+emp_mail_id;
						System.out.println("Am Initiator : Check for Reporting Officer : : fullSendingDetails ------------------------------------------------------------------:"+fullSendingDetails);
						
						flag31=1;
						%>
						<p>HR Department Need to Reporting officer</p>  
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(validateHR1());"/>Approved 
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(validateHR1());" />Not Approved
				        </p>
						<b>Send to :</b> &nbsp;&nbsp;
						<input class="check" type="radio" name="mailingCheck" value="<%=fullSendingDetails%>" /><%=emp_mail_id%>
					    <input type="text" name="CheckValues" readonly="readonly" id="text" value="" size="55"/> 
					    <font color="red" size="2">
						           <%
						            if(flag31==0){
						            	
						            int flag31g =0;
						            	out.println("Sorry...! Reporting Officer does not exist for Present Application");
						            	System.out.println("query not equal to flag31 reporting officer does not exist");
						            	%>
						            	
						            <input type="hidden" name="flaggg" value="<%=flag31g%>"/>	
						           <% }%></font>
						</td></tr></table>
						<%} }%>
	             <%} %>
	
	<%} 
	  else if (StringOfrst2!=null)	//If Account Department sending tO HR
	  {
		  
	      
		  //String accountDepartment = rst2.getString(1);%>
	  <!-- <p>Account department Need to send back to HR department</p>   -->
	  <!-- IT SUPPORT ALSO SENDS TO HR -->
		<p>Need to send back to HR department</p>  
		
	 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(validateHR1());"/>Approved 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(validateHR1());" />Not Approved
     </p>
 
		<% if(rst5.next())
		{String emp_name = rst5.getString("i_name");
		String emp_desg = rst5.getString("i_desg");
		String emp_mail_id = rst5.getString("i_email_id");
		String fullSendingDetails = emp_name +","+emp_desg +","+emp_mail_id;
		System.out.println("fullSendingDetails ------------------------------------------------------------------:"+fullSendingDetails);
		flag31=1;
		%><b>Send to :</b> &nbsp;&nbsp;
		<input class="check" type="radio" name="mailingCheck" value="<%=fullSendingDetails%>" /><%=emp_mail_id%>
	    <input type="text" name="CheckValues" readonly="readonly" id="text" value="" size="55"/> 
	    <font color="red" size="2">
				           <%
				            if(flag31==0){
				            	
				            int flag31g =0;
				            	out.println("Sorry...! HR Local does not exist for '"+city+"' location");
				            	System.out.println("query not equal to flag31");
				            	%>
				            	
				            <input type="hidden" name="flaggg" value="<%=flag31g%>"/>	
				           <% }
				 %></font>
		</td></tr></table>
		<% }%>
			
		<% 
	  }
	  else if (Stringrst3!=null)	//IT SUPPORT sending TO HR
	  { String accountDepartment = rst2.getString(1);%>
		<p>IT department Need to send back to HR department</p>
		<table align="center" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
		<tr><td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(validateHR1());"/>Approved 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(validateHR1());" />Not Approved
         </td></tr> 
   <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="90" maxlength="199"></textarea></div></td>
  </tr>
   </table>
		<% if(rst5.next())
		{
		String hrlocal = rst5.getString("i_email_id");%>
		<input type="checkbox" name="fullSendingDetails" value="<%=hrlocal%>"/><%=hrlocal%>
		<% }
	  }
	  else{}
}%>
 

 
</br>
                                                                
   </td>
		
	</tr>
</table>  --%>
				<!--  <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='ITclearanceSelectAdmin.jsp?msg=1'"/> </td>
      <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td>
    <td>  <INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate();" /></td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	<td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
   	</tr>
 
</table> -->
				<!-- <table style="margin-left: auto;margin-right: auto;" >
 <tr>
 
      <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td> -->
				<%-- <%
System.out.println("NAME FOR SUBMIT : "+SessionName);
if((ITbno.equals(session.getAttribute("b_no")) && ITdesg.equals(session.getAttribute("desg"))))
 {%>
    <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value=" IT SUBMIT" name=button1 onclick="return ITManager();" /></td>
    <%} 
    else  --%>
				<%-- <%if(StringOfrst111!=null)
    { %>
    <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate() && OtherAdmin());" /></td>
    <%} 
    else {%>
    
   <!--  <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="Chec box SUBMIT" name=button1 onclick="return (OtherAdminCheckBox());" /></td> -->
    
      <%
        	  if(StringOfrst1!=null)
        	  {
        	   if(StringOfrst4==null)//(rst4.next())//StringOfrst4!=null
        	   {%>
        	   <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SEND TO IT" name=button1 onclick="return (validateHRtoIT1atempt() && ITClearanceSendingHRtoIT1atempt());" /></td>
        	   <% }
        	   else{%>
            	   <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SEND TO RO" name=button2 onclick="return (validateHRtoROatempt() && ITClearanceSendingHRtoROatempt());" /></td>
            	   <%
        	       }
        	  }
        	  else if(StringOfrst2!=null)
        	  {//Account sending to HR in first attempt%>
       	   <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name="button3" onclick="return (validateACtoHR1atempt() && ITClearanceSendingACtoHR1atempt());" /></td>
    	   <%
        	  }
        	  else if (Stringrst3!=null)
        	  {%>
       	   <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (OtherAdminCheckBox());" /></td>
    	   <%
        	  }
        	  %>
          
    
    
    <% }%>
    --%>


















				</table>
				<%
				} catch (Exception e) {
				System.out.println(e);
				} finally {
				DbUtil.closeDBResources(rs1, st1, cn1);
				DbUtil.closeDBResources(rs2, st2, cn2);
				DbUtil.closeDBResources(rs3, st3, cn3);
				DbUtil.closeDBResources(rs4, st4, cn4);
				DbUtil.closeDBResources(rs5, st5, cn5);
				DbUtil.closeDBResources(rs11, st11, cn11);
				DbUtil.closeDBResources(rs100, st100, cn100);
				DbUtil.closeDBResources(null, psmt, null);
				DbUtil.closeDBResources(rst111, null, cnt111);
				DbUtil.closeDBResources(rst1112, null, cnt1112);
				DbUtil.closeDBResources(rst112, null, cnt112);
				DbUtil.closeDBResources(rst312, null, cnt312);
				}
				%>
			</center>
			<br /> <br /> <br />

		</div>
		<div id="dialog" class="web_dialog">
			<table style="width: 100%; border: 0px;" cellpadding="3"
				cellspacing="0">
				<tr>
					<td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
					<td class="web_dialog_title align_right"><a href="#"
						id="btnClose">Close</a></td>
				</tr>
			</table>
			<br /> <label style="text-align: center;">HR/Admin (Local)</label> <br />
			<label style="font-size: 30px;">&#x21d3;</label> <br /> <label>A/C
				(Local)</label> <br /> <label style="font-size: 30px;">&#x21d3;</label> <br />
			<label>IT (Local</label> <br /> <label style="font-size: 30px;">&#x21d3;</label>
			<br /> <label>HR/Admin (Local)</label> <br /> <label
				style="font-size: 30px;">&#x21d3;</label> <br /> <label>Reporting
				Officer</label> <br /> <label style="font-size: 30px;">&#x21d3;</label> <br />
			<label>HR/Admin (Local)</label> <br /> <label
				style="font-size: 30px;">&#x21d3;</label> <br />

			<fieldset>
				Super Admin <br /> <label>BM/GM</label> <br /> <label
					style="font-size: 30px;">&#x21d3;</label> <br /> <label>IT(HO)</label>
				<br /> <label style="font-size: 30px;">&#x21d3;</label> <br /> <label>HR/Admin
					(HO)</label> <br /> <label style="font-size: 30px;">&#x21d3;</label> <br />
				<label>GA(HO)</label> <br /> <label style="font-size: 30px;">&#x21d3;</label>
				<br /> <label>HR/Admin (HO)</label> <br />
			</fieldset>
			<br /> <br />
		</div>
	</form>

</body>

</html>