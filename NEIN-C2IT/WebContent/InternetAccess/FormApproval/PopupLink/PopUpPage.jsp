<%@page language="java"%>
<%@ include file="../../../banner.jsp" %>
<%@page import="java.sql.*"%>

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
 String no=request.getParameter("form_no");
 System.out.println("wat is the getting value ******************************************  :"+no); 
 String req = request.getParameter(no);
 System.out.println("wat is the getting value 2 ***************************************************:"+req); 
 %>
 <br /><center><label style="font: bold; size: 3">INTERNET ACCESS FORM NO : <%=no%> IS SAVED AND SENT SUCCESSFULLY</label></center> <br />
 <%
 try 
 
 {
 //NEIN/CS/Domain/90-212
 String[] parts = req.split("CS/");
 String first = parts[0];
 String second = parts[1];
 System.out.println("FIRST : "+first);//FIRST : NEIN/
 System.out.println("SECOND : "+second);//  Domain/90-212

  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
  String query2 = "SELECT form6_no FROM form6_internet  WHERE SUBSTRING(form6_no,9,20)='"+second+"'";
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