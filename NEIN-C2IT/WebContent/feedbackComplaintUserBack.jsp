<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import = "java.util.Date" %> 
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>FEEDBACK</title>

<script type="text/javascript">
function btnClick() { 
         close(); 
}
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">


<br>
<br>




<center><font size=4 ><b>
<%  
                String f_date;
         	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         	    Date date = new Date();
            	f_date = dateFormat.format(date);
                %>

<%

Connection cn = null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null; 
PreparedStatement psmt=null,psmt2=null;
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();


String name=request.getParameter("name");
String user_mail_id = request.getParameter("user_mail_id");
String branch = request.getParameter("branch");

String substr = branch.substring(branch.length() - 2);
System.out.println("substr :"+substr);


String aboutWhat = request.getParameter("aboutWhat");
String systemAdmin[] = request.getParameterValues("systemAdmin");
String softwareEngr[] = request.getParameterValues("softwareEngr");
String part1=null,part2=null;
String partSoft1=null,partSoft2=null;
System.out.println("systemAdmin : "+systemAdmin);
System.out.println("systemAdmin array : "+systemAdmin[0]);
System.out.println("softwareEngr : "+softwareEngr);
System.out.println("softwareEngr array : "+softwareEngr[0]);
if((!systemAdmin[0].equals("Select"))&&(softwareEngr[0].equals("Select")))
{
for(int k=0;k<systemAdmin.length;k++)
	{
		String[] parts = systemAdmin[k].split("--");
 		part1=parts[0];
 		part2=parts[1];
		System.out.println("System Admin part 1  "+part1);
		System.out.println("System Admin part2 "+part2);
	}
}
if((!softwareEngr[0].equals("Select"))&&(systemAdmin[0].equals("Select")))
{
for(int j=0;j<softwareEngr.length;j++)
	{
		String[] partsSoft = softwareEngr[j].split("--");
		part1=partsSoft[0];
		part2=partsSoft[1];
		System.out.println("softwareEngr  part 1  "+part1);
		System.out.println("softwareEngr  part2 "+part2);
	}
}
	

System.out.println("Anbout what "+aboutWhat);


String feedback=request.getParameter("feedback");

String msg=null;

psmt2 = cn.prepareStatement("SELECT mailid FROM handling_master WHERE assignedLocation LIKE ? AND Locpost=?");
psmt2.setString(1,branch + "%");
psmt2.setString(2,"GENERAL MANAGER");
ResultSet rss = psmt2.executeQuery();
System.out.println("RSS :"+rss);
String gm_mail_id =null;
while(rss.next())
        {
 		    gm_mail_id = rss.getString("mailid");
    		String a = rss.getString(1);
    		//System.out.println("MAIL ID   :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+a);
			//System.out.println("MAIL ID OF NEXT VERSION :"+gm_mail_id);
		}

if(gm_mail_id != null)
{
	    System.out.println("If IS TRUE ");
	    psmt = cn.prepareStatement("insert into feedback(name,feedback,date,user_mail_id,gm_mail_id,Branch,About,systemAdmin,SysAdminMail) values(?,?,?,?,?,?,?,?,?)");
		psmt.setString(1,name);
		psmt.setString(2,feedback);
		psmt.setString(3,f_date);
		psmt.setString(4,user_mail_id);
		psmt.setString(5,gm_mail_id);
		psmt.setString(6,branch);
		psmt.setString(7,aboutWhat);
		psmt.setString(8,part1);
		psmt.setString(9,part2);
		int i = psmt.executeUpdate();
		
		System.out.println("If IS TRUE saved in db");
		
		msg = "Thank__You__For__Your__Feedback\\n Mail__Is__Send__To__Respective__General__Manager ";
		//out.println("................................\n '"+b_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");
	 if((aboutWhat.equals("System Admin")) && ((!systemAdmin[0].equals("Select"))&&(softwareEngr[0].equals("Select"))))
 		{
		    System.out.println("Runs when Users Selected system Admin sending Mail ");
		    postMail.postMail(user_mail_id,name,"pass1234",part2," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
			//postMail.postMail(user_mail_id,name,"pass1234","farooq.s@nittsu.co.in"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");              
			postMail.postMail(user_mail_id,name,"pass1234","prasanna.v@nittsu.co.in"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
			postMail.postMail(user_mail_id,name,"pass1234",gm_mail_id," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
		//	postMail.postMail(user_mail_id,"pass1234",part2," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
			//postMail.postMail(user_mail_id,name,"pass1234","farooqsha27@gmail.com"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
 		}
	 else  if((aboutWhat.equals("Software")) && ((!softwareEngr[0].equals("Select"))&&(systemAdmin[0].equals("Select"))))
		{
		 	System.out.println("Runs when Users Selected Software Engr Seending Mail ");
		 	postMail.postMail(user_mail_id,name,"pass1234",part2," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "Engineer</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
			//postMail.postMail(user_mail_id,name,"pass1234","farooq.s@nittsu.co.in"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "Engineer</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");              
			postMail.postMail(user_mail_id,name,"pass1234","prasanna.v@nittsu.co.in"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "Engineer</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
			postMail.postMail(user_mail_id,name,"pass1234",gm_mail_id," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "Engineer</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
		//	postMail.postMail(user_mail_id,"pass1234",part2," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+part1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
			//postMail.postMail(user_mail_id,name,"pass1234","farooqsha27@gmail.com"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +aboutWhat+ "</font>:"+partSoft1+" <br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
		}
 		else
		{
 			System.out.println("Runs when other option is selected ");
	   		 //postMail.postMail(user_mail_id,name,"pass1234","farooq.s@nittsu.co.in"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>:<font color=red> " +aboutWhat+ "</font><br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");              
			 postMail.postMail(user_mail_id,name,"pass1234","prasanna.v@nittsu.co.in"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>:<font color=red> " +aboutWhat+ "</font><br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
	 	     postMail.postMail(user_mail_id,name,"pass1234",gm_mail_id," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>:<font color=red> " +aboutWhat+ "</font><br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
		   //  postMail.postMail(user_mail_id,name,"pass1234","farooqsha27@gmail.com"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>:<font color=red> " +aboutWhat+ "</font><br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"); 
 		}
}
else
{
	msg = "GENERAL__MANAGER__NOT__EXIST__FOR__THIS__LOCATION";
	System.out.println("Else IS TRUE ");
}



response.sendRedirect("feedbackComplaintUser.jsp?msg=" +msg);
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,cn);
			DbUtil.closeDBResources(rs2,st2,null);
			DbUtil.closeDBResources(null,psmt,null);
			DbUtil.closeDBResources(null,psmt2,null);
			}

%>

<br>
<br />
<br />


 <button onclick="window.location.href='login.jsp?msg=1'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


