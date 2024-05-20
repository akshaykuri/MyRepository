<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %><%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "timeDiff" class="CON2.TimeDifference" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>IMS REPORT</title>
	<link rel='stylesheet' type='text/css' href='css/homePage.css' />
	<script language="javascript"   type="text/javascript" src="js/selectLocationWiseHO.js"></script>
	<script language="javascript"   type="text/javascript" src="js/SelectionComplain.js"></script> 
	<script language="javascript" type="text/javascript" src="js/datetimepicker.js">
	/* 
    Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
	Script featured on JavaScript Kit (http://www.javascriptkit.com)
	For this script, visit http://www.javascriptkit.com */

	</script>
	<link rel='stylesheet' type='text/css' href='css/style4.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }

/*    function validate()
   {
       
       var d1=document.form.time_in;
       var d2=document.form.time_out;
       var m=document.form.mail;
    if ((d1.value==null)||(d1.value=="")){
   alert("Enter Login Time!");
   d1.focus();
   return false;
   }
   if (checkAddress(d1.value)==false){
   d1.value="";
   alert("Invalid Login Time");
   d1.focus();
   return false;
   }
   if ((d2.value==null)||(d2.value=="")){
	   alert("Enter Log Out Time!");
	   d2.focus();
	   return false;
	   }
	   if (checkAddress(d2.value)==false){
	   d2.value="";
	   alert("Invalid Log Out Time");
	   d2.focus();
	   return false;
	   }   
	    if ((m.value==null)||(m.value=="")){
		   alert("Enter Designation And Employee Name!");
		   m.focus();
		   return false;
		   }
		   if (checkAddress(m.value)==false){
		   m.value="";
		   alert("Invalid Designation And Employee Name");
		   m.focus();
		   return false;
		   } 
		   	   
else
return true;
   }
    */
 
</script>
<script type="text/javascript">
  function validateCheck()
   {
	  //	alert("alert");
	   var chkd = document.form.itmail.checked || document.form.admail.checked ||  document.form.gmmail.checked || document.form.hrmail.checked;

	    if (chkd) {
	      return true; //Submit the form
	    } else {
	      alert ("Please Tik a Checkbox To Send IMS Report\n ");
	      return false; //Prevent it from being submitted
	    }
   }
</script>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__", "  "); 
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

<script language="javascript" type="text/javascript">
function link(complain_id) {
             document.form.action="updateComplaintPage.jsp?number="+complain_id;
   			 document.form.target="_self";
   			// newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
   			 //document.form.target=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
   			// document.form.target.focus();
   			 document.form.method="post";
   		     document.form.submit();
   			 
   			     }
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} 
</script>

		<script>
		var id =0;
		
		$(document).ready(function() {
			
			
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
				var master = $(this).parents("table.dynatable");
				
				// Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "")
				prot.find(".id").attr("value", id);
				prot.find(".incComplainId").attr("id","ComplainId"+id); 
				prot.find(".incUserName").attr("id","UserNameId"+id); 
				prot.find(".incModule").attr("id","ModuleId"+id); 
				prot.find(".incUserDescrip").attr("id","UserDescripId"+id);
				prot.find(".incTime").attr("id","TimeId"+id);
				prot.find(".incTime2").attr("id","Time2Id"+id);
				prot.find(".incTimeDiff").attr("id","TimeDiffId"+id);
				prot.find(".incStatus").attr("id","StatusId"+id);
				prot.find(".incRemarks").attr("id","RemarksId"+id);
				master.find("tbody").append(prot);
			});
			
			// Remove button functionality
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("tr").remove();
				id--
			});
			
		});
		
		
		
		</script>
	<%
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute("city")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("adminbom.jsp?msg="+msgg);
}
%>	
		<script type="text/javascript">
		
		       var idd = 0;
		     function clear()
		          {
		          
		                 
		               	    var frm=document.forms[0],flds=[frm['itemQuantity'],frm['itemRate'],frm['itemAmount']],total=0;
 							for (var z0=0;z0<flds[0].length;z0++)
 							{
 							 if (isFinite(flds[0][z0].value*1)&&isFinite(flds[1][z0].value*1))
 							 // if (isFinite(flds[0][z0].value*1)&&isFinite(flds[1][z0].value*1)&&isFinite(flds[2][z0].value*1)&&isFinite(flds[3][z0].value*1)&&isFinite(flds[4][z0].value*1))
 							 {
 							  flds[2][z0].value = clearComma(flds[2][z0].value);
  						     }
					        }          
 						    frm['totalcon'].value=(clearComma(total));
		 
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
                       }       var url="selImsBranch.jsp";  
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
            
    <!--
function popupform(myform, windowname)
{
if (! window.focus)return true;
window.open('', windowname, 'height=200,width=400,scrollbars=yes');
myform.target=windowname;
return true;
}
//-->
/* function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} */
       
                </script>
                <script type="text/javascript">
                function  get_val5( tot_val,head_val, ids )
   {
      
         var y = 'iditemName'+ids.toString();
         var z = 'idHead'+ids.toString();
        document.getElementById(y).value = tot_val; 
        document.getElementById(z).value = head_val; 
     	
   }
                
                function Note()
                {
                	var s = document.getElementById("sta");
                	var ss = document.getElementById("cm_time_diff_id");
                	if(ss.value == "" );
                	alert("Date Time Will Be Calculated Auto");
                	ss.focus();
                	isValidForm =false;
                }
                </script>

  <style type="text/css"> 
textarea.special { 
font-family:arial; 

font-size:11px; 
overflow: auto;
}
    
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
select {
    font-size:0.8em;
     /* border-color:#999;  without this, it won't work */
}

</style>

		<script type="text/javascript">
		      function linkInsert()
		        {
		            document.form.action = "PurchaseOrderBack.jsp";  
		        	document.form.method = "post";
		        	document.form.submit();
		        
		        }
		</script>
		<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
		</style>
		
		
</head>

<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	            String total_val=null;
	              String req;
	              Connection2 dbConn = new Connection2();
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null,locationNO=null;
	            // String transId = null;  
	             
	            // String textArea1,textArea2,txtDate,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,mr_idpo,mr_assetpo,itemhead;
	            String idextend,complain_id,cm_name,cm_location,cm_date,emp,transid,cm_type,cm_problem,mail,status,cm_status,admin_remarks;
	            
	            Timestamp cm_time,cm_time2,cm_time_diff=null;
	            
	%>


     <%--
                 // transId = "abc"+String.valueOf(Math.random()); 
     
                  req = request.getParameter("txtCalendar");
                  
                  
                  
                  System.out.println("Request payload: "+ req);
String[] dateString = req.split("-");
                  
                  System.out.println(dateString[1]);
                 
                  if (dateString[1].equals("Jan"))
                  {
                	  dateString[1]="01";
                  }
                  if (dateString[1].equals("Feb"))
                  {
                	  dateString[1]="02";
                  }
                  if (dateString[1].equals("Mar"))
                  {
                	  dateString[1]="03";
                  }
                  if (dateString[1].equals("Apr"))
                  {
                	  dateString[1]="04";
                  }
                  if (dateString[1].equals("May"))
                  {
                	  dateString[1]="05";
                  }
                  if (dateString[1].equals("Jun"))
                  {
                	  dateString[1]="06";
                  }
                  if (dateString[1].equals("Jul"))
                  {
                	  dateString[1]="07";
                  }
                  if (dateString[1].equals("Aug"))
                  {
                	  dateString[1]="08";
                  }
                  if (dateString[1].equals("Sep"))
                  {
                	  dateString[1]="09";
                  }
                  if (dateString[1].equals("Oct"))
                  {
                	  dateString[1]="10";
                  }
                  if (dateString[1].equals("Nov"))
                  {
                	  dateString[1]="11";
                  }
                  if (dateString[1].equals("Dec"))
                  {
                	  dateString[1]="12";
                  }
                  
                  String dateF = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
                  System.out.println("DATE FORMAT dateF "+dateF);
                  
                  
                  --%><%
                  Connection cnl2 = null; 
                  Statement stl2 = null; 
                  ResultSet rsl2 = null; 
                  Connection cnl1 = null; 
                  Statement stl1 = null; 
                  ResultSet rsl1 = null; 
                  Connection cnl4 = null; 
                  Statement stl4 = null; 
                  ResultSet rsl4 = null; 
                  Connection cnl3 = null; 
                  Statement stl3 = null; 
                  ResultSet rsl3 = null; 
                  String gmname=null,gmpost=null,gmmail=null;
                  String brname=null,brpost=null,brmail=null;
                  String itname=null,itpost=null,itmail=null;
                  String adname=null,adpost=null,admail=null;
                  Connection cn5 = null; 
                  Statement st5 = null; 
                  ResultSet rs5 = null; 
                  Connection cn2 = null;
                  Statement st2= null; 
                  ResultSet rs2 = null;

                  Connection cna2 = null;
                  Statement sta2 = null; 
                  ResultSet rsa2 = null;
                  Connection cn1 = null;
                  Statement st1 = null; 
                  ResultSet rs1 = null;
                  Connection cn_id = null; 
                  Statement st_id = null; 
                  ResultSet rs_id = null; 
                      try{                
                                      
                  String cs_datett;
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Date date = new Date();
					cs_datett = dateFormat.format(date);
					System.out.println("DATE"+cs_datett);
					
			    PreparedStatement psmt1=null,psmt2=null,psmt3=null;		
					
					
                  String transId = "abc"+String.valueOf(Math.random());
                  
         		  logInName = session.getAttribute("theName");
         		  realname = session.getAttribute("Nname");
         		  
         		 String realname = null;
         		
         		 realname =(String) session.getAttribute("Nname");
         		  
         		  System.out.println("NAME::::real one "+realname);
         		  System.out.println("NAME::::login name "+logInName);
         		  desg = session.getAttribute("desg");
         		  city = session.getAttribute("NpostingCo");
         		  locationNO = session.getAttribute("b_no");
         	      Initiator = session.getAttribute("Nmail");
         		  System.out.println("IMS Branch nameeee Mrho  "+city);
         		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
                 // out.println("Request payload: "+ req);
                   conn = con.getConnection2();
                   st = conn.createStatement();
                   //rs = st.executeQuery("select * from po where po.pordernon='"+req+"'");
                 //   rs = st.executeQuery("select textarea1,textarea2,txtDate,textarea3,textarea4,VendorText,rupes,taxes,desg,emp,DATE_FORMAT(po_date,'%d/%m/%Y') as po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,itemhead,mr_idpo,mr_assetpo,transid from po where po.pordernon='"+req+"'");
                    //rs = st.executeQuery("select complain_id,cm_date,cm_date2,emp,transid,cm_type,mail,status from complain_master_item WHERE cm_date='"+dateF+"' AND complain_id LIKE 'NEIN/CM%' AND mail LIKE '"+Initiator+"'");
                    //select complain_id,cm_date,cm_date2,emp,transid,cm_type,mail,status from complain_master_item WHERE cm_date='2014-02-21' AND emp='Mathan Kumar'
                    rs = st.executeQuery("select complain_id,cm_date,cm_date2,emp,transid,cm_type,mail,status from complain_master_item WHERE cm_date='"+cs_datett+"' AND emp='"+realname+"'");
                   while(rs.next()){
                	   
                	   complain_id = rs.getString("complain_id");
                	
                	   emp = rs.getString("emp");
                	   // cm_name = rs.getString("cm_name");
                	    //cm_location = rs.getString("cm_location");
                	    cm_date = rs.getString("cm_date");
                	   // cm_time = rs.getString("cm_time");
                	   // cm_time2 = rs.getString("cm_time2");
                	  //  cm_time_diff = rs.getString("cm_time_diff");
                	 //   cm_status = rs.getString("cm_status");
                	    
                	      transid = rs.getString("transid");
                	      
                   }
                  
                  
                   
                  	 
                  	 
                  	 
     %>
     
<body background="images/u.jpg">



<!--  <form name="form" method="post" action="ims_HO_Save_Back.jsp" onsubmit="popupform(this, 'join')">   -->
 <form name="form" method="post" action="ims_Branch_Save_BackAdmin.jsp">  

<%-- <form name="form" method="post" action="TempWork.jsp">--%>


<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"><%= session.getAttribute( "theName" ) %></textarea>

<!--<div id="leftfeature"><input type="button" value="BACK" onclick="window.location.href='HO.jsp'"/></div>
	-->


		
		
		 <input type="hidden" name="transid" value="<%=transid%>" />
	
		<input type="hidden" name="sysAdminMail" value="<%=Initiator%>" />
		<input type="hidden" name="e_LocationNo" value="<%=locationNO%>"/>
		<div style="clear:both"></div>
		
		<div id="customer">

         

		
		</div>
		
		

		
               <%--  
                String cs_date;
         	   DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         	   //get current date time with Date()
         	   Date date = new Date();
            	
            	cs_date = dateFormat.format(date);
            	
            	
                System.out.println("cs date we are getting "+cs_date);
            	String cr_time;
            	
                --%>
               <%
               Date currentdate = new Date(); 
               //Date hour = currentdate.getHours()+":"+ currentdate.getMinutes() + ":" + currentdate.getSeconds();

              // hour = document.getElementById('hour1').value;
               //var vat = document.getElementById("hour").value;
               //alert("time zone :"+hour);
               //--------------------------------------
               
               long start = System.currentTimeMillis();
				long end = start + (1*3600 + 23*60 + 45) * 1000; // 1 h 23 min 45.678 s
				Date timeDiff2 = new Date(end - start - 3600000); // compensate for 1h in millis
				SimpleDateFormat timeFormat = new SimpleDateFormat("H:mm:ss");
				System.out.println("Duration: " + timeFormat.format(timeDiff2));
               System.out.println("second version"+timeFormat);
               %>
	
	<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<%
                     
                    String new_id = null;
                    int id=0;
                    String id22=null;
                    
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                  //  rs_id = st_id.executeQuery("SELECT max(idextend) from ims_master where ims_id like 'NEIN/CS/IMS/90-%'");
                    //rs_id = st_id.executeQuery("SELECT max( idextend ) ,substr(cs_id,12,4), substr( cs_id, 1, 11 ) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+city+"'=branch_master.b_name GROUP BY cs_id");
                   // rs_id = st_id.executeQuery("SELECT max(idextend),substr(ims_id,16,4),substr(ims_id,1,15) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+city+"'=branch_master.b_name GROUP BY ims_id");
                    /* rs_id = st_id.executeQuery("SELECT max(idextend),(SELECT max(substr(ims_id,16,4)) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no)AS increval,(SELECT max(substr(ims_id,1,15)) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no)AS increLoc FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no"); */
                    rs_id = st_id.executeQuery("SELECT max(idextend),(SELECT max(idextend) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no)AS increval,(SELECT max(substr(ims_id,1,15)) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no)AS increLoc FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no");
                    while ( rs_id.next() )
                    {    
                    	
                    	
                    	try
                    	{
                    		//id=rs_id.getInt(1);
                    		id=rs_id.getInt("increval");
                    		if(id==0)
                    			id=1;
                    		id22= rs_id.getString("increLoc");
                    		if(id22==null)
                    			id22="NEIN/CS/IMS/"+locationNO+"-";
                    		 System.out.println("ID  before "  +id);
                                 id=id+1;     
                                 System.out.println("ID  after "  +id);
                                 System.out.println("IDD22   "  +id22);
                    			System.out.println("Gen id "  +rs_id.getInt(1));
                    			new_id =id22+String.valueOf(id);
                    			System.out.println("NEW ID  "+new_id);
                    	}
                    	catch(SQLException ex)
                    	{
                    		  System.out.println(ex.toString());
                    		 new_id = "NEIN/CS/IMS/90-1";
                    	    }

                    }
                                   
                    %>

<br />
   <%

cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select b_name from branch_master ORDER BY b_name Asc");

%>
<center>
<table border="1" cellspacing="1" width="800" align="center" background="images/s.jpg">
<tr><td colspan="5" align="left"><center><b><font size="3" style="font-size: medium;">IMS DAILY REPORT</font></b></center></td></tr>
<%-- <tr>
<td colspan="4"  class="meta-head" align="left">Client Name:NIPPON EXPRESS (INDIA) PRIVATE LIMITED</td>
<td colspan=""  class="meta-head" align="left">DATE:<textarea id="temp_date" name="Send_date" readonly="readonly" rows="1" cols="15"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
</tr>
<tr>
<td colspan="4" align="left">SYSTEM ADMINISTRATOR NAME:<textarea rows="1" cols="25" readonly="readonly" name="admin_name"><%=realname%></textarea> </td>
<td class="meta-head" width="100" align="left">Time IN : <textarea id="" name="time_in" rows="1" cols="10"></textarea></td>
<td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>

</tr>
<tr>
<td colspan="4" align="left">Location Name :<textarea rows="1" cols="15	" readonly="readonly" name="admin_city"><%=city%></textarea></td>
<td colspan="" align="left">IMS Number :<textarea rows="1" cols="25	" readonly="readonly" name="ims_id"><%=new_id%></textarea></td>
<td class="meta-head" width="100" align="left">Time OUT : <textarea id="" name="time_out" rows="1" cols="10"></textarea></td>
</tr> --%>
<tr>
<td>SYS ADMIN:<textarea rows="1" cols="25" readonly="readonly" name="admin_name"><%=realname%></textarea></td>
<td>Location Name :<textarea rows="1" cols="15	" readonly="readonly" name="admin_city"><%=city%></textarea></td>
<td>DATE:<textarea id="temp_date" name="Send_date" readonly="readonly" rows="1" cols="15"> <%= po_date.format(new java.util.Date()) %> </textarea></td>
<td style="visibility: hidden; display: none"><input
			type="hidden" name="idextend" value="<%=id%>" /></td>
</tr>
</table>



<br />
   <%


cna2 = con.getConnection2();
sta2=cna2.createStatement();
rsa2 = sta2.executeQuery("select * from branch_master ORDER BY b_name Asc");



cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select csm_name from current_status_master ORDER BY csm_name Asc");

%>
 

	<table class="dynatable" width="1200" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
			
				<tr>
				    
				    
				
				    
					<td width="" align="center"  height="21" >Sl No</td>
					<td width="67" align="center"  height="21" >Complain ID </td>	
					<td width="67" align="center"  height="21" >User Name </td>	
					<td width="67" align="center"  height="21" >Module</td>	
					<td width="67" align="center"  height="21" >Problem Type</td>				
					<td width="67" align="center"  height="21" >Problem Description</td>
					<td width="67" align="center"  height="21" >Report Time</td>
					<td width="67" align="center"  height="21" >Completed Time</td>
					<td width="67" align="center"  height="21" >Total Duration</td>
					<td width="67" align="center"  height="21" >Current status</td>
					<td width="67" align="center"  height="21" >Remarks</td>
			
					
				</tr>  
				    
				    <%
				            int i=0;int k=0;
				            conn = con.getConnection2();
				            st2 = conn.createStatement();
				           // rs = st.executeQuery("select complain_id,cm_name,transid,cm_location,cm_problem,DATE_FORMAT(cm_time,'%h:%i:%s') as cm_time,DATE_FORMAT(cm_time2,'%h:%i:%s') as cm_time2,TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				             //rs = st.executeQuery("select cm_time,DATE_FORMAT(STR_TO_DATE(cm_time2,'%d-%m-%y %h:%i:%s'),'%h:%i:%s') as cm_time2,TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				           //rs = st.executeQuery("select cm_time,FROM_UNIXTIME(UNIX_TIMESTAMP(STR_TO_DATE(cm_time2, '%M %d %Y %h:%i%p')),'%h:%i:%p') as cm_time2,TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				           //rs = st.executeQuery("select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp from complain_master_item WHERE cm_date='"+dateF+"'");
				          // rs2 = st2.executeQuery("select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_time,cm_time2,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type from complain_master_item WHERE cm_date='"+cs_datett+"' AND emp='"+realname+"' UNION select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_time,cm_time2,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type from complain_master_item WHERE cm_date2='"+cs_datett+"' AND emp='"+realname+"' ");
				           
				           psmt1 = cn2.prepareStatement("select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_time,cm_time2,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type from complain_master_item WHERE cm_date=? AND emp=? UNION select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_time,cm_time2,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type from complain_master_item WHERE cm_date2=? AND emp=?");
				           psmt1.setString(1,cs_datett);
				           psmt1.setString(2,realname);
				           psmt1.setString(3,cs_datett);
				           psmt1.setString(4,realname);
				           
				           rs2 = psmt1.executeQuery();
				           java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
				            while(rs2.next()){
				        						k++;
				            					complain_id = rs2.getString("complain_id");
                								emp = rs2.getString("emp");
                	 						    cm_name = rs2.getString("cm_name");
                							    cm_location = rs2.getString("cm_location");
                	 						    cm_problem = rs2.getString("cm_problem");
                	                            cm_time = rs2.getTimestamp(1);
                							    cm_time2 = rs2.getTimestamp(2);
                							    			
                							   // String diff = rs2.getString("cm_time_diff");
                							 	//System.out.println("NEW :::::::::::::::::::::::::::::::: :"+diff);
                							 		System.out.println("cm time value :"+cm_time);
                							 	System.out.println("cm time 2  value :"+cm_time2);
                							 	
                							 	
                							 	//Timestamp cm_time22 = rs2.getTimestamp("cm_time2");
                							 //	System.out.println("cm time 22  value :"+cm_time22);
                							 	
                							 	
                							 	//SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");
                							  //  Date parsedDate = dateFormat2.parse(cm_time22);
                							   // Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
                							    
                							   // System.out.println("new date format : "+timestamp);
                							   //select TIME(cm_time),TIME(cm_time2),TIMEDIFF(cm_time2,cm_time) as cm_time_diff,cm_time,cm_time2,complain_id,cm_name,transid,cm_location,cm_problem,cm_status,admin_remarks,emp,cm_type from complain_master_item WHERE cm_date='2014-04-23' AND emp='Mathan Kumar'
                							 	Timestamp t1 = rs2.getTimestamp("cm_time");
                							 	System.out.println("t1 value :"+t1);
                							 	Timestamp t2 = rs2.getTimestamp("cm_time2");
                							 	
                						
                							 	System.out.println("t2 value :"+t2);
                							 	
                							 	//String cm_time_diff2 = rs2.getString(3);
                							 	//String diffTime = timeDiff.getTimeDifference(t1.toString(),t2.toString());
                							 	String diffTime = timeDiff.getTimeDifference(t1.toString(),t2.toString());
                							 //	System.out.println("cm time difftttttttttttt :"+cm_time_diff2);
                							    cm_status = rs2.getString("cm_status");
                							  
                							    cm_type = rs2.getString("cm_type");
                							    admin_remarks = rs2.getString("admin_remarks");
                    						    transid = rs2.getString("transid");
				    			        	        i++;
				        		    	   		     String tot_val=null;
				            	      		   	     String head = "ComplainId";
				            	       				 String itemN = "iditemName";
				            	       				
				            %>
				            
				            <script>
				                    
				                     id++;
				                     
				            </script>
				            
				                 
				     <tr>
				  
				  
				     
				 
				    <td width="67" align="center"  height="21" ><input type="text" name="id[]\" value="<%=i%>" size=1 class="id" /></td>
					<td>   <input type="hidden" name="<%=k%>" value="<%=complain_id%>" />
					<input type="text" readonly="readonly" name="complain_id" id="<%=head+i%>" value="<%=complain_id%>" id="ComplainId" class="incComplainId" size="20"/></td>
					<td><textarea  readonly="readonly" name="cm_name" id=""  rows="1" cols="25" class="incUserName" id="UserNameId" ><%=cm_name %></textarea></td>
					<td width="100"><textarea  readonly="readonly" name="cm_location" id=""  rows="1" cols="14" class="incModule" id="ModuleId" ><%=cm_location %></textarea></td>
					<td width="100"><textarea  readonly="readonly" name="cm_type" id=""  rows="1" cols="14" class="incType" id="TypeId" ><%=cm_type%></textarea></td>
	
					<%-- <td width="67" align="center"  height="21" ><input type="text" name="itemQuantity" size="4" value="<%=itemQuanity%>" onclick="showId(this.id)"  /></td> --%>
					<td width="67" align="center"  height="21" ><input readonly="readonly" type="text" name="cm_prob" size="34" id="UserDescripId" class="incUserDescrip" value="<%=cm_problem%>" /></td>
					<td width="67" align="center"  height="21" ><input readonly="readonly" type="text" name="cm_reported" size="4" id="TimeId" class="incTime" value="<%= sdf.format(cm_time)%>"  /></td>
				<td width="67" align="center"  height="21" ><input readonly="readonly" type="text" name="cm_completed" size="4" id="Time2Id" class="incTime2" value="<%=sdf.format(cm_time2) %>" class="incRate" /></td>
				
					<%-- <td width="67" align="center"  height="21" ><input type="text" name="cm_time_diff" size="6" id="TimeDiffId" class="incTimeDiff" value="<%=cm_time_diff2%>"  /></td> --%>
					
					
					<%-- <td width="67" align="center"  height="21" ><input readonly="readonly" type="text" name="cm_timeString" size="6" id="TimeDiffId" class="incTimeDiff" value="<%=cm_time_diff2%>"  /></td> --%>
					<td width="67" align="center"  height="21" ><input readonly="readonly" type="text" name="cm_timeString" size="6" id="TimeDiffId" class="incTimeDiff" value="<%=diffTime%>"  /></td>
					<td width="100"><textarea  name="cm_status" readonly="readonly" id="StatusId"  rows="1" cols="15"  class="incStatus" ><%=cm_status %></textarea>
					<font color="white" size="2" ><a href="#" onclick="link(<%=k%>);">update</a>
					
					
					</font>
					</td>
					<td width="100"><textarea  name="admin_remarks" id="RemarksId"  rows="2" cols="40" class="incRemarks"  ><%=admin_remarks %></textarea></td>
					
					</tr>
				        
				            
				            <%         
				            	        
				            }
				    %>
				   <tr><td><a href="NewComplainAdditionAdmin.jsp?msg=1">New Complaint ?</a></td>
				   <td colspan="10"></td>
				   </tr>
		
               
	 
		</table> 

  





<br />

<!-- <table align="left" bgcolor="lightgrey">
<tr>
<td>
      <a href="NewComplainAddition.jsp?msg=1"  onclick="return popitup('NewComplainAddition.jsp?msg=1')">New Complain </a>
     &nbsp;&nbsp;&nbsp;&nbsp;
      </td>
</tr>
</table> -->
<%-- <table width="" align=center bgcolor="lightgrey">

   <tr> 
      <td>
      <% 
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
cn5 = con.getConnection2();
st5 = cn5.createStatement();

%>

   
                                    
                                    
                       <select name="desg" onchange="showEmp(this.value)" style="width: 130px;" id="desg">      
                       <option value="none">-----Select-----</option>
                          
                          <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                       cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                           st5 = cn5.createStatement();  
                           rs5 = st5.executeQuery("Select * from desg");
                          while(rs5.next()){     %>     
                          
                           <option value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>     
                                        <br>    
                                            <div id='emp'>      
                                              <select name="emp" style="width: 130px;">   
                                                   <option value='-1' style="width: 130px;">--Select--</option>  
                                                         </select>     
                                                            </div>    
                                                            
                                                            
                                                               
  <label id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" /> 
      
      
      </td> --%>
      	 <br />
		
		<table width="900" border="1" cellspacing="0" cellpadding="0">  
<% 

cn5 = con.getConnection2();
st5 = cn5.createStatement();


cnl3 = con.getConnection2();
stl3 = cnl3.createStatement();
//rsl3 = stl3.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE post='IT MANAGER' AND city='"+city+"'");
//rsl3 = stl3.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE DESG_NO='6' AND city='"+city+"'");
rsl3 = stl3.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='SR.MANAGER IT' AND b.b_no='"+locationNO+"'");
while(rsl3.next()){ 
	itname=rsl3.getString("Nname");
	itpost=rsl3.getString("post");
	itmail=rsl3.getString("Nmail");
	System.out.println("it  name ---------------------------------------------------------------------"+itmail);
}


cnl4 = con.getConnection2();
stl4 = cnl4.createStatement();
//rsl4 = stl4.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE DESG_NO='9' AND city='"+city+"'");
rsl4 = stl4.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='ADMIN%' AND b.b_no='"+locationNO+"'");
while(rsl4.next()){ 
	adname=rsl4.getString("Nname");
	adpost=rsl4.getString("post");
	admail=rsl4.getString("Nmail");
	System.out.println("ad   name---------------------------------------------------------------------"+admail);
}


cnl1 = con.getConnection2();
stl1 = cnl1.createStatement();
//rsl1 = stl1.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE DESG_NO='7' AND city='"+city+"'");
rsl1 = stl1.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='GENERAL MANAGER' AND b.b_no='"+locationNO+"'");
while(rsl1.next()){ 
	gmname=rsl1.getString("Nname");
	gmpost=rsl1.getString("post");
	gmmail=rsl1.getString("Nmail");
	System.out.println("gm  mail---------------------------------------------------------------------"+gmmail);
%>
<%-- 	
	<tr>
	<td>
       <input type="checkbox" value="<%=gmmail%>" name="gm"/><%=gmname%> 
       </td></tr> --%>
	<%
}

cnl2 = con.getConnection2();
stl2 = cnl2.createStatement();
//rsl2 = stl2.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE DESG_NO='8' AND city='"+city+"'");
rsl2 = stl2.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='BRANCH MANAGER' AND b.b_no='"+locationNO+"'");
while(rsl2.next()){ 
	brname=rsl2.getString("Nname");
	brpost=rsl2.getString("post");
	brmail=rsl2.getString("Nmail");
	System.out.println("br  mail---------------------------------------------------------------------"+brmail);
	
}


%>

   
               <tr>                      
              <%--     <td>                  
                       <select name="desg" onchange="showEmp(this.value)">      
                       <option value="none">Select</option>
                          
                          <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                       cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                           st5 = cn5.createStatement();  
                           rs5 = st5.executeQuery("Select DISTINCT DESIGNATION from desg d,login l WHERE DESIGNATION=post  AND city='"+city+"' ORDER BY d.DESIGNATION ASC");
                         //  rs5 = st5.executeQuery("Select DESIGNATION from desg");
                          // rs5 = st5.executeQuery("Select * from desg");
                          while(rs5.next()){     %>     
                          
                           <option value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>     
                                        <br>    
                                            <div id='emp'>      
                                              <select name="emp" >   
                                                   <option value='-1'></option>  
                                                         </select>     
                                                            </div>    
                                                            
                                                            
                                                               
  <label id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" />        
       
       </td> --%>
       
       <%-- <td><input type="checkbox" value="<%=hrmail%>" name="hrmail"/>HR:::<%=hrname%></td> --%>
       <%-- <td><input type="checkbox" value="<%=itmail%>" name="itmail" id="iditmail"/>&nbsp;SR.MANAGER IT : <%=itname %></td> --%>
          <td><input type="checkbox" value="<%=admail%>" name="admail" id="idadmail" />Admin / IT Incharge : <%=adname %></td>
       <td><input type="checkbox" value="<%=gmmail%>" name="gmmail" id="idgmmail" />&nbsp;General Manager : <%=gmname %></td>
       <td><input type="checkbox" value="<%=brmail%>" name="hrmail" id="idhrmail" />Branch Manager : <%=brname %></td>
       
    
       </tr>                       
</table>


<%
                      }
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs_id,st_id,cn_id);
	DbUtil.closeDBResources(rs5,st5,cn5);
	DbUtil.closeDBResources(rsa2,sta2,cna2);
	DbUtil.closeDBResources(rsl1,stl1,cnl1);
	DbUtil.closeDBResources(rsl2,stl2,cnl2);
	DbUtil.closeDBResources(rsl3,stl3,cnl3);
	DbUtil.closeDBResources(rsl4,stl4,cnl4);
  }
	%>
      <table>
      <tr>
      
	  <!-- <td style="size:1"><input style="font-size:1" type="submit" title="Click to Save and Send mail" value="SEND REPORT" name="save1" id="save" onclick="return(validate() && validateCheck());"  /></td> -->
	  <td style="size:1"><input style="font-size:1" type="submit" title="Click to Save and Send mail" value="SEND REPORT" name="save1" id="save" onclick="return validateCheck();"  /></td>
	<!--   <td> <input type="button" value="CANCEL" onclick="goBack();" /></td> -->
	  <td style="font-size: 1"><input style="size: 1;" type="button" title="Back To Selection Date Page" value="BACK" onclick="history.go(-1)" /></td>
	   <%-- %><td> <input type="button" value="CANCEL" onclick="window.opener=null; window.close(); return false;" /></td> --%>
      <!--<td style="size:1">&nbsp;&nbsp;<input style="size:1" type="button"  onclick="history.go(0)"  value="RESET"/></td>   
     --><%-- <td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="PRINT" onclick="window.location.href='jasper2.jsp'"/> </td>
     <td style="size:1"><input style="font-size:1" type="submit" value="SAVE" name="save" id="save" onclick="this.disabled=true;return true;"/></td>
      <td><input type=button value=printtt onclick="window.open('D:/P1.pdf'); return true;"/></td> 
      <td><input type="button" value="PDF" name="print" id="print" disabled="disabled" onclick="link();"/></td>
       
       <td><input type="button" value="WORD" name="word" id="word" disabled="disabled" onclick="Word();"/></td>  --%>

      
      <td>
      <!-- <a href="NewComplainAddition.jsp?msg=1"  onclick="return popitup('NewComplainAddition.jsp?msg=1')">New Complaint ?</a> -->
     <!--  <a href="NewComplainAddition.jsp?msg=1">New Complaint ?</a> -->
    <!--  &nbsp;&nbsp;&nbsp;&nbsp; -->
      </td>
      <td>
      
      
      <a href="imsHelp.jsp" onclick="return popitup('imsHelp.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td>
 
      <!--<td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='HO.jsp'"/> </td>
 -->
 
 
 
 </tr>
 
</table>
</center>
	<br /><br /><br />

</form>	

</body>

</html>