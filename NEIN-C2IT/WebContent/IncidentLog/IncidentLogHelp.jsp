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
<li><b>How To Work On Incident Log</b></li>
 <li><a class="hide" href="#">Step1</a></li>
 <li>Step1 -Report Contents </li>

 <li><a class="hide" href="#">Step2</a></li>
 <li>Step2 -Next Approval </li>

 <li><a class="hide" href="#">Step3</a></li>
<li>Step3 -Approval Routine</li>

 <%-- %><li><input id="hiderow"type='submit' style="background-color:#012D58;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>--%> 
 <li><input id="hiderow"type='submit' style="background-color:grey;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>
 <li>Close Sub Window</li>
</ul>

<div class="show">
<p>Incident Report Contains</p>
<p>
System Admin Name , Location and present date will be captured auto.
<p>Select two date - From date and To date</p>


<p> System Admin need to Initiate Incident log</p>
<p><b>Add button</b>To add new row <p> 

<p>Selection button is provided for easy click for every fields </p>
<p>
<b>Date</b>Enter contents for which date you have entering regarding incident issue.
<b>Time</b> need to be entered , provided every 15 min difference.
<b>Viewed by</b> The person who have viewed reporting incident.
<b>Incident Reported </b>Options provided , if Incident reported , need to write remarks compulsory.
<b>Remarks</b> Optional , but compulsory if you select Incident reported.
</p>
</div>

<div class="show">
<p>After entering two dates(from and to) </p>
<p>After entering required fields </p>
<p>Select HR mail id , to whom you are going to send for further approval.</p>
<p>Click on Send report </p>
 <p></p></div>
<div class="show">
<p>Approval Routine </p>
<p>
IT SUPPORT</p>
<p>
HR ADMIN
</p>

<p>
IT MANAGER HO
</p>
<br/>
<br/>

<p>HO : Approval Routine : System Admin -> HR/Admin -> IT MANAGER.
</div> 

</div>




</body>
</html>
