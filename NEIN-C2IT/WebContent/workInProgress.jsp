<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="layout.css" ... />
        <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico">
        <title>Logout</title>
    </head>


<script type="text/javascript">
function btnClick() { 
    close(); 
/*     if(!close())
    	{
    	alert("Oops sorry \n \n \t \t Click on back button");
    	} */
}
</script>
<style type="text/css">
.color-grey
{ background-color: #555;
  border-radius: 55px;}
.color-grey:hover 
{ background: red;
  border-radius: 55px;}
.center{
text-align: center;
font-size: 18px;

}
#pa{

  background-color: white;
}
div {
/*   background: #466368;
  background: radial-gradient(#648880, #293f50); */
  border-radius: 55px;
  height: 220px;
  /* background-image: images/workInProgress.jpg; */
  background: url("images/workInProgress.jpg") 50px 10% no-repeat,url("images/workInProgress.jpg") 820px 0 no-repeat, linear-gradient(red, #5c9e19);
}
</style>


    </head>
    








    <body>
      <div>
     <section class="center">
       <h1>Work in <ins>Progress</ins></h1>
       <h6>Patience is not the ability to wait, <br> but how you act while you're waiting.</h6>
        </section>
        <br>
        <br>
        <br>  <br>
      <br>
        <p class="center" style="font-size:16px;color:black">
        <input class="color-grey" type="button" value="Back" onclick="history.go(-1);" />
        <input class="color-grey" type="button" value="Close" onclick="btnClick();"></p>
      <br>
      <br>
      
      <p align="right">
           
                <font color="blue" style="font-size:12px;">&copy;<i>2016 Developing by NEIN HO IT.</i></font>
      </p>
      </div>
    </body>

    
</html>