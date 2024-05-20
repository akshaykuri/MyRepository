<html>
<head>
<title>Email Setup</title>

<style type="text/css">
</style>

<script type="text/javascript">
function EmailSetup(selected) {
document.getElementById('ADname').value = selected.options[selected.selectedIndex].value;
document.getElementById('idNpost').value = selected.options[selected.selectedIndex].text;
}
</script>
</head>

<body><form action="checkback.jsp" method="post">
<select name="Npost" id="SBoxEmail" onchange="EmailSetup(this)">
 <option value="">-- Select --</option>
 <option value="John@somewhere.com">John</option>
 <option value="Jacob@somewhere.com">Jacob</option>
 <option value="Jingleheimer@somewhere.com">Jingleheimer</option>
 <option value="Smith@somewhere.com">Smith</option>
 <option value="Junior@somewhere.com">Ditto</option>
</select>

<input type="text" name="DESG_NO" id="ADname" value="" size="30">
<input type="text" name="DESG_NOO" id="idNpost" value="" size="30">
<--- John  -->
i wanna save in one input:John@somewhere.com
John  in other
<input value="SUBMIT" type="submit" />
</form>
</body>