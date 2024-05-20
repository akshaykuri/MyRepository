<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<%@page import="CON2.ConnectionLMS" %> 
<jsp:useBean id = "lms" class="CON2.ConnectionLMS" />

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<script src="https://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
<script language="javascript"   type="text/javascript" src="js/onSubmitWait.js"></script>

		<script>
var timer=null;

function stop()
{
clearTimeout(timer);
}

function start()
{
var time=new Date();
var hours=time.getHours();
var minutes=time.getMinutes();
minutes=((minutes < 10) ? "0" : "") + minutes;
var seconds=time.getSeconds();
seconds=((seconds < 10) ? "0" : "") + seconds;
var clock=hours + ":" + minutes + ":" + seconds;
document.forms[0].cs_time.value=clock;
timer=setTimeout("start()",1000);
}
</script>
	
	
		<script>
		var id =0;
		$(document).ready(function() {
		$("table.dynatable button.add").click(function() {
				id++;
			   var master = $(this).parents("table.dynatable");
				var prot = master.find(".prototype").clone();
				prot.attr("class", "")
				prot.find(".id").attr("value", id);
				/* prot.find(".incSi_drive").attr("id","id_si_drive"+id); 
				prot.find(".incSi_harddisk").attr("id","id_si_harddisk"+id); 
				prot.find(".incSi_usedSpace").attr("id","id_si_usedspace"+id);
				prot.find(".incSi_freeSpace").attr("id","id_si_freespace"+id); */
				master.find("tbody").append(prot);
			});
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("tr").remove();
				id--;
			});
		});
	</script>
	<script>
		var id2 =0;
		$(document).ready(function() {
		$("table.dynatable2 button.add2").click(function() {
			
			  //  alert("dyn table 2");
				id2++;
			   var master2 = $(this).parents("table.dynatable2");
				var prot2 = master2.find(".prototype2").clone();
				prot2.attr("class", "");
				prot2.find(".id2").attr("value", id2);
				
				prot2.find(".incmpls").attr("name","mpls"+id2);
				//prot2.find(".mplsradio2").attr("id","mpls"+id2);
		/* 		prot.find(".incMpls_name").attr("id","id_mpls_name"+id); 
				prot.find(".incMpls").attr("id","id_mpls"+id);
				prot.find(".incMpls_remarks").attr("id","id_mpls_remarks"+id); */
				
				master2.find("tbody").append(prot2);
			});
			$("table.dynatable2 button.remove2").live("click", function() {
				$(this).parents("tr").remove();
				id2--;
			});
		});
	</script> 
	<script>
		var id3 =0;
		$(document).ready(function() {
		$("table.dynatable3 button.add3").click(function() {
			id3++;
			   var master3 = $(this).parents("table.dynatable3");
				var prot3 = master3.find(".prototype3").clone();
				prot3.attr("class", "");
				prot3.find(".id3").attr("value", id3);
				prot3.find(".incinternet").attr("name","internet"+id3);
				master3.find("tbody").append(prot3);
			});
			$("table.dynatable3 button.remove3").live("click", function() {
				$(this).parents("tr").remove();
				id3--;
			});
		});
	</script>
	<!-- <script>
		var id4 =0;
		$(document).ready(function() {
		$("table.dynatable4 button.add4").click(function() {
			id4++;
			   var master4 = $(this).parents("table.dynatable4");
				var prot4 = master4.find(".prototype4").clone();
				prot4.attr("class", "");
				prot4.find(".id4").attr("value", id4);
				prot4.find(".incbkup").attr("name","bkup"+id4);
				master4.find("tbody").append(prot4);
			});
			$("table.dynatable4 button.remove4").live("click", function() {
				$(this).parents("tr").remove();
				id4--;
			});
		});
	</script> -->
	<script>
		var id5 =0;
		$(document).ready(function() {
		$("table.dynatable5 button.add5").click(function() {
			id5++;
			   var master5 = $(this).parents("table.dynatable5");
				var prot5 = master5.find(".prototype5").clone();
				prot5.attr("class", "");
				prot5.find(".id5").attr("value", id5);
				prot5.find(".incphto").attr("name","phto"+id5);
				master5.find("tbody").append(prot5);
			});
			$("table.dynatable5 button.remove5").live("click", function() {
				$(this).parents("tr").remove();
				id5--;
			});
		});
	</script>
	<script>
		var id6 =0;
		$(document).ready(function() {
		$("table.dynatable6 button.add6").click(function() {
			id6++;
			   var master6 = $(this).parents("table.dynatable6");
				var prot6 = master6.find(".prototype6").clone();
				prot6.attr("class", "");
				prot6.find(".id6").attr("value", id6);
				prot6.find(".incprt").attr("name","prt"+id6);
				master6.find("tbody").append(prot6);
			});
			$("table.dynatable6 button.remove6").live("click", function() {
				$(this).parents("tr").remove();
				id6--;
			});
		});
	</script>
	<script>
		var id7 =0;
		$(document).ready(function() {
		$("table.dynatable7 button.add7").click(function() {
			id7++;
			   var master7 = $(this).parents("table.dynatable7");
				var prot7 = master7.find(".prototype7").clone();
				prot7.attr("class", "");
				prot7.find(".id7").attr("value", id7);
				prot7.find(".incfx").attr("name","fx"+id7);
				master7.find("tbody").append(prot7);
			});
			$("table.dynatable7 button.remove7").live("click", function() {
				$(this).parents("tr").remove();
				id7--;
			});
		});
	</script>
	<script>
		var id8 =0;
		$(document).ready(function() {
		$("table.dynatable8 button.add8").click(function() {
			id8++;
			   var master8 = $(this).parents("table.dynatable8");
				var prot8 = master8.find(".prototype8").clone();
				prot8.attr("class", "");
				prot8.find(".id8").attr("value", id8);
				prot8.find(".incbr").attr("name","br"+id8);
				master8.find("tbody").append(prot8);
			});
			$("table.dynatable8 button.remove8").live("click", function() {
				$(this).parents("tr").remove();
				id8--;
			});
		});
	</script>

<%
if(session==null||session.getAttribute("NpostingCo")==null||session.getAttribute("b_no")==null)
{
	String msgg="Session TimeOut";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
%>
		<script type="text/javascript">
		
		
		     function clear()
		          {
		          
		                 
		               	   var frm=document.forms[0],flds=[frm['mr_itemQuantity'],frm['mr_itemRate'],frm['mr_itemAmount']],total=0;
 							for (var z0=0;z0<flds[0].length;z0++)
 							{
 							 if (isFinite(flds[0][z0].value*1)&&isFinite(flds[1][z0].value*1))
 							 {
 							  flds[2][z0].value = clearComma(flds[2][z0].value);
  						     }
					        }          
 						    frm['totalcon'].value=(clearComma(total));
		 
			     }
		
		       function calculateDynamic()
		          {
		          
		                 
		               	   var frm=document.forms[0],flds=[frm['mr_itemQuantity'],frm['mr_itemRate'],frm['mr_itemAmount']],total=0;
 							for (var z0=0;z0<flds[0].length;z0++)
 							{
 							 if (isFinite(flds[0][z0].value*1)&&isFinite(flds[1][z0].value*1))
 							 {
 							    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
  							      
  							      
  							     var temp =  flds[2][z0].value = click123(flds[0][z0].value*flds[1][z0].value);
  							      
  							      temp = clearComma(temp);
  							      total+= (temp*1);
  						     }
					        }          
 						    frm['totalcon'].value=(click123(total));
		 
			     }
			     
	function vatcal()
      { 
       
    	var value = clearComma(document.getElementById("totalcon").value);
    	
    	  
            
		var vat = document.getElementById("abcvat").value;
		
		//alert(value)
		//alert(vat)
		var subTotal = parseFloat(Math.round(parseFloat(value)*parseFloat(vat))/(100));
		document.getElementById("vat1").value=subTotal;
	  }
			     
		</script>
				 <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<!-- 	   <script type="text/javascript">
    $(function(){
    $('input:checkbox').change(function()
    		{
    		$('input:checkbox[name="'+this.name+'"]').not(this).prop('checked',!this.checked);
  			});
    });
    </script> -->
	
	
	<script type = "text/javascript">
  function  get_val( tot_val,HeadVal)
  {
   document.getElementById('TextBox1').value = tot_val;
   document.getElementById('idVendorText').value = HeadVal;
   }
   
   function get_val9(tot_val)
   {
   		var append = tot_val.charAt(tot_val.length-2);
   		
   		
   		if(append=='a')
   		  {
   		      alert("Cannot be appended");
   		  }
   		else{
   		// form.action = "MRAMDExtend.jsp?msg=1";
   		 form.action = "MRHOExtend.jsp?msg=1";
   		 form.method = "post";
 		 form.submit();
         }
   }
   
   function  get_val2( tot_val )
  {
   document.getElementById('TextBox2').value = tot_val;
   }
    function  get_v2( tot_val )
  {
   document.getElementById('TBox2').value = tot_val;
   }
   function  get_v22( tot_val )
  {
   document.getElementById('TBox22').value = tot_val;
   }
   function  get_val3( tot_val,BillCo)
  {
   document.getElementById('TextBox3').value = tot_val;
   document.getElementById('idabc3').value = BillCo;
   }
     function  get_v3( tot_val )
  {
   document.getElementById('TBox3').value = tot_val;
   }
    function  get_v33( tot_val )
  {
   document.getElementById('TBox33').value = tot_val;
   }
    function  get_val4( tot_val,ShipCo )
  {
   document.getElementById('TextBox4').value = tot_val;
   document.getElementById('idabc4').value = ShipCo;
   }
    function  get_v4( tot_val )
  {
   document.getElementById('TBox4').value = tot_val;
   }
   function  get_v44( tot_val )
  {
   document.getElementById('TBox44').value = tot_val;
   }
   
   function  get_val5( tot_val,head_val, ids )
   {
    
         var y = 'iditemName'+ids.toString();
         var z = 'idHead'+ids.toString();
        document.getElementById(y).value = tot_val; 
        document.getElementById(z).value = head_val; 
     	
   } 
   
 function moveNumbers() 
{ 
var TextBox1=document.getElementById("TextBox1"); 
var option=TextBox1.options[TextBox1.selectedIndex].text; 
document.getElementById("result").value=option; 
} 

function cancel()
	        {
		alert("You cancelled !!\n\n   data is lost !!!");
			}
  </script>
  <script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="selEmp.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
            
            
     function Mail(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="selectMailId.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText   
                                                      } 
                                                              
            } 
            
/*  
function popupform(myform, windowname)
{
if (! window.focus)return true;
window.open('', windowname, 'height=200,width=400,scrollbars=yes');
myform.target=windowname;
return true;
}
 */

            
                </script>
<script>

function click123(nStr)
        {
            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            var z = 0;
            var len = String(x1).length;
            var num = parseInt((len/2)-1);

            while (rgx.test(x1))
            {
                if(z > 0)
                {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
                }
                else
                {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
                    rgx = /(\d+)(\d{2})/;
                }
                z++;
                num--;
                if(num == 0)
                {
                    break;
                }
            }
           <%-- document.getElementById('totalconvert').value = x1+x2  --%>
            return x1 + x2;
        }




    function clearComma(val)
    {
    // var v = document.getElementById('vat1').value
    //alert("inside clear "+val);
    
    
    
    var v = val;
    
    
  //  alert("v "+v);
		    <%-- alert("coming"+v);--%>
		    for(i=0; i<v.length; i++)
            {
                v = v.replace(',', '')
            }
            
            return v;
   }
        
    function calculatemain()
    {
     var v = document.getElementById('vat1').value
		    <%-- alert("coming"+v);--%>
		    for(i=0; i<v.length; i++)
            {
                v = v.replace(',', '')
            }
            <%-- alert("getting"+v);--%>
            
            if (v == null || v.length == 0) {
                v = 0; // Use this value in the later stages
                 }
            document.form.vat1.value = click123(v)
            var v2 = document.getElementById('vat2').value
            <%-- alert("coming"+v2);--%>
            for(i=0; i<v2.length; i++)
            {
                v2 = v2.replace(',', '')
            }
           <%-- alert("getting"+v2); --%>
            if (v2 == null || v2.length == 0) 
                {
                v2 = 0; // Use this value in the later stages
                }
           document.form.vat2.value = click123(v2)
           <%--document.form.totalcon.value = Totalmain--%>  
           Total = parseFloat(total) + parseFloat(v) + parseFloat(v2);
           <%--Math.ceil(value* 2) / 2;--%>
           
           <%--Convert a number, without keeping any decimals:
 
var num = 5.56789;
 var n=num.toFixed();--%> 
            var To = Total.toFixed();
		   <%-- var Total =parseFloat(Math.round(parseInt(x)+parseInt(v)+parseInt(v2)));--%>
		document.getElementById("rupees").value=click123(To);
		
		 }
function calcu()
		 {
		  v = document.form.vat1.value
		 v = Number(v)           
               for(i=0; i<v.length; i++)
            {
                v = v.replace(',', '')
            }
           <%-- alert("after value " +a11);--%>
  
             document.form.vat1.value = click123(v);
             
         v2 = document.form.vat2.value
         	 v2 = Number(v2)           
               for(i=0; i<v2.length; i++)
            {
                v2 = v2.replace(',', '')
            }
           <%-- alert("after value " +a11);--%>
  
             document.form.vat2.value = click123(v2);
         
         t = document.form.totalcon.value
         	 t = Number(t)           
               for(i=0; i<t.length; i++)
            {
                t = t.replace(',', '')
            }
           <%-- alert("after value " +a11);--%>
  
             document.form.totalcon.value = click123(t);
        
		 total123 =  parseFloat(v) + parseFloat(v2) + parseFloat(t);
		
		 document.getElementById("rupees").value=click123(total123);
		 }
		 
		 function calll()
		 {
		 
		 var x = document.getElementById('totalcon').value
            <%-- alert("comming inside test box"+x); --%>
            for(i=0; i<x.length; i++)
            {
                x = x.replace(',', '')
            }
            <%-- alert("after value " +x); --%>
            <%--document.getElementById('txt1').value = x;--%>
             if (x == null || x.length == 0) {
                x = 0; // Use this value in the later stages
                 }
        
		   
		    
		    var v = document.getElementById('vat1').value
		    <%-- alert("coming"+v);--%>
		    for(i=0; i<v.length; i++)
            {
                v = v.replace(',', '')
            }
            <%-- alert("getting"+v);--%>
            
            if (v == null || v.length == 0) {
                v = 0; // Use this value in the later stages
                 }
            document.form.vat1.value = click123(v)
            var v2 = document.getElementById('vat2').value
            <%-- alert("coming"+v2);--%>
            for(i=0; i<v2.length; i++)
            {
                v2 = v2.replace(',', '')
            }
           <%-- alert("getting"+v2); --%>
            if (v2 == null || v2.length == 0) 
                {
                v2 = 0; // Use this value in the later stages
                }
           document.form.vat2.value = click123(v2)
            
           Total = parseFloat(x) + parseFloat(v) + parseFloat(v2);
           <%--Math.ceil(value* 2) / 2;--%>
           
           <%--Convert a number, without keeping any decimals:
 
var num = 5.56789;
 var n=num.toFixed();--%> 
           
		   
		   var To = Total.toFixed();
		   <%-- var Total =parseFloat(Math.round(parseInt(x)+parseInt(v)+parseInt(v2)));--%>
		document.getElementById("rupees").value=click123(To);
		
		  Tota = parseFloat(v) + parseFloat(v2);
		   var To1 = Tota.toFixed();
		 
		document.getElementById("vat3").value=click123(To1);
       }
		 
	 
       function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
		 
	function operate() {
    	  //enable print
      		document.getElementById("print").disabled=false;
      		document.getElementById("word").disabled=false;
     	 //disable save
 			document.getElementById("save1").disabled=true;
			 return true;
			}
	 function link() {
   			 document.form.action="jasperMoreThenTenItem";
   			 document.form.method="post";
   			 document.form.submit();
   			 
   					 }
   	 function Word() {
   	         document.form.action="jasperMoreThenTenItemWord";
   	         document.form.method="post";
   	         document.form.submit();
   	         }	 	 
		 
		
</script>
  <style type="text/css"> 
textarea.special { 
font-family:arial; 

font-size:11px; 
overflow: auto;
}

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
select {
    font-size:0.8em;
     /* border-color:#999;  without this, it won't work */
}

</style>
<script type="text/javascript">
function valthisform(form) 
{

	//var checkboxes = document.forms.form.elements.mailingCheck;
	var checkboxes = document.getElementsByName('mailingCheck');
	//alert("BEFORE LENGTH : "+checkboxes);
	//alert("LENGTH : "+checkboxes.length);
	//if(checkboxes.length == undefined) 
	//checkboxes.length = 0;
	//  alert("LENGTH 2 : "+checkboxes.length);
	  for (var i = 0; i < checkboxes.length; i++) 
	     {
	      if (checkboxes[i].checked) 
	          {
	      		return true;
	          }
	      }
      alert('Please Tick the Check box for selecting mail id:');
	  return false;
  }
</script>
		<script type="text/javascript">
		      function linkInsert()
		        {
		            document.form.action = "PurchaseOrderBack.jsp";  
		        	document.form.method = "post";
		        	document.form.submit();
		        
		        }
		      
		      
		</script>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
	
		
		<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
			
			
			.dynatable2 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable2 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable2 .prototype2 {
				display:none;
			}
		
			.dynatable3 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable3 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable3 .prototype3 {
				display:none;
			}
		
			.dynatable4 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable4 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable4 .prototype4 {
				display:none;
			}
			
			.dynatable5 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable5 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable5 .prototype5 {
				display:none;
			}
			
			.dynatable6 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable6 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable6 .prototype6 {
				display:none;
			}
			
			.dynatable7 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable7 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable7 .prototype7 {
				display:none;
			}
		
			.dynatable8 {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable8 td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable8 .prototype8 {
				display:none;
			}
		
		</style>
		 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }

   function validate()
       {
       var cremark= document.form.main_remarks;
       if(cremark.value=="")
    	   {
    	   alert("Enter Remarks");
    	   cremark.focus();
    	   return false;
    	   }
  	  else
           return true;
   }
</script>

</head>

                  <%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null, Initiator=null,locationNO=null;
	              
	              String []itemName=null;
	              String []itemQuantity;
	              String []itemRate;
	              String []abbreviation;
	              String []asset;
	              String []itemAmount;
	              Connection2 dbConn = new Connection2();
	              String transid = null;  
	              String[] req=null;
	              %>
                  <%
                 
                  req = request.getParameterValues("loc[]");
                  int l=req.length;
                  System.out.println("Length $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ "+l);
                  
                  
     		      logInName = session.getAttribute("theName");
     		      realname =  session.getAttribute("Nname");
     		      desg = session.getAttribute("desg");
     		      city = session.getAttribute("NpostingCo");
     		      Initiator = session.getAttribute("Nmail");
     		      locationNO = session.getAttribute("b_no");
     		      /* System.out.println("b_no ********************************* "+locationNO);
     		      System.out.println("Location handling :  "+req);
     		      System.out.println("logInName  "+logInName);
     		      System.out.println("realname  "+realname);
     		      System.out.println("desg  "+desg);
     		      System.out.println("Branch nameeee  "+city);
     		      System.out.println("Initiator NAMEEEEEEEE "+Initiator); */
     		      Connection cn_id = null,cn8=null; 
                  Statement st_id = null,st8=null; 
                  ResultSet rs_id = null,rs8=null; 
                  %>
<body >
    <form action="CheckListBack.jsp" method="post" name="form" id="form">
     <input type="hidden" name="totlength" value="<%=l%>" />
    <textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"><%= session.getAttribute( "theName" ) %></textarea>
    <br /><br /><div id="page-wrap">
    <table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	   <tr>
		   <td><font size="3"><b><center><label>NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> </center></b></font></td>
	   </tr>
    </table>
    <br />
    <br />
    <center>
    <label><font color="black"><u><b>IT CHECK LIST</b></u></font></label> </center>


               <%  
               String cs_date;
         	   DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         	   //get current date time with Date()
         	   Date date = new Date();
               cs_date = dateFormat.format(date);
               //System.out.println("cs date we are getting "+cs_date);
               String cr_time;
               GregorianCalendar gcalendar = new GregorianCalendar();
               /* System.out.print("Time: ");
               System.out.print(gcalendar.get(Calendar.HOUR) + ":");
               System.out.print(gcalendar.get(Calendar.MINUTE) + ":");
               System.out.println(gcalendar.get(Calendar.SECOND)); */
               String timee = (gcalendar.get(Calendar.HOUR) + ":" +gcalendar.get(Calendar.MINUTE) + ":"+gcalendar.get(Calendar.SECOND));
               //System.out.print("Time:gggggggggggg "+timee);
               %>


		      <%--  <%
                    String new_id = null;
                    int id=0;
                    String id22=null;
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    //System.out.println("Location Of Check Sheet  "+locationNO);
                    rs_id = st_id.executeQuery("SELECT max( idextend ),(SELECT MAX(substr(cs_id,12,4)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no) AS increval,(SELECT MAX(substr(cs_id,1,11)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no) AS increLoc  FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no");
                    while ( rs_id.next() )
                        {    
                     	try
                    	   {
                    	   id=rs_id.getInt(1);
                    	   System.out.println("\\n id of sequence no, "+id);//19
                    	   if(id==0)
                    		   id=1;
                    	   id22= rs_id.getString("increLoc");
                    	   if(id22==null)
                    		   id22="NEIN/CS/"+locationNO+"-";
                    		System.out.println("id of idextend no, "+id22);
                            id++;     
                    		new_id = "" +String.valueOf(id);
                    		System.out.println("CS HO "  +new_id);//20
                    		}
                    	catch(SQLException ex)
                    	    {
                    		System.out.println(ex.toString());
                    		new_id = "NEIN/CS/90-1";
                    	    }
                       }
                       %> --%>
   <%
   try
     {
     int len=0;
     while(len<l)
         {
    	 transid = "abc"+String.valueOf(Math.random());
         %> <br></br>           
         <div style="clear:both"></div>
		 <div id="customer"></div>
         <table border="0" width="890">
         <tr>
             <td style="visibility: hidden; display: none">
                <input type="hidden" name="transid<%=len%>" value="<%=transid%>" />
   
	            <input type="hidden" name="idextend<%=len%>" value="<%=id%>" />
	            <input type="hidden" name="e_name<%=len%>" value="<%=session.getAttribute("Nname")%>" />
	            <input type="hidden" name="e_designation<%=len%>" value="<%=session.getAttribute("desg")%>" />
	            <input type="hidden" name="b_no" value="<%=session.getAttribute("b_no")%>" />
	            <input type="hidden" name="Initiator_mail_id<%=len%>" value="<%=session.getAttribute("Nmail")%>" />
	        </td>
         </tr>
         <tr >
             <td align="center" bgcolor="blue" style="padding-left: 5px;padding-bottom:3px; font size="35;"">Location:<input name="city<%=len%>" id="idcity" value="<%=req[len]%>" readonly="readonly"/></td>
         </tr>
         <tr >
             <td width="450"> Date (dd/mm/yyyy):  <textarea readonly="readonly" id="idcs_date" name="cs_date<%=len%>" rows="1"><%= cs_date %></textarea></td>
             <td width="450" align="right" style="visibility: hidden; display: none">Time:   <textarea readonly="readonly" id="idcs_time" name="cs_time<%=len%>" rows="1" ></textarea></td>
          </tr>
       </table>
       <br />
       <table border="1" cellspacing="1" width="890">
           <tr>
               <td width="25" align="center" height="5" colspan="2"><center>1</center></td>
               <td >&nbsp;Power supply </td><td width="443"></td>
          </tr>
          <tr>
 	          <td width="30" align="center" rowspan="5"><center></center></td>
	          <td colspan="2">&nbsp;RAW Power Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		         <input type ="radio" name = "ps_raw<%=len%>" value ="YES" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <input type ="radio" name = "ps_raw<%=len%>" value ="NO" />NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <input type ="radio" name = "ps_raw<%=len%>" value ="NOT APPLICABLE" />NOT APPLICABLE
             </td>
         </tr>
         <tr>
	         <td colspan="2">&nbsp;UPS Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type ="radio" name = "ps_upsworking<%=len%>" value ="YES" readonly="readonly" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type ="radio" name = "ps_upsworking<%=len%>" value ="NO" readonly="readonly" />NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type ="radio" name = "ps_upsworking<%=len%>" value ="NOT APPLICABLE" readonly="readonly" />NOT APPLICABLE
            </td>
        </tr>
        <tr>
	       <td colspan="2">&nbsp;UPS Backup Time( To be checked weekly once )</td>
	       <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type ="text" name = "ps_upsbackup<%=len%>" value =""  maxlength="10"/>hours</td>
        </tr> 
        <tr>
 	       <td colspan="2"  height="20">&nbsp;UPS Preventive Maintenance<br />( to be checked 3 months once ) </td>
           <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	         	<input type ="radio" name = "ps_upspreventive<%=len%>" value ="YES" readonly="readonly" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type ="radio" name = "ps_upspreventive<%=len%>" value ="NO" readonly="readonly" />NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type ="radio" name = "ps_upspreventive<%=len%>" value ="NOT APPLICABLE" readonly="readonly" />NOT APPLICABLE
          </td>
       </tr> 
      <tr></tr>
    <table border="1" cellspacing="1" align="center" width="890">
      <tr>
         <td width="65" align="center" height="5" colspan="2"><center>2</center></td>
         <td width="390">&nbsp;MPLS VPN </td><td width="445"></td>
      </tr>
   </table>
   <%
    Connection cn7 = null;
    Statement st7 = null; 
    ResultSet rs7 = null;
    try
      {
      cn7 = con.getConnection2();
      st7=cn7.createStatement();
      rs7 = st7.executeQuery("select m.isp_name from mpls_master m INNER JOIN branch_master b ON(m.bkLocation=b.b_name) WHERE b.b_no='"+locationNO+"'  ORDER BY m.id Asc");
      int id2=0;
      %>
      <table class="dynatable2" border="2" cellspacing="1" border="1" width="890" style="height: 150"  bgcolor="">
	    <tr>
	         <td width="30" align="center"  height="21" ></td>
		     <td width="45" align="center"  height="21" ><button class="add2" type="button">+</button></td>
			 <td width="60" align="center"  height="21" >SL<br />NO.</td>
			 <td width="320" align="center"  height="21" ><font color="red" size="4">*</font>LINK/LINE</td>				
			 <td width="445" align="center"  height="21" colspan="4" >Downtime:<br /> ( if NO, pls. specify total no. of hours down )</td>
		</tr>
		<tr class="prototype2">
			<td width="30" align="center"  height="21" ></td>
	        <td width="45" align="center"  height="21" ><button class="remove2" type="button">--</button></td>
			<td width="60" align="center"  height="21" ><input type="text" name="id2[]" value="0" size=1 class="id2" /></td>					
			<td width="320" align="center"  height="21" >
			     <select name="mpls_name<%=len%>"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs7.next()){ %>
					<option> <%=rs7.getString(1)%> </option> 
					<%} 
		} catch (SQLException ex) { ex.printStackTrace();} 
		finally { 
                if (rs7 != null) { try { rs7.close(); } catch (SQLException e) { /* ignored */}}
	 			if (st7 != null) { try { st7.close(); } catch (SQLException e) { /* ignored */}}
			    if (cn7 != null) { try { cn7.close(); } catch (SQLException e) { /* ignored */}}
                }%> 
				</select>
  			</td>
            <td width="100" align="center"  height="21" ><input type="radio"  value="YES" class="incmpls" />YES</td>
            <td width="100" align="center"  height="21" ><input type="radio"  value="NO"  class="incmpls" />NO</td>
			<td width="245" align="center"  height="21" ><input type="text" name="mpls_remarks<%=len%>" maxlength="90" value="" /></td>      
		</tr>
	 </table>
     <table border="1" cellspacing="1" align="center" width="890">
        <tr>
	       <td width="20" align="center" height="5" ><center>3</center></td>
	       <td width="390" colspan="2">&nbsp;INTERNET CONNECTION</td><td width="440"></td>
        </tr>
     </table>	
	<%
     cn8 = con.getConnection2();
     st8=cn8.createStatement();
     rs8 = st8.executeQuery("SELECT internet_name FROM internet_master WHERE bkLocation='"+req[len]+"' ORDER BY internet_name ASC");
    %>
    <table class="dynatable3" border="2" cellspacing="1" border="1" width="890" style="height: 150"  bgcolor="">
		<tr>
		    <td width="30" align="center"  height="21" ></td>
			<td width="45" align="center"  height="21" ><button class="add3" type="button">+</button></td>
			<td width="60" align="center"  height="21" >SL<br />NO.</td>
			<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>INTERNET</td>				
			<td width="445" align="center"  height="21" colspan="4" ></td>
		</tr>
		<tr class="prototype3">
			<td width="30" align="center"  height="21" ></td>
		    <td width="45" align="center"  height="21" ><button class="remove3" type="button">--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id3[]" value="0" size=1 class="id3" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="int_name<%=len%>"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs8.next()){ %>
					<option> <%=rs8.getString(1)%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incinternet"  value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incinternet"  value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
		</tr>
	</table>
    <table border="1" cellspacing="1" width="890">
        <tr>
	      <td width="65" align="center" height="5" colspan="2"><center>4</center></td>
	      <td width="390" >&nbsp;ISP ( MPLS VPN )Router</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		     <input type ="radio" name = "isp_router<%=len%>" value ="YES" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type ="radio" name = "isp_router<%=len%>" value ="NO" />NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type ="radio" name = "isp_router<%=len%>" value ="NOT APPLICABLE" />NOT APPLICABLE</td>
        </tr>
    </table>		
    <table border="1" cellspacing="1" width="890">
       <%--  <tr>
	     <td width="65" align="center" height="5" colspan="2"><center>5</center></td>
	     <td width="390" >&nbsp;User Data backup taken ( Automatic user backup )<br /> ( weekly sheduled backup )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <input type ="radio" name = "udb<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type ="radio" name = "udb<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type ="radio" name = "udb<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td>
        </tr>

        <tr>
     	 <td width="65" align="center" height="5" colspan="2"><center>6</center></td>
	     <td width="390" >&nbsp;Lotus Notes Server ( working )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <input type ="radio" name = "ln_server<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type ="radio" name = "ln_server<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type ="radio" name = "ln_server<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td>
       </tr> --%>
       <tr>
	    <td width="65" align="center" height="5" colspan="2"><center>5</center></td>
	    <td width="390" >&nbsp;NEWINS Application ( Working )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "NEWINS<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "NEWINS<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "NEWINS<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td>
       </tr>
       <tr>
   	    <td width="65" align="center" height="5" colspan="2"><center>6</center></td>
	    <td width="390" >&nbsp;Server Room AC ( Working ) <br /> Temperature Maintained</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "sr_ac<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "sr_ac<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "sr_ac<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE<br />
         <input type ="text" name = "tm<%=len%>" value ="" maxlength="10" />
        </td>
        </tr>
   </table>		
   <table border="1" cellspacing="1" width="890">
     <tr>
	 <td width="65" align="center" height="5" colspan="2"><center>7</center></td>
	 <td width="390" >&nbsp;Photocopier</td><td width="445"></td>
     </tr>
   </table>
   <%
    Connection cn10 = null;
    Statement st10 = null; 
    ResultSet rs10 = null;
    try
       {
       cn10 = con.getConnection2();
       st10=cn10.createStatement();
       rs10 = st10.executeQuery("SELECT DISTINCT photocopier_name FROM photocopier_master WHERE bkLocation='"+req[len]+"' ORDER BY photocopier_name ASC");
       %>
      <!-- 5 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
      <table class="dynatable5" border="1" cellspacing="1" width="890" style="height: 150"  bgcolor="">
	 		  <tr><td width="30" align="center"  height="21" ></td>
				    
				    <td width="45" align="center"  height="21" ><button class="add5" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Photocopier Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<tr class="prototype5">
					<td width="30" align="center"  height="21" ></td>
				    <td width="45" align="center"  height="21" ><button class="remove5" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id5[]" value="0" size=1 class="id5" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="phto_name<%=len%>"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs10.next()){ %>
					<option> <%=rs10.getString("photocopier_name")%> </option> 
					<%} 
       } catch (SQLException ex) { ex.printStackTrace();} 
       finally { 
	   if (rs10 != null) { try { rs10.close(); } catch (SQLException e) { /* ignored */}}
	   if (st10 != null) { try { st10.close(); } catch (SQLException e) { /* ignored */}}
	   if (cn10 != null) { try { cn10.close(); } catch (SQLException e) { /* ignored */}}
       }
	             %> </select>
  	           	</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incphto" value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incphto" value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
	</table>
		
	<table border="1" cellspacing="1" width="890">
      <tr>
	    <td width="65" align="center" height="5" colspan="2"><center>8</center></td>
	    <td width="390" >&nbsp;Printer ( Laser Jet / Dot Matrix )</td><td width="445"></td>
     </tr>
    </table>
   <%
   Connection cn11 = null;
   Statement st11= null; 
   ResultSet rs11 = null;
   try
      {
      cn11 = con.getConnection2();
      st11=cn11.createStatement();
      rs11 = st11.executeQuery("SELECT printer_name FROM printer_master WHERE bkLocation='"+req[len]+"' ORDER BY printer_name ASC");
      %>
      <!-- 6 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
      <table class="dynatable6" border="1" cellspacing="1" width="890" style="height: 150"  bgcolor="">
				<tr><td width="30" align="center"  height="21" ></td>
				    <td width="45" align="center"  height="21" ><button class="add6" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Printer Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<tr class="prototype6">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove6" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id6[]" value="0" size=1 class="id6" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="prt_name<%=len%>"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs11.next()){ %>
					<option> <%=rs11.getString("printer_name")%> </option> 
					<%}
      } catch (SQLException ex) { ex.printStackTrace();} 
      finally { 
	  if (rs11 != null) { try { rs11.close(); } catch (SQLException e) { /* ignored */}}
	  if (st11 != null) { try { st11.close(); } catch (SQLException e) { /* ignored */}}
	  if (cn11 != null) { try { cn11.close(); } catch (SQLException e) { /* ignored */}}
      }
					%> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incprt" value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incprt" value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
  </table>
		
   <table border="1" cellspacing="1" width="890">
        <tr>
    	<td width="65" align="center" height="5" colspan="2"><center>9</center></td>
	   <td width="390" >&nbsp;Fax Machines</td><td width="445"></td>
       </tr>
   </table>
   <%
Connection cn12 = null;
Statement st12= null; 
ResultSet rs12 = null;
try
    {
    cn12 = con.getConnection2();
    st12=cn12.createStatement();
    rs12 = st12.executeQuery("SELECT fax_name FROM fax_master WHERE fxLocation='"+req[len]+"' ORDER BY fax_name ASC");
    %>
    <!-- 7 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
    <table class="dynatable7" border="1" cellspacing="1" width="890" style="height: 150"  bgcolor="">
				<tr><td width="30" align="center"  height="21" ></td>
				    <td width="45" align="center"  height="21" ><button class="add7" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Fax Machines Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<tr class="prototype7">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove7" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id7[]" value="0" size=1 class="id7" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="fx_name<%=len%>"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs12.next()){ %>
					<option> <%=rs12.getString("fax_name")%> </option> 
					<%} 
    } catch (SQLException ex) { ex.printStackTrace();} 
      finally { 
	  if (rs12 != null) { try { rs12.close(); } catch (SQLException e) { /* ignored */}}
	  if (st12 != null) { try { st12.close(); } catch (SQLException e) { /* ignored */}}
	  if (cn12 != null) { try { cn12.close(); } catch (SQLException e) { /* ignored */}}
      }
					%> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" value="YES" class="incfx"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" value="NO" class="incfx"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
</table>
<table border="1" cellspacing="1" width="890">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>10</center></td>
	<td width="390" >&nbsp;Barcode Scanner / Printer</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn13 = null;
Statement st13= null; 
ResultSet rs13 = null;
try
    {
    cn13 = con.getConnection2();
    st13=cn13.createStatement();
    rs13 = st13.executeQuery("SELECT barcode_name FROM barcode_master WHERE brLocation='"+req[len]+"' ORDER BY barcode_name ASC");
    %>
    <!-- 8st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
    <table class="dynatable8" border="1" cellspacing="1" width="890" style="height: 150"  bgcolor="">
				<tr><td width="30" align="center"  height="21" ></td>
				    <td width="45" align="center"  height="21" ><button class="add8" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Barcode Scanner / Printer Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<tr class="prototype8">
					<td width="30" align="center"  height="21" ></td>
				    <td width="45" align="center"  height="21" ><button class="remove8" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id8[]" value="0" size=1 class="id8" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="br_name<%=len%>"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs13.next()){ %>
					<option> <%=rs13.getString(1)%> </option> 
					<%} 
    } catch (SQLException ex) { ex.printStackTrace();} 
    finally { 
	  if (rs13 != null) { try { rs13.close(); } catch (SQLException e) { /* ignored */}}
	  if (st13 != null) { try { st13.close(); } catch (SQLException e) { /* ignored */}}
	  if (cn13 != null) { try { cn13.close(); } catch (SQLException e) { /* ignored */}}
      }
					%> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incbr" value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incbr" value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>
</table>
 <table border="1" cellspacing="1" width="890">
		<tr>
	    <td width="65" align="center" height="5" colspan="2"><center>11</center></td>
	    <td width="390" >&nbsp;Telephone EPABX / Lines</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "tele<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "tele<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "tele<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td>
       </tr>
  	   <tr>
        <td width="65" align="center" height="5" colspan="2"><center>12</center></td>
        <td  width="390">&nbsp;CCTV ( Working )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "cctv<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "cctv<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "cctv<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td>
        </tr>
        <tr>
	    <td width="32" align="center" rowspan="1"><center></center></td>
	    <td colspan="2">&nbsp;CCTV Backup ( no. of days ) </td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "cctv_backup<%=len%>" value =""  maxlength="10" onclick="popup();"/></td>
        </tr>
        <tr>
	    <td width="65" align="center" height="5" colspan="2"><center>13</center></td>
	    <td width="390" >&nbsp;Access Controller ( working ) </td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "access_con<%=len%>" value ="YES" readonly="readonly"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "access_con<%=len%>" value ="NO" readonly="readonly" />NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "access_con<%=len%>" value ="NOT APPLICABLE" readonly="readonly" />NOT APPLICABLE</td>
        </tr>
 	    <tr>
        <td width="65" align="center" height="5" colspan="2"><center>14</center></td>
        <td width="390">&nbsp;Fire Alarm ( Working )</td><td width="445" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "fire_a<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "fire_a<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "fire_a<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td></tr>
        <tr>
	    <td width="32" align="center" rowspan="1"><center></center></td>
	    <td colspan="2">&nbsp;When was last checked</td><!-- <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = fire_l value ="" /></td> -->
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text"  style="width: 6em"  name="fire_l<%=len%>" id="idCalendar" onclick="showCalendarControl(this)" readonly="readonly" />
		 <img src="images/cal.gif" id="idForDay"  name="imgForDate<%=len%>" width="16" height="16"  onclick="showCalendarControl(document.getElementById('idCalendar'))">					        
		</img>
		</td>
        </tr>
   	    <tr>
        <td width="25" align="center" height="5" colspan="2"><center>15</center></td>
        <td>&nbsp;Intrusion Deduction System (IDS) (working)</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "ids_w<%=len%>" value ="YES" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "ids_w<%=len%>" value ="NO" />NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "ids_w<%=len%>" value ="NOT APPLICABLE" />NOT APPLICABLE</td></tr>
        <tr>
 	    <td width="14" align="center" rowspan="1"><center></center></td>
	    <td colspan="2">&nbsp;When was last checked</td><!-- <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ids_l value ="" /></td> -->
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text"  style="width: 6em"  name="ids_l<%=len%>" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly" />
		<img src="images/cal.gif" id="idForDay"  name="imgForDate<%=len%>"  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></img></td> 					        
        </tr>
	    <tr>
        <td width="25" align="center" height="5" colspan="2"><center>16</center></td>
        <td>&nbsp;Any IT hardware under Repair ( Pls. specify ) </td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "ithardware_r<%=len%>" value ="" maxlength="100"/></td></tr>
        <tr>
	    <td width="14" align="center" rowspan="1"><center></center></td>
	    <td colspan="2">&nbsp;Status or by which it will be rectified and put into use</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" size="50" name = "ithardware_n<%=len%>" value =""  maxlength="100"/></td>
        </tr>
 	    <tr>
        <td width="25" align="center" height="5" colspan="2"><center>17</center></td>
        <td>&nbsp;Preventive Maintenance ( All IT equipment's )</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="radio" name = "preventive_e<%=len%>" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "preventive_e<%=len%>" value ="NO" readonly="readonly" onclick="popup();"/>NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name = "preventive_e<%=len%>" value ="NOT APPLICABLE" readonly="readonly" onclick="popup();"/>NOT APPLICABLE</td></tr>
        <tr>
	    <td width="14" align="center" rowspan="1"><center></center></td>
	    <td colspan="2">&nbsp;To be done every quater without fail <br />&nbsp; If No, provide reason</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "quarter_r<%=len%>" value ="" maxlength="100"/></td>
        </tr>
        </table>
        <%
        len++;} 
		} catch (SQLException ex) { ex.printStackTrace();} 
		  finally { //cn_id
		  if (rs_id != null) { try { rs_id.close(); } catch (SQLException e) { /* ignored */}}
		  if (st_id != null) { try { st_id.close(); } catch (SQLException e) { /* ignored */}}
		  if (cn_id != null) { try { cn_id.close(); } catch (SQLException e) { /* ignored */}}
		  if (conn != null) { try { conn.close(); } catch (SQLException e) { /* ignored */}}
		  }
          %>





 <label>Remarks :</label><br />
        <textarea rows="3" cols="173" name="main_remarks" style="background: lightgrey;" maxlength="480"></textarea> 
	    <br />
        <br />
	    <b>Send To:</b>
		<%
		Connection cn14 = null,cn131=null;
		Statement st14= null,stlms1=null; 
		ResultSet rs14 = null,rslms1=null;
		try
		   {
		   cn14 = con.getConnection2();
		   cn131 = lms.getConnectionlms();
		   st14=cn14.createStatement();
		   rs14 = st14.executeQuery("SELECT DISTINCT empid,empname,empdesg,empmailid FROM formapproval WHERE formtype='CHECKLIST' AND  levelno='1' and branch= '"+locationNO+"'");
		   while(rs14.next())
		        {
			    String NAME = rs14.getString("empname");	  
				String Mailing=rs14.getString("empmailid");
				String Designation = rs14.getString("empdesg");
				String emp_no = rs14.getString("empid");
				
				
				String emailLms1=""; 
			    stlms1=cn131.createStatement();
			    rslms1 = stlms1.executeQuery("SELECT email FROM user WHERE emp_id='"+emp_no+"' ");
				if(rslms1.next())
				     {
					 emailLms1 = rslms1.getString("email");
					 }  
				
				
				String tot = NAME + "--"  + Designation + "--" + emailLms1;
		        %>
		        <input type="checkbox" name="mailingCheck" value="<%=tot%>"/><%=NAME%> - <%=emailLms1%>
		        <%} 
		    } catch (SQLException ex) { ex.printStackTrace();} 
		      finally { 
			  if (rs14 != null) { try { rs14.close(); } catch (SQLException e) { /* ignored */}}
			  if (st14 != null) { try { st14.close(); } catch (SQLException e) { /* ignored */}}
			  if (cn14 != null) { try { cn14.close(); } catch (SQLException e) { /* ignored */}}
		      }
		    %>
		<br />
        <br />
       <center>
       <table align=center bgcolor="lightgrey">
             <tr> 
               <td style="size:1"><div id="formsubmitbutton"><input style="font-size:1" type="submit" value="SEND CHECK LIST" name="save1" id="save1" onclick="return ( validate() && valthisform() && ButtonClicked())"/></div>
	           <div id="buttonreplacement" style="margin-left:30px; display:none;">
 	           <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	           </div> 
	           </td>
	           <td style="size:1">&nbsp;&nbsp;<input style="size:1" type="reset"    value="RESET"/></td>   
               <td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
               <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='OtherPage.jsp?msg=1'"/> </td>
             </tr>
      </table>
     </center>
	 <br /><br /><br />
     </div>
</form>	
</body>
</html>