<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript" language="javascript">
function OtherAdmin()
{
	alert("OTHER ADMIN");
document.form.action="AccessCardAdminBack.jsp";
document.form.method="post";
document.form.submit();
}
function ITManager()
{
	alert("IT MANAGER");
document.form.action="AccessCardBackITmanagerHO.jsp";
document.form.method="post";
document.form.submit();
}
</script>
<body>
 <form  name="form" method="post"  action=""> 
<table>
<tr>
<td></td>
     <td> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return OtherAdmin();" />
      <td> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="IT SUBMIT" name=button1 onclick="return ITManager();" />
</tr>
</table>
</form>
</body>
</html>