<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<title>Assign Asset</title>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
    {
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
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
	        var url="getEmployeeNONIT1.jsp";  
		    url +="?EMP_NO=" +v;
		    xmlHttp.onreadystatechange = getInfo;  
		    xmlHttp.open("GET", url, true);   
		    xmlHttp.send(null);    
        }  
function getInfo()
        { 
	          var str2=xmlHttp.responseText;;
	          if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                           { 
                             //alert("here");
                             document.getElementById("resultFromAjax2").innerHTML = str2;
                             document.getElementById("idempName").value =  document.getElementById("p1").value;
                             document.getElementById("idempDesg").value =  document.getElementById("p2").value;
                      		 document.getElementById("idempBranch").value =  document.getElementById("p3").value;
                      		 document.getElementById("idempSubBranch").value =  document.getElementById("p4").value;
                             document.getElementById("idempMobNo").value =  document.getElementById("p5").value;
                     		 document.getElementById("idempEmailID").value =  document.getElementById("p6").value;	//idempDept,idempRo
                     		 document.getElementById("demo").value =  document.getElementById("p7").value;
                      		 document.getElementById("idempDept").value =  document.getElementById("p8").value;
                     		 document.getElementById("idempRo").value =  document.getElementById("p9").value;
                     		 sendInfo1();
                           }
              else
                       	{
                        	document.getElementById("resultFromAjax2").innerHTML = str2;
                            document.getElementById("idempName").value = "";
                            document.getElementById("idempDesg").value =""; 
                     		document.getElementById("idempBranch").value = "";
                     	    document.getElementById("idempSubBranch").value = "";
                            document.getElementById("idempMobNo").value =  "";
                            document.getElementById("idempEmailID").value =	"";
                            document.getElementById("idempDept").value = "";
                            document.getElementById("idempRo").value = "";
                    		document.getElementById("demo").value =document.getElementById("idempId").value;
                    		cleartext1();
                   		}
             
             } 
</script>
<script type="text/javascript">  
 function sendInfo1()  
           {  
	       var v1=document.getElementById("demo").value;
	       //alert(v1);
	       if(v1=="")
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
    	    var url="getEmployeeNONIT11.jsp";  
    		    url +="?EMP_NO=" +v1;
    		    xmlHttp.onreadystatechange = getInfo1;  
    		    xmlHttp.open("GET", url, true);   
    		    xmlHttp.send(null);    
             }  
 		 function getInfo1()
             {     
	         var str3=xmlHttp.responseText;  
             if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                      { 
            	          document.getElementById("resultFromAjax1").innerHTML = str3;
            	     	 
            	          document.getElementById("idmobNum").value = document.getElementById("mobileNo1").value;
            		      document.getElementById("idmobSIM").value = document.getElementById("SIMno1").value;
            		      document.getElementById("idmobileNoCom").value = document.getElementById("SIMProvided1").value;
            		      document.getElementById("idlotusMod").value = document.getElementById("lotusMod1").value;
            		      document.getElementById("idlotusOwner").value = document.getElementById("lotusOwner1").value;
            		      document.getElementById("idlotusIP").value = document.getElementById("lotusIP1").value;
            		      document.getElementById("idftpAdd").value = document.getElementById("ftpAddress1").value;
            		      document.getElementById("iddoiFtp").value = document.getElementById("ftpDOI1").value;
            		      document.getElementById("idremarksFtp").value = document.getElementById("ftpRemarks1").value;
            	         
            	     	 
            	     	 
                     	 document.getElementById("idaType").value =  document.getElementById("q1").value;
                    	 if(document.getElementById("idaType").value=="")
                    		 document.getElementById("idaType").value="Select";
                       document.getElementById("assetno").value =  document.getElementById("q2").value;
                     // alert("idano q2assetno :"+ document.getElementById("assetno").value);

                      if(document.getElementById("assetno").value =="-1")
                    	  {
                    	  //alert("idano q2assetno2222222222 :"+ document.getElementById("assetno").value);
	                      document.getElementById("assetno").value="";
                    	  }
                     
                      document.getElementById("idano1").style.visibility='visible';
                      document.getElementById("idano1").value =document.getElementById("assetno").value;  
                      //alert("idano1  :"+ document.getElementById("idano1").value);
                      
          		      document.getElementById("iddoiasset").value =  document.getElementById("q3").value;
                      document.getElementById("idassetconf").value =  document.getElementById("q4").value;
                      document.getElementById("idremarksasset").value = document.getElementById("q5").value;
                      
                         
                      document.getElementById("idemailid1").value =  document.getElementById("p11").value;
                      document.getElementById("idpass").value =  document.getElementById("p21").value;
          		      document.getElementById("iddoi2").value =  document.getElementById("p31").value;
                      document.getElementById("ididfile").value = document.getElementById("p311").value;
          		      document.getElementById("idremarks2").value =  document.getElementById("p41").value;
          		 
                      document.getElementById("idopcode").value =  document.getElementById("p51").value;
         		      document.getElementById("idpass1").value =  document.getElementById("p61").value;	
         		      document.getElementById("iddoi3").value =  document.getElementById("p71").value;
                      document.getElementById("idlevel").value = document.getElementById("p711").value;
         		      document.getElementById("idremarks3").value =  document.getElementById("p81").value;
         		
                      document.getElementById("iddscpin").value =  document.getElementById("p91").value;
         		      document.getElementById("iddsccin").value =  document.getElementById("p101").value;
         		      document.getElementById("iddoi4").value =  document.getElementById("p111").value;
                      document.getElementById("iddscpass").value = document.getElementById("p1111").value;
                      document.getElementById("idremarks4").value =  document.getElementById("p121").value;
        		 
                      document.getElementById("iduname").value =  document.getElementById("p131").value;	
        		      document.getElementById("idpass3").value =  document.getElementById("p141").value;
         		      document.getElementById("iddoi5").value =  document.getElementById("p151").value;
                      document.getElementById("idremarks5").value =  document.getElementById("p161").value;  
         		
                      document.getElementById("iddcardno").value =  document.getElementById("p171").value;
         	          document.getElementById("iddoi1").value =  document.getElementById("p181").value;
                      document.getElementById("idimei").value = document.getElementById("p1811").value;
                      document.getElementById("idisp").value = document.getElementById("p1812").value;
                      document.getElementById("iddctype").value = document.getElementById("p1813").value;
                      document.getElementById("idremarks1").value =  document.getElementById("p191").value;
        		 
                      document.getElementById("idcard").value =  document.getElementById("p201").value;	
        		      document.getElementById("iddoi6").value =  document.getElementById("p211").value;
                      document.getElementById("idtype").value = document.getElementById("p2111").value;
        		      document.getElementById("idremarks6").value =  document.getElementById("p221").value;
        		      
        		      ///////////////////////////
        		      
        		      document.getElementById("idmobMod").value = document.getElementById("pa").value;
        		      document.getElementById("idmobSer").value = document.getElementById("pb").value;
        		      document.getElementById("iddoiMob").value = document.getElementById("pc").value;
        		      
        		      //document.getElementById("idemailMob").value = document.getElementById("pd").value;
        		     
        		      document.getElementById("idremarks7").value = document.getElementById("pe").value;
        		      
        		      document.getElementById("idhardMod").value = document.getElementById("pf").value;
        		      document.getElementById("idhardSer").value = document.getElementById("pg").value;
        		      document.getElementById("iddoiHard").value = document.getElementById("ph").value;
        		      document.getElementById("idhardCap").value = document.getElementById("pi").value;
        		      document.getElementById("idhardType").value = document.getElementById("pj").value;
        		      document.getElementById("idremarks8").value = document.getElementById("pk").value;
        		      
        		      // shaFO,idshaFO,doishaFO,iddoishaFO,remarksshaFO,idremarksshaFO
                      // tryappCre,idappCre,doiappCre,iddoiappCre,remarksappCre,idremarksappCre
        		      
        		      document.getElementById("idshaFO").value = document.getElementById("q6").value;
        		      document.getElementById("iddoishaFO").value = document.getElementById("q7").value;
        		      document.getElementById("idremarksshaFO").value = document.getElementById("q8").value;
        		      
        		      
        		      document.getElementById("idappCre").value = document.getElementById("q9").value;
        		      var makeCheckList=document.getElementById("q9").value;
        		      var ListCheck;
        		      if(!(makeCheckList==""))
        		    	  {
        		    		  ListCheck = makeCheckList.split(",");
        		    		  for(var i=0;i<ListCheck.length - 1;i++)
        		    		  {
        		    			/// 	alert(ListCheck[i]);
        		    		  	document.getElementById(ListCheck[i]).checked=true;
        		    		  }
        		    	  }
        		      
        		      document.getElementById("iddoiappCre").value = document.getElementById("q10").value;
        		      document.getElementById("idremarksappCre").value = document.getElementById("q11").value;
        		      document.getElementById("idotherAsset").value = document.getElementById("pl").value;
        		      document.getElementById("iddoiOther").value = document.getElementById("pm").value;
        		      document.getElementById("idremarks9").value = document.getElementById("pn").value;
        		      
        		    //new fields  
        		   
        			  }
             } 
</script>

<script type="text/javascript">
function cleartext1()
    {
	//var str3=xmlHttp.responseText;
    
    //alert("here1");
    // assetName,idaType,assetno,idano,doiasset,iddoiasset,idassetconf,ididassetconf,remarksasset,idremarksasset
                      // shaFO,idshaFO,doishaFO,doishaFO,remarksshaFO,idremarksshaFO
                      // tryappCre,idappCre,doiappCre,iddoiappCre,remarksappCre,idremarksappCre
    
     document.getElementById("idaType").value =  "Select";
    document.getElementById("idano").value =  "Select";
    document.getElementById("idano1").value="";
    document.getElementById("iddoiasset").value = "";
    document.getElementById("idassetconf").value = "";
    document.getElementById("idremarksasset").value = "";
    
   
    document.getElementById("idemailid1").value = "";
    document.getElementById("idpass").value =  "";
    document.getElementById("iddoi2").value =  "";
    document.getElementById("ididfile").value = ""; 
    document.getElementById("idremarks2").value = "";
     		 
    document.getElementById("idopcode").value =  "";
    document.getElementById("idpass1").value =  "";	
    document.getElementById("iddoi3").value =  "";
    document.getElementById("idlevel").value = "";
    document.getElementById("idremarks3").value =  "";
    		
    document.getElementById("iddscpin").value =  "";
    document.getElementById("iddsccin").value =  "";
    document.getElementById("iddoi4").value =  "";
    document.getElementById("iddscpass").value = "";
    document.getElementById("idremarks4").value =  "";
   		 
    document.getElementById("iduname").value =  "";	
    document.getElementById("idpass3").value =  "";
    document.getElementById("iddoi5").value =  "";
    document.getElementById("idremarks5").value =  "";
    		
    document.getElementById("iddcardno").value =  "";
    document.getElementById("iddoi1").value =  "";
    document.getElementById("idimei").value = "";
    document.getElementById("idisp").value = "Select";
    document.getElementById("iddctype").value="Select";
    document.getElementById("idremarks1").value =  "";
   		 
    document.getElementById("idcard").value =  "";	
    document.getElementById("iddoi6").value = "";
    document.getElementById("idtype").value = "Select";
    document.getElementById("idremarks6").value = "";
    
    document.getElementById("idmobMod").value = "";
    document.getElementById("idmobSer").value = "";
    document.getElementById("iddoiMob").value = "";
    // document.getElementById("idemailMob").value = "Select";
    document.getElementById("idremarks7").value = "";
   
    document.getElementById("idmobNum").value ="";
    document.getElementById("idmobSIM").value = "";
    document.getElementById("idmobileNoCom").value = "Select";
  
    
    
    document.getElementById("idlotusMod").value ="";
    document.getElementById("idlotusOwner").value ="Select";
    document.getElementById("idlotusIP").value = "";
    
    
    
    document.getElementById("idftpAdd").value = "";
    document.getElementById("iddoiFtp").value = "";
    document.getElementById("idremarksFtp").value ="";
    
    
    
    document.getElementById("idhardMod").value = "";
    document.getElementById("idhardSer").value = "";
    document.getElementById("iddoiHard").value = "";
    document.getElementById("idhardCap").value = "Select";
    document.getElementById("idhardType").value = "Select";
    document.getElementById("idremarks8").value = "";
   
 // shaFO,idshaFO,doishaFO,iddoishaFO,remarksshaFO,idremarksshaFO
    // tryappCre,idappCre,doiappCre,iddoiappCre,remarksappCre,idremarksappCre
    document.getElementById("idshaFO").value = "";
    document.getElementById("iddoishaFO").value = "";
    document.getElementById("idremarksshaFO").value = "";
    
    document.getElementById("idappCre").value = "Select";
    document.getElementById("iddoiappCre").value = "";
    document.getElementById("idremarksappCre").value = "";  
    
    
    
    document.getElementById("idotherAsset").value = "";
    document.getElementById("iddoiOther").value = "";
    document.getElementById("idremarks9").value = "";
    
    ////// new field s
    }
    
</script>

<script type="text/javascript">
	var expanded = false;
	function checkBoxValidation()
	{
		var vijayVal=null;
		//alert("i am in checkboxvalidation");
		for(var i=0; i < document.form.approverslist.length; i++)
		{
			if(!document.form.approverslist[i].checked)
			{
			
			}
			else
			{
				alert(document.form.approverslist[i].value);
				vijayVal=vijayVal+ document.form.approverslist[i].value+",";
				alert("inside else part"+vijayVal);
			}
		}
	}

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
		   
		    } else {
		    checkboxes.style.display = "none";
		    expanded = false;
		  }
		
		  // alert(values);
	  }
	 function sync(val) 
		{
			 var vijayVal="";
				for(var i1=0; i1 < document.form.approverslist.length; i1++)
				{
				
					if(document.form.approverslist[i1].checked)
					{
					//	alert(document.form.approverslist[i1].value);
						vijayVal=vijayVal+ document.form.approverslist[i1].value+",";
					//	alert("i1:"+i1+" :"+vijayVal);
					}
				}
			document.getElementById("idappCre").value=vijayVal;
		}
</script>





<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-body {
            padding: 2px 16px;
            background-color: #D3D3D3;
            }
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 82%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}
.modal-header {
    padding: 2px 16px;
    background-color: #D3D3D3;
    color: black;
              }
</style>
<script type="text/javascript"> // script for seluseroffice fun
function isNumber(evt) 
    {
	//var x=document.getElementById("idempId").value;
    //alert(x);
   // alert("here");
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
          }
   /*  var l=x.toString().length();
   alert(l); */
   return true;
   }
</script>

<script type="text/javascript"> // script for validate employe not exit
function validate() 
    {  //ididfile,idlevel,iddscpass,idimei,idisp,iddctype,idtype
		 var ename=document.getElementById("idempName").value;
   	 	//var edisg=document.getElementById("idempDesg").value;
    	//var ebra=document.getElementById("idempBranch").value;
	    //var esbra=document.getElementById("idempSubBranch").value;
	    //var emob=document.getElementById("idempMobNo").value;
	    //var email=document.getElementById("idempEmailID").value;
	    var i=document.getElementById("idemailid1").value;
	    var j=document.getElementById("idpass").value;
	    var k=document.getElementById("iddoi2").value;
	    var k1=document.getElementById("ididfile").value;
	    var l=document.getElementById("idremarks2").value;
	     		 
	    var m=document.getElementById("idopcode").value;
	    var n=document.getElementById("idpass1").value;	
	    var o=document.getElementById("iddoi3").value;
	    var o1=document.getElementById("idlevel").value;
	    var p=document.getElementById("idremarks3").value;
    		
	    var q=document.getElementById("iddscpin").value;
	    var r=document.getElementById("iddsccin").value;
	    var s=document.getElementById("iddoi4").value;
	    var s1=document.getElementById("iddscpass").value;//k1,o1,s1,y1,z1,a1,c1
	    var t=document.getElementById("idremarks4").value;
	   		 
	    var u=document.getElementById("iduname").value;	
	    var v=document.getElementById("idpass3").value;
	    var w=document.getElementById("iddoi5").value;
	    var x=document.getElementById("idremarks5").value;
	    		
	    var y=document.getElementById("iddcardno").value;
	    var z=document.getElementById("iddoi1").value;
	    var a=document.getElementById("idremarks1").value;
	    var y1=document.getElementById("idimei").value;
	    var z1=document.getElementById("idisp").value;
	    var a1=document.getElementById("iddctype").value;
	   		 
	    var b=document.getElementById("idcard").value;	
	    var c=document.getElementById("iddoi6").value;
	    var c1=document.getElementById("idtype").value;
	    var d=document.getElementById("idremarks6").value;
	    
    
    ////////////////////////////////
    
	    var mo1=document.getElementById("idmobMod").value;	
	    var mo2=document.getElementById("idmobSer").value;
	    var mo3=document.getElementById("iddoiMob").value;
  
	    //  var mo4=document.getElementById("idemailMob").value;
	    
	    ///
	    var mo5=document.getElementById("idmobNum").value;
	    var mo6=document.getElementById("idmobSIM").value;
	    var mo7=document.getElementById("idmobileNoCom").value ;
	    //
    
	    var lotusMod=document.getElementById("idlotusMod").value;;
    	var lotusOwner=document.getElementById("idlotusOwner").value;;
    	var lotusAdd=document.getElementById("idlotusIP").value;;
	
    	var ftpaddress=document.getElementById("idftpAdd").value ;
        var ftpdoi=document.getElementById("iddoiFtp").value ;
        var ftpremarks=document.getElementById("idremarksFtp").value ;
        
	    
	    var hr1=document.getElementById("idhardMod").value;
	    var hr2=document.getElementById("idhardSer").value;
	    var hr3=document.getElementById("iddoiHard").value;
	    var hr4=document.getElementById("idhardCap").value;
	    var hr5=document.getElementById("idhardType").value;
	    
	    var ot1=document.getElementById("idotherAsset").value;
	    var ot2=document.getElementById("iddoiOther").value;	
	  
	    ///////////////////////////////////
	   var xx= document.getElementById("idaType").value;
	   var xx1=document.getElementById("idano").value ;
	   var xx2=document.getElementById("iddoiasset").value;
	   var xx3=document.getElementById("idassetconf").value;
	   var xx4=document.getElementById("idremarksasset").value ;
	   var xx12=document.getElementById("idano1").value ;
	   var xx5= document.getElementById("idshaFO").value ;
	   var xx6=document.getElementById("iddoishaFO").value ;
	   var xx7=document.getElementById("idremarksshaFO").value ;
	   var xx8=  document.getElementById("idappCre").value ;
	   var xx9=document.getElementById("iddoiappCre").value;
	   var xx10= document.getElementById("idremarksappCre").value ;  
  
	   if(ename=="")
    	{
    	alert("Employee dose not exit..");
    	return false;
    	}
    
	   if(i=="" && j=="" && k=="" && l=="" && m=="" && n=="" && o=="" && p=="" && q=="" && r=="" && s=="" && t=="" && u=="" && v=="" && w=="" && x=="" && y=="" && z=="" && a=="" && b=="" && c=="" && d=="" && k1=="" && o1=="" && s1=="" && y1=="" && z1=="Select" && a1=="Select" && c1=="Select" &&   mo1=="" && mo2=="" && mo3==""  && mo4=="Select"  && hr1==""  && hr2=="" && hr3=="" && hr4=="Select" && hr5=="Select"   && ot1=="" && ot2=="" && xx=="Select" && xx1=="Select" && xx2=="" && xx3=="" && xx5=="" && xx6==""  && xx8=="Select"  && xx9=="" )
		{
		alert("sorry no any data entered...");
		return false;
		}
   
	    if(xx!="Select")
		{
		if( (xx1=="Select" || xx1=="" || xx2=="" ||xx3=="" || xx4=="")&&(xx12==""))
			{
			alert("Please enter all details Laptop/Desktop ...");
			return false;
			}
		}
	    if( xx2!="" ||xx3!="" || xx4!="")
	    {
	    if(xx=="Select")
		    {
		    alert("Please select asset type ...");
		    return false;
		    }
	    }
    
    
    
    
    if(i!="")
    	{
    	if(j=="" || k=="" || l=="" || k1=="")
    		{
    		alert("Please enter all EmailID details...");
    		return false;
    		}
    	}
    if(j!="" || k!="" || l!="" || k1!="")
	    {
	    if(i=="")
		    {
		    alert("Please enter EmailID ...");
		    return false;
		    }
	    }
    /////////////////////////
    if(m!="")
    	{
    	if(n=="" || o=="" || p=="" || o1=="")
    		{
    		alert("Please enter all Newins details...");
    		return false;
    		}
    	}
    if(n!="" || o!="" || p!="" || o1!="")
	    {
	    if(m=="")
		    {
		    alert("Please enter OP Code ...");
		    return false;
		    }
	    }
    ///////////////////////////////////////
    if(q!="")
    	{
    	if(r=="" || s=="" || t=="" || s1=="")
    		{
    		alert("Please enter all DSC details...");
    		return false;
    		}
    	}
    if(r!="" || s!="" || t!="" || s1!="")
	    {
	    if(q=="")
		    {
		    alert("Please enter DSC Pin no ...");
		    return false;
		    }
	    }
    ////////////////////////////////////////
    if(u!="")
    	{
    	if(v=="" || w=="" || x=="")
    		{
    		alert("Please enter all Domain User details...");
    		return false;
    		}
    	}
    if(v!="" || w!="" || x!="")
	    {
	    if(u=="")
		    {
		    alert("Please enter User Name ...");
		    return false;
		    }
	    }
    ////////////////////////////////
    if(y!="")
    	{
    	if(z=="" || a=="" || y1=="" || z1=="Select" || a1=="Select")
    		{
    		alert("Please enter all Data Card details...");
    		return false;
    		}
    	}
    if(z!="" || a!="" || y1!="" || z1!="Select" || a1!="Select")
	    {
	    if(y=="")
		    {
		    alert("Please enter DCard No ...");
		    return false;
		    }
	    }
    ////////////////////////////
    if(b!="")
    	{
    	if(c=="" || d=="" || c1=="Select")
    		{
    		alert("Please enter all Access Card details...");
    		return false;
    		}
    	}
    if(c!="" || d!="" || c1!="Select")
	    {
	    if(b=="")
		    {
		    alert("Please enter Card No...");
		    return false;
		    }
	    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //alert(mo3);
    if(mo1!="")
    	{
    	if(mo2=="" || mo3==""|| mo5==""|| mo6=="" || mo7=="Select")
    		{
    		alert("Please enter all Mobile handset details...");
    		return false;
    		}
    	}
    if(mo2!="" || mo3!="" || mo7!="Select")
	    {
	    if(mo1=="")
		    {
		    alert("Please enter mobile model no...");
		    return false;
		    }
	    }
    /////////////////////
    
    
    //// lotus traveler
    
     if(lotusMod!="")
    	 {
    	 if(lotusOwner=="Select" ||lotusAdd=="")
    		 {
    		  alert("Lotus note traveler Details...");
    		  return false;
    		 }
    	 
    	 }
     if(lotusMod=="")
	 {
	 if(lotusOwner!="Select" || lotusAdd!="")
		 {
		  alert("Lotus note traveler Details...");
		  return false;
		 }
	 
	 }
 
	    if(ftpaddress!="")
	    	{
	    	 if(ftpdoi=="" || ftpremarks=="")
	    		 {
	    		  alert("Please enter the Internet / FTP Details..");
	    		  return false;
	    		 }
	    	}
      
	    if(ftpaddress=="")
    	{
    	 if(ftpdoi!="" || ftpremarks!="")
    		 {
    		  alert("Please enter the Internet /FTP complete Details..");
    		  return false;
    		 }
    	}
  
     
     
     
    
    ///
    
    
    
    
    if(hr1!="")
    	{
    	if(hr2=="" || hr3=="" || hr4=="Select" || hr5=="Select")
    		{
    		alert("Please enter all harddisk/pendrive details...");
    		return false;
    		}
    	}
     if(hr2!="" || hr3!="" || hr4!="Select" || hr5!="Select")
	    {
	    if(hr1=="")
		    {
		    alert("Please enter Hard disk model no...");
		    return false;
		    }
	    }
     
     
     
     
     
     
     
   if(xx5!="")
 	{
 	if(xx6=="" || xx7=="")
 		{
 		alert("Please enter all Shaired Folders details...");
 		return false;
 		}
 	}
   if(xx6!="" || xx7!="")
	    {
	    if(xx5=="")
		    {
		    alert("Please enter Path...");
		    return false;
		    }
	    }
   if(xx8!="Select")
    	{
	   if(xx9=="" || xx10=="")
	    		{
	    		alert("Please enter all App Credentials details...");
	    		return false;
	    		}
	    	}
        if(xx9!="" || xx10!="")
		    {
        	 if(xx8=="")
			    {
			    alert("Please Select App Credentials...");
			    return false;
			    }
		    }
        
    ///////////////////
    if(ot1!="")
    	{
    	if(ot2=="")
    		{
    		alert("Please enter all other details...");
    		return false;
    		}
    	}
    if(ot2!="")
	    {
	    if(ot1=="")
		    {
		    alert("Please enter other asset description...");
		    return false;
		    }
	    }
    
    
    
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




<script type="text/javascript"> //  body onloade()
function cleartext()
    {
		var date = new Date();
		//document.getElementById('datepicker-13').value =null;
		//document.getElementById('datepicker-131').value =null;
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;
		var today = year + "-" + month + "-" + day;
		//idCalendar
	//document.getElementById('demo').value = today;
	//document.getElementById("idAss1").disabled = true;
    document.getElementById("idempId").focus();
    //alert("Here44444444444444");
    document.getElementById("idempId").value="";
    document.getElementById("idempName").value = "";
    document.getElementById("idempDesg").value = "";
    document.getElementById("idempBranch").value = "";
    document.getElementById("idempSubBranch").value = "";
    document.getElementById("idempMobNo").value = "";
    document.getElementById("idempEmailID").value = "";
    document.getElementById("idempDept").value = "";
    document.getElementById("idempRo").value = "";
    document.getElementById("demo").value = "";
    //iddcardno,iddoi1,idremarks1,idemailid1,idpass,iddoi2,idremarks2,idopcode,idpass1,iddoi3,idremarks3,iddscpin,iddsccin,iddoi4,idremarks4,iduname,idpass3,iddoi5,idremarks5,idcard,iddoi6,idremarks6
      
    document.getElementById("idaType").value =  "Select";
    document.getElementById("idano").value =  "Select";
    document.getElementById("idano1").style.visibility = "hidden";
    document.getElementById("iddoiasset").value = "";
    document.getElementById("idassetconf").value = "";
    document.getElementById("idremarksasset").value = ""; 
    
    
    
    
    document.getElementById("idemailid1").value = "";
    document.getElementById("idpass").value = "";
    document.getElementById("iddoi2").value = "";
    document.getElementById("ididfile").value = "";              
    document.getElementById("idremarks2").value = "";
    
    document.getElementById("idopcode").value ="";
    document.getElementById("idpass1").value="";
    document.getElementById("iddoi3").value = "";
    document.getElementById("idlevel").value = "";
    document.getElementById("idremarks3").value = "";
    
    
    document.getElementById("iddscpin").value = "";
    document.getElementById("iddsccin").value = "";
    document.getElementById("iddoi4").value = "";
    document.getElementById("iddscpass").value = "";
    document.getElementById("idremarks4").value = "";
    
    document.getElementById("iduname").value ="";
    document.getElementById("idpass3").value="";
    document.getElementById("iddoi5").value = "";
    document.getElementById("idremarks5").value = "";
    
    document.getElementById("iddcardno").value="";
    document.getElementById("iddoi1").value = "";
    document.getElementById("idimei").value = "";
    document.getElementById("idisp").value = "Select";
    document.getElementById("iddctype").value="Select";
    document.getElementById("idremarks1").value = "";
    
    document.getElementById("idcard").value = "";
    document.getElementById("iddoi6").value = "";
    document.getElementById("idtype").value = "Select";
    document.getElementById("idremarks6").value = "";
    
    document.getElementById("idmobMod").value = "";
    document.getElementById("idmobSer").value = "";
    document.getElementById("iddoiMob").value = "";
 //   document.getElementById("idemailMob").value = "Select";
    document.getElementById("idremarks7").value = "";
    
    document.getElementById("idhardMod").value = "";
    document.getElementById("idhardSer").value = "";
    document.getElementById("iddoiHard").value = "";
    document.getElementById("idhardCap").value = "Select";
    document.getElementById("idhardType").value = "Select";
    document.getElementById("idremarks8").value = "";
    
    document.getElementById("idshaFO").value = "";
    document.getElementById("iddoishaFO").value = "";
    document.getElementById("idremarksshaFO").value = "";
    
    document.getElementById("idappCre").value = "";
    document.getElementById("iddoiappCre").value = "";
    document.getElementById("idremarksappCre").value = "";  
    
    
    document.getElementById("idotherAsset").value = "";
    document.getElementById("iddoiOther").value = "";
    document.getElementById("idremarks9").value = "";
    
    document.getElementById("idmobNum").value = "";
    document.getElementById("idmobSIM").value = "";
    document.getElementById("idmobileNoCom").value = "Select";
    
    document.getElementById("idlotusMod").value = "";
    document.getElementById("idlotusOwner").value = "Select";
    document.getElementById("idlotusIP").value = "";
    
    document.getElementById("idftpAdd").value = "";
    document.getElementById("iddoiFtp").value = "";
    document.getElementById("idremarksFtp").value = "";
    
    
    var checkboxes = document.getElementById("checkboxes");
	  checkboxes.style.display = "none";
	 
    }
</script>

<script type="text/javascript">
function assetnofetch(str,bn){  
	//alert(str);
	document.getElementById("idano1").value = "";
	document.getElementById("iddoiasset").value = "";
    document.getElementById("idassetconf").value = "";
    document.getElementById("idremarksasset").value = ""; 
	document.getElementById("idassetconf").value = "";
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="assetavailableNONIT.jsp"; 
                    //alert (str);
                            url +="?AssetType=" +str + "&bname="+ bn ;   
                            //alert(url);
                           xmlHttp.onreadystatechange = assetavailable1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                     function assetavailable1(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                    document.getElementById("assetno").innerHTML=xmlHttp.responseText;    
                                    document.getElementById("idname").value=xmlHttp.responseText;
                                  }
                            	
                           } 
</script>

<script type="text/javascript">
function assetConfigFetch(str){  
	//alert("vijay"+str);
	if (typeof XMLHttpRequest != "undefined"){    
      xmlHttp= new XMLHttpRequest();    
        }      else if (window.ActiveXObject){    
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
              }      if (xmlHttp==null){   
                 alert("Browser does not support XMLHTTP Request");   
                   return;     
                    }       var url="assetavailableNONIT1.jsp"; 
                    //alert (str);
                            url +="?AssetNo=" +str;   
                            //alert(url);
                           xmlHttp.onreadystatechange = assetavailable1;  
                           xmlHttp.open("GET", url, true);   
                           xmlHttp.send(null);    
         }     
                     function assetavailable1(){     
                            	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                    document.getElementById("assetno").innerHTML=xmlHttp.responseText;    
                                    document.getElementById("idassetconf").value=document.getElementById("configuration").value;
                                     //document.getElementById("idsubBranch").value=xmlHttp.responseText;
                                    }
                            	
                           } 
</script>


</head>
<body onload="cleartext()">
<form  name="form"  method="post"  onsubmit="return validate()" action="assignOtherAssetDBNONIT.jsp" >
</br></br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr align="center">
        <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
    <tr align="center">
       <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br /></font></strong></td>
    </tr>
    <tr align="center">
      <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT</font></strong></td>
    </tr>
    <tr>
       <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
                           
       </td>
   </tr>
</table>
</br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSIGN OTHER ASSET FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
                 <%Connection con1 = null;
                 String url1 = "jdbc:mysql://localhost:3306/";
                 String db1 = "csdb";
                 String driver1 = "com.mysql.jdbc.Driver";
                 String userName1 ="root";
                 String password1="";
                 // int sumcount=0;
                 Statement st1=null,sts=null;
                 ResultSet rs1=null,rss1=null;  %>
       <table border="1" style="height: 100; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
            <tr>
               <td><font size="2" face="Swiss" id="empid"><font color="red" size="4">*</font>EMP&nbsp;ID:</font>
               <td><input type="text" name="empId" maxlength="10" id="idempId" value="" size=10 onkeypress="return isNumber(event)" onkeyup="return sendInfo(this.value);"/> </td>
               <td><font size="2" face="Swiss" id="hiderow">EMP&nbsp;NAME :</font></td>
		       <td><input type="text" name="empName" maxlength="99" id="idempName" value="" size=20 readonly/></td>
		       <td><font size="2" face="Swiss" id="hiderow">EMP&nbsp;DESG :</font></td>
		       <td><input type="text" name="empDesg" maxlength="99" id="idempDesg" value="" size=20 readonly/></td>
		       
		    </tr>                      
		    <tr> 
		       <td><font size="2" face="Swiss" id="hiderow">EMP&nbsp;BRANCH :</font></td>
		       <td><input type="text" name="empBranch" maxlength="99" id="idempBranch" value="" size=20 readonly/></td>
		        <td><font size="2" face="Swiss" id="hiderow">EMP&nbsp;SUBBRANCH :</font></td>
		        <td><input type="text" name="empSubBranch" maxlength="99" id="idempSubBranch" value="" size=20 readonly /></td>
		        <td><font size="2" face="Swiss" id="hiderow">EMP&nbsp;MOB NO :</font></td>
		        <td><input type="text" name="empMobNo" maxlength="99" id="idempMobNo" value="" size=15 readonly/></td>
		    </tr>
		    <tr>   
		       <td><font size="2" face="Swiss" id="hiderow">EMAILID :</font></td>
		       <td><input type="text" name="empEID" maxlength="99" id="idempEmailID" value="" size=40 readonly/>
		       <td><font size="2" face="Swiss" id="hiderow">DEPT :</font></td>
		       <td><input type="text" name="empDept" maxlength="99" id="idempDept" value="" size=20 readonly/>
		       <td><font size="2" face="Swiss" id="hiderow">RO :</font></td>
		       <td><input type="text" name="empRo" maxlength="99" id="idempRo" value="" size=20 readonly/>
		        <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 /></td>
		      
		       <!-- <td><input type="button" name="button" value="Check" id="button" onclick="sendInfo1();"></td> -->
		    </tr>
		</table>
		<br>
		<table border="1" style="height: 100; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
            <tr>
               <td><font size="2" face="Swiss" id="empid">CAR :</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp;Type&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</font></td>
                      <td>
                      <div id='assetName'> 
                      <select name="assetName" id="idaType" onchange="assetnofetch(this.value,idempBranch.value)" style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">
		                    <option value="Select" selected="selected">Select</option>
	                        <option value="CAR">CAR</option>
    	                    <!-- <option value="Desktop">Desktop</option> -->  
	                    </select>
	                    </div>
	                   </td>
                      <td><font size="2" face="Swiss" id="hiderow">Asset No :&nbsp;&nbsp;&nbsp;</font></td>
                       <td><div id='assetno'>      
                           <select name="assetno" id="idano" onchange="assetConfigFetch(this.value)" style="font-size: 11px;width: 110px; overflow: auto; height: 20px ">  
                               <option selected="selected">Select</option> 
                               <!-- <option value='-1' ></option>   -->
                           </select>     
                         </div>
                       <input type="text" name="ano1" maxlength="99" id="idano1" value="" size=20 readonly/> 
                   </td>
                       <td><font size="2" face="Swiss" id="hiderow">Date Of Issues :</font></td>
		              <td><input type="text" name="doiasset" maxlength="99" id="iddoiasset" value="" size=15 onclick="showCalendarControl(this)"/></td>
		              </tr>
		               <tr>  
		               <td><font size="2" face="Swiss" id="hiderow">Config :</font></td>
		              <td><input type="text" name="assetconf" maxlength="99" id="idassetconf" value="" size=20 readonly/></td>   
		               <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarksasset" maxlength="99" id="idremarksasset" value="" size=35 /></td>
		              
		              </tr>
                   </table>
              </td>                        
            </tr>   
           <!--  <tr>
               <td><font size="2" face="Swiss" id="empid">Email&nbsp;ID:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">EmailID&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</font></td>
                      <td><input type="text" name="emailid" maxlength="99" id="idemailid1" value="" size=30 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Password&nbsp;&nbsp;&nbsp;:</font></td>
                       <td><input type="text" name="pass" maxlength="99" id="idpass" value="" size=20 /></td>
                       <td><font size="2" face="Swiss" id="hiderow">Date Of Issues :</font></td>
		              <td><input type="text" name="doi2" maxlength="99" id="iddoi2" value="" size=15 onclick="showCalendarControl(this)"/></td>
		              </tr>
		               <tr>  
		               <td><font size="2" face="Swiss" id="hiderow">IDFile :</font></td>
		              <td><input type="text" name="idfile" maxlength="99" id="ididfile" value="" size=20 /></td>   
		               <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks2" maxlength="99" id="idremarks2" value="" size=35 /></td>
		              
		              </tr>
                   </table>
              </td>                        
            </tr>  -->  
          
          <!--   <tr>
               <td><font size="2" face="Swiss" id="empid">Newins&nbsp;ID:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">OP Code&nbsp;&nbsp;&nbsp;:&nbsp;</font></td>
                      <td><input type="text" name="opcode" maxlength="99" id="idopcode" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Password&nbsp;&nbsp;:&nbsp;&nbsp;</font></td>
                      <td><input type="text" name="pass1" maxlength="99" id="idpass1" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date of Issue&nbsp;&nbsp;:</font></td>
		              <td><input type="text" name="doi3" maxlength="99" id="iddoi3" value="" size=15 onclick="showCalendarControl(this)"/></td>
		              </tr>
		              <tr>     
		              <td><font size="2" face="Swiss" id="hiderow">Level&nbsp;&nbsp;:</font></td>
		              <td><input type="text" name="level" maxlength="99" id="idlevel" value="" size=20 /></td>
		              <td><font size="2" face="Swiss" id="hiderow">Remarks&nbsp;&nbsp;:</font></td>
		              <td><input type="text" name="remarks3" maxlength="99" id="idremarks3" value="" size=35 /></td>
		              
		              </tr>
                   </table>
              </td>
            </tr>   --> 
            <!-- <tr>
               <td><font size="2" face="Swiss" id="empid">DSC:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">DSCPin No:</font></td>
                      <td><input type="text" name="dscpin" maxlength="99" id="iddscpin" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">DSC CIN No:</font></td>
                      <td><input type="text" name="dsccin" maxlength="99" id="iddsccin" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue :</font></td>
		              <td><input type="text" name="doi4" maxlength="99" id="iddoi4" value="" size=15 onclick="showCalendarControl(this)"/></td>
		              </tr>
		              <tr>   
		              <td><font size="2" face="Swiss" id="hiderow">Password :</font></td>
		              <td><input type="text" name="dscpass" maxlength="99" id="iddscpass" value="" size=20 /></td>  
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks4" maxlength="99" id="idremarks4" value="" size=35 /></td>
		              
		              </tr>
                   </table>
              </td>                      
            </tr>    -->
            
            <%-- <tr>   
               <td><font size="2" face="Swiss" id="empid">Domain&nbsp;User:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">User Name:</font></td>
                      <td><input type="text" name="uname" maxlength="99" id="iduname" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Password&nbsp;&nbsp;&nbsp;&nbsp;:</font></td>
                      <td><input type="text" name="pass3" maxlength="99" id="idpass3" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue&nbsp;&nbsp;:</font></td>
		              <td><input type="text" name="doi5" maxlength="99" id="iddoi5" value="" size=15 onclick="showCalendarControl(this)"/></td>
		              </tr>
		              <tr>     
		              <td><font size="2" face="Swiss" id="hiderow">Remarks:</font></td>
		              <td><input type="text" name="remarks5" maxlength="99" id="idremarks5" value="" size=35 /></td>
		              </tr>
                   </table>
              </td>
            </tr>   
            <tr>
               <td><font size="2" face="Swiss" id="empid">Data&nbsp;Card:</font></td>
               <td> <table >
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">DCard&nbsp;&nbsp;No :</font></td>
                      <td><input type="text" name="dcardno" maxlength="99" id="iddcardno" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">DateOf&nbsp;Issue :</font></td>
                      <td><input type="text" name="doi1" maxlength="99" id="iddoi1" value="" size=15 onclick="showCalendarControl(this)"/></td>
                      <td><font size="2" face="Swiss" id="hiderow">IMEI No :</font></td>
		              <td><input type="text" name="imei" maxlength="99" id="idimei" value="" size=20/></td>
		              </tr>
		              <tr> 
		              <td><font size="2" face="Swiss" id="hiderow">ISP :</font></td>
		              <td><%
              try                              
                 {
	             Class.forName(driver1).newInstance();
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 String query1 = "select * from isp_provider";
                 st1 = con1.createStatement();
                 rs1 = st1.executeQuery(query1);
              %>
                       <select name="isp" id="idisp">
		               <option selected="selected">Select</option>
	                   <%while(rs1.next()){%>
			           <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
    	                      <%}%>
	                   </select>
             <%} catch (SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        con1.close();		             
			           }%></td>
		              
		              
		              
		              <td><font size="2" face="Swiss" id="hiderow">DataCardType :</font></td>
		              <td><%
              try
                 {
	             Class.forName(driver1).newInstance();
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 String query1 = "select * from datacard_type";
                 st1 = con1.createStatement();
                 rs1 = st1.executeQuery(query1);
              %>
                       <select name="dctype" id="iddctype">
		               <option selected="selected">Select</option>
	                   <%while(rs1.next()){%>
			           <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
    	                      <%}%>
	                   </select>
             <%} catch (SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        con1.close();		             
			           }%></td>
		               <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks1" maxlength="99" id="idremarks1" value="" size=35/></td>    
		               </tr>
                   </table>
              </td>
            </tr> 
             <tr>
               <td><font size="2" face="Swiss" id="empid">Access&nbsp;Card/ Biometric:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Card No&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </font></td>
                      <td><input type="text" name="card" maxlength="99" id="idcard" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doi6" maxlength="99" id="iddoi6" value="" size=15 onclick="showCalendarControl(this)"/></td>
                      <td><font size="2" face="Swiss" id="hiderow">Type :</font></td>
                     <td><%
              try
                 {
	             Class.forName(driver1).newInstance();
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 String query1 = "select * from accessbiotype";
                 st1 = con1.createStatement();
                 rs1 = st1.executeQuery(query1);
              %>
                       <select name="type" id="idtype">
		               <option selected="selected">Select</option>
	                   <%while(rs1.next()){%>
			           <option value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
    	                      <%}%>
	                   </select>
             <%} catch (SQLException ex)
                          {
                           ex.printStackTrace();                
                          }	
                finally{
                        con1.close();		             
			           }%>
	    </td>
		              
		              </tr>
		              <tr>
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks6" maxlength="99" id="idremarks6" value="" size=35 /></td>
		              </tr>
		           </table>
              </td>
            </tr> 
            <tr>
               <td><font size="2" face="Swiss" id="empid">Mobile&nbsp;Handset</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Model No&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </font></td>
                      <td><input type="text" name="mobMod" maxlength="99" id="idmobMod" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Serial No:</font></td>
                      <td><input type="text" name="mobSer" maxlength="99" id="idmobSer" value="" size=20 /></td>  
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doiMob" maxlength="99" id="iddoiMob" value="" size=15 onclick="showCalendarControl(this)"/></td>
                  
		              </tr>
		              <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Mobile No&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </font></td>
                      <td><input type="text" name="mobileNo" maxlength="99" id="idmobNum" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">SIM No:</font></td>
                      <td><input type="text" name="mobSIM" maxlength="99" id="idmobSIM" value="" size=20 /></td>  
                      <td><font size="2" face="Swiss" id="hiderow">SIM Provided by Company  :</font></td>
		              <td>
		                 <select name="mobileNumComp" id="idmobileNoCom">
		                   <option selected="Select">Select</option>
	                       <option value="Company">YES</option>
	                       <option value="Owner">NO</option>
    	                 </select>
    	              </td>
                  
		              </tr>
		              <tr>
		              
		              <!-- removed mobile access on mobile -->
		             <!--  <td><font size="2" face="Swiss" id="hiderow">Email Access on Mobile:</font></td>
		              <td>
		                 <select name="emailMob" id="idemailMob">
		                   <option selected="Select">Select</option>
	                       <option value="YES">YES</option>
	                       <option value="NO">NO</option>
    	                 </select>
    	              </td> -->
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks7" maxlength="99" id="idremarks7" value="" size=35 /></td>
		              </tr>
		            </table>
              </td>
            </tr>
              <tr>
               <td><font size="2" face="Swiss" id="empid">Lotus Note Traveler &nbsp;</font></td>
                <td>
               <table>
                <tr>
                <td><font size="2" face="Swiss" id="hiderow">Device Model &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </font></td>
                      <td><input type="text" name="lotusMod" maxlength="99" id="idlotusMod" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Device Owner ? :</font></td>
                      <td>
                   		   <select name="lotusOwner" id="idlotusOwner">
			                   <option selected="Select">Select</option>
		                       <option value="Company">Company</option>
		                       <option value="Owner">Own</option>
	    	               </select>
                      </td>  
                    <td><font size="2" face="Swiss" id="hiderow">Lotus Note Address  :</font></td>
                        <td><input type="text" name="lotusIP" maxlength="99" id="idlotusIP" value="" size=20 /></td>  
		       </tr>
		            </table> 
                </tr>         
            
            <tr>
               <td><font size="2" face="Swiss" id="empid">Internet &nbsp;/FTP:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">IP-Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></td>
                      <td><input type="text" name="ftpAddress" maxlength="100" id="idftpAdd" value="" size=20 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doiFtp" maxlength="99" id="iddoiFtp" value="" size=15 onclick="showCalendarControl(this)"/></td>
                      <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarksFtp" maxlength="99" id="idremarksFtp" value="" size=35 /></td>
                      </tr>
		            
		           </table>
              </td>
            </tr>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
               
          <tr>
               <td><font size="2" face="Swiss" id="empid">HardDisk&nbsp;/PenDrive:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Model No&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; </font></td>
                      <td><input type="text" name="hardMod" maxlength="99" id="idhardMod" value="" size=20 /></td>
                       <td><font size="2" face="Swiss" id="hiderow">Serial No:</font></td>
                      <td><input type="text" name="hardSer" maxlength="99" id="idhardSer" value="" size=20 /></td>  
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doiHard" maxlength="99" id="iddoiHard" value="" size=15 onclick="showCalendarControl(this)"/></td>
                     
		              </tr>
		              <tr>
		              <td><font size="2" face="Swiss" id="hiderow">External Capacity:</font></td>
		              <td>
		                 <select name="hardCap" id="idhardCap">
		                   <option selected="Select">Select</option>
	                       <option value="1">1</option>
	                       <option value="2">2</option>
	                        <option value="3">3</option>
	                       <option value="4">4</option>
	                        <option value="5">5</option>
	                       <option value="8">8</option>
	                        <option value="16">16</option>
	                       <option value="32">32</option>
	                        <option value="64">64</option>
	                       <option value="128">128</option>
	                        
    	                 </select>
		                 <select name="hardType" id="idhardType">
		                   <option selected="Select">Select</option>
	                       <option value="GB">GB</option>
	                       <option value="TB">TB</option>
    	                 </select>
    	              </td>
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks8" maxlength="99" id="idremarks8" value="" size=35 /></td>
		              </tr>
		           </table>
              </td>
            </tr>
            
            
            <tr>
               <td><font size="2" face="Swiss" >Shaired Folder:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Path</td>
                     
                      <td><input type="text" name="shaFO" maxlength="99" id="idshaFO" value="" size=40 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doishaFO" maxlength="99" id="iddoishaFO" value="" size=15 onclick="showCalendarControl(this)"/></td>
                      </tr>
		              <tr>
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarksshaFO" maxlength="99" id="idremarksshaFO" value="" size=35 /></td>
		              </tr>
		           </table>
              </td>
            </tr>         
            
            <tr>
               <td><font size="2" face="Swiss" >App Credentials:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">App Name :</td>
                      
                      
                      <td colspan="6">
                      <%      
                               try
                                 {
            	                 Class.forName(driver1).newInstance();
                                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                                 String query5 = "select * from software_owner_master ORDER BY developer_name ASC";
                                 sts = con1.createStatement();
                                 rss1 = sts.executeQuery(query5);
                                 %>
                             	<div class="multiselect">
                                   <div class="selectBox"onclick="showCheckboxes()">
                                         <select >
                                              <option value="">Select</option>
                                        </select>
                               <input type="text" name="appCre" size=25 id="idappCre" />
                                 <div class="overSelect"></div>
                                </div>
                                <div id="checkboxes"  onclick="showCheckboxes()">
                                        <%while(rss1.next()){%> 
     	                                     <label for="<%=rss1.getString(2)%>">
      			                             <input type="checkbox" name="approverslist" onclick="sync(this),showCheckboxes()" id="<%=rss1.getString(2)%>" class="group1" value="<%=rss1.getString(2)%>" /><%=rss1.getString(2)%></label><br />
     	      	                      <%}%>
                               </div>
                           </div>
     	<%} catch (SQLException ex) {
                                      ex.printStackTrace();
                                      }	
                                finally{
	                                 con1.close();	
                                		}%>
     	</td>
                      
                      
                      
                      <td>
                            <%      
                               try
                                 {
            	                 Class.forName(driver1).newInstance();
                                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                                 String query5 = "select * from software_owner_master ORDER BY developer_name ASC";
                                 sts = con1.createStatement();
                                 rss1 = sts.executeQuery(query5);
                                 %>
                                 <select name="appCre" id="idappCre">
		                         <option selected="selected">Select</option>
	                                   <%while(rss1.next()){%>
			                                  <option value="<%=rss1.getString(2)%>"><%=rss1.getString(2)%></option>
    	                              <%}%>
	                           </select>
		                    <%} catch (SQLException ex) {
                                      ex.printStackTrace();
                                      }	
                                finally{
	                                 con1.close();	
                                		}%>
                       
                      </td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doiappCre" maxlength="99" id="iddoiappCre" value="" size=15 onclick="showCalendarControl(this)"/></td>
                      </tr>
		              <tr>
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarksappCre"  maxlength="99" id="idremarksappCre" value="" size=35 /></td>
		              </tr>
		           </table>
              </td>
            </tr>         
            
            
            
            
                 
         <tr>
               <td><font size="2" face="Swiss" id="empid">Other Asset:</font></td>
               <td>
                   <table>
                      <tr>
                      <td><font size="2" face="Swiss" id="hiderow">Asset Desicription</td>
                      <td><input type="text" name="otherAsset" maxlength="99" id="idotherAsset" value="" size=40 /></td>
                      <td><font size="2" face="Swiss" id="hiderow">Date Of Issue:</font></td>
                      <td><input type="text" name="doiOther" maxlength="99" id="iddoiOther" value="" size=15 onclick="showCalendarControl(this)"/></td>
                      </tr>
		              <tr>
		              <td><font size="2" face="Swiss" id="hiderow">Remarks :</font></td>
		              <td><input type="text" name="remarks9" maxlength="99" id="idremarks9" value="" size=35 /></td>
		              </tr>
		           </table>
              </td>
            </tr>         
     --%>          
		</table>
</center>
<table width="79%" border="1" align="center" bgcolor="lightgrey">
       	<tr>
       	<td style="size: 1">
	     <center>
	     <input type=submit name="button" value="Add/Update" id="button">
		 <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" />
	     </center>
	     </td></tr>
 </table>
</div>
</div>
<br> 
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 

</form>
       <div id="resultFromAjax2" style="display:none;">
        
       </div>
       <div id="resultFromAjax1" style="display:none;">
        
       </div>
    
</body>
</html>