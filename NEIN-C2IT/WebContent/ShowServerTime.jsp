<html>
<head>
<title>Binod Java Solution AJAX </title>

<script type="text/javascript">
var request;
function init(){
window.setInterval("getTime()",1000);
}
function getTime(){
var url = "http://localhost:8080/CheckSheet/ShowServerTime/GetServerTime";
if(window.ActiveXObject){
request = new ActiveXObject("Microsoft.XMLHTTP");
}
else if(window.XMLHttpRequest){
request = new XMLHttpRequest();
}
request.onreadystatechange = showTime;
request.open("POST",url,true);
request.send();
}

function showTime(){

if(request.readyState == 4){
var response = request.responseText;
document.getElementById("TimeH1").innerHTML = response;
}

}


</script>

</head>
<body onload="init();">
<h1> Server Time :: </h1> <h1 id="TimeH1"/>

</body>
</html>
