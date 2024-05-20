<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<form method="post" action="vcBranchMasterUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	    <td></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Branch Name</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Branch ID</font></td>
        <td bgcolor="#74c1b9" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%
String no=request.getParameter("id");
System.out.println("_____ID___"+no);
String[] temp;
temp = no.split(",");
String id=temp[0];
String bname=temp[1];
String bid=temp[2];

System.out.println(bid);
System.out.println(bname);
Connection conn=null;

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");


Statement st=null,st2=null,st02=null;
ResultSet rs=null,rs2=null,rs02=null;
int sumcount=0;
 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   
  //String query = "select assettype,configname from assetconfgfield where assettype='"+an+"' and configname ='"+co+"'";
   //st = conn.createStatement();
   //rs = st.executeQuery(query);
   
    String query1 = "select * from vc_branchmaster";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
    <tr>
    <td style="visibility: hidden;"><input type="hidden" name="id" value="<%=id%>"></td>
          
   	     <td bgcolor="#d2f7f3"><input name="bname" style="background-color:white;width:100;color:black;" value="<%=bname%>"></td>
	     <td bgcolor="#d2f7f3"><input name="bid" style="background-color:white;width:100;color:black;" value="<%=bid%>"></td>
       
       <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="#d2f7f3"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
	     
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
      </form>