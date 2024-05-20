function checkAddress(str){
    var re = /[^[a-z][A-Z][0-9]]/g;
    if (re.test(str)) return false;
    return true;
  }
    function ValidateForm() {
    	
    var cn=document.form1.cm_name;
    var cl=document.form1.cm_location;
   var ctt=document.form1.cm_type;
    var cp=document.form1.cm_problem;
    var cs=document.form1.cm_status;
   var ct1 = document.form1.cm_time;
  // var ct2 = document.form1.cm_time2;
  // var comp = document.form1.compare;
 //  var fa = ct1.value;
   //alert("fa  "+fa);
//	var res = fa.substring(0,8);
	//var fa2 = ct2.value;
	//alert("fa2  "+fa2);
//	var res2 = fa2.substring(0,8);
   //var res = ct.split("",2);
   //alert("res value"+res);
  if ((cn.value==null)||(cn.value=="")){
    		alert("Enter Your Name");
    		cn.focus();
    		return false;
    		}
  if (checkAddress(cn.value)==false){
    	cn.value="";
    	alert("Invalid Name!");
    	cn.focus();
    	return false;
    	}

 if ((cl.value=="")||(cl.value.length==1)){
	 

    alert("Select Location");
    cl.focus();
    return false;
    }

	 if ((ctt.value==null)||(ctt.value=="")||(ctt.value==0)||(ctt.value=="0")){
		 // alert("length of blaaa "+ctt.value.length);
		    alert("Please Select Type Of Problem!");
		    ctt.focus();
		    return false;
		    }
		    if (checkAddress(ctt.value)==false){
		    ctt.value="";
		    alert("Invalid Problem!");
		    ctt.focus();
		    return false;
		    }
     if ((cp.value==null)||(cp.value=="")){
        alert("Enter Problem Details");
        cp.focus();
        return false;
        }
    
   if ((cs.value==null)||(cs.value=="")){
        alert("Select Status");
        cs.focus();
        return false;
        }
   if ((ct1.value==null)||(ct1.value=="")||(ct1.value.length==1)){
	  
   
        alert("Select From Date");
        ct1.focus();
        return false;
        }
    /*if ((ct2.value==null)||(ct2.value=="")||(ct1.value.length==1)){
        alert("Select To Date");
        ct2.focus();
        return false;
        }*/
    //28
  // if((comp.value!=res)||(comp.value!=res2))
	   
	/* if(comp.value!=res2)
    	{
    	//alert("comp value "+comp.value.length);
    	//alert("res length "+res.length);
    	//alert("res2 length "+res2.length);
    	alert("res "+res);
    	alert("res2 "+res2);
    	alert("Kindly Select todays Date From Calendar");
    	return false;
    	}
    if ((ct2.value<=ct1.value)){
    	//alert("ct1    :"+ct1);
    	//alert("ct2    :"+ct2);
        alert("ENTER PROPER ORDER");
        ct2.focus();
        return false;
        }*/
    
    else
    return true;

     
    }

    function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
	if (window.focus) {newwindow.focus();}
	return false;
}
	
		 
    function btnClick() { 
        close(); 
}	