<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




<TABLE BORDER=4 BGCOLOR=CYAN><TR><TD><FORM NAME="clock_form"><INPUT TYPE=TEXT NAME="clock" SIZE=25></FORM><SCRIPT LANGUAGE="JavaScript"><!-- Hide from non JavaScript browsersfunction clockTick(){currentTime = new Date();document.clock_form.clock.value = " "+currentTime;document.clock_form.clock.blur();setTimeout("clockTick()", 1000);}clockTick();// End of clock --></SCRIPT></TD></TR></TABLE>
</body>
</html>