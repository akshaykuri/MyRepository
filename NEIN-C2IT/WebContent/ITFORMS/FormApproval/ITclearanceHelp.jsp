<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@ include file="../../banner.jsp" %>
<head>
<title>IT CLEARANCE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
#container {
    width:750px;
    height:566px;
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
    height:1044px;
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
<b>How To Work On ITClearance</b>



<p>
IT Clearance No.,date,Initiator Name,Initiator Designation will be captured my system.</p>
<p>Enter the details of  Resigning employee.</p>
<p>Date of Resignation - Date of Relieved will be calculated accordingly with respect to status of employee</p>
<p>HR / Admin (Local)can enter only HR details of employee.</p>


<p>HR / Admin (Local) need to Send request to Account department. </p>



<p>Accounts department local can enter only there part of field and need to Send back to HR / Admin (Local) department.</p>
<p>Accounts department local should have Application form id and pwd to approve.Should use Application form hyper link and select pending request.</p>

<center><p><b>According to approval routine</b></p></center>
<p>Initiator can send only to same location Account department</p>
<p>From Initiator till Reporting officer have to use Form application.Should have form application user id and pwd.</p>
<p>Apart from Initiator, User should approve/not by selecting pending request from APPLICATION FORMS link.</p>
<p>While Approval Routine Designation is same has Reporting Officer designation ,Kindly follow the approval routine</p>
<!-- <p>HR Admin need to send to IT department (Local).</p>
<p>IT department can enter only IT details of employee.</p> -->


<!-- <div class="show">
<p>You can add any number of item by click add button. </p>
<p>Filling the appropriate fields(make sure you filled Asset{CE-Capital Expenditure and NCE-Non Capital Expenditure}).
 </p>
<p>If any notes/remarks needs to be included it can be typed in the Remarks field.</p>
<p>REMOVE button can be used to remove a detail but a minimum of 1 item should be entered before submitting the form.</p>
 <p>Select the Appropriate higher authority to approve your MR from the list.</p></div>
<div class="show">
<p>After filling all the details on MR form click on SAVE button for further adding quotation and comparison OR </p>
<p>After filling all the details on MR form click on SEND button. </p>
<p>An email will be sent automatically to the selected approver in the MR Form. </p>
<p>A response email from the selected approver will be sent back to you(Initiator) after he/she approves/dis-approves.</p>


</div>


<div class="show">
<p>Wait for response from approver.</p>
<p>If you dont get any response/approval/dis-approval mail from approver , you can resend it on clicking on resend button and mail will be resend to the selected approver.(MR STATUS page)</p>
<p>The Approving cycle ends up if see designation=none and higher authority name = -1.</p>
<p>
<b>Once Approved can proceed with next module.</B>
If dis-approved and if u want to repeat the cycle by requesting/raising new mr with new mr no , kindly write the reason/remarks in the remarks field.</p>
<p>
<b>Note:</b>Do not use special characters such as apostrophe ('') or double apostrophe ("")etc.
</p>
</div> 

</div> -->


<li><input id="hiderow"type='submit' style="background-color:grey;font-weight:bold;color:white;" value='CANCEL' onclick='btnClick();'></li>

</body>
</html>
