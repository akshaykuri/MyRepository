<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssetDCTypeMaster</title>
<script type="text/javascript">

if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>



<style>
/* The Modal (background) */
.modal
    {
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
.modal-body
    {
    padding: 2px 16px;
    background-color: #D3D3D3;
    }
.modal-content
    {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 40%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
    }
.modal-header
   {
   padding: 2px 16px;
   background-color: #D3D3D3;
   color: black;
   }
</style>
</head>
<script>
function popitup1(url)
        {
		newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>
<script  type="text/javascript">
function cleartext()
    {
	
	document.getElementById('iddctype').value =null;
	
    }
</script>
<script language = "Javascript">
function validate()
     {
	 //alert("hello");
     var nn=document.form.dctype;
     //var val=document.getElementById("idassetType").value;
     if ((nn.value==null)||(nn.value==""))
                {
                alert("Please Enter DCType Value!");
                nn.focus();
                return false;
                }
   
    }
</script>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
	System.out.println("------------- Asset DC Type  -----------------");
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
<body onload="cleartext()">
<form name="form" method="post"  onsubmit="return validate()" action="assetDCTypeBack.jsp">
   <div>
   <BR><BR>
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
         <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
   </table>
   <br>
   <div class="modal-content">
    <div class="modal-header">
              <center> <h2>DataCard Type Master</h2></center>
    </div>
    <div class="modal-body">
    <center>
    <br><br>
    <table border=1>
                        
           <tr>
                <td><font color="red" size="4">*</font>DataCard Type :</td>
                <td><input type="text" name="dctype" maxlength="20" id="iddctype" value="" size=20 /></td>
           </tr>
           
    </table>
    <br>
    <table>
            <tr>
               
                <td align=center><input type=submit name="button" value="Create" id="button" ></td>
	            <td align=center><input type="reset" value="Reset" onclick="cleartext()"/></td>
                <td><a href="DisplayDCType.jsp" onclick="return popitup1('DisplayDCType.jsp')">ViewAllDCType</a> </td>
               
                
            </tr>
    </table>
    <br>
   </center>
   </div>
   </div>
   <br><br>  
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
  </div>
  </form> 
</body>
</html>