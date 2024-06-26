<%-- 
    Document   : Logout.jsp
    Created on : May 15, 2009, 4:03:27 PM
    Author     : siddhi8
--%>

<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="layout.css" ... />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
        <title>Logout</title>
    </head>
    <script type="text/javascript">
    function btnClick() { 
        close(); 
     }
    </script>
    <style type="text/css">

/* Circle Text Styles */

#outerCircleText {

/* Optional - DO NOT SET FONT-SIZE HERE, SET IT IN THE SCRIPT */

font-style: italic;

font-weight: bold;

font-family: 'comic sans ms', verdana, arial;

color: blue;

/* End Optional */



/* Start Required - Do Not Edit */

position: absolute;top: 0;left: 0;z-index: 3000;cursor: default;}

#outerCircleText div {position: relative;}

#outerCircleText div div {position: absolute;top: 0;left: 0;text-align: center;}

/* End Required */

/* End Circle Text Styles */

</style>

<script type="text/javascript">



/* Circling text trail- Tim Tilton

   Website: http://www.tempermedia.com/

   Visit: http://www.dynamicdrive.com/ for Original Source and tons of scripts

   Modified Here for more flexibility and modern browser support

   Modifications as first seen in http://www.dynamicdrive.com/forums/

   username:jscheuer1 - This notice must remain for legal use

   */



;(function(){



// Your message here (QUOTED STRING)

var msg = "Thank you , Visit again to C2IT . ";



/* THE REST OF THE EDITABLE VALUES BELOW ARE ALL UNQUOTED NUMBERS */



// Set font's style size for calculating dimensions

// Set to number of desired pixels font size (decimal and negative numbers not allowed)

var size = 24;



// Set both to 1 for plain circle, set one of them to 2 for oval

// Other numbers & decimals can have interesting effects, keep these low (0 to 3)

var circleY = 0.75; var circleX = 2;



// The larger this divisor, the smaller the spaces between letters

// (decimals allowed, not negative numbers)

var letter_spacing = 5;



// The larger this multiplier, the bigger the circle/oval

// (decimals allowed, not negative numbers, some rounding is applied)

var diameter = 10;



// Rotation speed, set it negative if you want it to spin clockwise (decimals allowed)

var rotation = 0.4;



// This is not the rotation speed, its the reaction speed, keep low!

// Set this to 1 or a decimal less than one (decimals allowed, not negative numbers)

var speed = 0.3;



////////////////////// Stop Editing //////////////////////



if (!window.addEventListener && !window.attachEvent || !document.createElement) return;



msg = msg.split('');

var n = msg.length - 1, a = Math.round(size * diameter * 0.208333), currStep = 20,

ymouse = a * circleY + 20, xmouse = a * circleX + 20, y = [], x = [], Y = [], X = [],

o = document.createElement('div'), oi = document.createElement('div'),

b = document.compatMode && document.compatMode != "BackCompat"? document.documentElement : document.body,



mouse = function(e){

 e = e || window.event;

 ymouse = !isNaN(e.pageY)? e.pageY : e.clientY; // y-position

 xmouse = !isNaN(e.pageX)? e.pageX : e.clientX; // x-position

},



makecircle = function(){ // rotation/positioning

 if(init.nopy){

  o.style.top = (b || document.body).scrollTop + 'px';

  o.style.left = (b || document.body).scrollLeft + 'px';

 };

 currStep -= rotation;

 for (var d, i = n; i > -1; --i){ // makes the circle

  d = document.getElementById('iemsg' + i).style;

  d.top = Math.round(y[i] + a * Math.sin((currStep + i) / letter_spacing) * circleY - 15) + 'px';

  d.left = Math.round(x[i] + a * Math.cos((currStep + i) / letter_spacing) * circleX) + 'px';

 };

},



drag = function(){ // makes the resistance

 y[0] = Y[0] += (ymouse - Y[0]) * speed;

 x[0] = X[0] += (xmouse - 20 - X[0]) * speed;

 for (var i = n; i > 0; --i){

  y[i] = Y[i] += (y[i-1] - Y[i]) * speed;

  x[i] = X[i] += (x[i-1] - X[i]) * speed;

 };

 makecircle();

},



init = function(){ // appends message divs, & sets initial values for positioning arrays

 if(!isNaN(window.pageYOffset)){

  ymouse += window.pageYOffset;

  xmouse += window.pageXOffset;

 } else init.nopy = true;

 for (var d, i = n; i > -1; --i){

  d = document.createElement('div'); d.id = 'iemsg' + i;

  d.style.height = d.style.width = a + 'px';

  d.appendChild(document.createTextNode(msg[i]));

  oi.appendChild(d); y[i] = x[i] = Y[i] = X[i] = 0;

 };

 o.appendChild(oi); document.body.appendChild(o);

 setInterval(drag, 25);

},



ascroll = function(){

 ymouse += window.pageYOffset;

 xmouse += window.pageXOffset;

 window.removeEventListener('scroll', ascroll, false);

};



o.id = 'outerCircleText'; o.style.fontSize = size + 'px';



if (window.addEventListener){

 window.addEventListener('load', init, false);

 document.addEventListener('mouseover', mouse, false);

 document.addEventListener('mousemove', mouse, false);

  if (/Apple/.test(navigator.vendor))

   window.addEventListener('scroll', ascroll, false);

}

else if (window.attachEvent){

 window.attachEvent('onload', init);

 document.attachEvent('onmousemove', mouse);

};



})();



</script>
   <script type = "text/javascript" >
function changeHashOnLoad() {
     window.location.href += "#";
     setTimeout("changeHashAgain()", "50"); 
}
 
function changeHashAgain() {
  window.location.href += "1";
}
 
var storedHash = window.location.hash;
window.setInterval(function () {
    if (window.location.hash != storedHash) {
         window.location.hash = storedHash;
    }
}, 50);
</script>






<style type="text/css">
html, body{height: 70%; width: 100%; border: 0; padding: 0; margin: 0; background:'last1.jpg' ;}

#spacer{
display: block;
height: 85%;
width: 1px;
padding: 0;
margin: 0;
border: 0;
background:images/last1.jpg ; /* same as body bg */
float: right;
}

#bodycontent {
width: 100%;
margin: 0;
padding: 0;
border: 0;
float: right;
margin-right: -1px; /* this is the key to avoid the 1px jog caused by spacer */
}




#footer{
display: block;
clear: both;
width: 100%;
padding: 0;
margin: 0;
background: #ddd;
text-align: center;
margin-right: 0px;
}

#footer p{background: #ddd;}



</style>







    <body onload="changeHashOnLoad();" background="images/last1.jpg" >
        <%
        session.invalidate();
        response.setHeader("Cache-control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", -1);
        %>
        <%
        response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");


// set standard HTTP/1.1 no-cache headers
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

// set IE extended HTTP/1.1 no-cache headers
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");

// set standard HTTP/1.0 no-cache header
        response.setHeader("Pragma", "no-cache");
        %>
        <center><p style="font-size:16px;color:black">Session Time Out. Please click here to login
       <!--  <a href="javascript:location.replace('HOME.jsp')"><b>NEIN-C2IT</b></a> --></p></center>
        
        <table width="165" align ="center" id="hiderow">
<tr>
<td align="left" id="hiderow"><input id="hiderow" type='submit' style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'></td>

</tr>

</table>
       
         
 
<!--<div class="footer">
           
                <font color="blue" style="font-size:12px;color:black">&copy;2013 Created by Farooq Shaikh.</font>
       </div>
    --></body>

    
</html>