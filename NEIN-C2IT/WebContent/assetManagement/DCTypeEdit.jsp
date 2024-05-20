<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="DCTypeUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
	    <td></td>
		<td bgcolor="lightgrey" width="120" align=center><font color="black">ISP Name</font></td>
	    <td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%
String no=request.getParameter("id");
//System.out.println(no);
String[] temp;
temp = no.split(",");
String aid=temp[0];
String an=temp[1];

//System.out.println(an);
//System.out.println(co);
Connection conn=null;
Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;
int sumcount=0;
 %>
    <tr>
          <td style="visibility: hidden;"><input type="hidden" name="aid" value="<%=aid%>"></td>
          <td bgcolor=""><input name="assetname" style="background-color:white;width:100;color:black;" value="<%=an%>" ></td>
	      <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
          <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
	       
    
      </table>
      </form>