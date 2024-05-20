<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%-- <%@page import="CON2.DbUtil"%> --%>
 <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssetTrfanfer</title>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>
<%
System.out.println(" ----------- NONIT asset Trasnfer -------------");
String no=request.getParameter("id");
String[] temp;
temp = no.split(",");
String inv=temp[0];
String asno=temp[1];
String at=temp[2];
//System.out.println(":::::::::::: chintu"+at);
String bcod=temp[3];
String bran=temp[4];
String war=temp[5];
//String user=temp[8];
String sc=temp[6];
String man=temp[7];
System.out.println(inv);


//System.out.println(asno);
//System.out.println(at);
//System.out.println("BRanch "+bran);

System.out.println(war);

System.out.println(sc);
System.out.println(man);
//System.out.println(user); %>
      
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
    width: 50%;
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
<script type="text/javascript"> // script for sysdate // body onloade(), clear of field
function cleartext() 
    {
	document.getElementById("idaNo").value= "";
    }
</script>

 <script type="text/javascript"> // script for Search button onclic func
function maindat(att)
         {
	     var br = document.getElementById("idbran").value;
	      //alert(br);
	      
	     // alert("chintuuut :::: "+att);
	     
	     var per = document.getElementById("idperp").value;
	     var approvby = document.getElementById("idapprove").value;
	     var fi=document.form.file;
         var file_selected = false;
       //  alert("FILE : "+fi);
       //  alert("FILE name : "+file_selected);
       
       var fileName = fi.value;
       var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	     if(br=="Select")
	    	 {
	    	 alert("please Select the branch no....");
	    	 return false;
	    	 }
	     if(per=="")
    	     {
    	     alert("please Enter the perpus of transfer....");
    	     return false;
    	     }
	     if(approvby=="")
	     {
	     alert("please Enter the Approver name....");
	     return false;
	     }
	     if(ext=='')
         {
          alert("Upload File"+ext);
          fi.focus();
          return false;
          }
              
	     if(br!="Select" && per!="" )
	       {
	    	    //alert("hello");
	    	    var no1='<%=no%>';
	    	   // alert(no1);
	    	    var str=no1+","+br+","+per+","+approvby+","+att;
	    	   // alert(str);
	    	    var f=document.form;    
	    	    f.method="post";    
	    	    f.action='assetTransferDB.jsp?str='+str;    
	    	    f.submit();
	    	   }
	     }
</script>
 </head>
<body> 
<form method="post" name="form" id="form" enctype="multipart/form-data">
<BR><BR>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
</font></strong></td></tr>
<tr align="center">
<td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSET TRANSFER FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	    <tr>
		<td bgcolor="lightgrey" width="120" align=center><font color="black">Inventory No :</font></td>
		<td bgcolor=""><%=inv%></td>
		</tr>
		<tr>
	    <td bgcolor="lightgrey" width="120" align=center><font color="black">Asset No</font></td>
	    <td bgcolor=""><%=asno%></td>
	    </tr>
	    <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">Asset Type</font></td>
        <td bgcolor=""><%=at%></td>
        </tr>
        <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">Branch</font></td>
        <td bgcolor=""><%=bran%></td>
        </tr>
        <%-- <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">WarExpDate</font></td>
        <td bgcolor=""><%=war%></td>
        </tr> --%>
        <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="red" size="4">*</font><font color="black">Transfer TO</font></td>
        <td>
             <% Connection conn=null;
                Statement st2=null;
                ResultSet rs2=null;
                try 
                   {
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
                   //String query = "select assettype,configname from assetconfgfield where assettype='"+an+"' and configname ='"+co+"'";
                   //st = conn.createStatement();
                   //rs = st.executeQuery(query);
                   String query1 = "select * from branch_master_main where m_b_no!='"+bcod+"' ORDER BY m_b_name";
                   st2 = conn.createStatement();
                   rs2 = st2.executeQuery(query1);  %>
                   <select name="assetname" id="idbran">
	                    <option value="Select">select</option> 
	                    <% while(rs2.next()){ %>
	                    <option value="<%=rs2.getString(2)%>"><%=rs2.getString(2)%></option>
	                   <%}%> 
	               </select>
	               <% }catch (SQLException ex) 
                              {
                              ex.printStackTrace();
                              }     	
                       finally{} %>
	    </td>
	    </tr>
        <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="black"><font color="red" size="4">*</font>Purpose of transfer</font></td>
        <td><input type="text" name="perp" id="idperp" size="50" Value=""/></td>
        </tr>
         <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="black"><font color="red" size="4">*</font>ApprovedBy</font></td>
        <td><input type="text" name="approve" id="idapprove" size="30" Value=""/></td>
        </tr>
         <tr>
        <td bgcolor="lightgrey" width="120" align=center><font color="black"><font color="red" size="4">*</font>UploadFilee</font></td>
        <td width="67" align="center" height="21"><input type="file" name="file" id="filename" size="15" value="" class="incTotal" /></td>
        </tr>
        <tr><td bgcolor="lightgrey"></td>
          <td bgcolor="lightgrey"><input type="submit" name="save3" value="Update" style="background-color:lightgrey;font-weight:bold;color:black;" onclick=" return maindat('<%=at%>')">
           <input type="button" size="2" style="background-color:lightgrey;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'>
          </td>
        </tr>
      </table>
       <br>    
</center>
</div>
</div>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href='assettransferbackNONIT.jsp?assetno=<%=asno%>'><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                              
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    </tr>
</table> 
</form>
</body>
</html>


















