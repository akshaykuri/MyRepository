<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %>
<%@page import="java.text.DecimalFormat" %> 
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id="dateFormat" class="CON2.DateFormat" />
<%@page import="CON2.DateFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>GATE PASS REPORT </title>

<script type="text/javascript">
function btnClick() { 
         close(); 
}
</script>

<SCRIPT Language="Javascript">


function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
</script>	


	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>

</head>
<% 
Connection conn=null;
Statement st=null,st1=null; 
ResultSet rs=null,rs1=null;
PreparedStatement psmt=null;
String query1=null,formno="",passtype="",itnonit="",gattepassdate="",gattepasstime="",vendorname="",transportfrom="",transportto="",branch="",expReturnDate="";
String itnonit1 = request.getParameter("itnonit");
String passtype1 = request.getParameter("RETURNABLE_NON");
String date1 = request.getParameter("datefrom");
String date2 = request.getParameter("dateto");
String gbranch = request.getParameter("branch");
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
System.out.println("itnonit1 : "+ itnonit1);
System.out.println("passtype1 : "+ passtype1);
System.out.println("from date : "+ date1);
System.out.println("to date : "+ date2);
System.out.println("branch : "+ gbranch);
%>
<body>
   <form action="" name="form">
           <center>
             <table width="100%" border="1"  align="center" bgcolor="white" >
                    <tr>
                       <td colspan="11" align="center" bgcolor="blue"> <strong><font size ="4" color="black"><b>GATE PASS REPORT</b></font></strong></td>
                   </tr>
                   <tr>
						<td height="20" bgcolor="#FBCA64" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>FORM NO</b></font></td>
						<td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>PASS TYPE</b></font></td>
						<td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>IT/NONIT</b></font></td>
						<td height="20" bgcolor="#F6B326" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>GATEPASS DATE</b></font></td>
						<td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>TIME</b></font></td>
						<td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>RETURN DATE</b></font></td>
						<td height="20" bgcolor="#FBCA64" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>VENDOR NAME</b></font></td>
						<td height="20" bgcolor="#FBCA64" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>TRANSPORT FROM</b></font></td>
						<td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>TRANSPORT TO</b></font></td>
						<td height="20" bgcolor="#F6B326" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>GATEPASS BRANCH</b></font></td>
						<td>
						    <table border="1">
						            <tr>
						                 <td height="20" bgcolor="#FBD68A" width="50" align=center colspan="4"> <font color="black" style="font-family:verdana;" size="2"><b>ITEM DETAILS</b></font></td>
						            </tr>
						            <tr>
						                 <td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>ITEM DESC</b></font></td>
						                 <td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>ASSET NO.</b></font></td>
						                 <td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>QTY</b></font></td>
						                 <td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><b>REMARKS</b></font></td>
						            </tr>
					       </table>
					  </td>
				  </tr>
   
               <%try
                    {
            	   Class.forName(driver).newInstance();
            	   conn = DriverManager.getConnection(url+dbName,userName,password); 
                    String query = "select * from gatepassform "+
                                   "WHERE "+
        		                   "(itnonit = ?  OR ? = '') "+
        		                   "AND (passType = ?  OR ? = '') "+
        		                   "AND (braddress = ?  OR ? = '') "+
        		                   "AND (dateTme >= ?  OR ? = '') AND (dateTme <= ?  OR ? = '')";
                                   psmt = conn.prepareStatement(query); 
                                   // itnonit1,passtype1,date1,date2,gbranch
                                   System.out.println("Here....");
		                           psmt.setString(1,itnonit1);
		                           psmt.setString(2,itnonit1);
		                           psmt.setString(3,passtype1);
		                           psmt.setString(4,passtype1);
		                           psmt.setString(5,gbranch);
		                           psmt.setString(6,gbranch);
		                           psmt.setString(7,date1);
		                           psmt.setString(8,date1);
		                           psmt.setString(9,date2);
		                           psmt.setString(10,date2);
		                           rs = psmt.executeQuery();
		                           System.out.println("Here..2..");
                   // rs = st.executeQuery(query);
                    while(rs.next())
                         {
                    	 System.out.println("Here.3...");
                         formno=rs.getString(3);
                         System.out.println("Form No :"+formno);
                         passtype=rs.getString(4);
                         itnonit=rs.getString(37);
                         gattepassdate=rs.getString(7);
                         gattepasstime=rs.getString(16);
                         expReturnDate=rs.getString(12);
                         vendorname=rs.getString(13);
                         transportfrom=rs.getString(8);
                         transportto=rs.getString(9);
                         branch=rs.getString(20);%>
                         
                        <tr> 
                        <td height="20" bgcolor="#FBCA64" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=formno%></font></td>
						<td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=passtype%></font></td>
						<td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=itnonit%></font></td>
						<td height="20" bgcolor="#F6B326" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=gattepassdate%></font></td>
						<td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=gattepasstime%></font></td>
						<td height="20" bgcolor="#FBD68A" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=expReturnDate%></font></td>
						<td height="20" bgcolor="#FBCA64" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=vendorname%></font></td>
						<td height="20" bgcolor="#FBCA64" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=transportfrom%></font></td>
						<td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=transportto%></font></td>
                        <td height="20" bgcolor="#E4B248" width="50" align=center > <font color="black" style="font-family:verdana;" size="2"><%=branch%></font></td>
                       
                        <td>
                        <%query1 = "select * from gatepassitem where formno='"+formno+"'";
                         st1 = conn.createStatement();
                         rs1 = st1.executeQuery(query1);%>
                            <table border="1">
                            <%while(rs1.next())
                                  {%>
                        	      <tr>
                        	          <td bgcolor="#FBCA64" width="50" align=center><%=rs1.getString(3)%></td>
                        	          <td bgcolor="#FBCA64" width="50" align=center><%=rs1.getString(4)%></td>
                        	          <td bgcolor="#FBCA64" width="50" align=center><%=rs1.getString(5)%></td>
                        	          <td bgcolor="#FBCA64" width="50" align=center><%=rs1.getString(6)%></td>
                        	     </tr>
                                 <%}%>
                             </table>  
                         </td></tr>
                        <%}
        	       }catch(Exception ex)
	                     {
		    	         ex.printStackTrace();
		 	             }%>
       			  </table>
		 </center>
   </form>
			     

</body>
</html>
