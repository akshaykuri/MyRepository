<%@page language="java"%>
<%@ include file="../../../banner.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE body PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function cancel()
{
   close();
}
</script>
<body background="images/u.jpg">
<form >

<br />

<table border="1" width="60%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

 String no=request.getParameter("form_no");
 System.out.println("wat is the getting value ******************************************  :"+no); 
 String req = request.getParameter(no);
 System.out.println("wat is the getting value 2 ***************************************************:"+req); 
 %>
 <br /><center><label style="font: bold; size: 3">DOMAIN FORM NO : <%=no%> IS SAVED AND SENT SUCCESSFULLY</label></center> <br />
 <%
 try 
 
 {
 //NEIN/CS/Domain/90-212
 String[] parts = req.split("CS/");
 String first = parts[0];
 String second = parts[1];
 System.out.println("FIRST : "+first);//FIRST : NEIN/
 System.out.println("SECOND : "+second);//  Domain/90-212

 Class.forName(driver).newInstance();
 Connection conn = DriverManager.getConnection(url+dbName,userName,password); 
  String query2 = "SELECT form2_no FROM form2_domain  WHERE SUBSTRING(form2_no,9,20)='"+second+"'";
  Statement st2 = conn.createStatement();
  ResultSet rs2 = st2.executeQuery(query2); 
  int k=0;
 
   if(rs2.next()){
	                      String msg = "DOMAIN__USER__FORM__NO__:__'"+no+"'__SAVED__AND__SENT__SUCCESSFULLY";
                          response.sendRedirect("adminPage.jsp?msg="+msg);
                   }
 
  else
  {
	  System.out.println("SORRY ");
  }
     %>
      </table>

<%}catch(Exception e){}


%>

<br><br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="right"> 
    <center><p style="font-size:16px;color:black"> 
        <input type="button" value="OK" title="Click To Close Sub Menu" onclick="cancel();" /></p></center>
</td> 
</tr> 
</table>




 
 <br>

      </form>
      </body></html>