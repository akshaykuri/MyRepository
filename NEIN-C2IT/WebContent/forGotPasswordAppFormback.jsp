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







String msg=null;
String UserName=null,UserUid=null,UserPwd=null,mail_id =null;
psmt2 = cn.prepareStatement("SELECT Nname,idd,Npwd,Nmail FROM formuser_master WHERE Nmail=?");
psmt2.setString(1,name);
ResultSet rss = psmt2.executeQuery();
System.out.println("RSS :"+rss);

if(rss.next())
        {
 		    mail_id = rss.getString("Nmail");
 		    UserUid = rss.getString("idd");
 		   UserPwd = rss.getString("Npwd");
 		  UserName = rss.getString("Nname");
 		   msg = "Mail__Sent__To__User";  
 		   System.out.println("Sending Mail for user Id and Pwd for : "+UserName);
 		   
 		   
 		  if(mail_id != null)
 		 {
 		 		postMail.postMail("neinsoft@nittsu.co.in","C2IT USER ID ","pass1234",mail_id," C2IT USER ID and PWD :  " +UserName, "USER ID AND PASSWORD FOR C2IT APPLICATION "+  "  <br><br> User Id :<font color=blue> " +UserUid+ "</font><br>  User Password :<font color=blue> " +UserPwd+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");              
 		 }
 		  
 		  
 		 response.sendRedirect("forGotPasswordAppForm.jsp?msg=" +msg);
		}
   


 		
else{
	msg = "Wrong__Entries";  
	response.sendRedirect("forGotPasswordAppForm.jsp?msg=" +msg);
	
    }


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


