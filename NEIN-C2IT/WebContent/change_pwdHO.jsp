<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<html>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<link rel='stylesheet' type='text/css' href='css/NipponThankYou.css' />
<script language="javascript"   type="text/javascript" src="js/confirmMessage.js" ></script>
<script type="text/javascript">
function cancel()
{
   close();
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
<script>

function validate()
{
		var isValidForm = true;
        var errorMessages = "";
        
        var a=document.getElementById("idCurrent");
        if (a.value == "") 
        {
         alert("Current Password is required");
         a.focus();
         isValidForm = false;
        }
        
        var b=document.getElementById("idNew");
        if (b.value == "") 
        {
         alert("New Password is required");
         b.focus();
         isValidForm = false;
        }    
        
        var c=document.getElementById("idConfirm");
        if (c.value == "") 
        {
         alert("Confirmation of Password is required");
         c.focus();
         isValidForm = false;
        }   
        
       // if(document.f.new.value!=document.f.confirm.value){
    	     if(b.value!=c.value){
alert("New Password and Confirm Password should be same"+'\n'+" Re-enter confirm-password!");
document.f.confirm.value="";
return false;
}
//return true;
 if (!isValidForm) {
            //alert(errorMessages);
        }

        return isValidForm;
}
</script>
<script type="text/javascript">
function Validation()
{
	var a1=document.f.emp_no;
	var a2=document.f.address;
    var a3=document.f.contact;
	
   	 var d1=document.f.current; //Current pwd
	 var d2=document.f.newpwd; //new pwd
	 var d3=document.f.confirm;
	
	    if ((a1.value==null)||(a1.value=="NULL")||(a1.value==""))
		{
			 alert("Enter Emp No.!");
		         a1.focus();
			 return false;
			 }
	    if ((a2.value==null)||(a2.value=="NULL")||(a2.value==""))
		{
			 alert("Enter Address");
		         a2.focus();
			 return false;
			 }
	    if ((a3.value==null)||(a3.value=="NULL")||(a3.value==""))
		{
			 alert("Enter Contact");
		         a3.focus();
			 return false;
			 }
	    if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
					{
	  				 alert("Enter Current Password!");
	   			         d1.focus();
	  				 return false;
	  				 }
	    if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
		{
			 alert("Enter New Password!");
		         d2.focus();
			 return false;
			 }
	    if ((d3.value==null)||(d3.value=="NULL")||(d3.value==""))
		{
			 alert("Enter Confirm Pwd!");
		         d3.focus();
			 return false;
			 }
	    if(d2.value!=d3.value){
	    	alert("New Password and Confirm Password should be same"+'\n'+" Re-enter confirm-password!");
	    	document.f.confirm.value="";
	    	d3.focus();
	    	return false;
	    	}
	   /* if (checkAddress(d1.value)==false)
					{
	   				d1.value="";
	 			       alert("Invalid Material Requisition");
	   				d1.focus();
	  				 return false;
	  				 } */
	      
	  	 
	else
	return true;
	   }
	

</script>
<%
String SessionName=null,Sessiondesg=null;
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Connection conn=null;
Statement st2 =null;
ResultSet rs=null;
PreparedStatement psmt=null;
String Addr=null,cont=null,emp_no=null,pwd=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try 

{
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
 psmt = conn.prepareStatement("SELECT * FROM nentryho WHERE Nname=? AND Npost=?");
psmt.setString(1,SessionName);
psmt.setString(2,Sessiondesg);
rs = psmt.executeQuery();

while(rs.next()){
	 Addr = rs.getString("Naddr");
	 cont = rs.getString("Ncontact");
	 emp_no = rs.getString("EMP_NO");
	 pwd = rs.getString("Npwd");
}

%>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70"  >
<form name="f" method="post" action="changePasswordHOBack.jsp" >
<center>
<fieldset style="margin: 2 cm; border-bottom-color: black; width: 60%; " >

<label style="font: 300;"><font size="3">CHANGE PASSWORD</font> </label>
  <table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
 <tr style="visibility: hidden;display: none;"><td>
 <input type="text" name="changeName" value="<%=SessionName%>"/>
 <input type="text" name="changeDesg" value="<%=Sessiondesg%>"/>
 </td></tr>
   <% Object newName = session.getAttribute("theName");%>
<tr><td align="center" width="50%"><font size="2">System Admin</font> </td><td><font size="2"><%=SessionName%></font></td></tr>
<tr><td align="center" width="50%"><font size="2">Emp No.</font></td><td><input size="20" type="text" name="emp_no" maxlength="9" value="<%=emp_no%>"></td></tr>
<tr><td align="center" width="50%"><font size="2">Address</font></td><td><input size="20" type="text"  name="address" maxlength="55" value="<%=Addr%>"></td></tr>
<tr><td align="center" width="50%"><font size="2">Contact</font></td><td><input size="20" type="text"  name="contact" maxlength="25" value="<%=cont%>"></td></tr>


   
<tr><td align="center" width="50%"><font size="2">Current Password</font></td><td><input size="20" type="password" id="idCurrent" name="current" maxlength="25" value="<%=pwd%>"></td></tr>

<tr><td align="center" width="50%"><font size="2">New Password</font></td><td><input size="20" type="password" id="idNew" name="newpwd" maxlength="25" onkeyup="return confirmpass()"></td></tr>
<tr><td align="center" width="50%"><font size="2">Confirm Password</font></td><td><input size="20" type="password" id="idConfirm" name="confirm" maxlength="25" onkeyup="return confirmpass()"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Change Password" onclick="return Validation();"/><input type="button" value="Cancel" onclick="cancel();" /></td></tr>
</table>
<%-- <table>
<tr>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Naddr" style="background-color:#F0F0F0;width:100;color:black;" value="<%=Addr%>"></font></td>
      <td bgcolor="#F0F0F0" width="100"><font color="black"><input type="text" name="Ncontact" style="background-color:#F0F0F0;width:120;color:black;" value="<%=cont%>"></font></td>

</tr>
</table> --%>
</fieldset>
</center>
</form>
<%  }		catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(rs,st2,conn);
	DbUtil.closeDBResources(null,psmt,null);

	}	%>
</body>
</html>