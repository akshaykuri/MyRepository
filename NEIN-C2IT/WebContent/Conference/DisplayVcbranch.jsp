<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display VC Branch Details</title>
    <link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
    


<script language="javascript">
function editRecord(id)
    {  
	//alert(id);
    var f=document.form;    
    f.method="post";    
    f.action='vcbranchEdit.jsp?id='+id;    
    f.submit();
    }
    
function deleteRecord(id,id1)
    {   
	//alert(id); 
	//alert(id1); 
	if(confirm('You are above to delete Amenities'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='vcbranchDelete.jsp?id='+id+'&id1='+id1;    
           f.submit();
          }
	else{}
   }
   </script>
 </head>
<body>
<br><br>  
<form method="post" name="form">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">V/C BRANCH  DETAILS</font></strong></td></tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
                <%-- <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("emp_no")%>" >        
                </td>
 </tr>
</table>

<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	  <td bgcolor="#74c1b9" width="120" align=center><font color="black">BranchName</font></td>
	  <td bgcolor="white" width="120" align=center  style="background-color:#74c1b9"><font size="2" color="black"><b>EDIT</b></font></td>
		<td bgcolor="white" width="120" align=center  style="background-color:#74c1b9"><font size="2" color="black"><b>DELETE</b></font></td>
		 </tr>
<%
String no=request.getParameter("id");
System.out.println("form number -----"+no);

Connection conn=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;

 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
    String query1 = "select a.*,branch_name from vcbranch_add a inner join vc_branchmaster b on b.branch_id=a.vcbranch where a.Booking_no='"+no+"'";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
   <%while(rs2.next()){%>
    <tr>
         <%--  <td style="visibility: hidden;"><input type="hidden" name="sid" value="<%=sid%>"></td> --%>
         <td bgcolor="#d2f7f3"><input name="user" style="background-color:white;width:100;color:black;" value="<%=rs2.getString("branch_name")%>" readonly></td>
          <td bgcolor="#d2f7f3"><input id="hiderow" type="button" size="2" name="edit" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick='editRecord("<%=rs2.getInt("vid")%>");' ></td>
         <td style="background-color:#d2f7f3"><input id="hiderow" type="button" size="2" name="delete" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick='deleteRecord("<%=rs2.getInt("vid")%>","<%=rs2.getString("Booking_no")%>");' ></td>
 </tr>
	  <%}%>
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
  <br>
 


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="EditBooking.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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