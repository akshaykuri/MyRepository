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
<title>BACKUP SCHEDULE</title>
<script type="text/javascript" src="js/layout.js"></script>
<script language="javascript" type="text/javascript" src="../js/datetimepicker.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null)
          {
	      response.sendRedirect("adminlink.jsp?msg=1");
          }
    %>
<%-- <script  type="text/javascript">
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
</script> --%>
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
	      var e = document.form.fileEO;
          var o=document.form.sname;
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
<script language="javascript" type="text/javascript">
function popitup(url)
      {
	  newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	  if (window.focus) {newwindow.focus()}
 	       return false;
      }
</script>
<script  type="text/javascript">
function edit()
       {
	   
	   <%String empid1=request.getParameter("Nno");
           //System.out.println("Empid1 :"+empid1);
           Connection cn11 = null;
           Statement st11 = null; 
           ResultSet rs11 = null;
           cn11 = con.getConnection2();
           st11=cn11.createStatement();
           rs11 = st11.executeQuery("select * from systembackupschdaytime where empno='"+empid1+"'");
           try{
        	    while(rs11.next())
        	       {
        	       
        	       String id=rs11.getString(1);
        	       %>
        	       
        	       document.getElementById("iddayy"+"<%=id%>").style.visibility = 'hidden';
        	       document.getElementById("idhrr"+"<%=id%>").style.visibility = 'hidden';
        	       document.getElementById("idmmm"+"<%=id%>").style.visibility = 'hidden';
        	       document.getElementById("idsname1"+"<%=id%>").style.visibility = 'hidden';
        	       
        	       document.getElementById("mydiv"+"<%=id%>").style.visibility = 'hidden';
	              <%}
        	   }catch (Exception e) { System.out.println(e); }%>
       }
  </script>
<script language="javascript">
function editRecord(id)
        {    
        /* var f=document.form;    
        f.method="post";    
        f.action='scheduldeEdit.jsp?id='+id;    
        f.submit(); */
        //alert(id);
        var id1="idschday"+id;
        //alert(id1);
        var id2="iddayy"+id;
        var id3="idschtime"+id;
        var id4="idhrr"+id;
        var id5="idmmm"+id;
        var id6="idsoft"+id;
        var id7="idsname1"+id;
        var mydiv="mydiv"+id;
        document.getElementById(id1).type= 'hidden';
	    document.getElementById(id2).style.visibility = 'visible';
	    document.getElementById(id3).type = 'hidden';
	    document.getElementById(id4).style.visibility = 'visible';
	    document.getElementById(id5).style.visibility = 'visible';
	    document.getElementById(id6).type = 'hidden';
	    document.getElementById(id7).style.visibility = 'visible';
	    document.getElementById(mydiv).style.visibility = 'visible';
        }
function deleteRecord(id)
    {  
	if(confirm('You are above to delete a Schedule !'))
	     {
         var f=document.form;    
         f.method="post";    
         f.action='scheduldeDelete.jsp?id='+id;    
         f.submit();
  	     }
	else
		{}
    }
function saveRecord(id)
{  
if(confirm('You are above to Edit a Schedule !'))
     {
     var f=document.form;    
     f.method="post";    
     f.action='scheduldeEdit.jsp?id='+id;    
     f.submit();
	     }
else
	{}
}
function cancelRecord(id)
    {  
     var f=document.form;    
     f.method="post";    
     f.action='canelEdit.jsp?id='+id;    
     f.submit();

}
</script>
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
</head>
 
<body onload="edit();" >
   <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
          <tr align="center">
               <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
               <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
          </tr>
   </table> 
   <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
             <tr align="center">
                 <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>BACKUP SCHEDULE</b><br /> </font></strong></td>
            </tr>
            <tr align="center">
                <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong></td>
            </tr>
   </table>
   <br />
   <br />
 <!--  <div id="" style="overflow-y:scroll; overflow-x:hidden; height:360px;"> -->
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
           String empid=request.getParameter("Nno");
           System.out.println("Empid :"+empid);
          
           
           String msg1=request.getParameter("message");
           System.out.println("msg1 :"+msg1);
           if(!msg1.equals("y"))
               {%>
               <script language="javascript">
        	         alert("<%=msg1%>");
        	   </script>
               <%}
           Connection cn1 = null, cn2 = null,cn3 = null,cn4 = null;
           Statement st1 = null,st2 = null,st3 = null,st4 = null; 
           ResultSet rs1 = null,rs2 = null,rs3 = null,rs4 = null;
           cn1 = con.getConnection2();
           st1=cn1.createStatement();
           rs1 = st1.executeQuery("select * from systemuserbackup where empno='"+empid+"' and branchno='"+b_no+"'");
           try{
        	    if(rs1.next())
        	       {
        	       System.out.println("id :"+rs1.getString(2));%>
                 <center>
                  <div class="modal-content">
                    <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                           <tr>
                               <td align=center width=60%  colspan=4  background=".jpg">
                                   <font color=darkblue size=3 >BACKUP CHECK LIST</font>
                                </td>
                          </tr>
                          <tr>
                              <td align="left"><font size="2">EMP NO.:</font><font color=red>*</font></td>
                              <td align="left"><input type="text" name="Nno" value="<%=rs1.getString(1)%>" id="idemp_no" readonly ></td>
                              <td align="left"><font size=2> NAME:<font color=red>*</font></font></td>
	                          <td align="left"><input type="text" name="Nname" id="idname" value="<%=rs1.getString(2)%>" size=30 readonly></td>
                          </tr>
	                      <tr>
                               <td align="left"><font size="2">DESIGNATION</font><font color=red>*</font></td>
                               <td align="left"><input type="text" name="desg" id="iddesg" value="<%=rs1.getString(3)%>" size=30 readonly></td></td>
                               <td align="left"><font size="2">DEPARTMENT</font><font color=red>*</font></td>
                               <td align="left"><input type="text" name="dept" id="iddept" value="<%=rs1.getString(4)%>" size=30 readonly></td></td>
                         </tr>
                         
                	     <tr>
                	          <td align="left"><font size=2>BRANCH:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="<%=rs1.getString(5)%>" size=30 id="idbranch" name="branch" readonly></td>
                	          <td align="left"><font size=2>SUB BRANCH:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="<%=rs1.getString(6)%>" size=30 id="idsbranch" name="sbranch" readonly></td>
                	     </tr>
                	     <tr>
                	          <td align="left"><font size=2>SYSTEM TYPE:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="<%=rs1.getString(8)%>" size=30 id="idsystype" name="systype" readonly></td>
                	          <td align="left"><font size=2>SYSTEM SR. NO:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="<%=rs1.getString(9)%>" size=30 id="idsysno" name="sysno" readonly></td>
                	     </tr>
                	   
                	    
                	   </table>
                	
                              
                      
                    <div id="myDynamicTable">
                	  <table id="myTable" width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                           <tr>
                               <td align=center width=60%  colspan=8  background=".jpg">
                                   <font color=darkblue size=3 >SCHEDULED LIST</font>
                                </td>
                          </tr>
                        
                          <tr>
                              <td align="center"><font size=2></font> </td>
                              <td align="center"><font size=2>SCHEDULE FOR</font> </td>
                              <td align="center"><font size=2>SCHEDULE DAY </font></td>
                              <td align="center"><font size=2>SCHEDULE TIME</font></td>
	                          <td align="center"><font size=2>SOFTWARE USED</font></td>
	                          <td align="center" colspan=3><font size=2 >EDIT/DELETE</font></td>
                          </tr>
                                  <%
                                   Connection cn5 = null;
                                   Statement st5= null; 
                                   ResultSet rs5= null;
                                   cn5= con.getConnection2();
                                   st5=cn5.createStatement();
                                  // String emp=request.getParameter("idname");
                                  // System.out.println(" Emp id dfdfdf :"+p);
                                   rs5 = st5.executeQuery("select * from systembackupschdaytime where empno='"+empid+"'");
                                   %>
                                   <%while(rs5.next())
                                       {%>
	                                     <tr>
	                                         <td><input type="hidden" name="desg" id="iddesg" value="<%=rs5.getString(1)%>" size=10 readonly></td>
                                             <td align="center"><font size=2 >
                                                        <input type="text" name="schedfor" id="idschedfor" style="text-align:center;" value="<%=rs5.getString(3)%>" size=10 readonly></font>
                                             </td>
                                             <td align="center"><font size=2>
                                                        <input type="text" name="schday" id="idschday<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(4)%>" size=10 readonly></font>
                                                         <select name="dayy<%=rs5.getString(1)%>" id="iddayy<%=rs5.getString(1)%>" class="classday1">
                	                                           <option value="<%=rs5.getString(4)%>"><%=rs5.getString(4)%></option>
                                                               <option value="MON">MON</option>
                                                               <option value="TUE">TUE</option>
                                                               <option value="WED">WED</option>
                                                               <option value="THU">THU</option>
                                                               <option value="FRI">FRI</option>
                                                               <option value="SAT">SAT</option>
                                                               <option value="SUN">SUN</option>
                                                         </select>
                                             </td>
                                             <td align="center"><font size=2>
                                                      <input type="text" name="schtime" id="idschtime<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(5)%>" size=10 readonly></font>
                                                      <%String ti=rs5.getString(5);
                                                      System.out.println("Time "+ti);
                                                      
                                                      String[] split = ti.split(":");
                                                      String hr = split[0];
                                                      String min = split[1];
                                                      
                                                      
                                                     // String hr=ti.substring(0,2);
                                                      System.out.println("hr :"+hr);
                                                      //String min=ti.substring(3,5);
                                                      System.out.println("min :"+min);
                                                      %>
                                                      <select name="hrr<%=rs5.getString(1)%>" id="idhrr<%=rs5.getString(1)%>" >
                	                                         <option value="<%=hr%>"><%=hr%></option>
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
                                                      <select name="mmm<%=rs5.getString(1)%>" id="idmmm<%=rs5.getString(1)%>" class="classmm">
                                                             <option value="<%=min%>"><%=min%></option>
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
                                             <td align="center"><font size=2>
                                                        <input type="text" name="soft<%=rs5.getString(1)%>" id="idsoft<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(6)%>" size=10 readonly></font>
                                                        <%
                                                          Connection cn0211 = null;
                                                          Statement st0211 = null; 
                                                          ResultSet rs0211 = null;
                                                          cn0211 = con.getConnection2();
                                                          st0211=cn0211.createStatement();
                                                          rs0211 = st0211.executeQuery("select * from systemuserbackupswlist ORDER BY sname Asc");
                                                         %>
                	                                    <select name="sname1" id="idsname1<%=rs5.getString(1)%>">
			                                                      <option value=""><%=rs5.getString(6)%></option>
			                                                      <%while(rs0211.next()){ %>
		                                        		          <option><%=rs0211.getString("sname")%></option>
		                                                    	  <%} %>
		                                                 </select>
                                             </td>
                                             <td align="CENTER" colspan=2 >  <input type="button"  value="EDIT" name=button1  onclick="editRecord(<%=rs5.getString(1)%>);"/>
                                             <div id="mydiv<%=rs5.getString(1)%>">
                                             <input type="button"  value="SAVE" name=button2  onclick="saveRecord(<%=rs5.getString(2)+rs5.getString(1) %>);"/>
                                             <input type="button"  value="CANCEL" name=button3  onclick="cancelRecord(<%=rs5.getString(2)+rs5.getString(1) %>);"/> </div></td>
                                            
                                             <td align="CENTER" colspan=2 >  <input type="submit"  value="DELETE"  onclick="deleteRecord(<%=rs5.getString(2)+rs5.getString(1) %>);" /></td>
                                        </tr>
                                      <%}%>
                                 
                	     </table>
                	       </div>
                	       <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                	       
                	            <tr>
                	         <%
                                   //String p_type=request.getParameter("p_type");
                                   Connection cn02111 = null;
                                   Statement st02111 = null; 
                                   ResultSet rs02111 = null;
                                 
                                   cn02111 = con.getConnection2();
                                   st02111=cn02111.createStatement();
                                   rs02111 = st02111.executeQuery("select * from 	backuptypemaster ORDER BY sname Asc");
                                   %>
                	          <td align="left"><font size=2>DATA BACKUP:<font color=red>*</font></font></td>
                	          <td>
                                   <select name="fileEO" id="idfileEO">
			                              <option value="">Select</option>
			                                 <%while(rs02111.next()){ %>
		                                        		<option><%=rs02111.getString("sname")%></option>
		                                                    	<%} %>
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
                	     <table class="dynatable2" border="1" cellspacing="1" width="100%" style="height: 150"  bgcolor="gray">
			  	  	           <tr><td width="30" align="center"  height="21" ></td>
				                   <td width="45" align="center"  height="21" ><button class="add2" type="button">+</button></td>
				                   <td width="70" align="center"  height="10" ><font  size="2">SL.NO.</font></td>
					               <td width="320" align="center"  height="10" ><font color="red" size="2">*</font><font size="2">SCHEDULED DAY</font></td>				
					               <td width="445" align="center"  height="10"  ><font color="red" size="2">*</font><font  size="2">SCHEDULED TIME (HR:MM)</font></td>
				               </tr>
		 		               <tr class="prototype2">
					              <td width="30" align="center"  height="21" ></td>
			 	                  <td width="45" align="center"  height="21" ><button class="remove2" type="button">--</button></td>
					              <td width="70" align="center"  height="21" ><input type="text" name="id2[]" value="0" size=2 class="id2" readonly /></td>					
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
           	          
                      <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                       <tr>
                        
	                      <td align="CENTER" colspan=2 >
	                       <a href="" onclick="return popitup('BackupscheduleDisp.jsp')">View </a> </td>
	                       <td align="CENTER" colspan=2 >  <input type="submit"  value="SAVE" name=button1 onclick="return( validate() && ButtonClicked());" />
     	                   <!-- <input type="button" value="CLEAR" id="" onclick="clear1();" /> -->
     	                  </td>
	                  </tr>
	             </table>
	             </div>
 	             </center>
 	             <%}else{String msg = "YOU_CANT_SCHEDULED_FOR_OTHER_RESIGN_USERS";	
 	             response.sendRedirect("backupSchedule.jsp?msg=" +msg);}%>   
	</form>
	
	
	<div id="resultFromAjax2" style="display:none;">
     </div>
	
	<%
      }
      catch (Exception e) { System.out.println(e); }
      finally{
	         DbUtil.closeDBResources(rs1,st1,cn1);
	         }
	%>
    <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
           <tr> 
              <td width="1000" align="left"> 
                      <a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
              </td> 
              <td width="115" align="right"> 
                     <a href="backupSchedule.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
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