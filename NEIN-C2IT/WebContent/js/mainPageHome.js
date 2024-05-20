function checkForm() {
var cols = document.getElementById('tableData').getElementsByTagName('td'),
		colslen = cols.length, i = -1, color = checkForm.colors, val;
		//alert("Value :"+val);
		while(++i < colslen){
			val = cols[i].innerHTML;
			     {
	    		   var res = val.replace(".", ""); 
	    	       cols[i].style.backgroundColor = res <= 0? color.yellow : res < 40? color.dotgreen : color.white;
	    		   cols[i].innerHTML = res;
	                }
	    	   if (val.match(/[g]/))
	                {
			   		 var res = val.replace("g", ""); 
		      		 cols[i].style.backgroundColor = res <= 0? color.yellow : res < 40? color.red : color.white;
			 	     cols[i].innerHTML = res;
	                }
	    	   if (val.match(/[,,]/))
	           {
			   var res = val.replace(",,", ""); 
		       cols[i].style.backgroundColor = res <= 0? color.yellow : res < 40? color.doubledotred : color.white;
			   cols[i].innerHTML = res;
	           }
	    	   var str1 = "Casual Leave";
	    	   if (val.match(str1))
	           {
			   var res = val; 
		       cols[i].style.backgroundColor = res <= 0? color.yellow : res < "Casual Leave"? color.doubledotred : color.white;
			   cols[i].innerHTML = res;
	           }
	    	   var str2 = "Present";
	    	   if (val.match(str2))
	           {
			   var res = val; 
		       cols[i].style.backgroundColor = res <= 0? color.yellow : res < "Present"? color.yellow : color.white;
			   cols[i].innerHTML = res;
	           }
	    	   var str3 = "Comp Off";
	    	   if (val.match(str3))
	           {
			   var res = val; 
		       cols[i].style.backgroundColor = res <= 0? color.yellow : res < "Comp Off"? color.doubledotred : color.white;
			   cols[i].innerHTML = res;
	           }
	    	   var str4 = "Sick Leave";
	    	   if (val.match(str4))
	           {
			   var res = val; 
		       cols[i].style.backgroundColor = res <= 0? color.yellow : res < "Sick Leave"? color.doubledotred : color.white;
			   cols[i].innerHTML = res;
	           }
	    	   var str5 = "On Duty";
	    	   if (val.match(str5))
	           {
			   var res = val; 
		       cols[i].style.backgroundColor = res <= 0? color.yellow : res < "On Duty"? color.doubledotred : color.white;
			   cols[i].innerHTML = res;
	           }
		}
	}
	checkForm.colors = {
		green: "#7fff00",
		yellow: "lightgreen",
		dotred : "red",
		doubledotred : "red",
		dotgreen : "green",
		red: "#FF6600"
	}

	 
	/*START blinking*/
	window.onload=blinkOn;
	 
	function blinkOn()
	{
	  document.getElementById("blink").style.color="#ec691f";
	  setTimeout("blinkOff()",1000);
	}
	 
	function blinkOff()
	{
	  document.getElementById("blink").style.color="#2f4377";
	  setTimeout("blinkOn()",1000);
	}
	/*END blinking*/
function link(empp) 
{
var f=document.form;  


	f.method="post";   
	
	f.action='Displaywatch.jsp?empp='+empp;
	
	f.submit();
	}
	
	