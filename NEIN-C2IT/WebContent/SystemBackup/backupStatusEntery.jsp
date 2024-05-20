<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HO USER</title>
<script type="text/javascript" src="js/layout.js"></script>
<script language="javascript" type="text/javascript" src="../js/datetimepicker.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>


<style type="text/css">

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 150px; /* Main Menu Item widths */
border-bottom: 1px solid #ccc;
}
 
.sidebarmenu ul li{
position: relative;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
background-color: #012D58; /*background of tabs (default state)*/
}

.sidebarmenu ul li a:visited{
color: white;
}

.sidebarmenu ul li a:hover{
background-color: #ec691f;
}

/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 170px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}

.sidebarmenu a.subfolderstyle{
background: url(right.gif) no-repeat 97% 50%;
}

 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>

    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null)
          {
	      response.sendRedirect("adminlink.jsp?msg=1");
          }
    %>
<script  type="text/javascript">
    <% 
        String msg[] = request.getQueryString().toString().split("=");
        String disp = msg[1].toString();
        disp = disp.replace("%20", "");
        disp = disp.replace("%27", " ");
        disp = disp.replace("__","  ");
    %>
       msg = "<%=disp%>";
       if(msg!="1")
		   {
           alert(msg);
		   }
</script>

  <script  type="text/javascript">          
          function validate()
                  {
        	      var p;
        	      //alert(id2);
        	      var empno=document.form.Nno;
        	      var empname=document.form.Nname;
                  var e = document.form.fileEO;
                  var yesno = document.form.yesno;
                  var res = document.form.remarks;
                  var dt = document.form.date1;
                  var dt1 = document.form.date2;
                  //alert(res.value);
                  if ((empno.value==null)||(empno.value==""))
                      {
                      alert("Please Enter Employee No.!");
                      empno.focus();
                      return false;
                      }
                  if ((empname.value==null)||(empname.value==""))
                      {
                      alert("Please Enter Valid emp no.!");
                      empname.focus();
                      return false;
                      }
                  if ((e.value==null)||(e.value=="")||(e.value=="0"))
                      {
                      alert("Please select Data backup for!");
                      e.focus();
                      return false;
                      }
                  if((dt1.value==null)||(dt1.value==""))
  	                  {
  	                  alert("Please enter Scheduled date .!");
  	                  dt1.focus();
                      return false;
  	                  }
                 if((yesno.value=="yes")&&(dt.value==""))
       	               {
       	               alert("Please enter date of completion.!");
       	               dt.focus();
                       return false;
       	               }
                 if((yesno.value=="no")&&(res.value==""))
 	                   {
 	                   alert("Please enter resion for not completed.!");
 	                   res.focus();
                       return false;
 	                   }
                   else
                      return true; 
                 }
</script>
<script type="text/javascript">  
 function sendInfo(v)  
           {  
	       //alert(v);
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
    	        var url="getEmployee1.jsp";  
    		    url +="?EMP_NO=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
        function getInfo()
             {     
	         var str2=xmlHttp.responseText;
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")//iddesg,iddept,idbranch,idcono
                            { 
                             // alert("here");//idname,iduid,idpass,idnmail
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idname").value =  document.getElementById("p1").value;
                             document.getElementById("iddesg").value =  document.getElementById("p2").value;
                      		 document.getElementById("iddept").value =  document.getElementById("p3").value;
                      		 document.getElementById("idbranch").value =  document.getElementById("p4").value;
                      		 document.getElementById("idsbranch").value =  document.getElementById("p5").value;
                      		 document.getElementById("idsystype").value =  document.getElementById("p6").value;
                     		 document.getElementById("idsysno").value =  document.getElementById("p7").value;
                      		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idname").value = "";
                             document.getElementById("iddesg").value =""; 
      		                 document.getElementById("iddept").value = "";
      		                 document.getElementById("idbranch").value =  "";
      		                 document.getElementById("idsbranch").value = "";
      		                 document.getElementById("idsystype").value =  "";
    		                 document.getElementById("idsysno").value = "";
      		                 }
                 } 
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
    
     return true;
    }
</script>


<script language="javascript" type="text/javascript">
function popitup(url) {
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}

</script>
  <script  type="text/javascript">
  function clear1()
       {
	   //alert("Clear 1");
	   document.getElementById("idemp_no").value = "";
	   document.getElementById("idname").value = "";
       document.getElementById("iddesg").value =""; 
       document.getElementById("iddept").value = "";
       document.getElementById("idbranch").value =  "";
       document.getElementById("idsbranch").value = "";
       document.getElementById("idsystype").value =  "";
       document.getElementById("idsysno").value = "";
       document.getElementById("idfileEO").value = "";
       document.getElementById("datepicker").value = "";
       document.getElementById("idremarks").value = "";
       document.getElementById("datepicker1").value = "";
       document.getElementById("idyes").checked  = true;
   	   document.getElementById("idremarks").style.visibility = "hidden";
       }
  </script>
 <script  type="text/javascript">
function  databackup()
          {
	      //alert("Heare.....");
	      if(document.getElementById("idyes").checked  == true)
	    	  {
	          document.getElementById("datepicker").value="";
	          document.getElementById("datepicker").style.visibility = "visible";
	    	  document.getElementById("idremarks").value="";
	    	  document.getElementById("idremarks").style.visibility = "hidden";
	    	  }
	      else
	    	  {
	    	  document.getElementById("datepicker").value="";
	          document.getElementById("datepicker").style.visibility = "hidden";
	          document.getElementById("idremarks").value="";
	    	  document.getElementById("idremarks").style.visibility = "visible";
	    	  }
          }
 </script>
 <!-- /////////////////////////////////////// Date  Picker //////////////////////////////// -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' }).val();
  } );
  $( function() {
	    $( "#datepicker1" ).datepicker({ dateFormat: 'dd-mm-yy-DD' }).val();
	  } );
  </script>
   <!-- /////////////////////////////////////// Date  Picker //////////////////////////////// -->
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;" onload="clear1()">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
</table> 
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
             <tr align="center">
                       <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>BACKUP CHECK LIST</b><br /> </font></strong>
                       </td>
            </tr>
            <tr align="center">
                     <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong>
                     </td>
            </tr>
         </table>
          <br />
          <br />
 <form name="form" method="post"  action="backupStatusEnteryback.jsp">

	<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
         <%
         Name = (String) session.getAttribute("Nname");
         desg = (String) session.getAttribute("desg");
         city = (String) session.getAttribute("city");
         b_no = (String) session.getAttribute("b_no");
         admin =  (String) session.getAttribute("admin");
         email_id = (String) session.getAttribute("Nmail");
         //System.out.println("City name :"+city ); 
         %>
      <%
       Connection cn01e = null, cn02 = null,cn022 = null,cn01 = null;
       Statement st01e = null,st02 = null,st022 = null,st01 = null; 
       ResultSet rs01e = null,rs02 = null,rs022 = null,rs01 = null;
       cn02 = con.getConnection2();
       st02=cn02.createStatement();
       rs02 = st02.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
        try{
           %>
                 <center>
                    <table width="65%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                           <tr>
                               <td align=center width=60%  colspan=4  background=".jpg">
                                   <font color=darkblue size=3 >BACKUP CHECK LIST</font>
                                </td>
                          </tr>
                          <tr>
                              <td align="left"><font size="2">EMP NO.:</font><font color=red>*</font></td>
                              <td align="left"><input type="text" name="Nno" value="" id="idemp_no"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"><font color="red"> <div id="mydiv2"></div></font></td>
                              <td align="left"><font size=2> NAME:<font color=red>*</font></font></td>
	                          <td align="left"><input type="text" name="Nname" id="idname" value="" size=30 readonly></td>
                          </tr>
	                      <tr>
                               <td align="left"><font size="2">DESIGNATION</font><font color=red>*</font></td>
                               <td align="left"><input type="text" name="desg" id="iddesg" value="" size=30 readonly></td></td>
                               <td align="left"><font size="2">DEPARTMENT</font><font color=red>*</font></td>
                               <td align="left"><input type="text" name="dept" id="iddept" value="" size=30 readonly></td></td>
                         </tr>
                         
                	     <tr>
                	          <td align="left"><font size=2>BRANCH:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="" size=30 id="idbranch" name="branch" readonly></td>
                	          <td align="left"><font size=2>SUB BRANCH:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="" size=30 id="idsbranch" name="sbranch" readonly></td>
                	     </tr>
                	     <tr>
                	          <td align="left"><font size=2>SYSTEM TYPE:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="" size=30 id="idsystype" name="systype" readonly></td>
                	          <td align="left"><font size=2>SYSTEM SR. NO:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="" size=30 id="idsysno" name="sysno" readonly></td>
                	     </tr>
                	   
                	    <tr>
                	          <td align="left"><font size=2>DATA BACKUP:<font color=red>*</font></font></td>
                	            <td> 
                	                 <select name="fileEO" id="idfileEO" >
                	                      <option value="">Select</option>
                                          <option value="FILE">FILE</option>
                                          <option value="EMAIL">EMAIL</option>
                                        <!--   <option value="OTHER">OTHER</option> -->
                                    </select>
                	           </td>
                	           <td align="left"><font size=2>BACKUP FOR DATE/DAY:<font color=red>*</font></font></td>
                	           <td> <input type="text" name ="date2" value="" id="datepicker1" placeholder="Schedule Date/Day"><br></td>
                	  	     </tr> 
                	  	     <tr>
                	          <td align="left"><font size=2>BACKUP COMPLETED:<font color=red>*</font></font></td>
                	            <td colspan=3> 
                	                 <input type="radio" name="yesno" value="yes" id="idyes" onclick="databackup();" checked> YES  
                	                 <input type="text" name ="date1" value="" id="datepicker" placeholder="Completed Date"><br>
                                     <input type="radio" name="yesno" value="no" id="idno" onclick="databackup();"> NO
                                     <input type="text" name="remarks" id="idremarks" value="" width="40" size=100 placeholder="Enter resion">
                	           </td>
                	  	     </tr> 
                	  	    
                	   </table>
                	  
                	    
           	          
                      <table width="65%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                       <tr>
                          <td><a href="" onclick="return popitup('BackupscheduleDisp.jsp')">View All</a> </td>
	                      <td align="CENTER" colspan=4 > <input type="submit"  value="SAVE" name=button1 onclick="return( validate() && ButtonClicked());" />
     	                   <input type="button" value="CLEAR" id="" onclick="clear1();" />
     	                  </td>
	                  </tr>
	             </table>
 	             </center>
 	            
	</form>
	
	
	<div id="resultFromAjax2" style="display:none;">
     </div>
	
	<%
      }
      catch (Exception e) { System.out.println(e); }
      finally{
	         DbUtil.closeDBResources(rs01,st01,cn01);
	         DbUtil.closeDBResources(rs02,st02,null);
	         DbUtil.closeDBResources(rs022,st022,cn022);
	         DbUtil.closeDBResources(rs01e,st01e,cn01e);
             }
	%>
    <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
           <tr> 
              <td width="1000" align="left"> 
                      <a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
              </td> 
              <td width="115" align="right"> 
                     <a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
              </td> 
           </tr> 
    </table> 
    <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
           <tr align="center">
                <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white">NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
           </tr>
    </table> 
   
   </body>
</html>