function validateEmailsh(email)
{
    var splitted = email.match("^(.+)@(.+)$");
    if (splitted == null) return false;
    if (splitted[1] != null)
    {
        var regexp_user = /^\"?[\w-_\.]*\"?$/;
        if (splitted[1].match(regexp_user) == null) return false;
    }
    if (splitted[2] != null)
    {
        var regexp_domain = /^[\w-\.]*\.[A-Za-z]{2,4}$/;
        if (splitted[2].match(regexp_domain) == null)
        {
            var regexp_ip = /^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
            if (splitted[2].match(regexp_ip) == null) return false;
        } // if
        return true;
    }
    return false;
}

function checkEmail() {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value)){
    return true;
    }
    return false; 
  }
  function checkName(str){
      var re = /[^a-zA-Z]\s/g;
      if (re.test(str)) return false;
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
    function checkAddress(str){
    	var re = /[^[a-z][A-Z][0-9]]/g;
      if (re.test(str)) return false;
      return true;
    }
    
  function validate(){
	  var cp1=document.form1.cm_name;
	  var cp2=document.form1.cm_mail;
      var cp3=document.form1.cm_location;
      
     
      var cp4=document.form1.cm_type;
      var cp5=document.form1.cm_problem;
        var cp6=document.form1.mail;
        
        
         if ((cp1.value==null)||(cp1.value=="")){
    alert("Please Enter Your Name!");
    cp1.focus();
    return false;
    }
    if (checkName(cp1.value)==false){
    cp1.value="";
    alert("Invalid Name!");
    cp1.focus();
    return false;
    }
    if ((cp2.value==null)||(cp2.value=="")){
        alert("Enter Validate Email ID!");
        cp2.focus();
        return false;
        }
        if (validateEmailsh(cp2.value)==false){
        cp2.value="";
        alert("Invalid Email ID!");
        cp2.focus();
        return false;
        }
    
       if ((cp3.value==null)||(cp3.value=="")||(cp3.value==0)||(cp3.value=="0")){
    alert("Please Select Your Location!");
    cp3.focus();
    return false;
    }
    if (checkAddress(cp3.value)==false){
    cp3.value="";
    alert("Invalid Location!");
    cp3.focus();
    return false;
    }
   
       if ((cp4.value==null)||(cp4.value=="")||(cp4.value==0)||(cp4.value=="0")){
    alert("Please Select Type Of Problem!");
    cp4.focus();
    return false;
    }
    if (checkAddress(cp4.value)==false){
    cp4.value="";
    alert("Invalid Problem!");
    cp4.focus();
    return false;
    }
     if ((cp5.value==null)||(cp5.value=="")){
        alert("Please Enter Remarks!");
        cp5.focus();
        return false;
        }
         if (checkAddress(cp5.value)==false){
        cp5.value="";
        alert("Invalid Remarks!");
        cp5.focus();
        return false;
        }  
  
     if ((cp6.value=="Select")||(cp6.value=="0")||(cp6.value=="")){
    alert("Please Select Designation And Name !");
    cp6.focus();
    return false;
    }
    if (checkAddress(cp6.value)==false){
    cp6.value="";
    alert("Invalid DESIGNATION And Name!");
    co.focus();
    return false;
    }
    
   
else
return true;
}
