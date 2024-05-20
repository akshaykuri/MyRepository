<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.MailMessage"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "timeDiff" class="CON2.TimeDifferenceForm" />
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
     Connection conn = null, conn1 = null,cn5=null;
	 Statement st= null, st1=null,st2=null,st3=null,st5=null;
	 ResultSet rs5 = null; 
	 String []id;
	 String []mr_asset;
	 String []mr_itemName=null;
	 String []mr_itemQuantity=null;
	 String []mr_abbreviation;
	 String []mr_itemRate;
	 String []mr_itemAmount=null;
	 String []mr_DateByRegd;
	 String []transId=null;
	 String msg = null;
	 Connection2 dbConn = new Connection2();
	 MailMessage mailMessage = new MailMessage();
	 String message = null,message2=null;
	 %>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
	<div id="wrapper">
	<form name=form>
	<center><font size=4 ><b>
<%
		conn = dbConn.getConnection2();
		conn1 = dbConn.getConnection2();
		st = conn.createStatement();
		cn5 = con.getConnection2();
		st5 = cn5.createStatement();
	
		String cm_status=request.getParameter("cm_status");
		
		System.out.println("Cm Status ....... :"+cm_status);
		
		String city_no = request.getParameter("city_no");
		String complain_id=request.getParameter("complain_id");
		String cm_date2=request.getParameter("cm_date2");
		String cm_time=request.getParameter("cm_time");
		String cm_time2=request.getParameter("cm_time2");
		String root_cause=request.getParameter("root_cause");
		String steps_taken=request.getParameter("steps_taken");
		String cm_name = request.getParameter("cm_name");
		String cm_mail = request.getParameter("cm_mail");
		String emp = request.getParameter("emp");
		String mail = request.getParameter("mail");
		String SessionName = request.getParameter("SessionName");
		String Sessiondesg = request.getParameter("Sessiondesg");
		String SessionMail = request.getParameter("SessionMail");
		
		String emp1 = request.getParameter("emp1");
		String mail1 = request.getParameter("mail1");
		
		
		
		System.out.println("cm_name **********************************:"+cm_name);
		System.out.println("cm_mail :"+cm_mail);
		System.out.println("emp :"+emp);
		System.out.println("mail :"+mail);
		
		String admin_remarks=request.getParameter("admin_remarks");
		st2 = conn.createStatement();
		st3 = conn.createStatement();
		String newTr = "pqr"+String.valueOf(Math.random());
		Date result=null;// = formater.parse(mr_date);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try{
			result = new Date(sdf.parse(cm_date2).getTime());
		   }
		   catch (Exception e) {
			e.printStackTrace();
		   }
		String InitaitorMailId = null;
		rs5 = st5.executeQuery("select complain_id,cm_mail from complain_master_item where complain_id='"+complain_id+"'");
		while(rs5.next()){
			InitaitorMailId = rs5.getString("cm_mail");
		}
		PreparedStatement prs1=null,prs2=null;
		
	
	if(cm_status.equals("Resolved"))
		{
		prs1 = conn.prepareStatement("update complain_master_item set cm_time2=CURRENT_TIMESTAMP(),cm_status=?,cm_date2=?,admin_remarks=?,status=?,e_Location=?,emp=?,mail=?,root_cause=?,steps_taken=? where complain_id=? and emp=?");
		prs1.setString(1,cm_status);
		prs1.setDate(2,result);
		prs1.setString(3,admin_remarks);
		prs1.setString(4,"append");
		prs1.setString(5,city_no);
		prs1.setString(6,SessionName);
		prs1.setString(7,SessionMail);
		prs1.setString(8,root_cause);
		prs1.setString(9,steps_taken);
		prs1.setString(10,complain_id);
		prs1.setString(11,SessionName);
		int i=prs1.executeUpdate();	
		
		prs2 = conn1.prepareStatement("delete from complain_master_item where complain_id=? and emp!='"+SessionName+"'");
		prs2.setString(1,complain_id);
		int j=prs2.executeUpdate();	
		
		String mm = mail.trim();
		message2 = mailMessage.getMailMessage(complain_id.trim());
		postMail.postMail(SessionMail,SessionName,"pass1234",InitaitorMailId,"NEIN-C2IT Complaint No. :  " +complain_id+ " ",  "<font color=red> STATUS OF COMPLAINT :</font> <b>" +cm_status+  " "+  "</b><br>For the Complaint ID:<font color=blue>" +complain_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message2);
		message2=null;
		msg = "DETAIL__ \b SAVED__ \b\b SUCCESSFULLY";
		response.sendRedirect("PopUpPage.jsp?form_no=" +complain_id);
		}
	else
	    {
		prs2 = conn1.prepareStatement("delete from complain_master_item where complain_id=? and emp!='"+SessionName+"'");
		prs2.setString(1,complain_id);
		int j=prs2.executeUpdate();	
		
		prs1 = conn.prepareStatement("update complain_master_item set emp=?,mail=?,cm_location=? where complain_id=?");
		prs1.setString(1,emp1);
		prs1.setString(2,mail1);
		prs1.setString(3,"Head Office");
  	    prs1.setString(4,complain_id);
        int i=prs1.executeUpdate();	
		
		
		
		String mm = mail.trim();
		message2 = mailMessage.getMailMessage(complain_id.trim());
		
		postMail.postMail(SessionMail,SessionName,"pass1234",InitaitorMailId,"NEIN-C2IT Complaint No. :  " +complain_id+ " ",  "<font color=red> STATUS OF COMPLAINT :</font> <b>" +cm_status+  " "+  "</b><br>For the Complaint ID:<font color=blue>" +complain_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message2);
		postMail.postMail(SessionMail,SessionName,"pass1234",mail1,"NEIN-C2IT Complaint No. :  " +complain_id+ " ",  "<font color=red> STATUS OF COMPLAINT :</font> <b>" +cm_status+  " "+  "</b><br>For the Complaint ID:<font color=blue>" +complain_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message2);
        postMail.postMail(SessionMail,SessionName,"pass1234","chintu.kumar@nipponexpress.com","NEIN-C2IT Complaint No. :  " +complain_id+ " ",  "<font color=red> STATUS OF COMPLAINT :</font> <b>" +cm_status+  " "+  "</b><br>For the Complaint ID:<font color=blue>" +complain_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message2);
		message2=null;
		msg = "COMPLAINT__ \b ESCALATED \b TO \b HEAD \b OFFICE \b SUCCESSFULLY";
		response.sendRedirect("PopUpPage.jsp?form_no=" +complain_id);
	    }
		
		
		
		
		
		
		
		
		conn.close();
		st.close();
        %>
</b>
</font>
</center>
<center>
<table>
<tr>
<td><input type="button" value="OK" onclick="window.location.href='complainPageStatusBranch.jsp?msg=1'"/></td>
</tr>
</table>
</center>
</form>
</div>
</body>
</html>
