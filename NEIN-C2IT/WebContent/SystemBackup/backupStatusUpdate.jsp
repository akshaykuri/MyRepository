<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BACKUP STATUS UPDATION</title>
<script type="text/javascript" src="js/layout.js"></script>
<script language="javascript" type="text/javascript" src="../js/datetimepicker.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>

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
    width: 60%;
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
    border-radius: 4px;
    font-size: 15px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 5px 20px 5px 40px;
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
<!-- ///////////////////////////////// Dynamic table and js import above /////////////////////////////// -->
 <script>
		var id2 =0;
		$(document).ready(function() {
		$("table.dynatable2 button.add2").click(function()
				{
			    //alert("dyn table 2"+id2);
				id2++;
			    var master2 = $(this).parents("table.dynatable2");
				var prot2 = master2.find(".prototype2").clone();
				prot2.attr("class", "");
				prot2.find(".id2").attr("value", id2);
				prot2.find(".classday").attr("id","idday"+id2);
				prot2.find(".classhr").attr("id","idhr"+id2);
				prot2.find(".classmm").attr("id","idmm"+id2);
				master2.find("tbody").append(prot2);
			    });
	    $("table.dynatable2 button.remove2").live("click", function() 
	    		{
				$(this).parents("tr").remove();
				id2--;
			});
		});
	</script>
  <style>
	.dynatable2 .prototype2 
	     {
	 	 display:none;
		}
</style>	
 <!--  ///////////////////////////////// Dynamic table till here/////////////////////////////// -->
  <script  type="text/javascript">          
   function validate()
        {
 	    var p;
        //alert(id2);
        var empno=document.form.Nno;
        var empname=document.form.Nname;
        if ((empno.value==null)||(empno.value==""))
              {
              alert("Please Enter Employee No.!");
              empno.focus();
              return false;
              }
        if ((empname.value==null)||(empname.value=="")|| (empname.value=="Employee dosen't exist"))
              {
              alert("Please Enter Valid emp no.!");
              empname.focus();
              return false;
              }
          else
              return true; 
         }
</script>

<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) {
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
    	    var url="getEmployee1.jsp";  
    	    url +="?EMP_NO=" +v;
    		xmlHttp.onreadystatechange = getInfo;  
    		xmlHttp.open("GET", url, true);   
    		xmlHttp.send(null);  
      }  
 function getInfo()
            {     
	        var str2=xmlHttp.responseText;
	        var matches=0;
            if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")//iddesg,iddept,idbranch,idcono
                    { 
                    // alert("here");//idname,iduid,idpass,idnmail
                    document.getElementById("resultFromAjax2").innerHTML = str2;
                    document.getElementById("idname").value =  document.getElementById("p1").value;
                    document.getElementById("idname").style.color = "green";
                    document.getElementById("idname").style.fontStyle="normal";
                    }
                else
         	        {
         	        document.getElementById("resultFromAjax2").innerHTML = str2;
                    document.getElementById("idname").value = "Employee dosen't exist";
                    document.getElementById("idname").style.color = "magenta";
                    document.getElementById("idname").style.fontStyle="italic";
                   
      		        }
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
	  // alert("Clear 1");
	   document.getElementById("idemp_no").value = "";
	   document.getElementById("idname").value = "";
       }
</script>
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
               <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>BACKUP CHECK LIST</b><br /> </font></strong></td>
       </tr>
       <tr align="center">
               <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong> </td>
       </tr>
</table>
<br />
<br />
<form name="form" method="post"  action="backupStatusUpdateBack.jsp">
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
                 <div class="modal-content">
                 <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                           <tr>
                               <td align=center width=60%  colspan=4  background=".jpg">
                                   <font color=darkblue size=3 >BACKUP STATUS UPDATION</font>
                                </td>
                          </tr>
                          <tr>
                              <td align="left"><font size="2">EMP NO.:</font><font color=red>*</font></td>
                              <td align="left"><input type="text" name="Nno" value="" id="idemp_no"   onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);"><font color="red"> <div id="mydiv2"></div></font></td>
                              <td align="left"><font size=2> NAME:<font color=red>*</font></font></td>
	                          <td align="left"><input type="text" name="Nname" id="idname" value="" size=30 readonly></td>
                          </tr>
	            </table>
	            <input type="hidden" name="message" id="idmsg" value="y" >
                <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                       <tr>
                         <td align="CENTER" colspan=2 >
	                       <a href="" onclick="return popitup('BackupscheduleDisp.jsp')">View </a> </td>
	                       <td align="CENTER" colspan=2 >  <input type="submit" value="SERCH" name=button1 onclick="return( validate() && ButtonClicked());" />
     	                   <input type="button" value="CLEAR" id="" onclick="clear1();" />
     	                  </td>
	                  </tr>
	             </table>
	           
	             </div>
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