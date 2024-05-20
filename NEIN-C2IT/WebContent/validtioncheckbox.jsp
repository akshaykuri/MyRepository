<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checkbox()
{
var allchecked=0;
if(document.getElementById('cake').checked)allchecked=1;
if(document.getElementById('pie').checked)allchecked=1;
if(document.getElementById('ice_cream').checked)allchecked=1;
if(allchecked==0)alert('Very well. I\'ll be right back with the check!');
else alert('We\'ll bring that right out!');
}
</script>
</head>
<body>
<form onsubmit="checkbox()" action = "#" method="post" >
<fieldset><legend>Select as Many Desserts as You Like!</legend>
<p>Choose Desserts:</p>
Cake: <input type="checkbox" name="cake" value="1" id="cake"><br />
Pie: <input type="checkbox" name="pie" value="yes" id="pie"><br />
Ice-cream: <input type="checkbox" name="ice_cream" value="true" id="ice_cream"><br />
</fieldset>
<input type="submit" value="Don't be Modest!">
</form>
</body>
</html>