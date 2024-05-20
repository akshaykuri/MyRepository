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
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 50%; /* Full width */
    height: 50%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body 
    {
    padding: 2px 16px;
    background-color: #D3D3D3;
    }
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header {
     padding: 2px 16px;
     background-color: #D3D3D3;
     color: black;
     }
input[type=text] {
    width: 70%;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 13px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 5px 10px 5px 10px;
}

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
        	      var empno=document.form.Nno;
        	      var empname=document.form.Nname;
                  var nn=document.form.sbranch;
                  var no = document.form.systype;
                  var i=document.form.sysno;
                 // alert(empno.value);
                //  alert(empname.value);
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
                  if ((nn.value==null)||(nn.value=="")||(nn.value=="0"))
                      {
                      alert("Please Select SubBranch!");
                      nn.focus();
                      return false;
                      }
                  if ((no.value==null)||(no.value=="")||(no.value=="0"))
                      {
                      alert("Please Select System Type!");
                      no.focus();
                      return false;
                      }
                 if ((i.value==null)||(i.value==""))
                      {
                      alert("Please Enter System No.!");
                      i.focus();
                      return false;
                      }
                  else
                      return true;
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
    	        var url="getEmployee.jsp";  
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
                      		 document.getElementById("idcono").value =  document.getElementById("p5").value;
                      		document.getElementById("idbcode").value =  document.getElementById("p6").value;
                      		 }
                        else
         	                 {
         	                 document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idname").value = "";
                             document.getElementById("iddesg").value =""; 
      		                 document.getElementById("iddept").value = "";
      		                 document.getElementById("idbranch").value =  "";
      		                 document.getElementById("idcono").value = "";
      		                 document.getElementById("idbcode").value = "";
      		                 }
                 } 
</script>


<script language="javascript" type="text/javascript">
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus();}
	return false;
}

</script>

</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
</table> 

 <form name="form" method="post"  action="systemuserback.jsp">
         <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
             <tr align="center">
                       <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>CREATE BACKUP USER</b><br /> </font></strong>
                       </td>
            </tr>
            <tr align="center">
                     <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong>
                     </td>
            </tr>
         </table>

<br>
<br />
	<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
    <%
         Name = (String) session.getAttribute("Nname");
         desg = (String) session.getAttribute("desg");
         city = (String) session.getAttribute("city");
         b_no = (String) session.getAttribute("b_no");
         admin =  (String) session.getAttribute("admin");
         email_id = (String) session.getAttribute("Nmail");
        /*  System.out.println("-------------------------------------");
         System.out.println("Name Number :"+Name);
         System.out.println("desg Number :"+desg);
         System.out.println("city Number :"+city);
         System.out.println("Branch Number :"+b_no);
         System.out.println("admin Number :"+admin);
         System.out.println("email_id Number :"+email_id);
         System.out.println("------------------------------------"); */
         System.out.println("city Number ddddfdf:"+city);
         
    %>
 
     <%
       /* String idd=request.getParameter("idd");
       String Nname=request.getParameter("Nname");
       String Npwd=request.getParameter("Npwd");
       String Naddr=request.getParameter("Naddr");
       String Ncontact=request.getParameter("Ncontact");
       String Npost=request.getParameter("Npost");
       String NpostingCo=request.getParameter("NpostingCo");
       String Nmail=request.getParameter("Nmail"); */
       Connection cn01e = null, cn02 = null,cn022 = null,cn01 = null;
       Statement st01e = null,st02 = null,st022 = null,st01 = null; 
       ResultSet rs01e = null,rs02 = null,rs022 = null,rs01 = null;
       /* cn01e = con.getConnection2();
       st01e=cn01e.createStatement();
       rs01e = st01e.executeQuery("select dept_name from department_master WHERE dept_name NOT LIKE '%IT%' ORDER BY dept_name Asc");
        */
        cn02 = con.getConnection2();
       st02=cn02.createStatement();
       rs02 = st02.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
       /* cn022 = con.getConnection2();
       st022=cn022.createStatement();
       rs022 = st022.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
       cn01 = con.getConnection2();
       st01=cn01.createStatement();
       rs01 = st01.executeQuery("select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc");
       */    
        try{
           %>
      <!-- <table width="80%" height="3" cellpadding="0" cellspacing="0" ID="Table1">
          <tr>
                <td width="10%" align="justify" valign="top"></td>
                <td width="31%" align="justify" valign="top"></td>
                <td width="5%" align="justify" valign="top"></td>
                <td width="5%" align="justify" valign="top"></td>
                <td width="48%"> -->
               <center>
                    <table width="60%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                           <tr>
                               <td align=center width=60%  colspan=4  background=".jpg">
                                      <font color=darkblue size=3 > CREATE SYSTM USER</font>
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
                	          <input type="hidden"  value="" size=30 id="idbcode" name="bcode" readonly></td>
                	          <td>
	                              <font size=2>SUB BRANCH<font color=red>*</font></font></td><td>
	                              <select name="sbranch">
			                          <option value="0">Select</option>
			                          <%while(rs02.next()){ %>
			                                           <option ><%=rs02.getString(1)%> </option>
			                                         <%} %>
		                          </select>
  		                      </td>
                	     </tr>
                	    
                        <tr>
                	          <td align="left"><font size=2>CONTACT NO:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="" size=30 id="idcono" name="cono" readonly></td>
                	          <td><font size="2">SYSTEM TYPE</font><font color=red>*</font></td>
	                         <td>
	                              <select name="systype" >
			                           <option  value="0">Select</option>
		                               <option  value="LAPTOP">LAPTOP</option>
			                           <option  value="DESKTOP">DESKTOP</option>
	                             </select> 
	                         </td>
                	     </tr>
                	     
	                      <tr>
                	          <td align="left"><font size=2>SYSTEM SR. NO.:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="" size=30 id="idsysno" name="sysno"></td>
                	          <td align="left" colspan=1></td>
                	          <td align="left"></td>
                	     </tr>   
                        
	                     <tr>
	                             <td align="left"><a href="viewuser.jsp?msg=1" onclick="return popitup('viewuser.jsp?msg=1')"><font size=3>View System User</font></a> </td>
	                             <td align="center" colspan=3> <input type="submit"  value="SAVE" name=button1 onclick="return( validate() && ButtonClicked());" />
     	                         <input type="reset" value="RESET"/>
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
    </div>
    </div>
   </body>
</html>