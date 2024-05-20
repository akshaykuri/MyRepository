<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@ include file="../banner.jsp" %>
<head>
<title>IT CLEARANCE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
#container {
    width:750px;
    height:966px;
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
    width:478px;
    height:1844px;
    overflow:auto;
    padding:7px;
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
<b>Lotus Traveler : RULES</b>



<p><b>1.Who can apply</b></p>
<p>   <b>.</b>The mobile device (and the SIM if applicable) must be provided by the company.</p>
<p>   <b>.</b>Nippon Express staffs only. NOT for customer, temporary or Contract Workers.</p>

<p><b>2.Mobile device requirements</b></p>
<p>   <b>.</b>iPhone 3G or higher, iPad 1 or higher.</p>
<p>   <b>.</b>Android 2.x or higher.</p>
<p>   <b>.</b>Jail-broker or rooted devices are NOT allowed</p>

<p><b>3.User's responsibilities</b></p>
<p>   <b>.</b>Will NOT install on any other devices that are NOT provided by the company.</p>
<p>   <b>.</b>Protect the device from loss or unauthorized access.</p>
<p>   <b>.</b>The device must have keylock enabled. </p>
<p>   <b>.</b>In case of device lost or stolen, please report to NEIN IT immediately. </p>
<p>   <b>.</b>For lost or stolen device, NEIN IT will erase the data remotely, that may include private data.</p>
<p>   <b>.</b>Aware of data access or service charges by carrier.</p>
<p>   <b>.</b>When the staff leave the company, please inform NEIN IT in advance.</p>

<p><b>4.NEIN IT is NOT responsible for</b></p>
<p>   <b>.</b>Software installation. (Installation manual and assistant will be provided.)</p>
<p>   <b>.</b>Guarantee works on any specific type, model or OS version of device.</p>
<p>   <b>.</b>Apple account, Google account or any 3rd party account management.</p>
<p>   <b>.</b>Data access charges by carrier.</p>
<p>   <b>.</b>Data backup or restore for device.</p>
<p>   <b>.</b>Data extraction or retrieval from device.</p>

<p><b>5.Inactive User</b></p>
<p>   <b>.</b>If the account has to activity for 3 months, NEIN IT may disable the account.</p>
<p>   <b>.</b>Request for reactivation may required.</p>


<input align="middle" id="hiderow"type='submit' style="background-color:grey;font-weight:bold;color:white;" value='close' onclick='btnClick();'>
</div>


<li></li>

</body>
</html>
