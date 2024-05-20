<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title>FORM APPROVER</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<title>Insert title here</title>
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

 
</head>





<script>

function validatefield()
    {
	var uid=document.form1.uid;
	var pwd=document.form1.pwd;
	var fo1=document.form1.formno;
	var fi=document.form1.file;
    var file_selected = false;
    var fileName = fi.value;
    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    if(fo1.value=="")
	    {
	    alert("Please Select form No...");
	    return false;
	    }
    else if(uid.value=="")
        {
        alert("Please enter user ID...");
        return false;
        }
    else if(pwd.value=="")
        {
        alert("Please enter password..");
        return false;
        }
    else if(ext=='')
        {
        alert("Upload NExAS File"+ext);
        fi.focus();
        return false;
        }
	return true;
 }
</script>  



</head>
<body>
<form  method="post" onsubmit="return validatefield()" action="UploadNExASFormBack.jsp"  name="form1" id="form" enctype="multipart/form-data">
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="nippon.gif" height="35" width="220"> </td>
    
    </tr>
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">NExAS FORM UPLOAD</font></strong></td>
</tr>
 
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
      <table align="center"  border="1" > 
          <tr>
             <td><font color=red>*</font>NExAS Form No. :</td>
             <td><%Connection con = null;
             ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
         	String userName = dbProperties.getString("csdb.username");
         	String password = dbProperties.getString("csdb.password");
         	String url = dbProperties.getString("csdb.url");
         	String driver = dbProperties.getString("csdb.driverName");
         	String dbName = dbProperties.getString("csdb.dbName");
                        //int sumcount=0;
                        Statement st=null;
                        ResultSet rs=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con = DriverManager.getConnection(url+dbName,userName,password); 
						String query = "select form_no from form12_nexas where finalApproved='Final' and filepath IS NULL and fileName IS NULL ORDER BY form_no Asc";
						st = con.createStatement();
 						rs = st.executeQuery(query);
						%>
							<select name="formno" id="idformno" >
							<option value="">Select</option>
							<%while(rs.next()){%>
								<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
									
    						<%}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							con.close();
					   }%>
                 </td>
         </tr>
         <tr>
             <td><font color=red>*</font>User ID  :</td>
             <td ><input type="text" name="uid" id="iduid" size="15" value=""  /></td>
         </tr>
         <tr>
             <td><font color=red>*</font>Password  :</td>
             <td ><input type="text" name="pwd" id="idpwd" size="15" value=""  /></td>
         </tr>
         <tr>
             <td><font color=red>*</font>Upload NExAS form  :</td>
             <td ><input type="file" name="file" id="filename" size="15" value="" class="incTotal" /></td>
         </tr>
         <tr>
            
             <td ><input type="SUBMIT" VALUE="SAVE & SENT" /></td>
         </tr>
      </table>     
 
 
 
<br>
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../adminbom.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../adminbom.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>

</body>
</html>