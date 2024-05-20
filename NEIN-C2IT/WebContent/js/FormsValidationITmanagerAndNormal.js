
 function CheckLikes() {
	
	 var elem=document.forms['form'].elements['mailingCheck'];
	 len=elem.length-1;
	 chkvalue='';
	 for(i=0; i<=len; i++)
	 {
	 if(elem[i].checked)chkvalue=elem[i].value; 
	 }
	 if(chkvalue=='')
	 {
	 alert('Please Tick the Check box for selecting mail id:');
	 return false;
	 }
	 //alert ('Mail will be sent To: '+chkvalue);
	 return true;
          
	}
 function CheckLikes2() {

	 var elem1=document.forms['form'].elements['mailingCheck2'];
	// alert("ELEMT VALUE :"+elem);
	 len2=elem1.length-1;
	 chkvalue2='';
	 for(i=0; i<=len2; i++)
	 {
		// alert("elem[i].value"+elem[0].value);
	 if(elem1[i].checked)chkvalue2=elem1[i].value; 
	 }
	// alert("VALUE OF CHECK BOX :"+elem[0].value);
	 if(chkvalue2=='')
	 {
	 alert('Please Tick the Check box for selecting mail id:');
	 return false;
	 }
	 //alert ('Mail will be sent To: '+chkvalue);
	 return true;
          
	}
 
 function BlockNonIt() {
	   //  alert("Blocked Non it working");
		 var elem1=document.forms['form'].elements['progBlocked'];
		 len=elem1.length-1;
		 chkvalue1='';
		 for(i=0; i<=len; i++)
		 {
		 if(elem1[i].checked)chkvalue1=elem1[i].value; 
		 }
		 if(chkvalue1=='')
		 {
		 alert('Please Check the Check box for Programs to be Blocked:');
		 return false;
		 }
		 //alert ('Mail will be sent To: '+chkvalue);
		 return true;
	          
		} 
 function AllowNonIt() {
		// alert("Blocked Non it working");
			 var elem2=document.forms['form'].elements['progAllowed'];
			 //var frm=document.forms[0],flds=[frm['itemQuantity'],frm['itemRate'],frm['itemTax'],frm['itemAmount']],total=0;
			 len=elem2.length-1;
			 chkvalue2='';
			 for(i=0; i<=len; i++)
			 {
			 if(elem2[i].checked)chkvalue2=elem2[i].value; 
			 }
			 if(chkvalue2=='')
			 {
			 alert('Please Check the Check box for Programs to be Allowed:');
			 return false;
			 }
			 //alert ('Mail will be sent To: '+chkvalue);
			 return true;
		          
			}
 function BlockAllowNonIt() {
		 alert("Blocked Non it working");
	 		 var elem1=document.forms['form'].elements['progBlocked'],elements['progAllowed'];
			 
			 //var frm=document.forms[0],flds=[frm['itemQuantity'],frm['itemRate'],frm['itemTax'],frm['itemAmount']],total=0;
			 alert(elem1);
			
			 len1=elem1.length-1;
	
			 chkvalue1='';
			
			 alert("before forloop");
			 for(i=0; i<=len1; i++)
			 {
			 if(elem1[i].checked)chkvalue1=elem1[i].value; 
			 }
			
			 if(chkvalue1=='')
			 {
			 alert('Please Check the Check box for Programs to be Allowed / Blocked:');
			 return false;
			 }
			 //alert ('Mail will be sent To: '+chkvalue);
			 return true;
		          
			}
	 

 function IT()
 {
 		var remar = document.form.ITremark;
 		
 		var itname = document.form.ITdcode;
 		var itpwd = document.form.ITdpassword;
 		var itc = document.form.ITdlevel; 
 		var group = document.form.ITdremark;
 		var reminder = document.form.reminder;

 		
 		if(itname.value==""||itname.value==null)
		{
		alert("Please Enter Operator Code ");
		itname.focus();
		 return false;
		}
 		if(itpwd.value==""||itpwd.value==null)
		{
		alert("Please Enter Password");
		itpwd.focus();
		 return false;
		}
 		if(itc.value==""||itc.value==null)
		{
		alert("Please Enter Level ");
		itc.focus();
		 return false;
		}
 		
		if(group.value==""||group.value==null)
			{
			alert("Please Enter Remarks");
			group.focus();
			 return false;
			}
		if(reminder.value==""||reminder.value==null||reminder.value=="Select")
		 {
		 alert("Select Reminder");
		 reminder.focus();
		 return false;
		 }
	
 		else
 			return true;
 }

 function evalGroup()
 {
 		var remar = document.form.ITremark;
 		
 		var itname = document.form.ITusername;
 		var itpwd = document.form.ITpassword;
 		var itc = document.form.ITcreated; 
 		var group = document.form.mailingCheck;
 		

 		
 		if(itname.value==""||itname.value==null)
		{
		alert("Please Enter User Name ");
		itname.focus();
		 return false;
		}
 		if(itpwd.value==""||itpwd.value==null)
		{
		alert("Please Enter Password");
		itpwd.focus();
		 return false;
		}
 		if(itc.value==""||itc.value==null)
		{
		alert("Please Enter Group ");
		itc.focus();
		 return false;
		}
 		
		if(remar.value==""||remar.value==null)
			{
			alert("Please Enter Remarks");
			remar.focus();
			 return false;
			}
	
	
 		else
 			return true;
 }

 function checkNumber(string)
     {
     var numericExpression = /^[0-9]+$/;
     if(string.match(numericExpression)) {
      return true;
     } else {
     return false;
        }
     }
   function validate()
   {//txtmail_msg
   var d1 = document.form.txtmail_msg;
   var d2 = document.form.mail1;
   var ff=document.form.aabbcc;
  if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	 {
       alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
       document.getElementsByName("mmdradio")[0].focus();
       return false;
    } 
  if (document.getElementsByName("mmdradio")[0].checked)
	 {
	  if (!document.getElementsByName("higherAuthority")[0].checked && !document.getElementsByName("higherAuthority")[1].checked) 
	  		{  
		    alert("Select Radio Button \n \n For selecting Higher Authority Or Direct approval of Approval Routine \n \n  Else Can not Proceed Further..");
		    document.getElementsByName("higherAuthority")[0].focus();
      		return false;
	  		}
	  }
  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[0].checked && ((d2.value==null)||(d2.value=="NULL")||(d2.value=="")))
	 {
	        alert("Select Desgination and Mail ID ..");
	        d2.focus();
   		    return false;
	  }
 /*  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[1].checked && !document.getElementsByName("Itradio")[0].checked && !document.getElementsByName("Itradio")[1].checked)
	 {
	        alert("Select IT / NON IT");
		    document.getElementsByName("Itradio")[0].focus();
		    return false;
	  } */
  if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	{
	 alert("Enter Remarks !");
	         d1.focus();
	 return false;
	 }
else
return true;
   }
