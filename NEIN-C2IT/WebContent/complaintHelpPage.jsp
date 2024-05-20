<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@ include file="banner.jsp" %>
<head>
<title>show and hide divs</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
#container {
    width:950px;
    height:296px;
    padding:3px;
    border:3px double black;
    <%--background-color:#ec691f; --%>
    background-color:lightgrey;
    margin:auto;
 }
#buttons {
    float:left;
    width:250px;
    margin:0;
    padding:0;
    list-style-type:none;
 }
#buttons li {
    margin:4px;
    color:#333;
 }
#buttons .hs {
    display:block;
    width:100px;
    line-height:22px;
    border:2px inset black;
    color:black;
    text-decoration:none;
    text-align:center;
    <%--background-color:#012D58;--%>
    background-color:lightgrey;
    
 }

</style>

 <script type="text/javascript">
function btnClick() 
{ 
         close(); 
}
</script>

</head>
<body>

<div id="container">

<ul id="buttons">
<li><b>How To Work On Complain Page</b></li>
 <li><a class="hide" href="#">Step1</a></li>
<li>Step2 -After Complaint</li>
 <li><a class="hide" href="#">Step2</a></li>
<li>Step3 -Other Details</li>
 <li><a class="hide" href="#">Step3</a></li>

<li>Close Sub Window</li>
 <%-- %><li><input id="hiderow"type='submit' style="background-color:#012D58;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>--%> 
 <li><input id="hiderow"type='submit' style="background-color:grey;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>
</ul>

<div class="show">
<p>
Complain No. will be created Randomly.
Enter Required Fields,User Name,User Mail ID,User Location,Type of Problem,Report Problem
<p>User Name: Your full name </p>


<p>User Mail ID: your valid mail id (you will get a copy of mail to this mail id).</p>
<p>Report To: Select radio button ,category option will change as per Report-to.</p>
<p>User Location: your location,Admin are assigned location wise.</p>
<p>Type of Problem: Enter problem you are facing</p>
<p>Report Problem: Enter detail of your problem</p>
<p>Priority: Select Priority  </p>
<p><i>Re-select Report to and sent to options , if you are not getting desired mail id.</i></p>
</div>

<div class="show">
<p>Once Complain is Raised</p>
<p>Concern Person will once resolves, you can see onclick on concern IT support hyperLink</p>
<p>ComplainId will show you complete detail of your complain(Resolved/Pending)</p>
<p>User can re-send complaint to same system administrator / reminder by clicking re-send button.A copy of mail will be re directed to IT MANAGER</p>
</div>

<div class="show">
<p>NOTE : </p>
<p>Complain will be shown and raised on same day</p>
<p>Complain No. hyper link will show you complete detail</p>
<p>Complain will be resolved by concern person to whom user have sent mail</p>
<!-- <p>IF you select high priority : Mail will be sent to all System admins related to that Location.</p>
<p>IF you select Normal priority : Mail will be sent to one System admins related to that Location.</p> -->
<p>Priority : Based on priority System admin will resolve problem.</p>
<p>If System administrator not exists for particular location, you will not get system administrator name in send to field. </p>
<p>Now User can ESCALATE problem/issue to next level.Enter remarks send. </p>
</div>

 

</div>




</body>
</html>
