
 function BlockNonIt() {
    // alert("Blocked Non it working");
	 var elem1=document.forms['form'].elements['progBlocked'];
	 len=elem1.length-1;
	 chkvalue1='';
	 for(i=0; i<=len; i++)
	 {
	 if(elem1[i].checked)chkvalue1=elem1[i].value; 
	 }
	 if(chkvalue1=='')
	 {
	 document.getElementById("idBlockedColor").style.backgroundColor="red";
	 alert('Please Check the Check box for Programs to be Blocked:');
	 
	 return false;
	 }
	 //alert ('Mail will be sent To: '+chkvalue);
	 return true;
          
	} 
 function AllowNonIt() {
	// alert("Blocked Non it working");
		 var elem2=document.forms['form'].elements['progAllowed'];
		 len=elem2.length-1;
		 chkvalue2='';
		 for(i=0; i<=len; i++)
		 {
		 if(elem2[i].checked)chkvalue2=elem2[i].value; 
		 }
		 if(chkvalue2=='')
		 {
	     document.getElementById("idAllowedColor").style.backgroundColor="red";
		 alert('Please Check the Check box for Programs to be Allowed:');
		 return false;
		 }
		 //alert ('Mail will be sent To: '+chkvalue);
		 return true;
	          
		}	
 function remarks()
 {
 	//NonitRemarks	
 	var d1 = document.form.NonitRemarks;
 	var d2 = document.form.level;
 	
 	if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
 	{
 	 alert("Enter the Level!");
 	         d2.focus();
 	 return false;
 	 }
 	
 	if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
 	{
 	 alert("Enter Remarks !");
 	         d1.focus();
 	 return false;
 	 }
 else
 return true;
 }
