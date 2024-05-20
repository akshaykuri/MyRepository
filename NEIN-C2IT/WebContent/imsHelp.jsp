<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@ include file="banner.jsp" %>
<head>
<title>show and hide divs</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
#container {
    width:750px;
    height:266px;
    padding:5px;
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
.show {
    float:left;
    width:478px;
    height:244px;
    overflow:auto;
    padding:10px;
    border:1px solid #999;
    background-color:#fff;
 }
.show p {
    margin:0;
    padding-bottom:10px;
    text-align:justify;
 }
.hide {
    width:0;
    height:0;
    overflow:hidden;
 }
#d0,#d4 {
    color:#999;
 }
#d1,#d2,#d3 {
    color:#999;
 }
.show p {
    text-indent:30px;
 }
.show p:first-letter {
    font-family:times,serif;
    font-size:100%;
    font-weight:bold;
    color:#333;
 }
</style>

<script type="text/javascript">

   var c;
   var k=0;
   var j=0;
   var ary=[];
   var divs=document.getElementsByTagName('div');
   var lnks=document.getElementsByTagName('a');
   var splt;

/**************************************************

function init is provided for those who have javascript disabled
and would, otherwise, not be able to view any of the divs at all.
They would also I presume not need the links that control the divs
so that will not show up.

***************************************************/
function init() {
for(c=0;c<divs.length;c++) {
  if(divs[c].className=='show') {
     divs[c].className='hide';
     divs[c].id='d'+k++;     
   }
  }
for(c=0;c<lnks.length;c++) {
if(lnks[c].className=='hide') {
   ary[c]=true;
   lnks[c].className='hs';
   lnks[c].id='a'+j++;
   lnks[c].onclick=function() {
   splt=this.id.split('a')[1];
if(ary[splt]==true) {
   this.firstChild.nodeValue='hide';
   ary[splt]=false;
   showDiv(splt);
   return false;
     }
else {
   this.firstChild.nodeValue='show';
   ary[splt]=true;

document.getElementById('d'+splt).className='hide';
   return false;
     }
    }
   }
  }
 }

function showDiv(num) {
for(c=0;c<j;c++){
   document.getElementById('a'+c).firstChild.nodeValue='show';
   document.getElementById('a'+num).firstChild.nodeValue='hide';
   ary[c]=true;
   ary[num]=false;
 }
for(c=0;c<divs.length;c++) {  
  if(divs[c].className=='show') {
     divs[c].className='hide';
  }
 }
document.getElementById('d'+num).className='show';
 }

window.onload=function() {
   init();
 }
 </script>
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
<li><b>How To Work On IMS Daily Report</b></li>
 <li><a class="hide" href="#">Step1</a></li>
 <li>Step1 -Report Contents </li>

 <li><a class="hide" href="#">Step2</a></li>
 <li>Step2 -New Complaint </li>

 <li><a class="hide" href="#">Step3</a></li>
<li>Step3 -Sending To Higher Authority</li>

 <%-- %><li><input id="hiderow"type='submit' style="background-color:#012D58;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>--%> 
 <li><input id="hiderow"type='submit' style="background-color:grey;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>
 <li>Close Sub Window</li>
</ul>

<div class="show">
<p>IMS Report Contains</p>
<p>
System Admin Name , Location and present date will be captured auto.
<p>Daily Complaint are displayed in the Module</p>


<p>System Admin need to resolve complaints,till then status will be Pending,Number of Resolved/Pending will appear in dash board in home page, by clicking <b>update link</b> System Admin can change status</p>
<p>Resolve Complaints only if you are raising it.(which might be from phone)<p> 

<p><B>update link</B>, contains complete information about complaint of specific complaint, system Admin need to select if he resolved with remarks, click on save. <p>



</p>
</div>

<div class="show">
<p>To enter New Complaint if any </p>
<p>Click New Complaint link </p>
<p>Fill the required fields.</p>
<p>Click on save </p>
 <p></p></div>
<div class="show">
<p>Send Daily work Log</p>
<p>
Daily Work log will be appear on the screen</p>
<p>
Location wise IT Manager,Admin/IT incharge,General Manager,Branch Manager will appear.
</p>
<p>
Click required Higher authority check box to SEND IMS daily Report.Mail will be sent with attachment of IMS report to required Higher Authority.
</p>
<p>
Had Assigned to column is been assigned to other but u have taken initiative and resolved it, mail will go behalf of your name and mail id .
</p>
</div> 

</div>




</body>
</html>
