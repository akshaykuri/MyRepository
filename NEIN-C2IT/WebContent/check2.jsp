<html>
<head>
<title>Email Setup</title>

<style type="text/css">
</style>

<script type="text/javascript">
function EmailSetup(value,sel) {
  document.getElementById('ADname').value = value;
  document.getElementById('idNpost').value = sel;
}
</script>
</head>

<body><form action="checkback.jsp" method="post">
<select name="Npost" id="SBoxEmail" onchange="EmailSetup(this.value)">
  <option value="">-- Select --</option>
  <option value="John@somewhere.com" >John</option>
  <option value="Jacob@somewhere.com">Jacob</option>
  <option value="Jingleheimer@somewhere.com">Jingleheimer</option>
  <option value="Smith@somewhere.com">Smith</option>
  <option value="Junior@somewhere.com">Ditto</option>
</select>

<input type="text" name="DESG_NO" id="ADname" value="" size="30">

<input value="SUBMIT" type="submit" />
</form>
</body>

</html>