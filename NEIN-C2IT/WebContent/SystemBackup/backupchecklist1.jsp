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
                  var e = document.form.fileEO;
                  var o=document.form.sname;
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
                 if((o.value==null)||(o.value=="")||(o.value=="0"))
            	      {
            	       alert("Please software used name!");
                      o.focus();
                      return false;
            	      }
                 
               if(id2==0)
	                   {
	                   alert("Please enter Schedule day and time..");
	                   return false;
	                   } 
	          if(id2>0)
		              {
             	      for(p = 1; p <=id2; p++)
             	        {
             		    var x = 'idday'+p.toString();
             		    var y = 'idhr'+p.toString();
             		    var a = 'idmm'+p.toString();
             		    //alert(x);
             		    //alert(y);
             		    //alert(a);
             		    var x1 = document.getElementById(x).value;
             		    //alert("X1 :"+x1);
             		    if(x1=="")
             		    	 {
             		    	 alert("Please slect Schedule day...");
             		    	 return false;
             		    	 }
             		    var x2 = document.getElementById(y).value;
             		   //alert("X2 :"+x2);
            		    if(x2=="")
            		    	 {
            		    	 alert("Please slect Hours...");
            		    	 return false;
            		    	 }
            		    var x3 = document.getElementById(a).value;
            		   // alert("X3 :"+x3);
             		    if(x3=="")
             		    	 {
             		    	 alert("Please slect Miniuts...");
             		    	 return false;
             		    	 }
             	       }
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

<script  type="text/javascript">
function  bacupcompl()
          {
	      if(document.getElementById("idyes").checked  == true)
	    	  {
	    	  document.getElementById("idyes").value="Y";
	    	  document.getElementById("idrsigon").value="";
	    	  document.getElementById("idrsigon").style.visibility = "hidden";
	    	  }
	      else
	    	  {
	    	  document.getElementById("idno").value="N";
	    	  document.getElementById("idrsigon").value="";
	    	  document.getElementById("idrsigon").style.visibility = "visible";
	    	  }
          }
 </script>


 
 <script  type="text/javascript">
function  databackup3()
          {
	      if(document.getElementById("idfile").checked  == true)
	    	 document.getElementById("idfile").value="Y";
	      else
	    	  document.getElementById("idfile").value="N"; 
	      }

	
 </script>
 <script  type="text/javascript">
function  databackup2()
          {
	      if(document.getElementById("idemail").checked  == true)
    	     document.getElementById("idemail").value="Y";
	      else
	    	  document.getElementById("idemail").value="N";
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
       document.getElementById("idday").value =  "";
       document.getElementById("idhr").value = "";
       document.getElementById("idmm").value = "";
       document.getElementById("idfileEO").value = "";
       document.getElementById("idsname").value = "";
       
       /* document.getElementById("idothe").value="";
 	   document.getElementById("idothe").style.visibility = "hidden";
       document.getElementById("idyes").checked=true; 
       document.getElementById("idno").checked=false;
       document.getElementById("idrsigon").value="";
 	   document.getElementById("idrsigon").style.visibility = "hidden"; */
       }
  </script>
 <script  type="text/javascript">
function  databackup()
          {
	      if(document.getElementById("idothers").checked  == true)
	    	  {
	    	  document.getElementById("idothe").value="";
	    	  document.getElementById("idothers").value="Y";
	    	  document.getElementById("idothe").style.visibility = "visible";
	    	  }
	      else
	    	  {
	    	  document.getElementById("idothe").value="";
	    	  document.getElementById("idothers").value="N";
	    	  document.getElementById("idothe").style.visibility = "hidden";
	    	  }
          }
 </script>
 

</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;" onload="clear1()">

<table>
     <tr>
         <td>
              <img src="../images/nippon.gif" height="35" width="220">
        </td>
        <td align="right">
              <img src="../images/cs-soft.jpg" height="30" width="100" hspace="796" >
       </td>
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
 <form name="form" method="post"  action="backupchecklistback.jsp">

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
                    <table width="80%" border="1" style="border-collapse: collapse;" bgcolor="gray">
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
                	                 <select name="fileEO" id="idfileEO">
                	                      <option value="">Select</option>
                                          <option value="FILE">FILE</option>
                                          <option value="EMAIL">EMAIL</option>
                                          <option value="OTHER">OTHER</option>
                                    </select>
                	           </td>
                	           <%
                                   String p_type=request.getParameter("p_type");
                                   Connection cn0211 = null;
                                   Statement st0211 = null; 
                                   ResultSet rs0211 = null;
                                 
                                   cn0211 = con.getConnection2();
                                   st0211=cn0211.createStatement();
                                   rs0211 = st0211.executeQuery("select * from 	systemuserbackupswlist ORDER BY sname Asc");
                                   %>
                	          <td align="left"><font size=2>SOFTWARE USED:<font color=red>*</font></font></td>
                	          <td>
                                   <select name="sname" id="idsname">
			                              <option value="">Select</option>
			                                 <%while(rs0211.next()){ %>
		                                        		<option><%=rs0211.getString("sname")%></option>
		                                                    	<%} %>
		                            </select>
                            </td>
                     	     </tr> 
                	   </table>
                	  
                	     <table class="dynatable2" border="1" cellspacing="1" width="80%" style="height: 150"  bgcolor="gray">
			  	  	           <tr><td width="30" align="center"  height="21" ></td>
				                   <td width="45" align="center"  height="21" ><button class="add2" type="button">+</button></td>
				                   <td width="60" align="center"  height="10" ><font  size="2">SL.NO.</font></td>
					               <td width="320" align="center"  height="10" ><font color="red" size="2">*</font><font size="2">SCHEDULED DAY</font></td>				
					               <td width="445" align="center"  height="10"  ><font color="red" size="2">*</font><font  size="2">SCHEDULED TIME (HR:MM)</font></td>
				               </tr>
		 		               <tr class="prototype2">
					              <td width="30" align="center"  height="21" ></td>
			 	                  <td width="45" align="center"  height="21" ><button class="remove2" type="button">--</button></td>
					              <td width="60" align="center"  height="21" ><input type="text" name="id2[]" value="0" size=1 class="id2" /></td>					
					              <td width="320" align="center"  height="21" >
					                     <select name="day" id="idday" class="classday">
                	                      <option value="">Select</option>
                                          <option value="MON">MON</option>
                                          <option value="TUE">TUE</option>
                                          <option value="WED">WED</option>
                                          <option value="THU">THU</option>
                                          <option value="FRI">FRI</option>
                                          <option value="SAT">SAT</option>
                                          <option value="SUN">SUN</option>
                                         </select>
					             </td>      
				                 <td width="100" align="center"  height="21" >
                                         <select name="hr" id="idhr" class="classhr">
                	                      <option value="">HR</option>
                                          <option value="1">1</option>
                                          <option value="2">2</option>
                                          <option value="3">3</option>
                                          <option value="4">4</option>
                                          <option value="5">5</option>
                                          <option value="6">6</option>
                                          <option value="7">7</option>
                                          <option value="8">8</option>
                                          <option value="9">9</option>
                                          <option value="10">10</option>
                                          <option value="11">11</option>
                                          <option value="12">12</option>
                                          <option value="13">13</option>
                                          <option value="14">14</option>
                                          <option value="15">15</option>
                                          <option value="16">16</option>
                                          <option value="17">17</option>
                                          <option value="18">18</option>
                                          <option value="19">19</option>
                                          <option value="20">20</option>
                                          <option value="21">21</option>
                                          <option value="22">22</option>
                                          <option value="23">23</option>
                                          <option value="24">24</option>
                                        </select>
                                        <select name="mm" id="idmm" class="classmm">
                                          <option value="">MM</option>
                	                      <option value="00">00</option>
                                          <option value="01">01</option>
                                          <option value="02">02</option>
                                          <option value="03">03</option>
                                          <option value="04">04</option>
                                          <option value="05">05</option>
                                          <option value="06">06</option>
                                          <option value="07">07</option>
                                          <option value="08">08</option>
                                          <option value="09">09</option>
                                          <option value="10">10</option>
                                          <option value="11">11</option>
                                          <option value="12">12</option>
                                          <option value="13">13</option>
                                          <option value="14">14</option>
                                          <option value="15">15</option>
                                          <option value="16">16</option>
                                          <option value="17">17</option>
                                          <option value="18">18</option>
                                          <option value="19">19</option>
                                          <option value="20">20</option>
                                          <option value="21">21</option>
                                          <option value="22">22</option>
                                          <option value="23">23</option>
                                          <option value="24">24</option>
                                          <option value="25">25</option>
                                          <option value="26">26</option>
                                          <option value="27">27</option>
                                          <option value="28">28</option>
                                          <option value="29">29</option>
                                          <option value="30">30</option>
                                          <option value="31">31</option>
                                          <option value="32">32</option>
                                          <option value="33">33</option>
                                          <option value="34">34</option>
                                          <option value="35">35</option>
                                          <option value="36">36</option>
                                          <option value="37">37</option>
                                          <option value="38">38</option>
                                          <option value="39">39</option>
                                          <option value="40">40</option>
                                          <option value="41">41</option>
                                          <option value="42">42</option>
                                          <option value="43">43</option>
                                          <option value="44">44</option>
                                          <option value="45">45</option>
                                          <option value="46">46</option>
                                          <option value="47">47</option>
                                          <option value="48">48</option>
                                          <option value="49">49</option>
                                          <option value="50">50</option>
                                          <option value="51">51</option>
                                          <option value="52">52</option>
                                          <option value="53">53</option>
                                          <option value="54">54</option>
                                          <option value="55">55</option>
                                          <option value="56">56</option>
                                          <option value="57">57</option>
                                          <option value="58">58</option>
                                          <option value="59">59</option>
                                        </select>
                                    </td>
                      		    </tr>
                       </table>
           	          
                      <table width="80%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                       <tr>
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
                     <a href="../adminbom.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
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