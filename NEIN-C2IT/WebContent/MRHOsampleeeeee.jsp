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
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />


<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>MATERIAL REQUISITION</title>
	<link rel='stylesheet' type='text/css' href='css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	

	
	
	
		<script>
		var id =0;
		
		$(document).ready(function() {
			
			
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
			
				var master = $(this).parents("table.dynatable");
				
				// Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "")
				prot.find(".id").attr("value", id);
				prot.find(".incText").attr("id","iditemName"+id); 
				
				prot.find(".incSel").attr("id",id); 
				prot.find(".incRate").attr("id","rate"+id);
				prot.find(".incQuantity").attr("id","quantity"+id); 
				prot.find(".incTotal").attr("id","total"+id);
				master.find("tbody").append(prot);
			});
			
			// Remove button functionality
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("tr").remove();
				id--
			});
			
		});
		
		
		
		</script>

<%
if(session==null)
{
	response.sendRedirect("loginho.jsp?msg=1");
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
		</style>
		
		
</head>

<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	              
	              String []itemName=null;
	              String []itemQuantity;
	              String []itemRate;
	              String []abbreviation;
	              String []asset;
	              String []itemAmount;
	              Connection2 dbConn = new Connection2();
	      String transId = null;       
	%>


     <%
                  transId = "abc"+String.valueOf(Math.random());
     
     		   logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		  System.out.println("Branch nameeee Mrho  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<body>



<%-- %><form name="form" method="post" action="PurchaseOrderBack.jsp" onsubmit="popupform(this, 'join')">  --%>
<!--<form action="MRBack.jsp" method="post" name="form" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=300,height=200');">

-->




<form action="MRHOBack.jsp" method="post" name="form" >
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"><%= session.getAttribute( "theName" ) %></textarea>
<textarea name="city" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; display:none;"><%= session.getAttribute( "NpostingCo" ) %></textarea>
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME;"><%= session.getAttribute( "theName" ) %></textarea>
<div id="leftfeature"><input type="button" value="BACK" onclick="window.location.href='MrHomePageHO.jsp?msg=1'"/></div>
	<div id="page-wrap">
    <textarea rows="" cols="" id=header readonly="readonly">MATERIAL REQUISITION</textarea>
   
		<%-- <div id="header">PURCHASE ORDER <span class="back_button"><input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='HO.jsp'"/></span></div>--%>
		
		
		 <input type="hidden" name="transid" value="<%=transId%>" />
		
		<table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td><font size="3">
		<center><label>
		"Logistics Park", Plot No.7, Road No.10, Export Promotion Industrial Park,
		Whitefield, Bangalore - 560 066, India.</label> </center>
		<center><label>
		 Phone: +91 80 4135 3500 (10 Lines)
		 Fax : +91 80 4135 3539 E-mail : nein@nittsu.co.in</label></center></font></td>
	</tr>
</table>
		
		<div style="clear:both"></div>
		
		<div id="customer">

     
		
		</div>
		
		



	<table class="dynatable" width="100%" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
			
				<tr>
				    <td width="6" align="center"  height="21" ><button class="add" type='button'>Add</button></td>
					<td width="67" align="center"  height="21" >Sl No</td>
					<td width="67" align="center"  height="21" >Item </td>	
					<td width="67" align="center"  height="21" ><font color="red" size="4">*</font>Asset</td>				
					<td width="67" align="center"  height="21" >Quantity</td>
					<td width="67" align="center"  height="21" >Unit</td>
					<td width="67" align="center"  height="21" >Rate(Rs)</td>
					<td width="67" align="center"  height="21" >Total</td>
					<td width="67" align="center"  height="21" >Date By which Reqd.</td>
				</tr>
			
				<tr class="prototype">
				    <td width="3" align="center"  height="21" ><button class="remove" type='button'>Remove</button></td>
					<td width="67" align="center"  height="21" ><input type="text" name="id[]" value="0" size=1 class="id" /></td>
					<td width="67" align="center"  height="21" ><textarea  name="mr_itemName" id="idtextarea"  rows="5" cols="43"  class="incText" > </textarea>
					</td>	
					<td width="67" align="center"  height="21" >
					     <select name="mr_asset"  id="hiderow" style="font-size : 8pt">
							 <option value="">Select</option>
  							 <option value="CE" >CE</option>
  							 <option value="NCE" >NCE</option></select>
  							 
					</td>
					<td width="67" align="center"  height="21" ><input type="text" name="mr_itemQuantity" size="4" value="" class="incQuantity" /></td>
					<td width="67" align="center"  height="21" >
					<a href="DescriptionPO.jsp" onclick="return popitup('DescriptionPO.jsp')"><font size="1">New</font></a></td>
					<td width="67" align="center"  height="21" ><input type="text" name="mr_itemRate" size="4" value="" class="incRate" /></td>
					<td width="67" align="center"  height="21" ><input type="text" name="mr_itemAmount" size="8" value="" class="incTotal" readonly="readonly" onclick ="calculateDynamic()"/></td>
					<td width="67" align="center"  height="21" ><input type="text" name="mr_DateByRegd" size="8" value="" /></td>
				</tr>

  
	 
		</table> 






		
	<table width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
		
		
		
		<tr> 
		
		
		<td colspan="4"></td><td align=center><input type = button name = button1 align="middle" value=".CALCULATE." onclick ="calculateDynamic()" /></td></tr>
		
			<tr>
	
	 <td width="-1" height="21" colspan="4" align=center>TOTAL AMOUNT</td>
	 
	    <td  height="21"  align="center" width="80" >
		<input type= text name ="totalconNext" id="totalcon" size = 10 readonly="readonly" /></td>
		
	    </tr>
		

	<tr ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
		
		<textarea  name="mr_remarks"  rows="4" cols="101"></textarea></div></td></tr>
	
	
		
		
		</table>	
		
		
		
		<label><font color="red" size="4"><b>*</b>&nbsp;</font>CE - Capital Expenditure & NCE - Non Capital Expenditure</label> <br />

	 <br />
		
	
	
</form>	

</body>

</html>