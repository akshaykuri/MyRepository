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

    <%
    session.setMaxInactiveInterval(20*60);
    if(session==null||session.getAttribute( "Nname" )==null)
          {
	      response.sendRedirect("adminlink.jsp?msg=1");
          }
    %>
<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){ 
    	 //alert("Here..");
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="selEmp.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
</script>
<%int co=0; %>
<script language="javascript" type="text/javascript">     
    function showtext(str)
         { 
    	// alert("Here.."+str);
    	
    	 var n = str.length;
    	// alert("length.."+n);
    	 var res = str.substring(0,1);
    	// alert("Here11.."+res);
    	 var res1 = str.substring(1,n);
    	 //alert("Here112.."+res1);
    	 if(res=='n')
    		  var t='idtext'+res1;
    	 else
    		  var t='idtext'+str;
    	 if(res!='n')
    		       {
    		       document.getElementById(t).value="";
    	           document.getElementById(t).style.visibility = 'hidden';
    		       }
               else
            	   {
    	           document.getElementById(t).style.visibility = 'visible';
            	   }
    	 }  
    function showtext1(str)
        { 
    	//alert("Here.."+str);
    	
   	 var n = str.length;
   	// alert("length.."+n);
   	 var res = str.substring(0,1);
   //	 alert("Here11.."+res);
   	 var res1 = str.substring(1,n);
   	// alert("Here112.."+res1);
   	 if(res=='n')
   		  var t='idtext'+res1;
   	 else
   		  var t='idtext'+str;
   	 if(res!='n')
   	    	   {
   	    	   document.getElementById(t).value="";
   	           document.getElementById(t).style.visibility = 'hidden';
   	    	   }
            else
               { 	  
   	           document.getElementById(t).style.visibility = 'visible';
               }
        }  
</script>
<script language="javascript" type="text/javascript">     
    function clear1()
         { 
    	 var co=document.getElementById('idcoun').value;
         var j=1;
    	 while(j<=co)
    		 {
    		 var t='idtext'+j;
    		 var k='text'+j;
    		 document.getElementById(j).checked=false;
    		 document.getElementById(t).value="";
    		 document.getElementById(t).name = k;
    		 document.getElementById(t).style.visibility = 'hidden';
    		 j++;
    		 }
    	 document.getElementById('iddesg').value="";
    	 document.getElementById('idemp').value="-1";
      	 } 
</script>
 <script  type="text/javascript">          
          function validate()
                  {
        	      var co=document.getElementById('idcoun').value;
        	      var j=1;
         	      while(j<=co)
         		      {
         	    	  var p='n'+j;
         	    	  var t='idtext'+j;
         	          if(document.getElementById(p).checked==true && document.getElementById(t).value=="")
         		    	           {
         		    	           alert("Please Enter Remarks.!");
         		    	           document.getElementById(t).focus();
                                   return false;
         		    	           }
         	    	  j++;
         		      }
         	    if( document.getElementById('iddesg').value=="")
         	    	  {
         	    	  alert("Please select the checked and verified by Designation.!");
  		    	      document.getElementById('iddesg').focus();
                      return false;
         	    	  }
         	   if( document.getElementById('idemp').value=="-1")
   	    	          {
   	    	          alert("Please Select employee name.!");
	    	          document.getElementById('idemp').focus();
                      return false;
   	    	          }
                 }
</script>
<script language="javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function popitup(url) {
	newwindow=window.open(url,'name','height=1100,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} 
</script>
</head>
<body  onload="clear1()">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
</table> 

 <form name="form" method="post"  action="backupverification1back.jsp">
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
	<%!String branch=null,month=null,year=null,bno1=null; 
	   int k=0;%>
         <%
         branch =  request.getParameter("sbranch");
         year=    request.getParameter("year");
         month =  request.getParameter("month");
         session.setAttribute("branch",branch);
         session.setAttribute("year",year);
         session.setAttribute("month",month);
         //System.out.println("Branch :"+branch);
         // System.out.println("year :"+year); 
         //System.out.println("month :"+month);
          if(branch.equals("HEAD OFFICE"))
            {
     	    bno1="90";
     	    }
          else if(branch.equals("BANGALORE"))
            {
   	        bno1="10";
   	        }
          else if(branch.equals("CHENNAI"))
            {
   	        bno1="40";
   	        }
          else if(branch.equals("MUMBAI"))
            {
   	        bno1="30";
   	        }
          else if(branch.equals("DELHI"))
            {
   	        bno1="20";
   	        }
         
         
         if(month.equals("01")||month.equals("03")||month.equals("05")||month.equals("07")||month.equals("08")||month.equals("10")||month.equals("12"))
            {
        	 k=31;
        	}
       else if(month.equals("04")||month.equals("06")||month.equals("09")||month.equals("11"))
            {
     	    k=30;
     	    } 
       else if(month.equals("02"))
            {
       	    k=28;
            } 
       else
    	   k=30;
         
         
         
         
        // System.out.println("Branch Number ddddfdf:"+branch);
         //System.out.println("Month Number ddddfdf:"+month);
         %>
       <%
       Connection cn1 = null, cn2 = null,cn3 = null,cn4 = null,cn5=null,cn6=null,cn11=null;
       Statement st1 = null,st2 = null,st3 = null,st4 = null,st5=null,st6=null,st11=null,st111=null,st11a=null,st11aa=null,st11aaa=null,stab=null; 
       ResultSet rs1 = null,rs2 = null,rs3 = null,rs4 = null,rs5=null,rs6=null,rs11=null,rs111=null,rs11a=null,rs11aa=null,rs11aaa=null,rsab=null;
       int m=1;
       String f=null,d=null,t=null,s=null,rem1=null,rem2=null,reso=null,ye=null,ye1=null;
     //  cn1 = con.getConnection2();
     
       try{
           %>
      
                    <center>
                    <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="LightGreen ">
                           <tr>
                               <td align=center width=90%  colspan=40  background=".jpg">
                                      <font color=yellow size=2 >Y-COMPLETED/</font>
                                      <font color=red size=2 >RED N-NOT COMPLETED/</font>
                                      <font color=blue size=2 >BLUE N-STATUS NOT UPDATED FOR FILE/</font>
                                      <font color=maroon size=2 >MAROON N-STATUS NOT UPDATED FOR EMAIL</font>
                              </td>
                                
                          </tr>
                           <tr>
                               <td align=center width=90%  colspan=40  background=".jpg">
                                      <font color=darkblue size=5 >BACKUP VERIFICATION FORM</font>
                                </td>
                          </tr>
                          <tr>
                               <td align="center" width="2%" ><font size="2">Sr.NO</font></td>
                               <td align="center" width="2%"><font size="2">EMP NO</font></td>
                               <td align="center" width="5%"><font size=2> NAME</font></td>
                               <td align="center" width="1%"><font size="2">SCHEDULE DAY/TIME</font></td>
                               <td>
                               <table width="100%" border="1" style="border-collapse: collapse;" bgcolor="LightGreen ">
                                    <tr>
                                       <%while(m<=k){ %>
                                      <td align="center" width=5%><font size=2><%=m%></font></td>
                                      <%++m;} %>
                                    </tr>
                                    <tr>
                                      <% m=1;
                                        while(m<=k){
                                        	String day=Integer.toString(m);
                                        	String inputDateStr = String.format("%s/%s/%s", day, month, year);
                                            java.util.Date inputDate = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr);
                                            Calendar calendar = Calendar.getInstance();
                                            calendar.setTime(inputDate);
                                            String dayOfWeek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                                            s=dayOfWeek.substring(0,3);
                                            //System.out.println(dayOfWeek); 
                                        	%>
                                            <td align="center" width=5%><font size=2><%=s%></font></td>
                                          <%++m;} %>
                                    </tr>
                                </table>
                                </td>
                                <td align="center" width=80%><font size="2">VERIFIED</font></td>
                            </tr>
	                           <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                                cn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                                st1 = cn1.createStatement();  
                               
                                int i=0,f1=0,e1=0,o1=0;
                                String p=null,d1="",d2="",d3="",t1="",t2="",t3="";
                                rs1 = st1.executeQuery("Select empno,empname from systembackupchecklist  where bno='"+bno1+"' ");
                                while(rs1.next()){ i++;p=rs1.getString(1);%>
                                <tr>
                                    <td align="center" ><font size="2" ><%=i%></font></td>
                                    <td align="center" ><font size="2" color="black"><%=rs1.getString(1)%></font></td>
                                    <input type="hidden" name="empid<%=i%>" id="idempid<%=i%>" value="<%=rs1.getString(1)%>"> 
                                    <td align="center" ><font size="2" color="black"><%=rs1.getString(2)%></font></td>
                                    <input type="hidden" name="empname<%=i%>" id="idempname<%=i%>" value="<%=rs1.getString(2)%>"> 
                                    <td colspan=1>
                                    
                                       <%
                                       st2 = cn1.createStatement();
                                       rs2 = st2.executeQuery("Select * from systembackupschdaytime where empno='"+p+"' order by schday desc"); 
                                       while(rs2.next()){ 
                                    	   f=rs2.getString(3);
                                    	   d=rs2.getString(4);
                                    	   t=rs2.getString(5);
                                    	   if(f.equals("FILE"))
                                    	      {
                                    		   f1=1; 
                                    		   d1=rs2.getString(4)+"<br />"+d1;
                                    		   t1=rs2.getString(5)+"<br />"+t1;
                                    	      }
                                    	   if(f.equals("EMAIL"))
                                 	          {
                                 		      e1=1; 
                                 		      d2=rs2.getString(4)+"<br />"+d2;
                                 		      t2=rs2.getString(5)+"<br />"+t2;
                                 	          }
                                    	   if(f.equals("OTHER"))
                                 	          {
                                 		      o1=1; 
                                 		      d3=rs2.getString(4)+"<br />"+d3;
                                 		      t3=rs2.getString(5)+"<br />"+t3;
                                 	          }
                                           }
                                     	   %>
                                     	    <table border=1 style="border-collapse: collapse;">
                                     	    <%if(f1==1){%>
                                                <tr>
                                                    <td><font size="2" color="blue">FILE</font></td>
                                                    <td><font size="2" color="blue"><%=d1.substring(0, d1.length() - 1)%></font></td>
                                                    <td><font size="2" color="blue"><%=t1.substring(0, t1.length() - 1)%></font></td>
                                                    <input type="hidden" name="file<%=i%>"  value="<%=d1.substring(0, d1.length() - 1)%>"> 
                                                    <input type="hidden" name="filetime<%=i%>"  value="<%=t1.substring(0, t1.length() - 1)%>"> 
                                                </tr>
                                                <%}%>
                                                <%if(e1==1){%>
                                                <tr>
                                                    <td><font size="2" color="Maroon ">EMAIL</font></td>
                                                    <td><font size="2" color="Maroon "><%=d2.substring(0, d2.length() - 1)%></font></td>
                                                    <td><font size="2" color="Maroon "><%=t2.substring(0, t2.length() - 1)%></font></td>
                                                    <input type="hidden" name="email<%=i%>"  value="<%=d2.substring(0, d2.length() - 1)%>"> 
                                                    <input type="hidden" name="emailtime<%=i%>"  value="<%=t2.substring(0, t2.length() - 1)%>"> 
                                                
                                                </tr>
                                                <%}%>
                                                <%if(o1==1){%>
                                                <tr>
                                                    <td><font size="2" color="yellow">OTHER</font></td>
                                                   <td><font size="2" color="yellow"><%=d3.substring(0, d3.length() - 1)%></font></td>
                                                    <td><font size="2" color="yellow"><%=t3.substring(0, t3.length() - 1)%></font></td>
                                                </tr>
                                                <%}%>
                                            </table>
                                           
                                     </td>
                                     <td>
                                         <table border=1 style="border-collapse: collapse;" width="100%">
                       
                       
                       
                 <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////     -->  
                       
                                          
                                        <% 
                                        String resDate="%"+"/"+month+"/"+year+"%";
                                        //System.out.println("Result Date :" +resDate);
                                        if(f1==1)
                                             { %>
                                        	<tr>
                                        	    <%int m2=1,l=0;
                                                  String s1=null,f5=null,d5=null,da=null,da1=null,da2=null;
                                                  String[] dat = new String[31];
                                                  int a=0,j=0;
                                                  st11 = cn1.createStatement();
                                                  rs11 = st11.executeQuery("Select schdate from systembackupstatus where empno='"+p+"' and file='FILE' and schdate like '"+resDate+"' and (yes='yes' or no='no')"); 
                                                  while(rs11.next())
                                                        {
                                                	     da=rs11.getString(1);
                                                	     //System.out.println("Date of  da :" +da);
                                                	    // da1=(da.substring(11,14)).toUpperCase();
                                                	     //System.out.println("Date of  da1 :" +da1);
                                                         da2=da.substring(0,2);
                                                         //System.out.println("Schedule date ....... :" +rs11.getString(1));
                                                         dat[a]=da2;
                                                         a++;
                                                        }
                                                  int b=0;
                                                  while(m2<=k)
                                                      {
                                                	  String day1=Integer.toString(m2);
                                	                  String inputDateStr1 = String.format("%s/%s/%s", day1, month, year);
                                                      java.util.Date inputDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr1);
                                                      Calendar calendar1 = Calendar.getInstance();
                                                      calendar1.setTime(inputDate1);
                                                      String dayOfWeek1 = calendar1.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                                                      s1=dayOfWeek1.substring(0,3);
                                                      // System.out.println(" s1 value :"+s1);
                                                      //System.out.println(" D1 value :"+d1);
                                                      if(d1.contains(s1))
                                                                 {
                                                    	         //System.out.println("dat.........."+dat[b]);
                                                    	         if(dat[b]!=null)
                                                    	                {
                                                    	                if(Integer.parseInt(dat[b])==(m2))
                                                    	                          { System.out.println("empid"+p);
                                                    	                            String datu=null;
                                                    	                            if(m2<10)
                                                    	                              {
                                                    	                              datu="0"+m2+"/"+resDate.substring(2,9);
                                                    	                              }
                                                    	                            else
                                                    	                               {
                                                    	                                datu=m2+"/"+resDate.substring(2,9);	
                                                    	                               }
                                                    	                            System.out.println("date :"+datu);
                                                    	                            stab = cn1.createStatement();
                                                                                    rsab = stab.executeQuery("Select yes,no,res from systembackupstatus where empno='"+p+"' and schdate='"+datu+"' and file='FILE' "); 
                                                                                    if(rsab.next())
                                                                                            {
                                                                                      	    reso=rsab.getString(3);
                                                                                      	    ye=rsab.getString(1);
                                                                                      	    //System.out.println("True....."+reso);
                                                                                            }
                                                                                    if(ye!=null){%>
                                            	                                          <td align="center" width=2% ><font size=2 color="yellow" title="Completed">Y</font></td>
                                            	                                   <%}else{%>
                                            	                                	     <td align="center" width=2% ><font size=2 color="red"><a href="#" onClick="alert('<%=reso%>');" style="color:red">N</a></font></td>
                                            	                                	   <%}b++;
                                            	                                   }
                                                    	                        else
                                            	                                   {%>
                                            	                                    <td align="center" width=2% ><font size=2 color="blue" title="Status Not Updated"><b>N</b></font></td>  
                                                                                 <%}
                                                    	                }else{%>
                                                                               <td align="center" width=2% ><font size=2 color="blue" title="Status Not Updated"><b>N</b></font></td>  
                                                                   	          <%}
                                                                     
                                                     	         }else{%>
                                                                            <td align="center" width=2% ><font size=2 color="red"></font></td>
                                                                       <%} 
                                     	            m2++;
                                     	            }%>
                                           </tr>
                                       <%}%>
                                               
                          
                          <!-- ///////////////////////////////////////////////////////////////////////////// -->             
                                     <%if(e1==1){%>
                                           <tr>
                                            <%int m3=1;
                                              String da11=null,da21=null,s2=null;
                                              String[] dat1 = new String[31];
                                              int j1=0,a1=0;
                                              st111 = cn1.createStatement();
                                              rs111 = st111.executeQuery("Select schdate from systembackupstatus where empno='"+p+"' and file='EMAIL' and schdate like '"+resDate+"' and (yes='yes' or no='no')"); 
                                              while(rs111.next())
                                                    {
                                            	    da11=rs111.getString(1);
                                            	    //System.out.println("Date of  da11 :" +da11);
                                            	    da21=da11.substring(0,2);
                                                    //System.out.println("Date of  da2 :" +da21);
                                                    dat1[a1]=da21;
                                                    a1++;
                                                    }
                                              int b=0;
                                              while(m3<=k)
                                                  {
                                            	  String day1=Integer.toString(m3);
                            	                  String inputDateStr1 = String.format("%s/%s/%s", day1, month, year);
                                                  java.util.Date inputDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr1);
                                                  Calendar calendar1 = Calendar.getInstance();
                                                  calendar1.setTime(inputDate1);
                                                  String dayOfWeek1 = calendar1.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                                                  s2=dayOfWeek1.substring(0,3);
                                                  //System.out.println(" s2 value :"+s2);
                                                  //System.out.println(" D2 value :"+d2);
                                                  if(d2.contains(s2))
                                                  {
                                     	         //System.out.println("dat.........."+dat1[b]);
                                     	         if(dat1[b]!=null)
                                     	                {
                                     	                if(Integer.parseInt(dat1[b])==(m3))
                                     	                          {System.out.println("empid"+p);
                                                    	                            String datu1=null;
                                                    	                            if(m3<10)
                                                    	                              {
                                                    	                              datu1="0"+m3+"/"+resDate.substring(2,9);
                                                    	                              }
                                                    	                            else
                                                    	                               {
                                                    	                                datu1=m3+"/"+resDate.substring(2,9);	
                                                    	                               }
                                                    	                            System.out.println("date :"+datu1);
                                                    	                            stab = cn1.createStatement();
                                                                                    rsab = stab.executeQuery("Select yes,no,res from systembackupstatus where empno='"+p+"' and schdate='"+datu1+"' and file='EMAIL' "); 
                                                                                    if(rsab.next())
                                                                                            {
                                                                                      	    reso=rsab.getString(3);
                                                                                      	    ye1=rsab.getString(1);
                                                                                    	    //System.out.println("True....."+reso);
                                                                                          }
                                                                                  if(ye1!=null){%>
                                          	                                          <td align="center" width=2% ><font size=2 color="yellow" title="Completed"><b>Y</b></font></td>
                                          	                                   <%}else{%>
                                          	                                	     <td align="center" width=2% title=<%=reso%>><font size=2 color="red"><a href="#" onClick="alert('<%=reso%>');" style="color:red">N</a></font></td>
                                          	                                	   <%}b++;
                                          	                                   }
                                     	                        else
                             	                                   {%>
                             	                                    <td align="center" width=2% ><font size=2 color="Maroon" title="Status Not Updated"><b>N</b></font></td>  
                                                                  <%}
                                     	                }else{%>
                                                                <td align="center" width=2% ><font size=2 color="Maroon" title="Status Not Updated"><b>N</b></font></td>  
                                                    	          <%}
                                                      
                                      	         }else{%>
                                                             <td align="center" width=2% ><font size=2 color="red"></font></td>
                                                        <%} 
                      	            m3++;
                      	            }%>
                                           </tr> 
                                        <%}%>
                                           
                                           
                                            
                                          <%if(o1==1){%>
                                           <tr>
                                             <% int m2=1;
                                              String s1=null;
                                              while(m2<=k){
                                          	  String day1=Integer.toString(m2);
                                          	  String inputDateStr1 = String.format("%s/%s/%s", day1, month, year);
                                              java.util.Date inputDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr1);
                                              Calendar calendar1 = Calendar.getInstance();
                                              calendar1.setTime(inputDate1);
                                              String dayOfWeek1 = calendar1.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                                              s1=dayOfWeek1.substring(0,3);
                                              //System.out.println(" D3 value :"+d3);
                                              if(d3.contains(s1))
                                                 {%>
                                            	 <td align="center" width=2% ><font size=2 color="red"><b>N</b></font></td>
                                                 <%}else{%>
                                                  <td align="center" width=2% ><font size=2 color="red"></font></td>
                                                <%}
                                             m2++;}%></tr>
                                             <%}%>
                                             
                                         </table>
                                         </td>
                                    
                                         <% st11a = cn1.createStatement();
                                            rs11a = st11a.executeQuery("Select year,month,branch from systembackupverification where year='"+year+"' and month='"+month+"' and branch='"+branch+"' "); 
                                            if(!rs11a.next())
                                                    {
                                              	     //yr1=rs11a.getString(1);
                                              	     //System.out.println("True.....");
                                                %>
                                          <td>
                                          <table border=1 style="border-collapse: collapse;">
                                     	    <%if(f1==1){co++;%> 
                                                 <tr>
                                                      <td><input type="radio" name="namech<%=co%>" id="<%=co%>" value="yes" onclick='showtext(id);'/><font size=2 color="blue" >Y</font></td>
                                                      <td><input type="radio" name="namech<%=co%>" id="n<%=co%>" value="no" onclick='showtext(id);'><font size=2 color="blue">N</font></td>
                                                       <td><input type="radio" name="namech<%=co%>" id="c<%=co%>" value="close" onclick='showtext(id);'><font size=2 color="blue">C</font></td>
                                                      <td><input type="text"  name="text<%=co%>" id='idtext<%=co%>'  style="visibility:hidden"></td>
                                                </tr>
                                                <%}%>
                                                <%if(e1==1){co++;%>
                                                <tr>
                                                     <td><input type="radio" name="namech<%=co%>" id="<%=co%>" value="yes" onclick='showtext1(id);' ><font size=2 color="Maroon" >Y</font></td>
                                                     <td><input type="radio" name="namech<%=co%>" id="n<%=co%>" value="no" onclick='showtext1(id);'><font size=2 color="Maroon">N</font></td>
                                                     <td><input type="radio" name="namech<%=co%>" id="c<%=co%>" value="close" onclick='showtext1(id);'><font size=2 color="Maroon">C</font></td>
                                                     <td><input type="text" name="text<%=co%>" id="idtext<%=co%>"  style="visibility:hidden"></td>
                                                </tr>
                                                <%}%>
                                                <%if(o1==1){%>
                                                <tr>
                                                    <!-- <td align="center" width=5% ><input type="checkbox" name="veryfy2" value="yes"></td> -->
                                                 </tr>
                                                <%}%>
                                            </table>
                                         </td>
                                          <%} else{%>
                                          
                                          
                                         <td>
                                          <table border=1 style="border-collapse: collapse;">
                                     	    <%if(f1==1){
                                     	    	st11aa = cn1.createStatement();
                                                rs11aa = st11aa.executeQuery("Select year,month,branch,remarks from systembackupverification where year='"+year+"' and month='"+month+"' and branch='"+branch+"' and empid='"+p+"' and fileemail='FILE' "); 
                                                if(rs11aa.next())
                                                        {
                                                	    rem2=rs11aa.getString(4);
                                                        }
                                      	    %> 
                                                 <tr>
                                                       <td><input type="text" name="text1" id="idtext1"  value="<%=rem2%>" readonly></td>
                                                </tr>
                                                <%}%>
                                                <%if(e1==1){
                                                	st11aaa = cn1.createStatement();
                                                    rs11aaa= st11aaa.executeQuery("Select year,month,branch,remarks from systembackupverification where year='"+year+"' and month='"+month+"' and branch='"+branch+"' and empid='"+p+"' and fileemail='EMAIL'"); 
                                                    if(rs11aaa.next())
                                                            {
                                                      	    rem1=rs11aaa.getString(4);
                                                            }
                                                %>
                                                <tr>
                                                       <td><input type="text" name="text1" id="idtext1"  value="<%=rem1%>" readonly></td>
                                                </tr>
                                                <%}%>
                                                <%if(o1==1){%>
                                                <tr>
                                                    <!-- <td align="center" width=5% ><input type="checkbox" name="veryfy2" value="yes"></td> -->
                                                 </tr>
                                                <%}%>
                                            </table>
                                         </td>
                                           <%} %>
                                   </tr>                                  
	                          <% f1=0;e1=0;o1=0;d1="";d2="";d3="";t1="";t2="";t3=""; } %>
	                           <input type="hidden" name="coun" id="idcoun" value="<%=co%>"> 
	                           <input type="hidden" name="num" value="<%=i%>">   
	                         
	                            <% st11aa = cn1.createStatement();
                                rs11aa = st11aa.executeQuery("Select year,month,branch from systembackupverification where year='"+year+"' and month='"+month+"' and branch='"+branch+"' "); 
                                if(!rs11aa.next())
                                      {
                                      //yr1=rs11a.getString(1);
                                      //System.out.println("True.....");
                                      %>
                                 <tr>
	                             <td  colspan=7>Checked and Verified By  <br/>
	                             <select name="desg2" id="iddesg" onchange="showEmp(this.value)" class="a">      
                                         <option value="" class="a">Select</option>
                                         <% 
                                         st3 = cn1.createStatement();
                                         //System.out.println("Here...................");
                                         rs3 = st3.executeQuery("Select DISTINCT DESIGNATION from desg ORDER BY DESIGNATION ASC ");
                                         while(rs3.next()){%>     
                                                <option class="a" value="<%=rs3.getString("DESIGNATION")%>"><%=rs3.getString("DESIGNATION")%></option> 
                                                   <% }     %>   
                                  </select>     
                                  <br>
                                         <div id='emp' class="a">      
                                               <select name="emp" id="idemp">   
                                                   <option value='-1'></option>  
                                               </select>   
                                         </div>                
                                 </td>
                                 </tr>
                                
                          <tr>
                                 <td align="center" colspan=7> <input type="submit"  value="SUBMIT" name=button1 onclick="return( validate());" />
     	                         <input type="button" value="CLEAR" onclick="clear1();"/>
     	                         </td>
	                     </tr>
	                      <%}else{%>
	                      <tr>
                                 <td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
	                     </tr>
	                      <%} %>
	                   
 	             </table>
 	             
                 </center>
	</form>
	
	<div id="resultFromAjax2" style="display:none;">
        
       </div>
	
	<%}
      catch (Exception e) { System.out.println(e); }
      finally{
	         DbUtil.closeDBResources(rs1,st1,cn1);
	         DbUtil.closeDBResources(rs2,st2,cn1);
	         DbUtil.closeDBResources(rs3,st3,cn1);
             }
	%>
    <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
           <tr> 
              <td width="1000" align="left"> 
                      <a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
              </td> 
              <td width="115" align="right"> 
                     <a href="backupverification.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
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
