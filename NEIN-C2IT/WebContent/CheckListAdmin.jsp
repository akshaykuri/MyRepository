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

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>

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
	<!-- <script>
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
	</script> -->
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
	response.sendRedirect("adminbom.jsp?msg="+msgg);
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
		   <script type="text/javascript">
    $(function(){
    $('input:checkbox').change(function()
    		{
    		$('input:checkbox[name="'+this.name+'"]').not(this).prop('checked',!this.checked);
  			});
    });
    </script>
	
	
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
       
       var ccity=document.form.city;
       var cremark= document.form.main_remarks;
       var cmail=document.form.mail;
       var hm= document.form.hrmail;
    if ((ccity.value==null)||(ccity.value=="NULL"))
				{
  				 alert("Select Location!");
   			         ccity.focus();
  				 return false;
  				 }
   /* if (checkAddress(d1.value)==false)
				{
   				d1.value="";
 			       alert("Invalid Material Requisition");
   				d1.focus();
  				 return false;
  				 }
       */
       if(cremark.value=="")
    	   {
    	   alert("Enter Remarks");
    	   cremark.focus();
    	   return false;
    	   }
  	  /*  if(cmail.value=="")
  		   {
  		   alert("Select Designation and Validate Name");
  		   cmail.focus();
  		   return false;
  		   }
  	   if((hm.value==null)||(hm.value=="NULL")||(hm.value==""))
  		   {
  		   alert("ALERTTttttttttttttttt");
  		   return false;
  		   } */
  	   
else
return true;
   }
</script>
<script type="text/javascript">
function valthisform() {
    var chkd = document.form.itmail.checked || document.form.admail.checked ||  document.form.gmmail.checked || document.form.hrmail.checked;

    if (chkd) {
      return true; //Submit the form
    } else {
      alert ("please check a checkbox");
      return false; //Prevent it from being submitted
    }
  }
</script>	
</head>

<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null,locationNO=null;
	              
	              String []itemName=null;
	              String []itemQuantity;
	              String []itemRate;
	              String []abbreviation;
	              String []asset;
	              String []itemAmount;
	              Connection2 dbConn = new Connection2();
	      String transid = null,req=null;       
	%>


     <%
                  transid = "abc"+String.valueOf(Math.random());
        req = request.getParameter("loc");
     		   logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		   locationNO = session.getAttribute("b_no");
     		  System.out.println("b_no ********************************* "+locationNO);
     		  System.out.println("logInName  "+logInName);
     		  System.out.println("realname  "+realname);
     		  System.out.println("desg  "+desg);
     		  System.out.println("Branch nameeee  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<body onload="start()" onunload="stop()">



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!-- <form action="CheckList_PageOne_HOBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');"> -->
<form action="CheckListAdminBack.jsp" method="post" name="form" onsubmit="return(validate() && valthisform());">


<input type="hidden" name="transid" value="<%=transid%>" />

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"><%= session.getAttribute( "theName" ) %></textarea>
<br /><br /><div id="page-wrap">
<table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<b><center><label>
		NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> </center>
		</b></font></td>
		
	</tr>
</table>
<br />
<br />
<center>
<label><font color="black"><u><b>IT CHECK LIST</b></u></font></label> <br />


</center>
	 <br />


<%  
                String cs_date;
         	   DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
         	   //get current date time with Date()
         	   Date date = new Date();
            	
            	cs_date = dateFormat.format(date);
            	
            	
                System.out.println("cs date we are getting "+cs_date);
            	String cr_time;
               
            	
            	
            	GregorianCalendar gcalendar = new GregorianCalendar();
            	System.out.print("Time: ");
                System.out.print(gcalendar.get(Calendar.HOUR) + ":");
                System.out.print(gcalendar.get(Calendar.MINUTE) + ":");
                System.out.println(gcalendar.get(Calendar.SECOND));
                
                String timee = (gcalendar.get(Calendar.HOUR) + ":" +gcalendar.get(Calendar.MINUTE) + ":"+gcalendar.get(Calendar.SECOND));
                System.out.print("Time:gggggggggggg "+timee);
                
                %>


		<%
                     
                    String new_id = null;
                    int id=0;
                    String id22=null;
                    Connection cn_id = null; 
                    Statement st_id = null; 
                    ResultSet rs_id = null; 
                    cn_id = con.getConnection2();
                    st_id=cn_id.createStatement();
                    System.out.println("Location Of Check Sheet  "+locationNO);
                   // rs_id = st_id.executeQuery("SELECT max(idextend) from cs_master where cs_id like 'NEIN/CS/90%'");
                    //rs_id = st_id.executeQuery("SELECT max( idextend ) ,substr(cs_id,12,4), substr( cs_id, 1, 11 ) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no GROUP BY cs_id");
                    //rs_id = st_id.executeQuery("SELECT max( idextend ),(SELECT MAX(substr(cs_id,12,4)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '90'=branch_master.b_no) AS increval,(SELECT MAX(substr(cs_id,1,11)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '90'=branch_master.b_no) AS increLoc  FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '90'=branch_master.b_no");
                    rs_id = st_id.executeQuery("SELECT max( idextend ),(SELECT MAX(substr(cs_id,12,4)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no) AS increval,(SELECT MAX(substr(cs_id,1,11)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no) AS increLoc  FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+locationNO+"'=branch_master.b_no");
                    while ( rs_id.next() )
                    {    
                    	
                    	
                    	try
                    	{
                    		
                    		id=rs_id.getInt(1);
                    		System.out.println("\\n id of sequence no, "+id);
                    		if(id==0)
                    			id=1;
                    		id22= rs_id.getString("increLoc");
                    		if(id22==null)
                    			id22="NEIN/CS/"+locationNO+"-";
                    		System.out.println("id of idextend no, "+id22);
                                 id++;     
                    		//	System.out.println("Gen id "  +rs_id.getInt(1));
                    			new_id = "" +String.valueOf(id);
                    			System.out.println("CS HO "  +new_id);
                    		//	new_id = "" +String.valueOf(id);
                    	}
                    	catch(SQLException ex)
                    	{
                    		  System.out.println(ex.toString());
                    		 new_id = "NEIN/CS/90-1";
                    	    }

                    }
                                   
                    %>

<div style="clear:both"></div>
		
		<div id="customer">


		
		</div>
<table border="0" width="900">
<%Connection cn99 = null;
		Statement st99 = null; 
		ResultSet rs99 = null;
		cn99 = con.getConnection2();
		st99=cn99.createStatement();
		//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
		//rs99 = st99.executeQuery("SELECT DISTINCT assignedLocation FROM assigned_master WHERE Locname='"+realname+"' ORDER BY assignedLocation");
		//SELECT DISTINCT assignedLocation FROM assigned_master a INNER JOIN login l ON(a.delet=l.city) WHERE city='Head Office'
		rs99 = st99.executeQuery("SELECT DISTINCT assignedLocation FROM assigned_master a INNER JOIN login l ON(a.delet=l.city) WHERE city='"+city+"' ORDER BY assignedLocation ASC");
		%>
<tr>
<td style="visibility: hidden; display: none">
	<input type="hidden" name="idextend" value="<%=id%>" />
	<input type="hidden" name="e_name" value="<%=realname%>" />
	<input type="hidden" name="e_designation" value="<%=desg%>" />
	<input type="hidden" name="b_no" value="<%=locationNO%>" />
	<input type="hidden" name="Initiator_mail_id" value="<%=Initiator%>" />
	</td>
<%-- <td width="450">CheckSheet No.:<textarea id="idcs_id" name="cs_id" rows="1"><%=id22%><%=new_id %></textarea></td> --%>
<%-- <td width="450" align="right" >Location:<textarea id="idcity" name="city" rows="1"><%=city%></textarea></td> --%>

</tr>

<tr >
<td width="450"> Date (dd/mm/yyyy):  <textarea readonly="readonly" id="idcs_date" name="cs_date" rows="1"><%= cs_date %></textarea></td>
<td width="450" align="right" style="visibility: hidden; display: none">Time:   <textarea readonly="readonly" id="idcs_time" name="cs_time" rows="1" ></textarea></td>
<td align="right">Location: <select  name="city"  id="idcity">     <option value="NULL">SELECT</option> 
<%-- <option value="<%=city%>"><%=city%></option> --%>
										        <%while(rs99.next()){ %> 
										 
										        
										         <option ><%=rs99.getString(1)%></option>
										      
										        <%} %> 
										        </select></td>

</tr>

</table>
<br />

<table border="1" cellspacing="1" width="900">

<tr>




	
			
			
			
			
<td width="25" align="center" height="5" colspan="2"><center>1</center></td>

<td >&nbsp;Power supply </td><td width="443"></td></tr>
<tr>
	<td width="30" align="center" rowspan="5"><center></center></td>
	<td colspan="2">&nbsp;RAW Power Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = "ps_raw" value ="YES" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = "ps_raw" value ="NO" />NO</td>
</tr>
<tr>
	<td colspan="2">&nbsp;UPS Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = ps_upsworking value ="YES" readonly="readonly" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = ps_upsworking value ="NO" readonly="readonly" />NO</td>
</tr>
<tr>
	<td colspan="2">&nbsp;UPS Backup Time( To be checked weekly once )</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ps_upsbackup value =""  />hours</td>
</tr> 

 <tr>
 	<td colspan="2"  height="20">&nbsp;UPS Preventive Maintenance<br />( to be checked 3 months once ) </td>
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = ps_upspreventive value ="YES" readonly="readonly" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = ps_upspreventive value ="NO" readonly="readonly" />NO</td>
</tr> 
 <tr></tr>

<!-- <tr>
<td width="25" align="center" height="5" colspan="2"><center>2</center></td>

<td>&nbsp;Server Status ( HO only)</td><td width="100"></td></tr>
<tr>
	<td width="14" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = si_working value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = si_working value ="NO" readonly="readonly" onclick="popup();"/>NO</td>
</tr> -->
</table>

   <%--
Connection cn6 = null;
Statement st6 = null; 
ResultSet rs6 = null;
cn6 = con.getConnection2();
st6=cn6.createStatement();
rs6 = st6.executeQuery("select * from servername ORDER BY sname Asc"); 
--%>
<!-- 1st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
	<%-- <table class="dynatable" border="2" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				 <tr><td width="10"   height="21" ></td>
				    <td width="10" align="center"  height="21" ><button class="add" type='button'>+</button></td>
				    <td width="10" align="center"  height="21" >SL<br />NO.</td>
					<td width="217" align="center"  height="21" ><font color="red" size="4">*</font>HDD SPACE</td>				
					<td width="217" align="center"  height="21" >DRIVES</td>
					<td width="218" align="center"  height="21" >USED</td>
					<td width="218" align="center"  height="21" >Free Space</td>
					
				</tr>
			
				<tr class="prototype">
				   <td width="10"  height="21" ></td>
				    <td width="10" align="center"  height="21" ><button class="remove" type='button'>--</button></td>
					<td width="10" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" /></td>		
					<td width="217" align="center"  height="21" >
					     <select name="si_harddisk"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" >--Select--</option>
					<%while(rs6.next()){ %>
					<option> <%=rs6.getString("sname")%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="217" align="center"  height="21" >
					     <select name="si_drive"  id="hiderow" style="font-size : 8pt">
							 <option value="0" style="background: lightgrey;">--Select--</option>
  							 <option value="DRIVE A" >DRIVE A</option>
  							  <option value="DRIVE B" >DRIVE B</option>
  							   <option value="DRIVE C" >DRIVE C</option>
  							    <option value="DRIVE D" >DRIVE D</option>
  							     <option value="DRIVE E" >DRIVE E</option>
  							     <option value="DRIVE F" >DRIVE F</option></select>
  							 
					</td>
					<td width="218" align="center"  height="21" ><input type="text" name="si_usedspace" size="8" value="" class="incRate" style="background:lightgrey;" /></td> 
					<td width="218" align="center"  height="21" ><input type="text" name="si_freespace" size="8" value="" class="incRate" style="background:lightgrey;" /></td>      
				</tr>

  
	 
		</table> --%>
<table border="1" cellspacing="1" width="900">

<tr>
<td width="65" align="center" height="5" colspan="2"><center>2</center></td>

<td width="390">&nbsp;MPLS VPN </td><td width="445"></td></tr>

</table>

<!-- 2 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->

   <%
Connection cn7 = null;
Statement st7 = null; 
ResultSet rs7 = null;
cn7 = con.getConnection2();
st7=cn7.createStatement();
rs7 = st7.executeQuery("select mpls_branch from mpls_master ORDER BY mpls_branch Asc"); 
/* ,id2=0,id3=0,id4=0,id5=0,id6=0 */

int id2=0;

%>
<!--  <script>id++;</script> -->
<!-- 2st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable2" border="2" cellspacing="1" border="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    <td width="45" align="center"  height="21" ><button class="add2" type="button">+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>LINK/LINE</td>				
					<td width="445" align="center"  height="21" colspan="4" >Downtime:<br /> ( if NO, pls. specify total no. of hours down )</td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
				<tr class="prototype2">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove2" type="button">--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id2[]" value="0" size=1 class="id2" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="mpls_name"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs7.next()){ %>
					<option> <%=rs7.getString("mpls_branch")%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio"  value="YES" class="incmpls" />YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio"  value="NO"  class="incmpls" />NO</td>
					  <td width="245" align="center"  height="21" ><input type="text" name="mpls_remarks" value="" /></td>      
				</tr>

           
	 
		</table>
	
<table border="1" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>3</center></td>
	<td width="390" >&nbsp;ISP ( MPLS VPN )Router</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = isp_router value ="YES" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = isp_router value ="NO" />NO</td>
</tr>


</table>		
<table border="1" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>4</center></td>
	<td width="390" >&nbsp;User Data backup taken ( Automatic user backup )<br /> ( weekly sheduled backup )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = udb value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = udb value ="NO" readonly="readonly" onclick="popup();"/>NO</td>
</tr>

<tr>
	<td width="65" align="center" height="5" colspan="2"><center>5</center></td>
	<td width="390" >&nbsp;Lotus Notes Server ( working )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = ln_server value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = ln_server value ="NO" readonly="readonly" onclick="popup();"/>NO</td>
</tr>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>6</center></td>
	<td width="390" >&nbsp;NEWINS Application ( Working )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = NEWINS value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = NEWINS value ="NO" readonly="readonly" onclick="popup();"/>NO</td>
</tr>
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>7</center></td>
	<td width="390" >&nbsp;Server Room AC ( Working ) <br /> Temperature Maintained</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = sr_ac value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = sr_ac value ="NO" readonly="readonly" onclick="popup();"/>NO<br />
         <input type ="text" name = "tm" value =""  />
        </td>
</tr>
</table>		
		
	<table border="1" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>8</center></td>
	<td width="390" >&nbsp;Photocopier</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();
rs10 = st10.executeQuery("select photocopier_name from photocopier_master ORDER BY photocopier_name Asc"); 
%>
<!-- 5 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable5" border="1" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    <td width="45" align="center"  height="21" ><button class="add5" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Photocopier Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
			
				<tr class="prototype5">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove5" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id5[]" value="0" size=1 class="id5" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="phto_name"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs10.next()){ %>
					<option> <%=rs10.getString("photocopier_name")%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incphto" value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incphto" value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  
	 
		</table>
		
	<table border="1" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>9</center></td>
	<td width="390" >&nbsp;Printer ( Laser Jet / Dot Matrix )</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn11 = null;
Statement st11= null; 
ResultSet rs11 = null;
cn11 = con.getConnection2();
st11=cn11.createStatement();
rs11 = st11.executeQuery("select printer_name from printer_master ORDER BY printer_name Asc"); 
%>
<!-- 6 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable6" border="1" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    <td width="45" align="center"  height="21" ><button class="add6" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Printer Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
			
				<tr class="prototype6">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove6" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id6[]" value="0" size=1 class="id6" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="prt_name"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs11.next()){ %>
					<option> <%=rs11.getString("printer_name")%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incprt" value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incprt" value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  
	 
		</table>
		
		<table border="1" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>10</center></td>
	<td width="390" >&nbsp;Fax Machines</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn12 = null;
Statement st12= null; 
ResultSet rs12 = null;
cn12 = con.getConnection2();
st12=cn12.createStatement();
rs12 = st12.executeQuery("select fax_name from fax_master ORDER BY fax_name Asc"); 
%>
<!-- 7 dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable7" border="1" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    <td width="45" align="center"  height="21" ><button class="add7" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Fax Machines Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
			
				<tr class="prototype7">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove7" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id7[]" value="0" size=1 class="id7" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="fx_name"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs12.next()){ %>
					<option> <%=rs12.getString("fax_name")%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" value="YES" class="incfx"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" value="NO" class="incfx"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  
	 
		</table>
				<table border="1" cellspacing="1" width="900">
<tr>
	<td width="65" align="center" height="5" colspan="2"><center>11</center></td>
	<td width="390" >&nbsp;Barcode Scanner / Printer</td><td width="445"></td>
</tr>
</table>
   <%
Connection cn13 = null;
Statement st13= null; 
ResultSet rs13 = null;
cn13 = con.getConnection2();
st13=cn13.createStatement();
rs13 = st13.executeQuery("select barcode_name from barcode_master ORDER BY barcode_name Asc"); 
%>
<!-- 8st  dynamic table HDD SPACE  DOWNLOAD TIME ------------------------------------------------------------------------------- -->
<table class="dynatable8" border="1" cellspacing="1" width="900" style="height: 150"  bgcolor="">
			
				<tr><td width="30" align="center"  height="21" ></td>
				    
				    <td width="45" align="center"  height="21" ><button class="add8" type='button'>+</button></td>
				    <td width="60" align="center"  height="21" >SL<br />NO.</td>
					<td width="320" align="center"  height="21" ><font color="red" size="4">*</font>Barcode Scanner / Printer Details</td>				
					<td width="445" align="center"  height="21" colspan="4" ></td>
				</tr>
				<!-- <tr><td colspan="2"></td>	
					<td width="67" align="center"  height="21" >YES</td>
					<td width="67" align="center"  height="21" >NO</td>
					<td width="67" align="center"  height="21" >Remarks</td>
				</tr> -->
			
				<tr class="prototype8">
					<td width="30" align="center"  height="21" ></td>
				
				    <td width="45" align="center"  height="21" ><button class="remove8" type='button'>--</button></td>
					<td width="60" align="center"  height="21" ><input type="text" name="id8[]" value="0" size=1 class="id8" /></td>					
					<td width="320" align="center"  height="21" >
					     <select name="br_name"  id="hiderow" style="font-size : 8pt">
					<option value="" style="background: lightgrey;" > ---Select---</option>
					<%while(rs13.next()){ %>
					<option> <%=rs13.getString("barcode_name")%> </option> 
					<%} %> </select>
  							 
					</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incbr" value="YES"/>YES</td>
                      <td width="100" align="center"  height="21" ><input type="radio" class="incbr" value="NO"/>NO</td>
					  <td width="245" align="center"  height="21" ></td>      
				</tr>

  
	 
		</table>
<table border="1" cellspacing="1" width="900">
		<tr>
	<td width="65" align="center" height="5" colspan="2"><center>12</center></td>
	<td width="390" >&nbsp;Telephone EPABX / Lines</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = tele value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = tele value ="NO" readonly="readonly" onclick="popup();"/>NO</td>
</tr>

	<tr>
<td width="65" align="center" height="5" colspan="2"><center>13</center></td>

<td  width="390">&nbsp;CCTV ( Working )</td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = cctv value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = cctv value ="NO" readonly="readonly" onclick="popup();"/>NO</td></tr>
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;Backup ( no. of days ) </td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = cctv_backup value =""  onclick="popup();"/></td>
</tr>

<tr>
	<td width="65" align="center" height="5" colspan="2"><center>14</center></td>
	<td width="390" >&nbsp;Access Controller ( working ) </td><td width="445">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = access_con value ="YES" readonly="readonly"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = access_con value ="NO" readonly="readonly" />NO</td>
</tr>

	<tr>
<td width="65" align="center" height="5" colspan="2"><center>15</center></td>

<td width="390">&nbsp;Fire Alarm ( Working )</td><td width="445" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = fire_a value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = fire_a value ="NO" readonly="readonly" onclick="popup();"/>NO</td></tr>
<tr>
	<td width="32" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;When was last checked</td><!-- <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = fire_l value ="" /></td> -->
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text"  style="width: 6em"  name="fire_l" id="idCalendar" onclick="showCalendarControl(this)" readonly="readonly" />
		 <img src="images/cal.gif" id="idForDay"  name="imgForDate" width="16" height="16"  onclick="showCalendarControl(document.getElementById('idCalendar'))">					        
		</img>
		</td>
</tr>

	<tr>
<td width="25" align="center" height="5" colspan="2"><center>16</center></td>

<td>&nbsp;Intrusion Deduction System (IDS) (working)</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = "ids_w" value ="YES" />YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = ids_w value ="NO" />NO</td></tr>
<tr>
	<td width="14" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;When was last checked</td><!-- <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = ids_l value ="" /></td> -->
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text"  style="width: 6em"  name="ids_l" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly" />
		<img src="images/cal.gif" id="idForDay"  name="imgForDate"  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></img></td> 					        
</tr>
	<tr>
<td width="25" align="center" height="5" colspan="2"><center>17</center></td>

<td>&nbsp;Any IT hardware under Repair ( Pls. specify ) </td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "ithardware_r" value ="" /></td></tr>
<tr>
	<td width="14" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;Status or by which it will be rectified and put into use</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" size="50" name = "ithardware_n" value =""  /></td>
</tr>

	<tr>
<td width="25" align="center" height="5" colspan="2"><center>18</center></td>

<td>&nbsp;Preventive Maintenance ( All IT equipment's )</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="checkbox" name = "preventive_e" value ="YES" readonly="readonly" onclick="popup();"/>YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="checkbox" name = "preventive_e" value ="NO" readonly="readonly" onclick="popup();"/>NO</td></tr>
<tr>
	<td width="14" align="center" rowspan="1"><center></center></td>
	<td colspan="2">&nbsp;To be done every quater without fail <br />&nbsp; If No, provide reason</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="text" name = "quarter_r" value =""/></td>
</tr>

</table>
 <label>Remarks ( If any ):</label><br />
<textarea rows="3" cols="173" name="main_remarks" style="background: lightgrey;"></textarea> 
<!-- <table width="900"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<label>
		NIPPON EXPRESS (INDIA) PRIVATE LIMITED</label> 
		<b><center>
		<textarea rows="3" cols="180" ></textarea>
		</center>
		</b></font></td>
	</tr>
</table> -->
	 <br />
		
		<table width="900" border="1" cellspacing="0" cellpadding="0">  
<% 
String gmname=null,gmpost=null,gmmail=null;
String brname=null,brpost=null,brmail=null;
String itname=null,itpost=null,itmail=null;
String adname=null,adpost=null,admail=null;
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
cn5 = con.getConnection2();
st5 = cn5.createStatement();

Connection cnl3 = null; 
Statement stl3 = null; 
ResultSet rsl3 = null; 
cnl3 = con.getConnection2();
stl3 = cnl3.createStatement();
//rsl3 = stl3.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE post='SR.MANAGER IT' AND city='"+city+"'");
rsl3 = stl3.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='SR.MANAGER IT' AND b.b_no='"+locationNO+"'");
while(rsl3.next()){ 
	itname=rsl3.getString(1);//Nname
	itpost=rsl3.getString(2);//post
	itmail=rsl3.getString(3);//nmail
	System.out.println("it  name ---------------------------------------------------------------------"+itmail);
}

Connection cnl4 = null; 
Statement stl4 = null; 
ResultSet rsl4 = null; 
cnl4 = con.getConnection2();
stl4 = cnl4.createStatement();
//rsl4 = stl4.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE post LIKE 'ADMIN%' AND city='"+city+"'");
rsl4 = stl4.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='ADMIN%' AND b.b_no='"+locationNO+"'");
while(rsl4.next()){ 
	adname=rsl4.getString(1);//Nname
	adpost=rsl4.getString(2);//post
	admail=rsl4.getString(3);//Nmail
	System.out.println("ad   name---------------------------------------------------------------------"+admail);
}

Connection cnl1 = null; 
Statement stl1 = null; 
ResultSet rsl1 = null; 
cnl1 = con.getConnection2();
stl1 = cnl1.createStatement();
//rsl1 = stl1.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE post='GENERAL MANAGER' AND city='"+city+"'");
rsl1 = stl1.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='GENERAL MANAGER' AND b.b_no='"+locationNO+"'");
while(rsl1.next()){ 
	gmname=rsl1.getString(1);//Name
	gmpost=rsl1.getString(2);//post
	gmmail=rsl1.getString(3);//mail
	System.out.println("gm  mail---------------------------------------------------------------------"+gmmail);
%>
<%-- 	
	<tr>
	<td>
       <input type="checkbox" value="<%=gmmail%>" name="gm"/><%=gmname%> 
       </td></tr> --%>
	<%
}
Connection cnl2 = null; 
Statement stl2 = null; 
ResultSet rsl2 = null; 
cnl2 = con.getConnection2();
stl2 = cnl2.createStatement();
//rsl2 = stl2.executeQuery("Select DISTINCT Nname,post,Nmail from login WHERE post='BRANCH MANAGER' AND city='"+city+"'");
rsl2 = stl2.executeQuery("SELECT DISTINCT l.Nname,l.post,l.Nmail from login l INNER JOIN branch_master b ON((substr(l.city,1,4))=substr(b.b_name,1,4)) WHERE l.post='BRANCH MANAGER' AND b.b_no='"+locationNO+"'");
while(rsl2.next()){ 
	brname=rsl2.getString(1);
	brpost=rsl2.getString(2);
	brmail=rsl2.getString(3);
	System.out.println("br  mail---------------------------------------------------------------------"+brmail);
	
}


%>

   
               <tr>                      
              <%--     <td>                  
                       <select name="desg" onchange="showEmp(this.value)">      
                       <option value="none">Select</option>
                          
                          <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                       cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                           st5 = cn5.createStatement();  
                           rs5 = st5.executeQuery("Select DISTINCT DESIGNATION from desg d,login l WHERE DESIGNATION=post  AND city='"+city+"' ORDER BY d.DESIGNATION ASC");
                         //  rs5 = st5.executeQuery("Select DESIGNATION from desg");
                          // rs5 = st5.executeQuery("Select * from desg");
                          while(rs5.next()){     %>     
                          
                           <option value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>     
                                        <br>    
                                            <div id='emp'>      
                                              <select name="emp" >   
                                                   <option value='-1'></option>  
                                                         </select>     
                                                            </div>    
                                                            
                                                            
                                                               
  <label id="idMailLabel"></label>  
       <input type="hidden" name="mail" id="idMailValue" value="" />        
       
       </td> --%>
       
       <%-- <td><input type="checkbox" value="<%=hrmail%>" name="hrmail"/>HR:::<%=hrname%></td> --%>
      <%--  <td><input type="checkbox" value="<%=itmail%>" name="itmail" id="iditmail"/>&nbsp;SR.MANAGER IT<%=itname %></td> --%>
          <td><input type="checkbox" value="<%=admail%>" name="admail" id="idadmail" />Admin / IT Incharge<%=adname %></td>
       <td><input type="checkbox" value="<%=gmmail%>" name="gmmail" id="idgmmail" />&nbsp;General Manager<%=gmname %></td>
       <td><input type="checkbox" value="<%=brmail%>" name="hrmail" id="idhrmail" />Branch Manager<%=brname %></td>
       
    
       </tr>                       
</table>

<br />


<center>
<table align=center bgcolor="lightgrey">

   <tr> 
      <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="history.go(-1)"/> </td>
<!-- 	<td style="size:1"><input style="font-size:1" type="submit" value="SEND CHECK LIST" name="save1" id="save1" onclick="return (validate() && checkbox());"/></td>
	 -->
	
	
	<td style="size:1"><input style="font-size:1" type="submit" value="SEND CHECK LIST" name="save1" id="save1" /></td><!--
	  <td style="size:1">&nbsp;&nbsp;<input style="font-size:1" type="submit" value="SAVE" name="save1" id="save1" onclick="return operate();"/></td>
      --><td style="size:1">&nbsp;&nbsp;<input style="size:1" type="reset"    value="RESET"/></td>   
     <%-- <td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="PRINT" onclick="window.location.href='jasper2.jsp'"/> </td>
     <td style="size:1"><input style="font-size:1" type="submit" value="SAVE" name="save" id="save" onclick="this.disabled=true;return true;"/></td>
      <td><input type=button value=printtt onclick="window.open('D:/P1.pdf'); return true;"/></td> --%>
      <%-- %><td><input type="button" value="PDF" name="print" id="print" disabled="disabled" onclick="link();"/></td>
       
       <td><input type="button" value="WORD" name="word" id="word" disabled="disabled" onclick="Word();"/></td> --%><!--
      <td><input type="button" value="PDF" name="print" onclick="link();"  id="print" disabled="disabled"/></td>
       
       <td><input type="button" value="WORD" name="word" onclick="Word();" id="word" disabled="disabled"/></td>
      
      --><td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
    
      
 </tr>
 
</table>


</center>
	<br /><br /><br />
</div>
</form>	

</body>

</html>