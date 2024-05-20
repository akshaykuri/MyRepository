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
<script  type="text/javascript">          
          function validate()
                  {// alert("Hear");
        	      var branch=document.form.sbranch;
        	      var year=document.form.year;
                  var month = document.form.month;
                  // alert("Hear");
                  if ((branch.value==null)||(branch.value==""))
                      {
                      alert("Please Select Branch.!");
                      branch.focus();
                      return false;
                      }
                  if ((year.value==null)||(year.value==""))
                      {
                      alert("Please Select Year.!");
                     year.focus();
                      return false;
                      }
                  if ((month.value==null)||(month.value==""))
                      {
                      alert("Please Select Month!");
                      month.focus();
                      return false;
                      }
                  else
                	  return true;
                  }
     </script>
    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null)
          {
	      response.sendRedirect("adminlink.jsp?msg=1");
          }
    %>
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
</table> 

 <form name="form" method="post"  action="backupverification1.jsp">
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
       Connection cn01e = null, cn02 = null,cn022 = null,cn01 = null,cn51=null,cn0221=null;;
       Statement st01e = null,st02 = null,st022 = null,st01 = null,st51=null,st0221=null; 
       ResultSet rs01e = null,rs02 = null,rs022 = null,rs01 = null,rs51=null,rs0221=null;
       cn02 = con.getConnection2();
       st02=cn02.createStatement();
       rs02 = st02.executeQuery("select b_name from branch_master ORDER BY b_name Asc");
        cn022 = con.getConnection2();
       st022=cn022.createStatement();
         try{
           %>
      
               <center>
                    <table width="50%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                           <tr>
                               <td align=center width=60%  colspan=4  background=".jpg">
                                      <font color=darkblue size=3 > CREATE SYSTM USER</font>
                                </td>
                          </tr>
                          
                	     <tr>
                	          <td>
	                              <font size=2>BRANCH<font color=red>*</font></font></td><td>
	                              <select name="sbranch">
			                          <option value="">Select</option>
			                          <option  value="HEAD OFFICE">HEAD OFFICE</option>
			                          <option  value="BANGALORE">BANGALORE</option>
			                          <option  value="MUMBAI">MUMBAI</option>
			                          <option  value="DELHI">DELHI</option>
			                          <option  value="CHENNAI">CHENNAI</option>
			                       </select>
  		                      </td>
                	        <td><font size="2">YEAR/MONTH</font><font color=red>*</font></td>
	                         <td>
	                              <select  name="year" id="idyear" >
			                           <option  value="">Select</option>
		                               <option  value="2017">2017</option>
			                           <option  value="2018">2018</option>
			                           <option  value="2019">2019</option>
			                           <option  value="2020">2020</option>
			                           <option  value="2021">2021</option>
			                           <option  value="2022">2022</option>
			                           <option  value="2023">2023</option>
			                           <option  value="2024">2024</option>
			                           <option  value="2025">2025</option>
			                           <option  value="2026">2026</option>
			                           <option  value="2027">2027</option>
			                           <option  value="2028">2028</option>
			                           <option  value="2029">2029</option>
			                           <option  value="2030">2030</option>
	                             </select> 
	                              <select  name="month" id="idmonth" >
			                           <option  value="">Select</option>
		                               <option  value="01">JANUARY</option>
			                           <option  value="02">FEBUARY</option>
			                           <option  value="03">MARCH</option>
			                           <option  value="04">APPRIL</option>
			                           <option  value="05">MAY</option>
			                           <option  value="06">JUNE</option>
			                           <option  value="07">JULY</option>
			                           <option  value="08">AUG</option>
			                           <option  value="09">SEPTEMBER</option>
			                           <option  value="10">OCTOBER</option>
			                           <option  value="11">NOVEMBER</option>
			                           <option  value="12">DECEMBER</option>
	                             </select> 
	                         </td>
                	     </tr>
                        <tr>
	                       <td align="center" colspan=4> <input type="submit"  value="SUBMIT" name=button1 onclick="return( validate() );"/></td>
	                     </tr>
	             </table>
 	             </center>
                
                 
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
                     <a href="../adminbom.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
              </td> 
           </tr> 
    </table> 
    <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
           <tr align="center">
                <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white">NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
           </tr>
    </table> 
   </form>
   </body>
</html>