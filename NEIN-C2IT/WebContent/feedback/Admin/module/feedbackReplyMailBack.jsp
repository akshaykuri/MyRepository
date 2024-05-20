<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageNewins"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>

<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 
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

Connection cn = null,cn2=null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null; 
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt33=null;
try{
cn = con.getConnection2();
cn2 = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();

String req = request.getParameter("id");
System.out.println("Req iD : "+req);
String ReplyRemarks  = request.getParameter("ReplyRemarks");
String SenderName = request.getParameter("SenderName");
String SenderMail = request.getParameter("SenderMail");
String RepliedDate = request.getParameter("RepliedDate");
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
try{
	form_date = new Date(sdf.parse(RepliedDate).getTime());
}
catch (Exception e) {
	e.printStackTrace();
}
System.out.println("   form_date   :"+form_date);



String msg=null;

psmt2 = cn.prepareStatement("SELECT * FROM feedback WHERE id=?");
psmt2.setString(1,req);
ResultSet rss = psmt2.executeQuery();
//id,name,feedback,date,user_mail_id,gm_mail_id,Branch,About,systemAdmin,systemAdminMail
String name=null,feedback=null,date2=null,user_mail_id=null,gm_mail_id=null,Branch=null,About=null,systemAdmin=null,systemAdminMail=null;
while(rss.next())
        {
 		  About  = rss.getString("About");
 		  name = rss.getString("name");
 		 user_mail_id = rss.getString("user_mail_id");
 		 gm_mail_id = rss.getString("gm_mail_id");
 		 systemAdmin = rss.getString("systemAdmin");
 		 systemAdminMail = rss.getString("SysAdminMail");
 		feedback = rss.getString("feedback");
		}
System.out.println("   About   :"+About);
System.out.println("   name   :"+name);
System.out.println("   user_mail_id   :"+user_mail_id);
System.out.println("   gm_mail_id   :"+gm_mail_id);
System.out.println("   systemAdmin   :"+systemAdmin);
System.out.println("   systemAdminMail   :"+systemAdminMail);


if(gm_mail_id != null || user_mail_id !=null)
{
	//psmt3 = cn2.prepareStatement("UPDATE feedback SET ReplyRemarks=?,SenderMail=?,RepliedDate=? WHERE id=?");
	psmt3 = cn2.prepareStatement("UPDATE feedback SET ReplyRemarks=?,RepliedBy=?,RepliedDate=? WHERE id=?");
	//psmt3 = cn2.prepareStatement("INSERT INTO feedback ReplyRemarks=?,RepliedBy=?,RepliedDate=? WHERE id=?");
	psmt3.setString(1,ReplyRemarks);
	psmt3.setString(2,SenderMail);
	psmt3.setDate(3,form_date);
	psmt3.setString(4,req);
	int i = psmt3.executeUpdate();
	
	msg = "MAIL__SENT__TO__RESPECTIVE__MAIL__ID";
	 if((About.equals("System Admin")))
		 //if((About.equals("System Admin")) && (!systemAdmin.equals("Select")))
 		{
			 System.out.println("FIRST IF TRUE ");
		    postMail.postMail(user_mail_id,name,"pass1234",user_mail_id," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font>:"+systemAdmin+" <br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		    postMail.postMail(user_mail_id,name,"pass1234",gm_mail_id," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font>:"+systemAdmin+" <br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		    postMail.postMail(user_mail_id,name,"pass1234",systemAdminMail," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font>:"+systemAdmin+" <br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		    postMail.postMail(user_mail_id,name,"pass1234","prasanna.v@nittsu.co.in"," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font>:"+systemAdmin+" <br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		    postMail.postMail(user_mail_id,name,"pass1234","farooqsha27@gmail.com"," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font>:"+systemAdmin+" <br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		}
 		else
		{ System.out.println("FIRST IF false ");
		postMail.postMail(user_mail_id,name,"pass1234",user_mail_id," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font><br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		postMail.postMail(user_mail_id,name,"pass1234",gm_mail_id," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font><br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		postMail.postMail(user_mail_id,name,"pass1234",systemAdminMail," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font><br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		postMail.postMail(user_mail_id,name,"pass1234","prasanna.v@nittsu.co.in"," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font><br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		postMail.postMail(user_mail_id,name,"pass1234","farooqsha27@gmail.com"," C2IT FEEDBACK REPLY BY:  " +SenderName, "ON :"+form_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>.<font color=red> " +About+ "</font><br><br>"+name+" REMARKS : <font color=blue> " +feedback+ "</font> <br><br>"+SenderName+" REMARKS :<font color=red> " +ReplyRemarks+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		
	    }
}
else
{
	msg = "GENERAL__MANAGER__NOT__EXIST__FOR__THIS__LOCATION";
	System.out.println("1 THIS IS TRUE ");
}



		//response.sendRedirect("feedbackresults.jsp?msg=" +msg);
response.sendRedirect("../editDelet/FeedbackBranchDayToDayWise.jsp?msg=" +msg);
		
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	DbUtil.closeDBResources(null,psmt33,null);
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


