<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<%@page import="com.sun.mail.iap.Response"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>

<jsp:useBean id="con" class="CON2.Connection2" />

<head>
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
<script language="javascript"   type="text/javascript" src="js/scriptDyanamic.js"></script>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>UPLOAD FILE</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>

		<%
session.setMaxInactiveInterval(30*60);

		if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("theName")==null||session.getAttribute("form_no")==null)
		{   
	String msg=null;
	msg="Session Time Out \\n Login Again................";
	response.sendRedirect("../../../logout.jsp?msg="+msg);
}

%>
<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__", " ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script type="text/javascript">

          function checkName(str){
        	  var re = /[^a-zA-Z][/][(][)][.]/g;
              if (re.test(str)) return false;
              return true;
            }
             
            
          function validate(){
          
    
              var nn=document.form.MrId;
               
               // var pl=document.form.pwd;
                
               // var v=document.form.vname;
                
                var fi=document.form.file;
                var file_selected = false;
              //  alert("FILE : "+fi);
              //  alert("FILE name : "+file_selected);
              
              var fileName = fi.value;
              var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
             
            if ((nn.value==null)||(nn.value=="")||(nn.value=="null")){
            alert("Please Enter Material Requisition Number!");
            nn.focus()
            return false
            }
            if (checkName(nn.value)==false){
            nn.value=""
            alert("Invalid Number!");
            nn.focus()
            return false
            }
            /* if ((pl.value==null)||(pl.value=="")){
            alert("Please Enter Pwd!");
            pl.focus()
            return false
            } */
          /*   if (checkName(pl.value)==false){
                pl.value="";
                alert("Invalid Pwd!");
                pl.focus()
                return false
                } */
          /*   if ((v.value==null)||(v.value=="")){
                alert("Please Select Vendor!");
                v.focus()
                return false
                } */
             
           /*  if(file_selected!=true) 
            { 
            alert('No file selected!'); 
            return false;
            }  */ // or anything else
          /*   if(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "doc")
            {
            return true;
            } 
            else
            {
            alert("Upload File");
            fi.focus();
            return false;
            } */
            if(ext=='')
           {
            alert("Kindly Upload Comparison File : "+ext);
            fi.focus();
            return false;
            }
                
            
	 else
       return true;
}
</script>
<script type="text/javascript">
function Checkfiles(f){
 f = f.elements;
 if(/.*\.(gif)|(jpeg)|(jpg)|(doc)$/.test(f['filename'].value.toLowerCase()))
  return true;
 alert('Please Upload Gif or Jpg Images, or Doc Files Only.');
 f['filename'].focus();
 return false;
};
</script>
<script type="text/javascript">
 function dynamicValidation()
{
//alert("working ? ");
	   var frm=document.forms[0],flds=[frm['vname'],frm['file']],total=0;
		
	  // alert("1 :"+frm);
	   for (var z0=1;z0<flds[0].length;z0++)
		{
		  // alert("INSIDE FOR ");
		 //  alert("value 1 "+flds[0][z0].value);
		  // alert("value 1 Length "+flds[0][z0].value.length);
		  // alert("value 2 Length  "+flds[0][z0].value.length);
		  
		// if(flds[0][z0].value.length <= 2 || flds[0][z0].value== null || flds[0][z0].value=="Select" ||  flds[0][z0].value.length == "11" )
		/* 	 if(flds[0][z0].value.length <= 2 )
				 
		 {
			alert("LENGTH OF VENDOR : "+flds[0][z0]);
		    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
		     alert("Enter the VendorName..............");
		     flds[0][z0].focus();
		     return false;
	     } */
			 if (flds[0][z0].value==""|| flds[0][z0].value==null|| flds[0][z0].value=="Select" )
			 {
				 alert("LENGTH OF VENDOR : "+flds[0][z0].value);
			    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
			     alert("Select the Vendor   : Row - "+[z0]);
			     flds[0][z0].focus();
			     return false;
		     }
		
		 if(flds[1][z0].value.length<=2|| flds[1][z0].value==""|| flds[1][z0].value==null)
			 {
			 
			 alert("select Valid File");
			 flds[1][z0].focus();
			 return false;
			 }
		 
		
     } 
	  return true;
	 
} 
</script>
<script type="text/javascript">

var upload_number = 1;
function addFileInput() {
	/* alert(upload_number); */
 	var d = document.createElement("div");
	d.id = "d"+upload_number;
 	d.style.marginRight	 = "10px";
	d.style.background = '#e6e6e6';
	
	
	var slNo = document.createElement("input");
	slNo.setAttribute("type", "button");
	slNo.setAttribute("value", upload_number);
	slNo.setAttribute("name", "b"+upload_number);
	
	
	
 	var file = document.createElement("input");
 	file.id  =  "att"+upload_number;
 	file.setAttribute("type", "file");
 	file.setAttribute("name", "attachment"+upload_number);
 	slNo.style.background = '#999999';
 	slNo.style.marginRight	 = "10px";
 	file.style.background = 'none';
 	
 	
 	/* var remove = document.createElement("input");
 	remove.id  =  "remv"+upload_number;
 	remove.setAttribute("type", "button");
 	remove.setAttribute("name", "remv"+upload_number);
 	remove.setAttribute("value", "Remove");
 	remove.className  = "rmv";
 //	remove.onclick =removeAttachment();
	remove.style.width = 'auto';
 	
 	 */
 	d.appendChild(slNo);
 	d.appendChild(file); 	
	//d.appendChild(remove);
	
 	document.getElementById("moreUploads").appendChild(d);
 	
 	
 	var idd	 = document.getElementById("att"+upload_number);
 	/* idd.style.display ='none';   */
 	
 	idd.click();
 /* idd.onblur = getFileName(upload_number); */
 
 	//$("#remove").show();
 	document.getElementById("NoOfFiles").value = upload_number;
 
 	upload_number++;
 	
}


function removeAttachment(){
	
	$(document).ready(function(){
		var i =upload_number ; 
		i = parseInt(i) -1;
	

		if(upload_number > 1 ){
	        $("div").remove("#d"+i);
	      upload_number = parseInt(upload_number) - 1;
		}else{
			alert("No Files Attached");		
		}
	});
}

</script>
<script type="text/javascript">
function check(value){ 
xmlHttp=GetXmlHttpObject()
var url="DynamicMRIDAjaxValidity.jsp";
url=url+"?MrId="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
var showdata = xmlHttp.responseText; 
document.getElementById("mydiv").innerHTML= showdata;
} 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try{
xmlHttp=new XMLHttpRequest();
}
catch (e) {
try {
xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
}
catch (e){
xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
}
}
return xmlHttp;
}
</script>
<title>Insert title here</title>
</head>
<%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              String []vname;
	              String []fileName;
	              String req,req2;
	              Connection2 dbConn = new Connection2();
	              String transId = null;     
	              
	              java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy");
	              
   String ddate = po_date.format(new java.util.Date());
	              
	              Connection cn6 = null;
	              Statement st6 = null; 
	              ResultSet rs6 = null;Connection cna = null;
	              Statement sta = null; 
	              ResultSet rsa = null;   


%>
<%
try{
	String SessionName = (String) session.getAttribute("Nname");//there Name
	String req = (String) session.getAttribute("form_no");//there Name
System.out.println("Name:"+session.getAttribute( "Nname" )+"  In Quotation And Comparision Module And Location no. : "+session.getAttribute("b_no"));
		
 

 					//req = request.getParameter("form_no");
 		
 					System.out.println("mr id we are getting is --------------------------------------------------------------  : "+req);
 					//req2 = request.getParameter("MRtransid");
 					//System.out.println("mr pwd we are getting is  : "+req2);
                  transId = "abc"+String.valueOf(Math.random());  
                  //System.out.println("this is transId"+transId);
                  if(req==null)
                  {
                	  req = "";
                  }
                 /*  if(req2==null)
                  {
                	  req2 = "";
                  } */
                  if(session==null)
                  {
                  	response.sendRedirect("../loginho.jsp?msg=1");
                  }
                  %>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">



<!--  <form name="form"  action="DynamicFileUploadBack.jsp" method="post" enctype="multipart/form-data"> -->
<!-- <form name="form"  action="Dynamic2Back.jsp" method="post" enctype="multipart/form-data"> -->
<form name="form"  action="../../../lotusSupportingFile" method="post" enctype="multipart/form-data">
<input type="hidden" name="transid" value="<%=transId%>" />
<input type="hidden" name="SessionName" value="<%=SessionName%>" />


<br />
 <center>
  <div id="mydiv"></div>
  </center>
  
  
<%-- <table width="60%" border="" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr >
	<td align="left">Entered Mr Id <input type="text" name="MrId" size="15" onkeyup="check(this.value);" value="<%=session.getAttribute("req")%>" readonly="readonly"/>
	</td>
	<td align="center" >Generated PWD <input type="password" name="pwd" size="15" value="<%=session.getAttribute("req2")%>" readonly="readonly"/>
	</td>
	</tr>	

</table> --%>






<!-- 
<table class="dynatable" width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0"  align="center">
	<tr><td colspan="4" align="center" bgcolor="grey">
	UPLOAD COMPARISON
	</td>
	</tr>
	<tr>
		<td width="6" align="center" height="21"><button class="add" type='button'>Add</button></td>
		<td width="67" align="center" height="21">Sl No</td>
		<td width="67" align="center" height="21">Files</td>
	</tr>

	<tr class="prototype">
		<td width="7" align="center" height="21"><button class="remove" type='button'>Remove</button></td>
		<td width="67" align="center" height="21"><input readonly="readonly" type="text" name="id[]" value="1" size=1 class="id" /></td>
	
		<td width="67" align="center" height="21"><input type="file" name="file" id="filename" size="15" value="" class="incTotal" /></td>
	</tr>
</table> -->
<table class="formTable" width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0"  align="center">

<tr>
		<td height="20" bgcolor="grey"  align=center colspan="6"><font size="2" color="black"><b>SUPPORTING DOCUMENT</b></font></td>
		</tr>

<tr><th>Sl No</th><th colspan="3">File Name</th><th>View File</th><!-- <th>Delete File</th> -->
<%
int flag3=0;
conn = con.getConnection2();
sta = conn.createStatement();
		File f2 = new File("E:/neinSoft/files/C2IT/LotusSupportingFile/"+req);
		 File[] files2 = f2.listFiles();
        if((!f2.exists())||files2==null)
        {
          System.out.println("creating directory: SupportingFile" + req);
       // String msg = "File__Not__Exist__For__'"+MrId+"' ";
        //response.sendRedirect("ViewFile.jsp?msg="+msg);	
       // System.out.println("Files length--------------------------: " +files);
        }
      
       else{ 
       for(int m=0;m<files2.length;m++){
        	 flag3=1;
     
            String name3=files2[m].getName();
            String path3=files2[m].getPath();
           // String vnam=files[m].getName();
%>
	</tr>			         
<tr>
<td style="background-color: white;" width="50" align="center"  height="21" ><%=m+1%></td>

<td style="background-color: white;" width="450" colspan="3"> <%=name3%></td>
<td align="center" width="90" ><a href="download6.jsp?f=<%=path3%>">View</a></td>
<%-- <td><a href="deleteFile6.jsp?f=<%=path%>">Delete</a></td> --%>
</tr>
     <%
        }  }
        
          // vnameList = null;
        %>
        
       
        <% if (flag3==0){%>
        <tr>
       <td colspan="5">
        <center style="color: grey">
        <%out.println("Sorry.. Supporting Attachment Not Found For : "+req);%></center>
       </td>
       </tr><%} %>

</table>
<table class="formTable" width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0"  align="center">
<tr class="r"><td colspan="3" align="center" style="border-color:silver;background-color:grey;border-radius:5px;padding: 5px;">UPLOAD SUPPORTING DOCUMENTS</td></tr>
	<tr >
	<td align="left">Lotus No. <u><input type="text" name="form_no" size="15" style="color: navy;"  value="<%=session.getAttribute("form_no")%>" readonly="readonly"/></u>
	</td></tr>
<tr>

<td align="center">
<!--  <input type="file" name="attachment" id="attachment" onchange="document.getElementById('moreUploadsLink').style.display = 'block';" />  -->
<div id="moreUploads"></div>


<div id="FileNameList"></div>
<div id="moreUploadsLink">
<br><br><input type="hidden" name="NoOfFiles" id="NoOfFiles" value="0">
<a href="javascript:addFileInput();" style="width: auto;text-decoration: none;"><span style="background-color:grey; color:white; padding:4px;">Attach File</span></a>

<span class="error" id="fileE"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a  id="remove" style="width: auto;" onclick="return removeAttachment()"><span style="background-color:grey; color:white; padding:4px;" onmouseover="this.style.cursor='pointer'">Remove Last Attached File</span></a>
</div>
<div></div> 
</td>

</tr>




</table>


<%session.setAttribute("reqeee",req); %>
	<%}catch (Exception e) { System.out.println(e); }
	finally{
		DbUtil.closeDBResources(rs,st,conn);
		DbUtil.closeDBResources(rs6,st6,cn6);
		DbUtil.closeDBResources(rsa,sta,cna);
		
		
	} %>

<table width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
<!-- <td align="center">
    <a href="ViewFile.jsp" onclick="return popitup('ViewFile.jsp')">View Detail</a> </td> --> 
    <td align="center"><input type=submit name="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="Upload" id="button" onclick="return Validate();"/></td>
<!--     <td align="center"><a href="ViewCompFile.jsp">View Detail</a> </td> -->
    <!-- <td align="center"><a href="NewVendor.jsp?msg=1" onclick="return popitup('NewVendor.jsp?msg=1')">New Vendor </a> </td>
	 -->
	 <td id="hiderow" align="center"><input id="hiderow" type="button" size="2" name="rss" value="Back" style="background-color:white;font-weight:bold;color:black;" onclick='history.go(-1)'; /></td>
	<td align="center">
<a href="UploadFileView.jsp" onclick="return popitup('UploadFileView.jsp')">Help</a> </td>
	</tr>
</table>
<center><font size="3" color="red">*</font><label><font size="1"><b>NOTE:</b>DO NOT USE Special characters file name like  `~!@#$%^&*()_+ {}[];:'"?/ etc</font></label></center>
<br />
</form>







</body>
</html>