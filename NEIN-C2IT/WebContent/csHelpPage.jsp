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
.show {
    float:left;
    width:670px;
    height:284px;
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
<p>Category:Sub Category:Report Problem: Enter detail of your problem</p>
<p>Priority: Select Priority  </p>
<p><i>Re-select Report to and sent to options , if you are not getting desired mail id.</i></p>
</div>

<div class="show">
<p>Category is mapped with Report to i.e IT support,Office Administrator,software developer</p>
<p>If complain resolver is not assigned to any location, SEND TO option will be blank</p>
<br>
<p>Once Complain is Raised</p>
<p>You can keep track of your complaint by clicking concern person link</p>
<p>ComplainId will show you complete detail of your complain(Resolved/Pending)</p>
<p>User can re-send complaint by clicking re-send button </p>
<p>A copy of mail will be re directed to respective R.O</p>
</div>

<div class="show">
<p>NOTE : </p>

<p>Its an sequential process , can not jump to next field without entering previous field. </p>
<p>Report to , Category , sub category and complaint resolver are mapped to each other.</p>
<p>User mail id should be valid, an copy of mail will be sent</p>
<p>Complain No. hyper link will show you complete detail</p>

<p>Complain will be resolved by concern person to whom user have sent mail</p>
<!-- <p>IF you select high priority : Mail will be sent to all System admins related to that Location.</p>
<p>IF you select Normal priority : Mail will be sent to one System admins related to that Location.</p> -->
<p>Priority : Based on priority System admin will resolve problem.</p>
<p>If System administrator not exists for particular location,</p>
<p>You will not get system administrator name in send to field. </p>
<p>Now User can ESCALATE problem/issue to next level.Enter remarks send. </p>
</div>

 

</div>




</body>
</html>
