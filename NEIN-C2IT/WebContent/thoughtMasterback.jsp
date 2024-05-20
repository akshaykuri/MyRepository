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
String feedback=request.getParameter("feedback");

String msg=null;

String whoseThat = request.getParameter("whoseThat");

System.out.println("whose that : "+whoseThat);
//if(whoseThat!=null && whoseThat=="5")
	
	
 psmt2 = cn.prepareStatement("SELECT ndate FROM notemaster WHERE ndate=?");
psmt2.setString(1,f_date);
ResultSet rss = psmt2.executeQuery();
System.out.println("RSS :"+rss);

if(!rss.next())
        { 
 	
	psmt = cn.prepareStatement("insert into notemaster(name,note,ndate,status) values(?,?,?,?)");
	psmt.setString(1,name);
	psmt.setString(2,feedback);
	psmt.setString(3,f_date);
	psmt.setString(4,"done");

	int i = psmt.executeUpdate();
	msg = "Thank__You \\n Kindly__See__Home__Page";

}

else if(whoseThat!=null && (whoseThat.equals("SuperAdmin")))
        {
	psmt = cn.prepareStatement("insert into notemaster(name,note,ndate,status) values(?,?,?,?)");
	psmt.setString(1,name);
	psmt.setString(2,feedback);
	psmt.setString(3,f_date);
	psmt.setString(4,"done");

	int i = psmt.executeUpdate();
	msg = "Thank__You \\n Kindly__See__Home__Page";


        }
else
{
	msg = "Can__not__overwrite";
	System.out.println("1 THIS IS TRUE ");
}



response.sendRedirect("thoughtMaster.jsp?msg=" +msg);
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


