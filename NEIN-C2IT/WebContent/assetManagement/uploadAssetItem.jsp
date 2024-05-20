<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.sun.mail.iap.Response"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>UPLOAD FILE</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>


<script>

		function popitup(url) {
			//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
			//if (window.focus) {newwindow.focus()}
			//return false;
				newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
			if (window.focus) {newwindow.focus();}
			return false;
		}
		
		</script>
<script type="text/javascript">

          function checkName(str){
              var re = /[^a-zA-Z][/][(][)][.]/g;
              if (re.test(str)) return false;
              return true;
            }
          
          function validate()
                {
        	   //alert("i am in validate ");
                var fi=document.form.filepath;
                var file_selected = false;
                var fileName = fi.value;
                var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
                if(ext=='')
                  {
               	   alert("Please Browse File to upload "+ext);
               	   fi.focus();
                	 return false;
                  }
              else
                  return true;
                }

</script>


<title>Upload asset file</title>
</head>
<script type="text/javascript">
<% 
	System.out.println("------------- Upload Asset Item  -----------------");
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","\\n");
    disp = disp.replace("_","  ");
   %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>


<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
   <form name="form"  action="uploadAssetItem1.jsp" method="post" enctype="multipart/form-data" >
</br>
            <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
                      <tr align="center">
                           <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
                           <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
                     </tr>
                     <tr align="center">
                         <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
                             </font></strong>
                         </td>
                    </tr>
                    <tr align="center">
                            <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT</font></strong></td>
                    </tr>
                    <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                            <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
                    </tr>
            </table>
</br>
 <%String FileFullPath="D://neinSoft//files//C2IT//assetFile//UploadAssetItem.csv";%>
 
<table class="dynatable" width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0"  align="center">
	<tr>
	    <td colspan="4" align="center" bgcolor="grey">UPLOAD FILES</td>
	</tr>
	
	<tr class="prototype">
		<td width="67" align="center" height="21">Chose file :<input type="file" name="filepath" id="filepath" /></td>
	</tr>
	<tr><td>Download File Format :<a href="download6.jsp?f=<%=FileFullPath%>">Click </a></td></tr>
</table>


<table width="60%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<td align="center"><input type=submit name="button"  style="background-color:#2f4377;font-weight:bold;color:white;" value="Upload" id="button" onclick="return validate()"/></td>
       
	</tr>
</table>
<center><font size="3" color="red">*</font><label><font size="1"><b>NOTE:</b>DO NOT USE Special characters file name like  `~!@#$%^&*()_+ {}[];:'"?/ etc</font></label></center>
<br />
</form>
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
</body>
</html>