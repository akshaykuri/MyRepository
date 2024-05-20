<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="FeedbackUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="120" align=center><font color="black">NAME</font></td>

<td style="visibility: hidden;" ></td>
<td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
			</tr>
<%
String no=request.getParameter("id");
  
  
Connection conn=null;
Statement st=null;
ResultSet rs=null;
  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
  String query = "select * from about_master where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  while(rs.next()){%>
  
  <tr>
     
      <td bgcolor=""><input name="name" style="background-color:white;width:100;color:black;" value="<%=rs.getString("name")%>"></td>
      
      <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
      
            <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
      </tr>

      <%}}catch(Exception e){}finally{
			DbUtil.closeDBResources(rs,st,conn);

			}%>
      </table>
      </form>