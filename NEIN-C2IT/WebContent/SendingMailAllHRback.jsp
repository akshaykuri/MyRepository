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
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt33=null;
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();


String name=request.getParameter("name");
String user_mail_id = request.getParameter("user_mail_id");

String feedback=request.getParameter("feedback");

String allHR ="HR";


String msg=null;
String gm_mail_id =null;
psmt2 = cn.prepareStatement("select * from formuser_master WHERE subDept LIKE ? ORDER BY Nname ASC");
//psmt2.setString(1,branch + "%");
psmt2.setString(1,"%" + allHR + "%");
ResultSet rss = psmt2.executeQuery();
System.out.println("RSS :"+rss);
msg = "Mail__Sent__To__All__HR";
while(rss.next())
        {
 		    gm_mail_id = rss.getString("Nmail");
    		System.out.println("MAIL ID OF NEXT VERSION 1 :"+gm_mail_id);
		
		     postMail.postMail(user_mail_id,name,"pass1234",gm_mail_id," C2IT UPDATES :  ", "<br><br> <font> For your Kind info go through the following :</font> <br><font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> All Software-  http://neinsoft.nittsu.co.in:8185/NEIN  <br> C2IT Software - http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
		    // postMail.postMail(user_mail_id,name,"pass1234","farooqsha27@gmail.com"," C2IT FEEDBACK :  " +name, "ON :"+f_date+  " "+  " FeedBack/Complaint: <u>Regarding</u>:<font color=red> " +aboutWhat+ "</font><br><br> <font color=blue> " +feedback+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"); 
 		
        }
psmt = cn.prepareStatement("insert into sendingMail_allHRadmin(sentby_name,sentby_mail_id,remarks) values(?,?,?)");
psmt.setString(1,name);
psmt.setString(2,user_mail_id);
psmt.setString(3,feedback);
int i = psmt.executeUpdate();

response.sendRedirect("SendingAllHRMail.jsp?msg=" +msg);
%>
<%
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,cn);
			DbUtil.closeDBResources(rs2,st2,null);
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


