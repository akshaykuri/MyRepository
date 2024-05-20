<%@page import="CON2.DbUtil"%>
<%@page import="CON2.ImsDailyReport"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 

    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<script type="text/javascript">

 function link() {
    document.form.action="jasperGenerate";
    document.form.method="post";
    document.form.submit();
    }		 
	
function btnClick() { 
         close(); 
}
</script>
<%! 
                  ImsDailyReport mailMessage = new ImsDailyReport();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st11=null,st2=null;
	              ResultSet rs = null;
	              
	              String msg = null;
	              String output =null;
	              Connection2 dbConn = new Connection2();
	              StringBuffer strBuff = null;
	              
	              String message = null;
	            //  complain_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks
	              String []complain_id=null;
	              String []cm_name=null;
	              String []cm_location=null;
	              String []cm_prob=null;
	              String []cm_type=null;
	              String []cm_reported=null;
	              String []cm_completed=null;
	              String []cm_time_diff=null;
	              String []cm_status=null;
	              String []admin_remarks=null;
	              
	              %>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">
<form name=form>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>IMS DETAILS</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET MESSAGE PAGE</font></strong></td></tr>
</table>


<center><font size=4 ><b>

<br>
<br />
<br />

<%
try{
conn = dbConn.getConnection2();
st = conn.createStatement();
st11 = conn.createStatement();
cn2 = con.getConnection2();
st2 = cn2.createStatement();
////Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend
//complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks





String Send_date = request.getParameter("Send_date");
String admin_name = request.getParameter("admin_name");
String time_in = request.getParameter("time_in");
String time_out = request.getParameter("time_out");
String emp = request.getParameter("emp");
String desg = request.getParameter("desg");
String mail = request.getParameter("mail");
System.out.println("maill.................................................llll    "+mail);
String admin_city = request.getParameter("admin_city");
String ims_id = request.getParameter("ims_id");
String idextend = request.getParameter("idextend");
String sysAdminMail = request.getParameter("sysAdminMail");

System.out.println("sysAdminMailsysAdminMailsysAdminMail "+sysAdminMail);

Date result=null;// = formater.parse(po_date);
//Date formatDate = null;

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;

try{
	result = new Date(sdf.parse(Send_date).getTime());
	
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
System.out.println("AFTER converting po date is"+result);
rs = st2.executeQuery("select ims_id from ims_master where ims_id='"+ims_id+"'");
 if(rs.next()){
	
	          out.println("......'"+ims_id+"' IS ALREADY EXIST.......");
	          
	         // msg = "...'"+ims_id+"'__IS__ALREADY EXIST.......";
	          
	         // msg = output.replaceAll("_","  ").trim();
             }

else{  
	i=st.executeUpdate("insert into ims_master(Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend) values('"+result+"','"+admin_name+"','"+time_in+"','"+admin_city+"','"+time_out+"','"+ims_id+"','"+desg+"','"+emp+"','"+mail+"','"+idextend+"')");
  //  msg = "MAIL__SENT__SUCCESSFULLY";
    out.println("MAIL SENT SUCCESSFULLY TO '"+emp+"'");
	}

  // conn.commit();
%>
<% 
   
if(i>0){
	//complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks 
   if(request.getParameter("complain_id") != null||request.getParameter("cm_location") != null){
		
		String []item;
	    	String complain_id[] = request.getParameterValues("complain_id");
		  	String cm_name[] = request.getParameterValues("cm_name");
			String cm_location[] = request.getParameterValues("cm_location");
			String cm_prob[] = request.getParameterValues("cm_prob");
			String cm_type[] = request.getParameterValues("cm_type");
			String cm_reported[] = request.getParameterValues("cm_reported");
			String cm_completed[]= request.getParameterValues("cm_completed");
			String cm_time_diff[]= request.getParameterValues("cm_time_diff");
			String cm_status[]= request.getParameterValues("cm_status");
			String admin_remarks[]= request.getParameterValues("admin_remarks");
	     
		  try{ System.out.println("inside for try");
				conn = dbConn.getConnection2();
				st1 = conn.createStatement();
				
				for(int k=0;k<complain_id.length;k++)
				{
					System.out.println("inside for loop");
					st1.executeUpdate("insert into ims_item(complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks,Send_date,admin_city,cm_type) values('"+complain_id[k]+"','"+ims_id+"','"+cm_name[k]+"','"+cm_location[k]+"','"+cm_prob[k]+"','"+cm_reported[k]+"','"+cm_completed[k]+"','"+cm_time_diff[k]+"','"+cm_status[k]+"','"+admin_remarks[k]+"','"+result+"','"+admin_city+"','"+cm_type[k]+"')");
					
					System.out.println("outside for loop");
				 }
			}
			catch(Exception e){
				
				
				     e.printStackTrace();
			}
	} 
   
   //spostMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office) <br><br><br><br>"+message);
   message = mailMessage.getMailMessagePayment(ims_id.trim());
   postMail.postMail(mail,admin_name,"pass1234",mail," IMS DAILY WORK LOG : For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +ims_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);              


   message = null;
   
  // response.sendRedirect("ims_HO_Back.jsp?msg=" +msg);
}%>
<%


		    //System.out.println("we are getting this msggetting ? " +message);

		    // not working  response.sendRedirect("ims_HO_Back.jsp?msg=" +msg);
%>
  


	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,conn);

	DbUtil.closeDBResources(null,st1,cn2);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st11,null);
	
  }
	%>




</b>
</font>
</center>


<br />
<br />
<br />

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="ims_HO.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<center>
<%-- <table>
<tr>

<td><input type="button" value="pdf" onclick="link();"/></td>

<td><input type="button" value="OK" onclick="btnClick();"/></td>
</tr>

</table> --%>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"><marquee> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </marquee> </font></strong></td>
    
  </tr>
</table>
</center>
</form>

</div>




</body>
</html>
