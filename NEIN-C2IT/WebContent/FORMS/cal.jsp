<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">

* {
    -webkit-user-select:none;
}

body {
    background:url(../images/cal_bg.png);
}

article.container {
    padding: 50px 0 140px;
}

#cal{
    font-family:'Economica',sans-serif;
    width:200px;
    height:205px;
    position:relative;
    top:150px;
    left:25px;
    background-image:-webkit-gradient(
    linear,
    left bottom,
    left top,
    color-stop(0.9, rgb(52,59,63)),
    color-stop(0.9, rgb(70,80,85)),
    color-stop(1, rgb(82,91,97))
);
    background-image: -moz-linear-gradient(bottom, rgb(52,59,63) 90%, rgb(70,80,85) 91%, rgb(82,91,97) 100%);
    border:1px solid #000;
    border-radius:5px;
    box-shadow: 0 1px 0 rgba(255,255,255,0.3) inset, 0 0 5px rgba(0,0,0,0.8);
    -webkit-box-sizing:border-box;
    -moz-box-sizing:border-box;
    padding:0 9px 10px 11px;
    margin:0 auto;
}

.bigDate {
    position: absolute;
    top:-160px;
    left:0;
    opacity:0;
    -webkit-transform:scale(0.8);
    -moz-transform:scale(0.8);
    -webkit-transition:0.3s linear;
    -moz-transition:0.3s linear;
    -webkit-backface-visibility:hidden;
    font-size: 70px;
    width: 180px;
    text-align: center;
}

#header {
    position:relative;
    height:40px;
    line-height: 40px;
    color: white;
}

#numbers {
    position:relative;
    height:150px;
    background:#444 url(../images/micro_carbon.png);
    box-shadow:1px 1px 1px rgba(0,0,0,0.1) inset,-1px -1px 1px rgba(0,0,0,0.1) inset,0px -1px 0px rgba(255,255,255,0.2),-1px 1px 0px rgba(255,255,255,0.1),1px 0px 0px rgba(255,255,255,0.1);
    border:1px solid black;
}

.left {
    position:absolute;
    top:0;
    left:0;
}

.right {
    position:absolute;
    top:0;
    right:0;
}

h2 {
    position:absolute;
    left:10px;
    right:10px;
    text-align:center;
    font-size:20px;
	line-height: 9px;
}

.day {
    position:absolute;
    top:0;
    left:0;
    cursor:pointer;
    width:25px;
    height:25px;
    font-size:12px;
    text-shadow:0 1px 0 rgba(255,255,255,1);
    text-align:center;
    line-height:29px;
    display:inline-block;
    -webkit-transition:0.3s linear;
    -moz-transition:0.3s linear;
    box-shadow:1px 1px 0 rgba(0,0,0,1) inset,1px 1px 0 rgba(0,0,0,1),-1px -1px 0 rgba(255,255,255,1) inset,0 1px 1px rgba(0,0,0,0.7);
    background-image:-webkit-gradient(
    linear,
    left bottom,
    left top,
    color-stop(0, rgb(230,230,230)),
    color-stop(1, rgb(235,235,235))
);
    background-image: -moz-linear-gradient(bottom, rgb(230,230,230) 0%, rgb(235,235,235) 100%);
}

.day[prop="1"],.day[prop="4"]{
    -webkit-transition:0.4s linear;
    -moz-transition:0.4s linear;
}

.day[prop="2"],.day[prop="5"]{
    -webkit-transition:0.5s ease-in-out;
    -moz-transition:0.5s ease-in-out;
}

.day[prop="3"],.day[prop="6"]{
    -webkit-transition:0.6s linear;
    -moz-transition:0.6s linear;
}

.day[prop="7"],.day[prop="10"]{
    -webkit-transition:0.6s ease-in;
    -moz-transition:0.6s ease-in-out;
}

.day[prop="8"],.day[prop="11"]{
    -webkit-transition:0.6s ease-in-out;
    -moz-transition:0.6s ease-in-out;
}

.day[prop="9"],.day[prop="12"]{
    -webkit-transition:0.5s ease-out;
    -moz-transition:0.5s ease-out;
}

.day[prop="13"],.day[prop="17"]{
    -webkit-transition:0.5s linear;
    -moz-transition:0.5s ease-in-out;
}
.day[prop="14"],.day[prop="18"]{
    -webkit-transition:0.7s linear;
    -moz-transition:0.7s ease-in-out;
}
.day[prop="15"],.day[prop="19"]{
    -webkit-transition:0.6s ease-in-out;
    -moz-transition:0.6s ease-in-out;
}
.day[prop="16"],.day[prop="20"]{
    -webkit-transition:0.4s ease-in-out;
    -moz-transition:0.4s ease-in-out;
}

h2,.monthLink,input[type="radio"] {
    display:none;
    color:#fff !important;
    text-decoration:none;
    text-shadow:0 -1px 0 rgba(0,0,0,0.8);
}

h2[jan],.monthLink[jan] {
    display:block;
}

#feb:target h2[feb],#feb:target .monthLink[feb],
#mar:target h2[mar],#mar:target .monthLink[mar],
#apr:target h2[apr],#apr:target .monthLink[apr],
#may:target h2[may],#may:target .monthLink[may],
#jun:target h2[jun],#jun:target .monthLink[jun],
#jul:target h2[jul],#jul:target .monthLink[jul],
#aug:target h2[aug],#aug:target .monthLink[aug],
#sep:target h2[sep],#sep:target .monthLink[sep],
#oct:target h2[oct],#oct:target .monthLink[oct],
#nov:target h2[nov],#nov:target .monthLink[nov],
#dec:target h2[dec],#dec:target .monthLink[dec]
{
    display:block;
}

footer {
    font-family: 'PT Mono', sans-serif;
}

.month:not(#jan):target h2[jan],.month:not(#jan):target .monthLink[jan]{
    display:none;
}

input[type="radio"]:checked + label{
    background:#f2681d;
    /*box-shadow:0 2px 2px #b85000 inset,2px 0px 2px #b85000 inset, -1px 0px 0px rgba(255,255,255,0.5) inset,0px -1px 0px rgba(255,255,255,0.5) inset; */
    box-shadow:0 1px 0px black inset,1px 0px 0px black inset, -1px 0px 0px rgba(255,255,255,0.5) inset,0px -1px 0px rgba(255,255,255,0.5) inset;
    color:#fff;
    text-shadow:0 1px 0 rgba(0,0,0,0.5);
    font-weight:bold;
}

input[type="radio"]#thirtyone:checked ~ .bigDate[prop="31"],input[type="radio"]#thirty:checked ~ .bigDate[prop="30"],input[type="radio"]#twentynine:checked ~ .bigDate[prop="29"],input[type="radio"]#twentyeight:checked ~ .bigDate[prop="28"],input[type="radio"]#twentyseven:checked ~ .bigDate[prop="27"],input[type="radio"]#twentysix:checked ~ .bigDate[prop="26"],
input[type="radio"]#twentyfive:checked ~ .bigDate[prop="25"],input[type="radio"]#twentyfour:checked ~ .bigDate[prop="24"], input[type="radio"]#twentythree:checked ~ .bigDate[prop="23"], input[type="radio"]#twentytwo:checked ~ .bigDate[prop="22"], input[type="radio"]#twentyone:checked ~ .bigDate[prop="21"], input[type="radio"]#twenty:checked ~ .bigDate[prop="20"],
input[type="radio"]#nineteen:checked ~ .bigDate[prop="19"],input[type="radio"]#eightteen:checked ~ .bigDate[prop="18"], input[type="radio"]#seventeen:checked ~ .bigDate[prop="17"],input[type="radio"]#sixteen:checked ~ .bigDate[prop="16"],input[type="radio"]#fifteen:checked ~ .bigDate[prop="15"],input[type="radio"]#fourteen:checked ~ .bigDate[prop="14"],
input[type="radio"]#thirteen:checked ~ .bigDate[prop="13"], input[type="radio"]#twelve:checked ~ .bigDate[prop="12"],input[type="radio"]#eleven:checked ~ .bigDate[prop="11"],input[type="radio"]#ten:checked ~ .bigDate[prop="10"],input[type="radio"]#nine:checked ~ .bigDate[prop="9"],input[type="radio"]#eight:checked ~ .bigDate[prop="8"],input[type="radio"]#seven:checked ~ .bigDate[prop="7"],
input[type="radio"]#six:checked ~ .bigDate[prop="6"],input[type="radio"]#five:checked ~ .bigDate[prop="5"],input[type="radio"]#four:checked ~ .bigDate[prop="4"],input[type="radio"]#three:checked ~ .bigDate[prop="3"],input[type="radio"]#two:checked ~ .bigDate[prop="2"],input[type="radio"]#one:checked ~ .bigDate[prop="1"] {
    opacity: 1;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
}

.day[prop="1"],.day[prop="2"],.day[prop="3"],.day[prop="4"],.day[prop="5"],.day[prop="6"],.day[prop="7"]{ top:0px; }

.day[prop="8"],.day[prop="9"],.day[prop="10"],.day[prop="11"],.day[prop="12"],.day[prop="13"],.day[prop="14"]{ top:25px; }

.day[prop="15"],.day[prop="16"],.day[prop="17"],.day[prop="18"],.day[prop="19"],.day[prop="20"],.day[prop="21"]{ top:50px; }

.day[prop="22"],.day[prop="23"],.day[prop="24"],.day[prop="25"],.day[prop="26"],.day[prop="27"],.day[prop="28"]{ top:75px; }

.day[prop="29"],.day[prop="30"],.day[prop="31"]{ top:100px; }

.day[prop="1"],.day[prop="8"],.day[prop="15"],.day[prop="22"],.day[prop="29"]{ left:0px; }

.day[prop="2"],.day[prop="9"],.day[prop="16"],.day[prop="23"],.day[prop="30"]{ left:25px; }

.day[prop="3"],.day[prop="10"],.day[prop="17"],.day[prop="24"],.day[prop="31"]{ left:50px; }

.day[prop="4"],.day[prop="11"],.day[prop="18"],.day[prop="25"]{ left:75px; }

.day[prop="5"],.day[prop="12"],.day[prop="19"],.day[prop="26"]{ left:100px; }

.day[prop="6"],.day[prop="13"],.day[prop="20"],.day[prop="27"]{ left:125px; }

.day[prop="7"],.day[prop="14"],.day[prop="21"],.day[prop="28"]{ left:150px; }

#feb:target .day[prop="30"],#feb:target .day[prop="31"],#apr:target .day[prop="31"],#sep:target .day[prop="31"],#jun:target .day[prop="31"],#nov:target .day[prop="31"]{ display:none; }

#feb:target .day[prop="1"],#feb:target .day[prop="2"],#feb:target .day[prop="3"],#feb:target .day[prop="4"]{ top:0px; }

#feb:target .day[prop="5"],#feb:target .day[prop="6"],#feb:target .day[prop="10"],#feb:target .day[prop="11"],#feb:target .day[prop="7"],#feb:target .day[prop="8"],#feb:target .day[prop="9"]{ top:25px; }

#feb:target .day[prop="12"],#feb:target .day[prop="13"],#feb:target .day[prop="14"],#feb:target .day[prop="15"],#feb:target .day[prop="16"],#feb:target .day[prop="17"],#feb:target .day[prop="18"]{ top:50px; }

#feb:target .day[prop="19"],#feb:target .day[prop="20"],#feb:target .day[prop="21"],#feb:target .day[prop="22"],#feb:target .day[prop="23"],#feb:target .day[prop="24"],#feb:target .day[prop="25"]{ top:75px; }

#feb:target .day[prop="26"],#feb:target .day[prop="27"],#feb:target .day[prop="28"],#feb:target .day[prop="29"]{ top:100px; }

#feb:target .day[prop="5"],#feb:target .day[prop="12"],#feb:target .day[prop="19"],#feb:target .day[prop="26"]{ left:0px; }

#feb:target .day[prop="6"],#feb:target .day[prop="13"],#feb:target .day[prop="20"],#feb:target .day[prop="27"]{ left:25px; }

#feb:target .day[prop="7"],#feb:target .day[prop="14"],#feb:target .day[prop="21"],#feb:target .day[prop="28"]{ left:50px; }

#feb:target .day[prop="1"],#feb:target .day[prop="8"],#feb:target .day[prop="15"],#feb:target .day[prop="22"],#feb:target .day[prop="29"]{ left:75px; }

#feb:target .day[prop="2"],#feb:target .day[prop="9"],#feb:target .day[prop="16"],#feb:target .day[prop="23"]{ left:100px; }

#feb:target .day[prop="3"],#feb:target .day[prop="10"],#feb:target .day[prop="17"],#feb:target .day[prop="24"]{ left:125px; }

#feb:target .day[prop="4"],#feb:target .day[prop="11"],#feb:target .day[prop="18"],#feb:target .day[prop="25"]{ left:150px; }


#mar:target .day[prop="1"],#mar:target .day[prop="2"],#mar:target .day[prop="3"]{ top:0px; }

#mar:target .day[prop="4"],#mar:target .day[prop="5"],#mar:target .day[prop="6"],#mar:target .day[prop="10"],#mar:target .day[prop="7"],#mar:target .day[prop="8"],#mar:target .day[prop="9"]{ top:25px; }

#mar:target .day[prop="11"],#mar:target .day[prop="12"],#mar:target .day[prop="13"],#mar:target .day[prop="14"],#mar:target .day[prop="15"],#mar:target .day[prop="16"],#mar:target .day[prop="17"]{ top:50px; }

#mar:target .day[prop="18"],#mar:target .day[prop="19"],#mar:target .day[prop="20"],#mar:target .day[prop="21"],#mar:target .day[prop="22"],#mar:target .day[prop="23"],#mar:target .day[prop="24"]{ top:75px; }

#mar:target .day[prop="25"],#mar:target .day[prop="26"],#mar:target .day[prop="27"],#mar:target .day[prop="28"],#mar:target .day[prop="29"],#mar:target .day[prop="30"],#mar:target .day[prop="31"]{ top:100px; }

#mar:target .day[prop="4"],#mar:target .day[prop="11"],#mar:target .day[prop="18"],#mar:target .day[prop="25"]{ left:0px; }

#mar:target .day[prop="5"],#mar:target .day[prop="12"],#mar:target .day[prop="19"],#mar:target .day[prop="26"]{ left:25px; }

#mar:target .day[prop="6"],#mar:target .day[prop="13"],#mar:target .day[prop="20"],#mar:target .day[prop="27"]{ left:50px; }

#mar:target .day[prop="7"],#mar:target .day[prop="14"],#mar:target .day[prop="21"],#mar:target .day[prop="28"]{ left:75px; }

#mar:target .day[prop="1"],#mar:target .day[prop="8"],#mar:target .day[prop="15"],#mar:target .day[prop="22"],#mar:target .day[prop="29"]{ left:100px; }

#mar:target .day[prop="2"],#mar:target .day[prop="9"],#mar:target .day[prop="16"],#mar:target .day[prop="23"],#mar:target .day[prop="30"]{ left:125px; }

#mar:target .day[prop="3"],#mar:target .day[prop="10"],#mar:target .day[prop="17"],#mar:target .day[prop="24"],#mar:target .day[prop="31"]{ left:150px; }

/*may*/

#may:target .day[prop="1"],#may:target .day[prop="2"],#may:target .day[prop="3"],#may:target .day[prop="4"],#may:target .day[prop="5"]{ top:0px; }

#may:target .day[prop="6"],#may:target .day[prop="10"],#may:target .day[prop="7"],#may:target .day[prop="8"],#may:target .day[prop="9"],#may:target .day[prop="11"],#may:target .day[prop="12"]{ top:25px; }

#may:target .day[prop="13"],#may:target .day[prop="14"],#may:target .day[prop="15"],#may:target .day[prop="16"],#may:target .day[prop="17"],#may:target .day[prop="18"],#may:target .day[prop="19"]{ top:50px; }

#may:target .day[prop="20"],#may:target .day[prop="21"],#may:target .day[prop="22"],#may:target .day[prop="23"],#may:target .day[prop="24"],#may:target .day[prop="25"],#may:target .day[prop="26"]{ top:75px; }

#may:target .day[prop="27"],#may:target .day[prop="28"],#may:target .day[prop="29"],#may:target .day[prop="30"],#may:target .day[prop="31"]{ top:100px; }

#may:target .day[prop="6"],#may:target .day[prop="13"],#may:target .day[prop="20"],#may:target .day[prop="27"]{ left:0px; }

#may:target .day[prop="7"],#may:target .day[prop="14"],#may:target .day[prop="21"],#may:target .day[prop="28"]{ left:25px; }

#may:target .day[prop="1"],#may:target .day[prop="8"],#may:target .day[prop="15"],#may:target .day[prop="22"],#may:target .day[prop="29"]{ left:50px; }

#may:target .day[prop="2"],#may:target .day[prop="9"],#may:target .day[prop="16"],#may:target .day[prop="23"],#may:target .day[prop="30"]{ left:75px; }

#may:target .day[prop="3"],#may:target .day[prop="10"],#may:target .day[prop="17"],#may:target .day[prop="24"],#may:target .day[prop="31"]{ left:100px; }

#may:target .day[prop="4"],#may:target .day[prop="11"],#may:target .day[prop="18"],#may:target .day[prop="25"]{ left:125px; }

#may:target .day[prop="5"],#may:target .day[prop="12"],#may:target .day[prop="19"],#may:target .day[prop="26"]{ left:150px; }

/* June */

#jun:target .day[prop="1"],#jun:target .day[prop="2"]{ top:0px; }

#jun:target .day[prop="3"],#jun:target .day[prop="4"],#jun:target .day[prop="5"],#jun:target .day[prop="6"],#jun:target .day[prop="7"],#jun:target .day[prop="8"],#jun:target .day[prop="9"]{ top:25px; }

#jun:target .day[prop="10"],#jun:target .day[prop="11"],#jun:target .day[prop="12"],#jun:target .day[prop="13"],#jun:target .day[prop="14"],#jun:target .day[prop="15"],#jun:target .day[prop="16"]{top:50px; }

#jun:target .day[prop="17"],#jun:target .day[prop="18"], #jun:target .day[prop="19"],#jun:target .day[prop="20"],#jun:target .day[prop="21"],#jun:target .day[prop="22"],#jun:target .day[prop="23"]{ top:75px; }

#jun:target .day[prop="24"],#jun:target .day[prop="25"],#jun:target .day[prop="26"],#jun:target .day[prop="27"],#jun:target .day[prop="28"],#jun:target .day[prop="29"],#jun:target .day[prop="30"]{ top:100px; }

#jun:target .day[prop="3"],#jun:target .day[prop="10"],#jun:target .day[prop="17"],#jun:target .day[prop="24"]{ left:0px; }

#jun:target .day[prop="4"],#jun:target .day[prop="11"],#jun:target .day[prop="18"],#jun:target .day[prop="25"]{ left:25px; }

#jun:target .day[prop="5"],#jun:target .day[prop="12"],#jun:target .day[prop="19"],#jun:target .day[prop="26"],#jun:target .day[prop="29"]{ left:50px; }

#jun:target .day[prop="6"],#jun:target .day[prop="13"],#jun:target .day[prop="20"],#jun:target .day[prop="27"] { left:75px; }

#jun:target .day[prop="7"],#jun:target .day[prop="14"],#jun:target .day[prop="21"],#jun:target .day[prop="28"]{ left:100px; }

#jun:target .day[prop="1"],#jun:target .day[prop="8"],#jun:target .day[prop="15"],#jun:target .day[prop="22"],#jun:target .day[prop="29"]{ left:125px; }

#jun:target .day[prop="2"],#jun:target .day[prop="9"],#jun:target .day[prop="16"],#jun:target .day[prop="23"],#jun:target .day[prop="30"]{ left:150px; }

/*aug*/

#aug:target .day[prop="1"],#aug:target .day[prop="2"],#aug:target .day[prop="3"],#aug:target .day[prop="4"]{ top:0px; }

#aug:target .day[prop="5"],#aug:target .day[prop="6"],#aug:target .day[prop="10"],#aug:target .day[prop="11"],#aug:target .day[prop="7"],#aug:target .day[prop="8"],#aug:target .day[prop="9"]{ top:25px; }

#aug:target .day[prop="12"],#aug:target .day[prop="13"],#aug:target .day[prop="14"],#aug:target .day[prop="15"],#aug:target .day[prop="16"],#aug:target .day[prop="17"],#aug:target .day[prop="18"]{ top:50px; }

#aug:target .day[prop="19"],#aug:target .day[prop="20"],#aug:target .day[prop="21"],#aug:target .day[prop="22"],#aug:target .day[prop="23"],#aug:target .day[prop="24"],#aug:target .day[prop="25"]{ top:75px; }

#aug:target .day[prop="26"],#aug:target .day[prop="27"],#aug:target .day[prop="28"],#aug:target .day[prop="29"],#aug:target .day[prop="30"],#aug:target .day[prop="31"]{ top:100px; }

#aug:target .day[prop="5"],#aug:target .day[prop="12"],#aug:target .day[prop="19"],#aug:target .day[prop="26"]{ left:0px; }

#aug:target .day[prop="6"],#aug:target .day[prop="13"],#aug:target .day[prop="20"],#aug:target .day[prop="27"]{ left:25px; }

#aug:target .day[prop="7"],#aug:target .day[prop="14"],#aug:target .day[prop="21"],#aug:target .day[prop="28"]{ left:50px; }

#aug:target .day[prop="1"],#aug:target .day[prop="8"],#aug:target .day[prop="15"],#aug:target .day[prop="22"],#aug:target .day[prop="29"]{ left:75px; }

#aug:target .day[prop="2"],#aug:target .day[prop="9"],#aug:target .day[prop="16"],#aug:target .day[prop="23"],#aug:target .day[prop="30"]{ left:100px; }

#aug:target .day[prop="3"],#aug:target .day[prop="10"],#aug:target .day[prop="17"],#aug:target .day[prop="24"],#aug:target .day[prop="31"]{ left:125px; }

#aug:target .day[prop="4"],#aug:target .day[prop="11"],#aug:target .day[prop="18"],#aug:target .day[prop="25"]{ left:150px; }

/* sep */

#sep:target .day[prop="1"]{ top:0px; }

#sep:target .day[prop="2"],#sep:target .day[prop="3"],#sep:target .day[prop="4"],#sep:target .day[prop="5"],#sep:target .day[prop="6"],#sep:target .day[prop="7"],#sep:target .day[prop="8"]{ top:25px; }

#sep:target .day[prop="9"],#sep:target .day[prop="10"],#sep:target .day[prop="11"],#sep:target .day[prop="12"],#sep:target .day[prop="13"],#sep:target .day[prop="14"],#sep:target .day[prop="15"]{top:50px; }

#sep:target .day[prop="16"],#sep:target .day[prop="17"],#sep:target .day[prop="18"], #sep:target .day[prop="19"],#sep:target .day[prop="20"],#sep:target .day[prop="21"],#sep:target .day[prop="22"]{ top:75px; }

#sep:target .day[prop="23"],#sep:target .day[prop="24"],#sep:target .day[prop="25"],#sep:target .day[prop="26"],#sep:target .day[prop="27"],#sep:target .day[prop="28"],#sep:target .day[prop="29"]{ top:100px; }

#sep:target .day[prop="30"] {top:125px;}

#sep:target .day[prop="2"],#sep:target .day[prop="9"],#sep:target .day[prop="16"],#sep:target .day[prop="23"],#sep:target .day[prop="30"]{ left:0px; }

#sep:target .day[prop="3"],#sep:target .day[prop="10"],#sep:target .day[prop="17"],#sep:target .day[prop="24"]{ left:25px; }

#sep:target .day[prop="4"],#sep:target .day[prop="11"],#sep:target .day[prop="18"],#sep:target .day[prop="25"]{ left:50px; }

#sep:target .day[prop="5"],#sep:target .day[prop="12"],#sep:target .day[prop="19"],#sep:target .day[prop="26"],#sep:target .day[prop="29"]{ left:75px; }

#sep:target .day[prop="6"],#sep:target .day[prop="13"],#sep:target .day[prop="20"],#sep:target .day[prop="27"] { left:100px; }

#sep:target .day[prop="7"],#sep:target .day[prop="14"],#sep:target .day[prop="21"],#sep:target .day[prop="28"]{ left:125px; }

#sep:target .day[prop="1"],#sep:target .day[prop="8"],#sep:target .day[prop="15"],#sep:target .day[prop="22"],#sep:target .day[prop="29"]{ left:150px; }

/* Oct */

#oct:target .day[prop="1"],#oct:target .day[prop="2"],#oct:target .day[prop="3"],#oct:target .day[prop="4"],#oct:target .day[prop="5"],#oct:target .day[prop="6"]{ top:0px; }

#oct:target .day[prop="7"],#oct:target .day[prop="8"],#oct:target .day[prop="9"],#oct:target .day[prop="10"],#oct:target .day[prop="11"],#oct:target .day[prop="12"],#oct:target .day[prop="13"]{ top:25px; }

#oct:target .day[prop="14"],#oct:target .day[prop="15"],#oct:target .day[prop="16"],#oct:target .day[prop="17"],#oct:target .day[prop="18"],#oct:target .day[prop="19"],#oct:target .day[prop="20"]{ top:50px; }

#oct:target .day[prop="21"],#oct:target .day[prop="22"],#oct:target .day[prop="23"],#oct:target .day[prop="24"],#oct:target .day[prop="25"],#oct:target .day[prop="26"],#oct:target .day[prop="27"]{ top:75px; }

#oct:target .day[prop="28"],#oct:target .day[prop="29"],#oct:target .day[prop="30"],#oct:target .day[prop="31"]{ top:100px; }

#oct:target .day[prop="7"],#oct:target .day[prop="14"],#oct:target .day[prop="21"],#oct:target .day[prop="28"]{ left:0px; }

#oct:target .day[prop="1"],#oct:target .day[prop="8"],#oct:target .day[prop="15"],#oct:target .day[prop="22"],#oct:target .day[prop="29"]{ left:25px; }

#oct:target .day[prop="2"],#oct:target .day[prop="9"],#oct:target .day[prop="16"],#oct:target .day[prop="23"],#oct:target .day[prop="30"]{ left:50px; }

#oct:target .day[prop="3"],#oct:target .day[prop="10"],#oct:target .day[prop="17"],#oct:target .day[prop="24"],#oct:target .day[prop="31"]{ left:75px; }

#oct:target .day[prop="4"],#oct:target .day[prop="11"],#oct:target .day[prop="18"],#oct:target .day[prop="25"]{ left:100px; }

#oct:target .day[prop="5"],#oct:target .day[prop="12"],#oct:target .day[prop="19"],#oct:target .day[prop="26"]{ left:125px; }

#oct:target .day[prop="6"],#oct:target .day[prop="13"],#oct:target .day[prop="20"],#oct:target .day[prop="27"]{ left:150px; }

/* Nov */

#nov:target .day[prop="1"],#nov:target .day[prop="2"],#nov:target .day[prop="3"]{ top:0px; }

#nov:target .day[prop="4"],#nov:target .day[prop="5"],#nov:target .day[prop="6"],#nov:target .day[prop="7"],#nov:target .day[prop="8"],#nov:target .day[prop="9"],#nov:target .day[prop="10"]{ top:25px; }

#nov:target .day[prop="11"],#nov:target .day[prop="12"],#nov:target .day[prop="13"],#nov:target .day[prop="14"],#nov:target .day[prop="15"],#nov:target .day[prop="16"],#nov:target .day[prop="17"]{top:50px; }

#nov:target .day[prop="18"], #nov:target .day[prop="19"],#nov:target .day[prop="20"],#nov:target .day[prop="21"],#nov:target .day[prop="22"],#nov:target .day[prop="23"],#nov:target .day[prop="24"]{ top:75px; }

#nov:target .day[prop="25"],#nov:target .day[prop="26"],#nov:target .day[prop="27"],#nov:target .day[prop="28"],#nov:target .day[prop="29"],#nov:target .day[prop="30"]{ top:100px; }

#nov:target .day[prop="4"],#nov:target .day[prop="11"],#nov:target .day[prop="18"],#nov:target .day[prop="25"]{ left:0px; }

#nov:target .day[prop="5"],#nov:target .day[prop="12"],#nov:target .day[prop="19"],#nov:target .day[prop="26"]{ left:25px; }

#nov:target .day[prop="6"],#nov:target .day[prop="13"],#nov:target .day[prop="20"],#nov:target .day[prop="27"] { left:50px; }

#nov:target .day[prop="7"],#nov:target .day[prop="14"],#nov:target .day[prop="21"],#nov:target .day[prop="28"]{ left:75px; }

#nov:target .day[prop="1"],#nov:target .day[prop="8"],#nov:target .day[prop="15"],#nov:target .day[prop="22"],#nov:target .day[prop="29"]{ left:100px; }

#nov:target .day[prop="2"],#nov:target .day[prop="9"],#nov:target .day[prop="16"],#nov:target .day[prop="23"],#nov:target .day[prop="30"]{ left:125px; }

#nov:target .day[prop="3"],#nov:target .day[prop="10"],#nov:target .day[prop="17"],#nov:target .day[prop="24"]{ left:150px; }

/*Dec*/

#dec:target .day[prop="1"]{ top:0px; }

#dec:target .day[prop="2"],#dec:target .day[prop="3"],#dec:target .day[prop="4"],#dec:target .day[prop="5"],#dec:target .day[prop="6"],#dec:target .day[prop="7"],#dec:target .day[prop="8"]{ top:25px; }

#dec:target .day[prop="9"],#dec:target .day[prop="10"],#dec:target .day[prop="11"],#dec:target .day[prop="12"],#dec:target .day[prop="13"],#dec:target .day[prop="14"],#dec:target .day[prop="15"]{top:50px; }

#dec:target .day[prop="16"],#dec:target .day[prop="17"],#dec:target .day[prop="18"], #dec:target .day[prop="19"],#dec:target .day[prop="20"],#dec:target .day[prop="21"],#dec:target .day[prop="22"]{ top:75px; }

#dec:target .day[prop="23"],#dec:target .day[prop="24"],#dec:target .day[prop="25"],#dec:target .day[prop="26"],#dec:target .day[prop="27"],#dec:target .day[prop="28"],#dec:target .day[prop="29"]{ top:100px; }

#dec:target .day[prop="30"],#dec:target .day[prop="31"] {top:125px;}

#dec:target .day[prop="2"],#dec:target .day[prop="9"],#dec:target .day[prop="16"],#dec:target .day[prop="23"],#dec:target .day[prop="30"]{ left:0px; }

#dec:target .day[prop="3"],#dec:target .day[prop="10"],#dec:target .day[prop="17"],#dec:target .day[prop="24"],#dec:target .day[prop="31"]{ left:25px; }

#dec:target .day[prop="4"],#dec:target .day[prop="11"],#dec:target .day[prop="18"],#dec:target .day[prop="25"]{ left:50px; }

#dec:target .day[prop="5"],#dec:target .day[prop="12"],#dec:target .day[prop="19"],#dec:target .day[prop="26"],#dec:target .day[prop="29"]{ left:75px; }

#dec:target .day[prop="6"],#dec:target .day[prop="13"],#dec:target .day[prop="20"],#dec:target .day[prop="27"] { left:100px; }

#dec:target .day[prop="7"],#dec:target .day[prop="14"],#dec:target .day[prop="21"],#dec:target .day[prop="28"]{ left:125px; }

#dec:target .day[prop="1"],#dec:target .day[prop="8"],#dec:target .day[prop="15"],#dec:target .day[prop="22"],#dec:target .day[prop="29"]{ left:150px; }
​
</style>
<title>Insert title here</title>
</head>
<body>
<div id="cal">
    <div id="jan" class="month">
        <div id="feb" class="month">
            <div id="mar" class="month">
                <div id="apr" class="month">
                    <div id="may" class="month">
                        <div id="jun" class="month">
                            <div id="jul" class="month">
                                <div id="aug" class="month">
                                    <div id="sep" class="month">
                                        <div id="oct" class="month">
                                            <div id="nov" class="month">
                                                <div id="dec" class="month">
               <div id="header">                                     
                <h2 jan>January</h2>
                <h2 feb>February</h2>
                <h2 mar>March</h2>
                <h2 apr>April</h2>
                <h2 may>May</h2>
                <h2 jun>June</h2>
                <h2 jul>July</h2>
                <h2 aug>August</h2>
                <h2 sep>September</h2>
                <h2 oct>October</h2>
                <h2 nov>November</h2>
                <h2 dec>December</h2>
                
                <a href="#feb" class="monthLink right" jan> &rarr; </a>
                <a href="#jan" class="monthLink left" feb> &larr; </a>
                <a href="#mar" class="monthLink right" feb> &rarr; </a>
                <a href="#feb" class="monthLink left" mar> &larr; </a>
                <a href="#apr" class="monthLink right" mar> &rarr; </a>
                    
                <a href="#mar" class="monthLink left" apr> &larr; </a>
                <a href="#may" class="monthLink right" apr> &rarr; </a>
                <a href="#apr" class="monthLink left" may> &larr; </a>
                <a href="#jun" class="monthLink right" may> &rarr; </a>
                <a href="#may" class="monthLink left" jun> &larr; </a>
                <a href="#jul" class="monthLink right" jun> &rarr; </a>
                <a href="#jun" class="monthLink left" jul> &larr; </a>
                <a href="#aug" class="monthLink right" jul> &rarr; </a>
                <a href="#jul" class="monthLink left" aug> &larr; </a>
                <a href="#sep" class="monthLink right" aug> &rarr; </a>
                <a href="#aug" class="monthLink left" sep> &larr; </a>
                <a href="#oct" class="monthLink right" sep> &rarr; </a>
                <a href="#sep" class="monthLink left" oct> &larr; </a>
                <a href="#nov" class="monthLink right" oct> &rarr; </a>
                <a href="#oct" class="monthLink left" nov> &larr; </a>
                <a href="#dec" class="monthLink right" nov> &rarr; </a>
                <a href="#nov" class="monthLink left" dec> &larr; </a>
                    </div>
<div id="numbers">                    
<input type="radio" checked name="days" id="one"><label class="day" prop="1" for="one">1</label><div class="bigDate" prop="1">1st</div>
<input type="radio" name="days" id="two"><label class="day" prop="2" for="two">2</label><div class="bigDate" prop="2">2nd</div>
<input type="radio" name="days" id="three"><label class="day" prop="3" for="three">3</label><div class="bigDate" prop="3">3rd</div>
<input type="radio" name="days" id="four"><label class="day" prop="4" for="four">4</label><div class="bigDate" prop="4">4th</div>
<input type="radio" name="days" id="five"><label class="day" prop="5" for="five">5</label><div class="bigDate" prop="5">5th</div>
<input type="radio" name="days" id="six"><label class="day" prop="6" for="six">6</label><div class="bigDate" prop="6">6th</div>
<input type="radio" name="days" id="seven"><label class="day" prop="7" for="seven">7</label><div class="bigDate" prop="7">7th</div>
<input type="radio" name="days" id="eight"><label class="day" prop="8" for="eight">8</label><div class="bigDate" prop="8">8th</div>
<input type="radio" name="days" id="nine"><label class="day" prop="9" for="nine">9</label><div class="bigDate" prop="9">9th</div>
<input type="radio" name="days"  id="ten"><label class="day" prop="10" for="ten">10</label><div class="bigDate" prop="10">10th</div>
<input type="radio" name="days"  id="eleven"><label class="day" prop="11" for="eleven">11</label><div class="bigDate" prop="11">11th</div>
<input type="radio" name="days"  id="twelve"><label class="day" prop="12" for="twelve">12</label><div class="bigDate" prop="12">12th</div>
<input type="radio" name="days"  id="thirteen"><label class="day" prop="13" for="thirteen">13</label><div class="bigDate" prop="13">13th</div>
<input type="radio" name="days"  id="fourteen"><label class="day" prop="14" for="fourteen">14</label><div class="bigDate" prop="14">14th</div>
<input type="radio" name="days"  id="fifteen"><label class="day" prop="15" for="fifteen">15</label><div class="bigDate" prop="15">15th</div>
<input type="radio" name="days"  id="sixteen"><label class="day" prop="16" for="sixteen">16</label><div class="bigDate" prop="16">16th</div>
<input type="radio" name="days"  id="seventeen"><label class="day" prop="17" for="seventeen">17</label><div class="bigDate" prop="17">17th</div>
<input type="radio" name="days"  id="eightteen"><label class="day" prop="18" for="eightteen">18</label><div class="bigDate" prop="18">18th</div>
<input type="radio" name="days"  id="nineteen"><label class="day" prop="19" for="nineteen">19</label><div class="bigDate" prop="19">19th</div>
<input type="radio" name="days"  id="twenty"><label class="day" prop="20" for="twenty">20</label><div class="bigDate" prop="20">20th</div>
<input type="radio" name="days"  id="twentyone"><label class="day" prop="21" for="twentyone">21</label><div class="bigDate" prop="21">21st</div>
<input type="radio" name="days"  id="twentytwo"><label class="day" prop="22" for="twentytwo">22</label><div class="bigDate" prop="22">22nd</div>
<input type="radio" name="days"  id="twentythree"><label class="day" prop="23" for="twentythree">23</label><div class="bigDate" prop="23">23rd</div>
<input type="radio" name="days"  id="twentyfour"><label class="day" prop="24" for="twentyfour">24</label><div class="bigDate" prop="24">24th</div>
<input type="radio" name="days"  id="twentyfive"><label class="day" prop="25" for="twentyfive">25</label><div class="bigDate" prop="25">25th</div>
<input type="radio" name="days"  id="twentysix"><label class="day" prop="26" for="twentysix">26</label><div class="bigDate" prop="26">26th</div>
<input type="radio" name="days"  id="twentyseven"><label class="day" prop="27" for="twentyseven">27</label><div class="bigDate" prop="27">27th</div>
<input type="radio" name="days"  id="twentyeight"><label class="day" prop="28" for="twentyeight">28</label><div class="bigDate" prop="28">28th</div>
<input type="radio" name="days"  id="twentynine"><label class="day" prop="29" for="twentynine">29</label><div class="bigDate" prop="29">29th</div>
<input type="radio" name="days"  id="thirty"><label class="day" prop="30" for="thirty">30</label><div class="bigDate" prop="30">30th</div>
<input type="radio" name="days"  id="thirtyone"><label class="day" prop="31" for="thirtyone">31</label><div class="bigDate" prop="31">31st</div>
                    </div>


                    </div>
                    </div>
                    </div>   
                    </div>
                    </div>
                    </div>  
                    </div>
                    </div>
                    </div>                      
            </div>
        </div>
    </div>
</div>​
</body>
</html>