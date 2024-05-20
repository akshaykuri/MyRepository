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
              var i=document.form.UID;
              var l=document.form.Nno;
              
                   var p=document.form.UPWD;
                   var nn=document.form.Nname;
                var co=document.form.post;
                var c=document.form.city;
                var g=document.form.Nmail;
                var dn=document.form.DEPT_NAME;
                
                 if ((nn.value==null)||(nn.value=="")){
            alert("Please Enter Name!");
            nn.focus();
            return false;
            }
            if (checkName(nn.value)==false){
            nn.value="";
            alert("Invalid Name!");
            nn.focus();
            return false;
            }
            if ((l.value==null)||(l.value=="")){
                alert("Please Enter No.!");
                l.focus();
                return false;
                }
                if (checkNumber(l.value)==false){
                l.value="";
                alert("Invalid No.!");
                l.focus();
                return false;
                }
            
               if ((i.value==null)||(i.value=="")){
            alert("Please Enter ID!");
            i.focus();
            return false;
            }
            if (checkAddress(i.value)==false){
            i.value="";
            alert("Invalid ID!");
            i.focus();
            return false;
            }
           
               if ((p.value==null)||(p.value=="")){
            alert("Please Enter PASSWORD!");
            p.focus();
            return false;
            }
            if (checkAddress(p.value)==false){
            p.value="";
            alert("Invalid PASSWORD!");
            p.focus();
            return false;
            }
             if ((g.value==null)||(g.value=="")){
                alert("Please Enter Mail ID!");
                g.focus();
                return false;
                }
                if (checkEmail(g.value)==false){
                g.value="";
                alert("Invalid Invalid Mail ID!");
                g.focus();
                return false;
                } 
          
             if ((co.value==null)||(co.value=="")||(co.value=="0")||(co.value.length<=1)){
            alert("Please Enter DESIGNATION!");
            co.focus();
            return false;
            }
            if (checkAddress(co.value)==false){
            co.value="";
            alert("Invalid DESIGNATION!");
            co.focus();
            return false;
            }
             if ((c.value==null)||(c.value=="")||(c.value=="0")||c.value.length<=1){
            alert("Please Enter CITY!");
            c.focus();
            return false;
            }
            if (checkAddress(c.value)==false){
            c.value="";
            alert("Invalid CITY!");
            c.focus();
            return false;
            }
            
            
            
            if ((dn.value==null)||(dn.value=="")||(dn.value=="0")||dn.value.length<=1){
            alert("Please Select Department!");
            dn.focus();
            return false;
            }
            if (checkEmail(dn.value)==false){
            	dn.value="";
            alert("Invalid Department!");
            	dn.focus();
            return false;
            }
            
           
	 else
       return true;
}
       