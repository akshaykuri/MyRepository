<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<%@ page import = "javax.servlet.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HO USER</title>
<script type="text/javascript" src="js/layout.js"></script>
<!-- <script language="javascript" type="text/javascript" src="../js/datetimepicker.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" /> -->
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<!-- <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> -->
    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null)
          {
	      response.sendRedirect("adminlink.jsp?msg=1");
          }
    %>

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
long millis=System.currentTimeMillis();  
java.util.Date date=new java.util.Date(millis);  
//System.out.println(date);  
String day=(date.toString()).substring(0,3);
String dt=(date.toString()).substring(8,10);
String yr=(date.toString()).substring(24,28);
String mo=(date.toString()).substring(4,7);
//System.out.println("Day  :"+day);
//System.out.println("Month :"+mo);
// System.out.println("Year :"+yr);
int dt1=Integer.parseInt(dt);
String mo1=null;
if(mo.equalsIgnoreCase("JAN"))
    mo1="01";
else if(mo.equalsIgnoreCase("FEB"))
    mo1="02";
else if(mo.equalsIgnoreCase("MAR"))
    mo1="03";
else if(day.equalsIgnoreCase("APR"))
    mo1="04";
else if(mo.equalsIgnoreCase("MAY"))
    mo1="05";
else if(mo.equalsIgnoreCase("JUN"))
    mo1="06";
else if(mo.equalsIgnoreCase("JUL"))
    mo1="07";
else if(mo.equalsIgnoreCase("AUG"))
    mo1="08";
else if(mo.equalsIgnoreCase("SEP"))
    mo1="09";
else if(mo.equalsIgnoreCase("OCT"))
    mo1="10";
else if(mo.equalsIgnoreCase("NOV"))
    mo1="11";
else if(mo.equalsIgnoreCase("DEC"))
    mo1="12";
%>




<script  type="text/javascript">
function  databackup(id)
          {
	      //alert("Heare....."+id);
	      var id1="idyes"+id;
	      var id2="idno"+id;
	      var id3="idremarks"+id;
	      if(document.getElementById(id1).checked  == true)
	    	  {
	    	  document.getElementById(id2).checked  = false;
	          document.getElementById(id3).value="";
	    	  document.getElementById(id3).style.visibility = "hidden";
	    	  }
	     if(document.getElementById(id2).checked  == true)
    	     {
	         document.getElementById(id1).checked  = false;
    	     document.getElementById(id3).value="";
    	     document.getElementById(id3).style.visibility = "visible";
    	     }
	    if(document.getElementById(id2).checked  == false)
 	         {
	         document.getElementById(id3).value="";
 	         document.getElementById(id3).style.visibility = "hidden";
 	         }
	      
	      }
 function clear1()
         {
         //alert("Clear 1");
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
          	       String schday=rs11.getString(4);
          	       //System.out.println("id....444 :"+id);
          	       int p11=1;
                   while(p11<=dt1)
                         {
                   	     String dy1=Integer.toString(p11);
                       	 String inputDateStr1 = String.format("%s/%s/%s", dy1, mo1, yr);
                         java.util.Date inputDate11 = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr1);
                         Calendar calendar11 = Calendar.getInstance();
                         calendar11.setTime(inputDate11);
                         String dayOfWeek11 = calendar11.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                         String s1=dayOfWeek11.substring(0,3);
                         //System.out.println("Day of week  :"+s); 
                       	 // System.out.println("cur day :"+day.toUpperCase());
                         //System.out.println("schee day :"+rs5.getString(4));
                         if(schday.equalsIgnoreCase(s1))
                               {String id1=id+p11;%>
                               document.getElementById("idyes"+"<%=id1%>").checked  = false;
                               document.getElementById("idno"+"<%=id1%>").checked  = false;
                               document.getElementById("idremarks"+"<%=id1%>").value = "";
                               document.getElementById("idremarks"+"<%=id1%>").style.visibility = "hidden";         
                               <%}
                        p11++;
                        }
                   }
          	   }catch (Exception e) { System.out.println(e); }%>
           
         }
 </script>
  <script  type="text/javascript">          
  function validate(id)
       {
       var p;
       //alert("empid :"+id);
       var yesno = document.form.yesno;
       var res = document.form.remarks;
       //alert(res.value);
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
</head>
 
<body   onload="clear1()">
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
 
   <form name="form" method="post"  action="backupStatusUpdateBack1.jsp">
  	     <%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
         <%
         Name = (String) session.getAttribute("Nname");
         desg = (String) session.getAttribute("desg");
         city = (String) session.getAttribute("city");
         b_no = (String) session.getAttribute("b_no");
         admin =  (String) session.getAttribute("admin");
         email_id = (String) session.getAttribute("Nmail");
         //System.out.println("City name :"+city ); 
            String empid=request.getParameter("Nno");
            String msg1=request.getParameter("message");
            System.out.println("msg1 :"+msg1);
            if(!msg1.equals("y"))
                {%>
                <script language="javascript">
         	         alert("<%=msg1%>");
         	   </script>
                <%}
            
            
            
            
            
            
           //System.out.println("Empid :"+empid);
           Connection cn1 = null, cn2 = null,cn3 = null,cn4 = null,cn2a=null;
           Statement st1 = null,st2 = null,st3 = null,st4 = null,st2a=null; 
           ResultSet rs1 = null,rs2 = null,rs3 = null,rs4 = null,rs2a=null;
           cn1 = con.getConnection2();
           st1=cn1.createStatement();
           rs1 = st1.executeQuery("select * from systembackupchecklist where empno='"+empid+"' and bno='"+b_no+"'");
           try{
        	    if(rs1.next())
        	       {
        	       //System.out.println("id :"+rs1.getString(2));%>
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
                              <td align="left"><input type="text" name="Nno" value="<%=rs1.getString(2)%>" id="idemp_no" readonly ></td>
                              <td align="left"><font size=2> NAME:<font color=red>*</font></font></td>
	                          <td align="left"><input type="text" name="Nname" id="idname" value="<%=rs1.getString(3)%>" size=30 readonly></td>
                          </tr>
	                      <tr>
                               <td align="left"><font size="2">DESIGNATION</font><font color=red>*</font></td>
                               <td align="left"><input type="text" name="desg" id="iddesg" value="<%=rs1.getString(4)%>" size=30 readonly></td></td>
                               <td align="left"><font size="2">DEPARTMENT</font><font color=red>*</font></td>
                               <td align="left"><input type="text" name="dept" id="iddept" value="<%=rs1.getString(5)%>" size=30 readonly></td></td>
                         </tr>
                         
                	     <tr>
                	          <td align="left"><font size=2>BRANCH:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="<%=rs1.getString(6)%>" size=30 id="idbranch" name="branch" readonly></td>
                	          <td align="left"><font size=2>SUB BRANCH:<font color=red>*</font></font></td>
                	          <td align="left"><input type="text"  value="<%=rs1.getString(7)%>" size=30 id="idsbranch" name="sbranch" readonly></td>
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
	                          <td align="center"><font size=2>SCHEDULED DATE</font></td>
	                          <td align="center" ><font size=2 >BACKUP COMPLETEED</font></td>
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
	                                         <td><input type="hidden" name="desg" id="iddesg<%=rs5.getString(1)%>" value="<%=rs5.getString(1)%>" size=10 readonly></td>
                                             <td align="center"><font size=2 >
                                                        <input type="text" name="schedfor<%=rs5.getString(1)%>" id="idschedfor<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(3)%>" size=10 readonly></font>
                                             </td>
                                             <td align="center"><font size=2>
                                                        <input type="text" name="schday<%=rs5.getString(1)%>" id="idschday<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(4)%>" size=10 readonly></font>
                                                         
                                             </td>
                                             <td align="center"><font size=2>
                                                      <input type="text" name="schtime<%=rs5.getString(1)%>" id="idschtime<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(5)%>" size=10 readonly></font>
                                                      
                                              </td>
                                             <td align="center"><font size=2>
                                                        <input type="text" name="soft<%=rs5.getString(1)%>" id="idsoft<%=rs5.getString(1)%>" style="text-align:center;" value="<%=rs5.getString(6)%>" size=10 readonly></font>
                                             </td>
                                             <td align="center"><font size=2>
                                                          <%
                                                          String s=null;
                                                          String schday=rs5.getString(4);
                                                          int p=1;
                                                          while(p<=dt1)
                                                              {
                                                        	  String dy=Integer.toString(p);
                                                          	  String inputDateStr = String.format("%s/%s/%s", dy, mo1, yr);
                                                              java.util.Date inputDate = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr);
                                                              Calendar calendar = Calendar.getInstance();
                                                              calendar.setTime(inputDate);
                                                              String dayOfWeek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                                                              s=dayOfWeek.substring(0,3);
                                                              //System.out.println("Day of week  :"+s); 
                                                         	  // System.out.println("cur day :"+day.toUpperCase());
                                                        	  //System.out.println("schee day :"+rs5.getString(4));
                                                        	  String pp=null;
                                                        	  String schdate=null;
                                                        	  if(schday.equalsIgnoreCase(s))
                                                        	        {
                                                        		   
                                                        		    if(p<10)
                                                        		        {
                                                        		    	pp="0"+(String.valueOf(p));
                                                        		        schdate=pp+"/"+mo1+"/"+yr;
                                                        		        }
                                                        		    else
                                                        		        {
                                                        		        schdate=p+"/"+mo1+"/"+yr;
                                                        		        }
                                                        		    
                                                        		    String schdateid=rs5.getString(1)+p;%>
                                                        		    <input type="text" name="schdate<%=schdateid%>" id="idschdat<%=schdateid%>" style="text-align:center;" value="<%=schdate%>" size=1 readonly></font>
                                                        	       <%}
                                                        	  p++;
                                                              }
                                                          %>
                                                </td>
                                                <td align="center"><font size=2>
                                                <%
                                                int p1=1;
                                                String pp1=null;
                                          	    String schdate1=null;
                                                while(p1<=dt1)
                                                 {
                                           	     String dy=Integer.toString(p1);
                                             	 String inputDateStr1 = String.format("%s/%s/%s", dy, mo1, yr);
                                                 java.util.Date inputDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr1);
                                                 Calendar calendar1 = Calendar.getInstance();
                                                 calendar1.setTime(inputDate1);
                                                 String dayOfWeek1 = calendar1.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                                                 s=dayOfWeek1.substring(0,3);
                                                 //System.out.println("Day of week  :"+s); 
                                            	 // System.out.println("cur day :"+day.toUpperCase());
                                           	     //System.out.println("schee day :"+rs5.getString(4));
                                           	     if(schday.equalsIgnoreCase(s))
                                           	          {
                                           	    	  String id=rs5.getString(1)+p1;
                                           	    	  //System.out.println("Sch db :=========="+id);
                                           	    	   if(p1<10)
                                                        		        {
                                                        		    	pp1="0"+(String.valueOf(p1));
                                                        		        schdate1=pp1+"/"+mo1+"/"+yr;
                                                        		        }
                                                        		    else
                                                        		        {
                                                        		        schdate1=p1+"/"+mo1+"/"+yr;
                                                        		        }
                                           	         // String schdate=p1+"/"+mo1+"/"+yr;
                                           	          //System.out.println("Schdate :"+schdate);
                                           	          //System.out.println("Schdate2 :"+rs5.getString(3));
                                           	          //System.out.println("empid :"+empid);
                                           	          cn2 = con.getConnection2();
                                                      st2=cn2.createStatement();
                                                      rs2 = st2.executeQuery("select schdate from systembackupstatus where empno='"+empid+"' and schdate='"+schdate1+"' and file='"+rs5.getString(3)+"' and Status='Completed'");
                                                      if(rs2.next())
                                                	       {%>
                                                	       
                                                	       <p ><font size=3 color="red" style="italic"><i>Completed</i></font> </p>
                                                	      <%-- <input type="hidden" name="remarks33<%=id%>" id="idyes<%=id%>" value="" width="50" size=50 placeholder="Enter resion">   <br />  
                              	                          <input type="hidden" name="remarks33<%=id%>" id="idno<%=id%>" value="" width="50" size=50 placeholder="Enter resion">   <br />  
                              	                          <input type="hidden" name="remarks33<%=id%>" id="idremarks<%=id%>" value="" width="50" size=50 placeholder="Enter resion">   <br />  
                              	                         --%> 
                                                	<%}else{
                                                		  cn2a = con.getConnection2();
                                                          st2a=cn2a.createStatement();
                                                          System.out.println("Here emp :"+empid);
                                                          System.out.println("Here dat :"+schdate1);
                                                          System.out.println("Here file :"+rs5.getString(3));
                                                          rs2a = st2a.executeQuery("select schdate from systembackupstatus where empno='"+empid+"' and schdate='"+schdate1+"' and file='"+rs5.getString(3)+"' and Status='Pending'");
                                                          if(rs2a.next())
                                                  	          {%>
                                                  	             
                                                  	              <input type="checkbox" name="yes<%=id%>" value="yes" id="idyes<%=id%>" onclick="databackup(<%=id%>);" > YES
                	                                              <input type="checkbox" name="no<%=id%>" value="no" id="idno<%=id%>" onclick="databackup(<%=id%>);" > NO
                                                                  <input type="text" name="remarks<%=id%>" id="idremarks<%=id%>" value="" width="50" size=50 placeholder="Enter resion">   <br />
                                                                 
                              	                             <%}else{%>
                              	                                   
                              	                                   <input type="hidden" name="remarks33<%=id%>" id="idyes<%=id%>" value="" width="50" size=50 placeholder="Enter resion">  
                              	                                   <input type="hidden" name="remarks33<%=id%>" id="idno<%=id%>" value="" width="50" size=50 placeholder="Enter resion"> 
                              	                                   <input type="hidden" name="remarks33<%=id%>" id="idremarks<%=id%>" value="" width="50" size=50 placeholder="Enter resion">
                              	                                   
                              	                                   <%} 
                                                          }
                                                      }
                                           	      p1++;
                                                  }
                                             %>
                                             
                                        </td>   
                                       </tr>
                                      <%}%>
                                 
                	     </table>
                	       </div>
                	       
                	     
                      <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="gray">
                       <tr>
                        
	                      <!-- <td align="CENTER" colspan=2 >
	                       <a href="" onclick="return popitup('BackupscheduleDisp.jsp')">View </a> </td> -->
	                       <td align="CENTER" colspan=2 >  <input type="submit"  value="SAVE" name=button1 onclick="return( validate(<%=empid%>));" />
     	                   <!-- <input type="button" value="CLEAR" id="" onclick="clear1();" /> -->
     	                  </td>
	                  </tr>
	             </table>
	             </div>
 	             </center>
 	            <%}else{String msg = "YOU_CANT_UPDATE_STATUS_FOR_OTHER_RESIGN_USERS";	
 	             response.sendRedirect("backupStatusUpdate.jsp?msg=" +msg);}%>   
	</form>

	
	
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
                     <a href="backupStatusUpdate.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
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