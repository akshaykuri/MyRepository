<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<head>

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Conference room Booking</title>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>
 
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
 <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

  
 
 <script type="text/javascript">  
 
 function senddate(id)  
     {  
	 d1=id.substring(4,5);
	 var date=document.getElementById("date1"+id1).value;
     var fromtime=document.getElementById("timef"+id1).value;
     var totime=document.getElementById("timeto"+id1).value;
     var branch=document.getElementById("branchid").value;
     var room= document.getElementById("roomid").value;
    if(branch=="select")
	   {
	   alert('Please select branch');
	   return false; 
	   }
     if(room=="select")
	   {
	   alert('Please select Room type');
	   return false; 
	   }
     if (typeof XMLHttpRequest != "undefined")
    	  {    
    	  xmlHttp= new XMLHttpRequest();    
    	  }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	         var url="ConRoomAjax.jsp";  
    		     url +="?date="+date+"&fromtime="+fromtime+"&totime="+totime+"&branch="+branch+"&room="+room;
    		     xmlHttp.onreadystatechange = getInfo1;  
    		     xmlHttp.open("GET", url, true);   
    		     xmlHttp.send(null);   
    		
	}      
	  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str=xmlHttp.responseText;
                             document.getElementById("resultFromAjax1").innerHTML = str;
                             document.getElementById("msg").value =  document.getElementById("msg1").value;
                             alert(document.getElementById("msg").value);
                             document.getElementById("date1"+id1).value="";
                             }
             } 
</script>
   
   
    <script type="text/javascript">  
 
 function senddate1(id)  
     {  
	 id1=id.substring(5,6);
	 var date=document.getElementById("date1"+id1).value;
     var fromtime=document.getElementById("timef"+id1).value;
     var totime=document.getElementById("timeto"+id1).value;
     var branch=document.getElementById("branchid").value;
    var room= document.getElementById("roomid").value;
    
   if(branch=="select")
	{
	   alert('Please select branch');
	   return false; 
	}
   
   if(room=="select")
	{
	   alert('Please select Room type');
	   return false; 
	}
       	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	         var url="ConRoomAjax.jsp";  
    		    url +="?date="+date+"&fromtime="+fromtime+"&totime="+totime+"&branch="+branch+"&room="+room;
    		  //  alert(url);
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);   
    		
	}      
	  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str=xmlHttp.responseText;
                              
                             document.getElementById("resultFromAjax1").innerHTML = str;
                             document.getElementById("msg").value =  document.getElementById("msg1").value;
                             alert(document.getElementById("msg").value);
                             alert(document.getElementById("msg1").value);
                             document.getElementById("date1"+id1).value="";
                            }
             } 
</script> 
   
   <script type="text/javascript">  
 
 function senddate2(id)  
           {  
//	 alert("hereee innnnnnnnnnnnnn    senddate2");
	// alert("id----"+id);
	 id1=id.substring(3,4);
	// alert("id1----"+id1);
	 
	var date=document.getElementById("date1"+id1).value;
  //  alert("date--"+date);
    
    var fromtime=document.getElementById("timef"+id1).value;
   // alert("fromtime--"+fromtime);
    
    var totime=document.getElementById("timeto"+id1).value;
   // alert("fromtime--"+totime);
    
    var branch=document.getElementById("branchid").value;
  //  alert("branch--"+branch);
   var room= document.getElementById("roomid").value;
   //alert("room--"+room);
   
   if(branch=="select")
	{
	   alert('Please select branch');
	   return false; 
	}
   
   if(room=="select")
	{
	   alert('Please select Room type');
	   return false; 
	}
   
       	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="ConRoomAjax.jsp";  
    		    url +="?date="+date+"&fromtime="+fromtime+"&totime="+totime+"&branch="+branch+"&room="+room;
    		  //  alert(url);
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);   
    		
	}      
	  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str=xmlHttp.responseText;
                              
                             document.getElementById("resultFromAjax1").innerHTML = str;
                             document.getElementById("msg").value =  document.getElementById("msg1").value;
                             alert(document.getElementById("msg").value);
                            // alert(document.getElementById("msg1").value);
                             document.getElementById("date1"+id1).value="";
                            }
             } 
</script>

<script type="text/javascript">  
 
 function senddate3(id)  
           {  
	//alert("hereee innnnnnnnnnnnnn   senddate3");
	// alert("id----"+id);
	 id1=id.substring(3,4);
	// alert("id1----"+id1);
	 
	var date=document.getElementById("date1"+id1).value;
  //  alert("date--"+date);
    
    var fromtime=document.getElementById("timef"+id1).value;
   // alert("fromtime--"+fromtime);
    
    var totime=document.getElementById("timeto"+id1).value;
   // alert("fromtime--"+totime);
    
    var branch=document.getElementById("branchid").value;
   // alert("branch--"+branch);
   var room= document.getElementById("roomid").value;
  // alert("room--"+room);
    
   if(branch=="select")
	{
	   alert('Please select branch');
	   return false; 
	}
   if(room=="select")
	{
	   alert('Please select Room type');
	   return false; 
	}
   
   
       	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="ConRoomAjax.jsp";  
    		    url +="?date="+date+"&fromtime="+fromtime+"&totime="+totime+"&branch="+branch+"&room="+room;
    		  //  alert(url);
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);   
    		
	}      
	  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str=xmlHttp.responseText;
                              
                             document.getElementById("resultFromAjax1").innerHTML = str;
                             document.getElementById("msg").value =  document.getElementById("msg1").value;
                             alert(document.getElementById("msg").value);
                           //  alert(document.getElementById("msg1").value);
                             document.getElementById("date1"+id1).value="";
                            }
             } 
</script>

<script type="text/javascript">  
 
 function senddate4(id)  
           {  
	//alert("hereee innnnnnnnnnnnnn   senddate4");
//	 alert("id----"+id);
	 id1=id.substring(3,4);
	// alert("id1----"+id1);
	 
	var date=document.getElementById("date1"+id1).value;
 //   alert("date--"+date);
    
    var fromtime=document.getElementById("timef"+id1).value;
    //alert("fromtime--"+fromtime);
    
    var totime=document.getElementById("timeto"+id1).value;
  //  alert("fromtime--"+totime);
    
    var branch=document.getElementById("branchid").value;
    //alert("branch--"+branch);
   var room= document.getElementById("roomid").value;
 //  alert("room--"+room);
    
   if(branch=="select")
	{
	   alert('Please select branch');
	   return false; 
	}
   if(room=="select")
	{
	   alert('Please select Room type');
	   return false; 
	}
       	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="ConRoomAjax.jsp";  
    		    url +="?date="+date+"&fromtime="+fromtime+"&totime="+totime+"&branch="+branch+"&room="+room;
    		  //  alert(url);
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);   
    		
	}      
	  
  function getInfo1()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str=xmlHttp.responseText;
                              
                             document.getElementById("resultFromAjax1").innerHTML = str;
                             document.getElementById("msg").value =  document.getElementById("msg1").value;
                             alert(document.getElementById("msg").value);
                           //  alert(document.getElementById("msg1").value);
                             document.getElementById("date1"+id1).value="";
                            }
             } 
</script>

   
        
    
 <script>
		var id2 =0;
		$(document).ready(function() {
			
			$('#button').click(function () {
				 // alert("here");
				  var i=1;
				  var isvalid=true;
				  $( "input" ).each(function( i ) {
				  if(isvalid!=false){
				  if($("#date1" +i).val()=="")
				  {
				  alert("Enter date");
				  isvalid =false;
				  }}
				 
				  if(isvalid!=false){
					  if(($("#timef" +i).val()=="") || ($("#timef" +i).val()=="HRf:MMf"))
					  {
					  alert("Enter From time");
					  isvalid =false;
					  }}
				  
				  if(isvalid!=false){
					  if(($("#timeto" +i).val()=="") || ($("#timeto" +i).val()=="HRf:MMf"))
					  {
					  alert("Enter  To time");
					  isvalid =false;
					  }}
				  
					  });
				  
				  
				  return isvalid;
				   

				  });
			
			
			
	//alert("hiiiii1111111");
			// Add button functionality
			 $("table.dynatable2 button.add").click(function() {
				id2++;
			//	alert("ID :"+id);
				var master = $(this).parents("table.dynatable2");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype2").clone();
				prot.attr("class", "");
				prot.find(".id2").attr("value",id2);
				//alert(value);
				
				prot.find(".date1").attr("id","date1"+id2);
				
				prot.find(".timef").attr("id","idf"+id2);
				prot.find(".mmf").attr("id","id1"+id2);
				
				prot.find(".timet").attr("id","hrt"+id2);
				prot.find(".mmt").attr("id","idt1"+id2);
				
				prot.find(".timefc").attr("id","timef"+id2);
				prot.find(".timetoc").attr("id","timeto"+id2);
				
				prot.find(".hrfc").attr("id","hrf"+id2);
				
				prot.find(".buttonc").attr("id","buttonc"+id2);
				
			//
				master.find("tbody").append(prot);
				
			 	$('#date1'+ id2).datepicker( {
		      	       changeMonth:true,
		     	       changeYear:true,
		     	       yearRange:"-50:+50",
		     	       minDate: 0,
		     	       dateFormat:"yy-mm-dd" } ); 
		
		});
			
			 var id =0;
			 $("table.dynatable button.add").click(function() {
					id++;
					//alert("ID :"+id);
					var master = $(this).parents("table.dynatable");
				  // Get a new row based on the prototype row
					var prot = master.find(".prototype").clone();
					prot.attr("class", "");
					prot.find(".id").attr("value",id);
					//alert(value);
					prot.find(".amenc").attr("id","ament"+id);
					
					prot.find(".quanc").attr("id","quant"+id); 
					prot.find(".remarksc").attr("id","aremarks"+id);
					
					master.find("tbody").append(prot);
			});
			
			 var id1 =0;
			 $("table.dynatable1 button.add").click(function() {
					id1++;
				//	alert("ID :"+id);
					var master = $(this).parents("table.dynatable1");
				  // Get a new row based on the prototype row
					var prot = master.find(".prototype1").clone();
					prot.attr("class", "");
					prot.find(".id1").attr("value",id1);
					//alert(value);
					prot.find(".vcbranch").attr("id","vcbranch"+id1);
					
				
					master.find("tbody").append(prot);
			});
			// Remove button functionality
		$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			
			$("#dynatable2").on('click','.remove2',function(){
			       $(this).closest("#tr3").remove();
			       id2--;
			     });
		
		$("#dynatable").on('click','.remove',function(){
		       $(this).closest("#tr1").remove();
		       id--;
		     });
		
		$("#dynatable1").on('click','.remove1',function(){
		       $(this).closest("#tr2").remove();
		       id1--;
		     });
		
	
		});
	</script>
       

<script>
$(function() 
		  {   
	      $( "#datef1" ).datepicker({
		       changeMonth:true,
		       changeYear:true,
		       yearRange:"-50:+50",
		       minDate: 0,
		       dateFormat:"yy-mm-dd" });
		   });
</script> 

 <style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
</style>

<style>
			.dynatable1 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable1 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable1 .prototype1 {
				display:none;
			}
</style>

<style>
			.dynatable2 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable2 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable2 .prototype2 {
				display:none;
			}
</style>

<style type="text/css">
.multiselect {
  width: 200px;
}
.multiselect1 {
  width: 200px;
}
.selectBox {
  position: relative;
}
.selectBox1 {
  position: relative;
}
.selectBox select {
  width: 100%;
  font-weight: bold;
}
.selectBox1 select {
  width: 100%;
  font-weight: bold;
}
.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
}
#checkboxes1 {
  display: none;
  border: 1px #dadada solid;
}
#checkboxes label {
  display: block;
  
}
#checkboxes1 label {
  display: block;
  
}
#checkboxes label:hover {
  background-color: #1e90ff;
}

#checkboxes1 label:hover {
  background-color: #1e90ff;
}
}
</style>

<script type="text/javascript">
var expanded = false;
		 function showCheckboxes() 
		{
			//alert("I came here");
		  var checkboxes = document.getElementById("checkboxes");
		  if (!expanded) {
		    checkboxes.style.display = "block";
		    expanded = true;
		    var values = $('input:checkbox:checked.group1').map(function () {
				   return this.value;
				  
				 }).get(); 
		 //   alert(values);
		    $("#BranchHr").val(values);
		    } else {
		    checkboxes.style.display = "none";
		    expanded = false;
		  }
		
		  //alert(values);
		  }
</script>

<script type="text/javascript">
var expanded = false;
		 function showCheckboxes1() 
		{
			//alert("I came here");
		  var checkboxes = document.getElementById("checkboxes1");
		  if (!expanded) {
		    checkboxes.style.display = "block";
		    expanded = true;
		    var values = $('input:checkbox:checked.group2').map(function () {
				   return this.value;
				  
				 }).get(); 
		 //   alert(values);
		    $("#BranchIt").val(values);
		    } else {
		    checkboxes.style.display = "none";
		    expanded = false;
		  }
		
		  //alert(values);
		  }
</script>

<script  type="text/javascript">
<% 
String msg[] = request.getQueryString().toString().split("=");

String disp = msg[1].toString();
disp = disp.replace("%20", "");
disp = disp.replace("%27", " ");
disp = disp.replace("__","   ");

    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

		
<script type="text/javascript">  
 function sendInfo(v)  
           {  
    	   if (typeof XMLHttpRequest != "undefined")
    	          {    
    		      xmlHttp= new XMLHttpRequest();    
    		      }
    	   else if (window.ActiveXObject)
    	          {    
    		      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
    		      } 
    	   if (xmlHttp==null)
    	          {   
    		      alert("Browser does not support XMLHTTP Request");   
    		      return;     
    		      }      
    	    var url="empdetails.jsp";  
    		    url +="?emp_id=" +v;
    		    xmlHttp.onreadystatechange = getInfo;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
 
 function sendInfo1(v)  
 {  
 if (typeof XMLHttpRequest != "undefined")
        {    
	      xmlHttp= new XMLHttpRequest();    
	      }
 else if (window.ActiveXObject)
        {    
	      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
	      } 
 if (xmlHttp==null)
        {   
	      alert("Browser does not support XMLHTTP Request");   
	      return;     
	      }      
  var url="empdetails1.jsp";  
	    url +="?emp_id=" +v;
	    xmlHttp.onreadystatechange = getInfo;  
	    xmlHttp.open("GET", url, true);   
	    xmlHttp.send(null);    
   }  
 
  function getInfo()
             {     
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                            { 
               	             var str2=xmlHttp.responseText;
               	             
                             // alert("here ");
                             document.getElementById("resultFromAjax1").innerHTML = str2;
                             document.getElementById("uname").value =  document.getElementById("p1").value;
                             document.getElementById("uemail").value= document.getElementById("p2").value;
                             document.getElementById("ubranch").value= document.getElementById("p3").value;
                             document.getElementById("udept").value= document.getElementById("p4").value;
                             
                             document.getElementById("bbranch").value =  document.getElementById("b1").value;
                             document.getElementById("bdept").value =  document.getElementById("b2").value;
                             
                            // var str3=xmlHttp.responseText;
                             
                             
                      		 }
             } 
</script>

<script language="javascript" type="text/javascript">     
     var xmlHttp;     
      var xmlHttp;      
      function showRoom(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="RoomTypeSelectPage.jsp";  
                           url +="?branchid=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("room").innerHTML=xmlHttp.responseText;    
                                                      } 
                                                              
            }  
</script>	

<script>
function admSelectCheck(nameSelect)
{
    console.log(nameSelect);
    if(nameSelect){
        admOptionValue = document.getElementById("vc").value;
        admOptionValue1 = document.getElementById("ac").value;
      admOptionValue2 = document.getElementById("webex").value;
     //alert(admOptionValue2);
        //alert("hiiii");
        if((admOptionValue == nameSelect.value) || (admOptionValue1 == nameSelect.value)){
            document.getElementById("divs").style.display = "block";
        }
        else{
            document.getElementById("divs").style.display = "none";
        }
        if(admOptionValue2 == nameSelect.value){
            document.getElementById("div").style.display = "block";
        }
        else{
            document.getElementById("div").style.display = "none";
        }
       
    }
    else{
        document.getElementById("divs").style.display = "none";
    }
}
</script>
	<script>
 function check(id) {
	// alert(id);
	 var id1=id.substring(3,4);
	// alert(id1);
	 
	// document.getElementById("inp1"+id1).value=document.getElementById("id1"+id1).value;
  
	 var x=document.getElementById("idf"+id1).value;
	// alert("hr----"+x);
	 var y=document.getElementById("id1"+id1).value;
	// alert("mm----"+y);
	 var z= document.getElementById("timef"+id1).value;
	
	 
	 document.getElementById("timef"+id1).value=x+":"+y;
//	 alert("z----"+z);
    } 
 </script>
 
 <script>
 function check1(id) {
	// alert(id);
	 var id1=id.substring(3,4);
	// alert(id1);
	 
	// document.getElementById("inp1"+id1).value=document.getElementById("id1"+id1).value;
  
	 var x=document.getElementById("idf"+id1).value;
	// alert("hr----"+x);
	 var y=document.getElementById("id1"+id1).value;
	// alert("mm----"+y);
	 var z= document.getElementById("timef"+id1).value;
	
	 
	 document.getElementById("timef"+id1).value=x+":"+y;
	// alert("z----"+z);
	 
	     } 
 </script>

 
 <script>
 function checkt(id) {
	// alert(id);
	 var id1=id.substring(3,4);
	// alert(id1);
	 

	  
	 var m=document.getElementById("hrt"+id1).value;
	// alert("hr----"+m);
	 var n=document.getElementById("idt1"+id1).value;
//	 alert("mm----"+n);
	 var p= document.getElementById("timeto"+id1).value;
	
	 
	 document.getElementById("timeto"+id1).value=m+":"+n;
	// alert("p----"+p);
	  var s=document.getElementById("idf"+id1).value;
	 // alert("s----"+s);
	  if(s=="HRf")
		 {
		 alert("Select From time");
		 document.getElementById("idf"+id1).value='HR';
		 }
	  if(+m < +s)
		 {
		 alert("Follow 24 hour format");
		 document.getElementById("hrt"+id1).value='HRt';
		 }
	 
	  
	
    } 
 </script>
 <script>
 function checkt1(id) {
	// alert(id);
	 var id1=id.substring(4);
	// alert(id1);
	 
	// document.getElementById("inp1"+id1).value=document.getElementById("id1"+id1).value;
  
	 var m=document.getElementById("hrt"+id1).value;
	// alert("hr----"+m);
	 var n=document.getElementById("idt1"+id1).value;
	// alert("mm----"+n);
	 var p= document.getElementById("timeto"+id1).value;
	
	 
	 document.getElementById("timeto"+id1).value=m+":"+n;
//	 alert("p----"+p);
	 
	 var date=document.getElementById("date1"+id1).value;
	//alert(date); 
	  var fromtime=document.getElementById("timef"+id1).value;
	//  alert(fromtime);
	
	  var totime=document.getElementById("timeto"+id1).value;
	//  alert(totime);
	   var x=1;
	      for(i=2;i<=id1;i++)
	    	  {
	    	 
	    	 // alert("x--"+x);
	    	  var date1=document.getElementById("date1"+x).value;
	    	// alert("date1--"+date1);
	    	 
	    	  if(date==date1)
	    		  {
	    		  var fromtime1=document.getElementById("timef"+x).value;
	    		//  alert("fromtime1--"+fromtime1);
	    		  var totime1=document.getElementById("timeto"+x).value;
	    		 // alert("totime1--"+totime1);
	    		  
	    		 // alert("hiii");
	    		  if((fromtime==fromtime1 && totime==totime1) ||
	    			(fromtime==fromtime1 && totime<=totime1) ||
	    			(fromtime>=fromtime1 && totime==totime1)||
	    			(fromtime<=fromtime1 && totime==totime1) ||
	    			(fromtime<fromtime1 && totime==totime1)||
	    			(fromtime==fromtime1 && totime>=fromtime1)||
	    			(fromtime<fromtime1 && totime>totime1) ||
	    			(fromtime>=fromtime1 && totime<=totime1) ||
	    			(fromtime<totime1 && totime>=totime1) ||
	    			(fromtime<fromtime1 && totime==fromtime1) ||
	    			(fromtime==totime1 && totime>=totime1) ||
	    			(fromtime<fromtime1 && (totime<totime1 && totime>fromtime1))
	    		  )
	    			  {
	    			  alert("Selected timing you have already used");
	    			  document.getElementById("idf"+id1).value='HRf';
	    			  document.getElementById("id1"+id1).value='MMf';
	    			  document.getElementById("hrt"+id1).value='HRt';
	    			  document.getElementById("idt1"+id1).value='MMt';
	    			  }
	    		  
	    		  }
	    	  x++;
	    	  } 
    } 
 </script>

  <style type="text/css">
        body
        {
            font-size: 9pt;
            font-family: Arial;
        }
    </style>
  <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
    </script>
    
    <SCRIPT language=Javascript>
      <!--
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
      //-->
   </SCRIPT>
    <script>
  function  validateForm()
    {  
	  
    
    	var meetingtype=document.getElementById("meetingid");
    	var branch=document.getElementById("branchid");
   	    var dept=document.getElementById("deptid");
	   var purpose=document.getElementById("purposeid");
	   var room=document.getElementById("roomid");
	   var fromh=document.getElementById("id");
	   var fromm=document.getElementById("id1");
	   var toh=document.getElementById("idt");
	   var tom=document.getElementById("idt1");
	  //var date1=document.getElementByName("date1");
	   
    	if(meetingtype.value=="select")
		{
		   alert('Please select meeting type');
		   return false; 
		   
		}
    	
 	   if(branch.value=="select")
		{
		   alert('Please select branch');
		   return false; 
		}
 	    //return true;
 	  
	    if(dept.value=="select")
		{
		   alert('Please select department');
		   return false; 
		}
	    //return true;
	    
	    if(purpose.value=="select")
		{
		   alert('Please select purpose');
		   return false; 
		}
	    //return true;
	    
	   if(room.value=="select")
		{
		   alert('Please select Room type');
		   return false; 
		}
	  //return true;
	   
	    if(fromh.value=="HRf")
		{
		   alert('Please select TIME');
		   return false; 
		}
	   //return true;
	  
	    if(fromm.value=="MMf")
		{
		   alert('Please select TIME');
		 //  focus();
		   return false; 
		}
	  // return true;
	   
	    if(toh.value=="HRt")
		{
		   alert('Please select TIME');
		   return false; 
		}
	 //  return true;
	  
	    if(tom.value=="MMt")
		{
		   alert('Please select TIME');
		   return false; 
		}
	
		return true;
    }
    </script>
    
    <script>
   $(document).ready(function () {
	   var $tbl = $('#table1');
	     $('#Button1').click(function(){
	        var num = $('input[id="Text1"]').val();
	            //alert(num);
	            $tbl.find('.row').remove();
	            for(var i=1;i<=num;i++){
	            	
	            $('table[id="table1"]').append(' <tr class="row"><td><input type="text" name="rr1"></td><td><input type="text" name="rr"></td><td><select name="type"><option value="Host/Leader">Host/Leader</option><option value="Participant">Participant</option></select></td></tr>');

	        }
	        });
	    });
</script>

<script>
function addDate(){
date = new Date();
var month = date.getMonth()+1;
var day = date.getDate();
var year = date.getFullYear();

if (document.getElementById('current').value == ''){
document.getElementById('current').value = year + '-' + month + '-' + day;
}
}
</script>

    
</head>
<body onload="addDate();">
<form  name="form" id="myform"  onsubmit="return validateForm();" method="post"  action="ConRoomBookingBack.jsp" >
<br><br>

 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
     
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">CONFERENCE/MEETING ROOM BOOKING</font></strong></td>
</tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
                <%-- <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("empid")%>" >        
                </td>
 </tr>
</table>
<br>

<center>
 
	 <br />
 <%
String b_no=null;
b_no = (String) session.getAttribute("bno");
System.out.println("b_no :"+b_no);
%>
	 <br />
<%
Connection cnn1 = null,cnn2=null,cnn3=null,cnn4=null;
Statement stt1= null,stt2=null,stt3=null,stt4=null; 
ResultSet rss1 = null,rss2=null,rss3=null,rss4=null;Connection cnn5 = null; 
Statement stt5 = null; 
ResultSet rss5 = null; 
try{
cnn1 = con.getConnection2();
stt1=cnn1.createStatement();
rss1 = stt1.executeQuery("select b_name,b_location from branch_master ORDER BY b_name Asc"); 

cnn2 = con.getConnection2();
stt2=cnn2.createStatement();
rss2 = stt2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cnn4 = con.getConnection2();
stt4=cnn4.createStatement();
rss4 = stt4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

String b_id = null;
int id=0;
String id2=null;
cnn3 = con.getConnection2();
stt3=cnn3.createStatement();
//rs3 = st3.executeQuery("SELECT max(idextend),substr(form1_it_clearance.form1_no,18,4),substr(form1_it_clearance.form1_no,1,17) From form1_it_clearance WHERE '"+b_no+"'=substr(form1_it_clearance.form1_no,15,2) GROUP BY form1_no");
rss3 = stt3.executeQuery("SELECT max(idextend) FROM conference_room_booking WHERE Booking_no IN(SELECT Booking_no FROM conference_room_booking LEFT JOIN branch_master b ON(substr(Booking_no,16,2)=b.b_no) WHERE '"+b_no+"'=b.b_no GROUP BY Booking_no)");
//rs3 = st3.executeQuery("SELECT MAX(idextend) FROM mr_master WHERE mr_id IN(SELECT mr_id FROM mr_master Left Join branch_master b ON (substr(mr_id,9,2)=b.b_no)  WHERE '"+city_no+"'=b.b_no GROUP BY idextend)");
/* while ( rs_id.next() )
{   */  
	 if(rss3.next()){
	
	try
	{
		id=rss3.getInt(1);
		if(id==0)
 			id=0;
		System.out.println("ID VALUE "+id);
		if(id2==null)
 			id2="NEIN/CS/BOOKNo/"+b_no+"-";
		//id2= rs_id.getString(3);
		System.out.println("ID2 VALUE "+id2);
            id++;     
			//System.out.println("Gen id "  +rs_id.getInt(1));
			//new_id = "" +String.valueOf(id);
		System.out.println("ID VALUE ++ "+id);	
			b_id = id2+String.valueOf(id);
			System.out.println("BOOKING--- "  +b_id);
		
	}
	catch(SQLException ex)
	{
		  System.out.println(ex.toString());
		  b_id = "NEIN/CS/BOOKNo/90-1";
	    }
	//System.out.println("new Id **************************222222222: "  +new_id);
}
%>
<label><b><font color="#156e72" size="4">BOOKING PERSON DETAILS</font></b></label>
<table width="75%" border="1" align="center" bgcolor="#d2f7f3">
<tr>
<td>Booking Ref Number</td>
<td>
 <input name="booking_no" readonly="readonly" value=" <%=b_id%>" size="25" />
 <input type="hidden"  name="bno" value="<%=b_no%>" size="25" />                              
</td>
<%

String empid=null;
empid = (String) session.getAttribute("empid");

Connection conn = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("leavemanagement");
String userName = dbProperties.getString("leavemanagement.username");
String password = dbProperties.getString("leavemanagement.password");
String url = dbProperties.getString("leavemanagement.url");
String driver = dbProperties.getString("leavemanagement.driverName");
String dbName = dbProperties.getString("leavemanagement.dbName");

Statement st=null;
ResultSet rs=null; 
try
{
	Class.forName(driver).newInstance();
	conn= DriverManager.getConnection(url+dbName,userName,password);
	String query = "SELECT u.full_name,u.email,u.branch_id,u.department_id,b.branch_name,d.department_name FROM user u INNER JOIN branchmaster b on b.branch_id=u.branch_id INNER JOIN department d on d.department_id=u.department_id WHERE (u.emp_id='"+empid+"');";
	st = conn.createStatement();
	rs= st.executeQuery(query);
	%>
    <%while(rs.next()){ %>
    <td>Emp Id</td>
     <td><input type="text" name="emp_id" id="emp_id" value="<%=session.getAttribute("empid")%>" readonly/></td>
    </tr>
    <tr>
    <td>Email Id</td>
    <td><input type="text" name="uemail" id="uemail" value="<%=rs.getString("email")%>" readonly/></td>
    <td>Name(Booking Person)</td>
    <td><input type="text" name="uname" id="uname" value="<%=rs.getString("full_name")%>" readonly/></td>
    </tr>
    <tr>  
    <td>Branch)</td>
    <td><input type="text" name="ubranch" id="ubranch" value="<%=rs.getString("branch_name")%>" readonly/></td>
    <td>Department</td>
    <td><input type="text" name="udept" id="udept" value="<%=rs.getString("department_name")%>" readonly/></td>
    </tr>
    </table>
<%}%>

<%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             conn.close();
                                        			}%>  



<br>
<br>
<label><b><font color="#156e72" size="4">ENTER BOOKING DETAILS</font></b></label>
<table width="75%" border="1" align="center" bgcolor="#d2f7f3">
 <tr>
<td>Booking for(Person Name)</td>
<td><input type="text" name="bname" id="bname" onkeyup="sendInfo1(this.value)" required/></td>

<td>Branch</td>
<td>
 <%Connection con1 = null;
                                                /*   String url = "jdbc:mysql://localhost:3306/";
                                                  String db = "csdb";
                                                  String driver= "com.mysql.jdbc.Driver";
                                                  String userName ="root";
                                                  String password=""; */
                                                  // int sumcount=0;
                                                  ResourceBundle dbProperties1 = ResourceBundle.getBundle("csdb");
                                                  String userName1 = dbProperties1.getString("csdb.username");
                                                  String password1 = dbProperties1.getString("csdb.password");
                                                  String url1 = dbProperties1.getString("csdb.url");
                                                  String driver1= dbProperties1.getString("csdb.driverName");
                                                  String dbName1 = dbProperties1.getString("csdb.dbName");

                                                  Statement st1=null;
                                                  ResultSet rs1=null; 
                                                  int flag=0;
                                                  try
                                                     {
                                                	  Class.forName(driver).newInstance();
                                                	  con1= DriverManager.getConnection(url1+dbName1,userName1,password1);
                                                     String query = "select * from vc_branchmaster ORDER BY branch_name";
                                                     st1 = con1.createStatement();
                                                     rs1= st1.executeQuery(query);
                                                 %>
                                       <select name="branchid" id="branchid" onchange="showRoom(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus>      
                                       <option value="select">Select</option>
	                                            <%while(rs1.next()){ flag=1;%>
			                                    <option value="<%=rs1.getString("branch_id")%>"><%=rs1.getString("branch_name")%></option>
    	                                        <%}%>
	                                  </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
                                            	  con1.close();
                                        			}%> 
 
</td>
</tr>
<tr>
<td>Department</td>
<td> <%
                                                 
                                                  Statement st2=null;
                                                  ResultSet rs2=null; 
                                                  int flag1=0;
                                                  try
                                                     {
                                                	  Class.forName(driver).newInstance();
                                                	  con1= DriverManager.getConnection(url+dbName,userName,password);
                                                     String query = "select * from leavemanagement.department ORDER BY department_name";
                                                     st2 = con1.createStatement();
                                                     rs2= st2.executeQuery(query);
                                                 %>
                                       <select name="bdept" id="deptid" onchange="showEmp(this.value)" style="font-size: 11px;width: 142px;overflow: auto;height: 20px " autofocus required>      
                                       <option value="select">Select</option>
	                                            <%while(rs2.next()){ flag=1;%>
			                                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
    	                                        <%}%>
	                                  </select>

                                          <%} catch (SQLException ex) {
                                                     ex.printStackTrace();
                                                     }	
                                              finally{
	                                            	//	DbUtil.closeDBResources(rs,st,con);
		                                             con1.close();
                                        			}%>  </td>
<td>Purpose</td>
<td><select name="purpose" id="purposeid" required>
    <option value="select">Select</option>
    <option>Internal</option>
    <option>External</option>
</select></td>
</tr>

<tr>
<td>Booking Room Type
</td>
<td>
<div id='room'>      
                                              <select name="room" id="roomid" required style='font-size: 11px;width: 142px;overflow: auto;height: 20px'>   
                                                   <option value='select'>Select</option>  
                                                         </select>     
                                                            </div>

</td>
<td>Meeting Type</td>
<td><select id="meetingid" name="select" onchange="admSelectCheck(this);" >
<option value="select">Select</option>
<option id="vc">Video Conference</option>
<option id="ac">Audio Conference</option>
<option id="webex">Web-Ex Meeting</option>
<option>General Meeting</option>
<option>Others</option>
</select>
<br>

<div id="div" style="display:none;">
     Number of Web-Ex participants :<input type="text" id="Text1" name="Text1">
     
     <input id="Button1" type="button" value="Add" onclick="showRow()"/>
     <br>
     
     <table id="table1">
     <tr>
     <th>Name</th>
     <th>Email Id</th>
     <th>Type</th>
     </tr>
    
     <tr class="row">
    <td><input type="text" name="rr1" ></td>
    <td><input type="text" name="rr" ></td>
    <td><select name="type"><option value="Host/Leader">Host/Leader</option><option value="Participant">Participant</option></select></td>
  </tr>
     </table>
     </div>
<div id="divs" style="display:none;">
<p>Select VC/AC with Branch</p>
<table class="dynatable1" id="dynatable1" width="75%" border="1"  cellspacing="0" cellpadding="0" bgcolor="#d2f7f3">
  	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Select</font></td>
		    
	     </tr>
		 <tr class="prototype1" id="tr2">
		           <td width="2" align="center" height="21"><button class="remove1" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" name="id1[]" value="0" size=1 class="id1" readonly="readonly" /></td>
		           <td>
		                <% 
		                Connection con6 = null;
             
                        Statement st6=null;
                        ResultSet rs6=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						 con6= DriverManager.getConnection(url1+dbName1,userName1,password1);
						String query2 = "select * from vc_branchmaster ORDER BY branch_name";
						st6 = con6.createStatement();
 						rs6 = st6.executeQuery(query2);
						%>
					    <select name="vcbranch" class="vcbranch" id="vcbranch">
        					<option selected="selected">Select</option>
							<%while(rs6.next()){%>
								
										<option  value="<%=rs6.getString(3)%>"><%=rs6.getString(2)%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con6.close();
					   }%>	
				
		       </td>
              </tr>
</table>
		

</div>

</td>
</tr>
<tr>
<td>Date
</td>
<td colspan='4'>
 <!-- <input type="text" name="fromd" id="fromd" placeholder="Date"/>
<input type="text" name="date1" id="datef1" placeholder="Date"/> -->

<table class="dynatable2" id="dynatable2" width="75%" border="1"  cellspacing="0" cellpadding="0" bgcolor="#d2f7f3">
  	    <tr>
		     <td width="70" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Date </font></td>
		     <td ><font size="2" face="Swiss" id="hiderow">From Time </font></td>
		      
		     <td><font size="2" face="Swiss" id="hiderow">To Time </font></td> 
		     <!-- <td><font size="2" face="Swiss" id="hiderow">Check Availability</font></td>  -->
	     </tr>
		 <tr class="prototype2" id="tr3">
		           <td width="2" align="center" height="21"><button class="remove2" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" name="id2[]" id="sno" value="0" size=1 class="id2" readonly="readonly" /></td>
		           <td>
		          <input type="text" name="date1"  class="date1" id="date1" placeholder="Date" onchange=" return senddate1(this.id);"/>      
		       </td>
		      <!--  <td>
		          <input type="text" name="datet"  class="datet" id="datet" placeholder="Date" />      
		       </td> -->
		      
<td  width="5" align="center" height="21">
<select id="idf" class="timef" onChange="check(id),senddate2(this.id);">
<option value="HRf">HR</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>

</select>
<!-- <input type="text" class="hrfc" name="hrf" id="hrf" value=""> -->
<select id="id1" class="mmf" onChange="check1(id),senddate3(this.id);">
<option value="MMf">MM</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
<input type="hidden" class="timefc" name="timef" id="timef" value="">
<!-- <select id="id2"  onChange="check2();">
<option>AM/PM</option>
<option>AM</option>
<option>PM</option>
</select> -->


<br><!-- <input type="text" name="date2" id="date2" placeholder="Date"/> -->
</td>
<td>
<select id="hrt" class="timet" onChange="checkt(id),senddate4(this.id);">
<option value="HRt">HR</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select>

<select id="idt1" class="mmt" onChange="checkt1(id),senddate(this.id);";">
<option value="MMt">MM</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>

</select>
<input type="hidden" class="timetoc" name="timeto" id="timeto" value=""  >


</td>

              </tr>
</table>
<input type="hidden" id="msg" name="msg" value="">
 
</td>

<tr>

<td>Total No of Attendies</td>
<td><input type="text" name="npart" id="npart" onkeypress="return isNumberKey(event)" ondrop="return false;" onpaste="return false;"/>    <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>
<input type="hidden" name="current" id="current">
</td>
<td>Remarks</td>
<td><textarea name="remarks"></textarea></td>
</tr>
<tr>

<td>Amenities Required</td>
<td>

     
     <table class="dynatable" id="dynatable" width="75%" border="1"  cellspacing="0" cellpadding="0" bgcolor="#d2f7f3">
  	    <tr>
		     <td width="45" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Items</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Quantity</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Remarks</font></td>
		     
	     </tr>
		 <tr class="prototype" id="tr1">
		           <td width="4" align="center" height="21"><button class="remove" type='button' ><font size="4">-</font></button></td>
		           <td width="" align="left"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		           <td>
		                <% 
		                Connection con5 = null;
                     
                        Statement st5=null;
                        ResultSet rs5=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
                        con5= DriverManager.getConnection(url1+dbName1,userName1,password1);
						String query2 = "select Amenities_name from amenities_master";
						st5 = con5.createStatement();
 						rs5 = st5.executeQuery(query2);
						%>
					    <select name="ament" class="amenc" id="ament">
        					<option selected="selected">Select</option>
							<%while(rs5.next()){%>
								
										<option  value="<%=rs5.getString(1)%>"><%=rs5.getString(1)%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
				
		       </td>
		      
		       <td><input type="text" class="quanc" name="quant" id="quant" ></td>
               <td><input type="text" class="remarksc" name="aremarks" id="aremarks">
               </td>
        
     </tr>
</table>
		
     
  
</td>
<td>cc
</td>
<td > <input type="text" name="cc" id="cc" ><br><font color="red">NOTE: Please seperate CC mailids by comma(,)</font></td>
</tr>
<tr>
<td>Information To HR/ADMIN</td>
<td>
<% 
String bno=null;
bno = (String) session.getAttribute("bno");
System.out.println("branch nooo :"+b_no);     

Connection con7 = null;


                        Statement stt=null;
                        ResultSet rss=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
                        con7= DriverManager.getConnection(url+dbName,userName,password);
						String query3 = "SELECT u.`full_name`,u.`email`,u.`emp_id` FROM `user` u inner join branchmaster b on b.branch_id=u.branch_id inner join department d on d.department_id=u.department_id WHERE u.`department_id`='10' and b.branch_type_code='"+bno+"'and u.`employee_status`='yes' and u.`employee_dept`='HR' ";
                        stt = con7.createStatement();
 						rss = stt.executeQuery(query3);
						%>
<div class="multiselect">
 <div class="selectBox"onclick="showCheckboxes()">
      <select id="select1">
        <option value="0">Select option  </option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes"  onclick="showCheckboxes()">
     <%while(rss.next()){%>
   <input type="checkbox" name="approverslist" onclick="showCheckboxes()" class="group1" value="<%=rss.getString("email")%>" /><%=rss.getString("full_name")%><br>
  <%}%>
       </div>
      
  </div>
  <input type="hidden" name="BranchHr" id="BranchHr" /> 
  <%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con7.close();
					   }%>	
</td>
<td>Information To IT</td>
<td>
<% 
String bno1=null;
bno1 = (String) session.getAttribute("bno");
System.out.println("branch nooo11111 :"+bno1);     

Connection con8 = null;

  Statement st7=null;
                        ResultSet rs7=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
                        con8= DriverManager.getConnection(url+dbName,userName,password);
						String query4 = "SELECT u.`full_name`,u.`email`,u.`emp_id` FROM `user` u inner join branchmaster b on b.branch_id=u.branch_id inner join department d on d.department_id=u.department_id WHERE u.`department_id`='12' and b.branch_type_code='"+bno1+"'and u.`employee_status`='yes' ";
                        st7 = con8.createStatement();
 						rs7 = st7.executeQuery(query4);
						%>
<div class="multiselect">
 <div class="selectBox" onclick="showCheckboxes1()">
      <select id="select1">
        <option value="0">Select option  </option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes1"  onclick="showCheckboxes1()">
     <%while(rs7.next()){%>
   <input type="checkbox" name="approverslist1" onclick="showCheckboxes1()" class="group2" value="<%=rs7.getString("email")%>" /><%=rs7.getString("full_name")%><br>
  <%}%>
       </div>
      
  </div>
  <input type="hidden" name="BranchIt" id="BranchIt" /> 
  <%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con8.close();
					   }%>
</td>
</tr>
</table>
<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rss1,stt1,cnn1);
	DbUtil.closeDBResources(rss2,stt2,cnn2);
	DbUtil.closeDBResources(rss3,stt3,cnn3);
	DbUtil.closeDBResources(rss4,stt4,cnn4);
	DbUtil.closeDBResources(rss5,stt5,cnn5);
  }
	%>
<br>
</center>
 <table width="100%" border="0" align="center" >
                              <tr>
	                          	<td style="size:1">
	                          	     <center>
			                		<input type="submit" name="button" value="Book" id="button"  />
			                		<!-- <input type="button" name="backBtn"  value="BACK" /> -->
		                             <input type="reset" value="RESET">
		                             </center>
		                       </td>
		                      </tr>
	                         </table>



 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="ConRoomHome.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 

</form>
   <div id="resultFromAjax1" style="display:none;">
        
       </div>    
</body>
</html>