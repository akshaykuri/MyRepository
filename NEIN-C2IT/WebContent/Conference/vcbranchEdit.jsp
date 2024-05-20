<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  ;
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<%@ page import = "java.util.ResourceBundle" %>
<jsp:useBean id = "con" class="CON2.Connection2" />





<form method="post" action="vcbranchUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	    <td></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Branch</font></td>
	     <td bgcolor="#74c1b9" width="120" align=center><font color="black">Edit</font></td>
        <td bgcolor="#74c1b9" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%
System.out.println("edit page---inner amenties");
String no=request.getParameter("id");
System.out.println("edit page---"+no);

Connection conn = null;

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null;
ResultSet rs=null;

 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   
  //String query = "select assettype,configname from assetconfgfield where assettype='"+an+"' and configname ='"+co+"'";
   //st = conn.createStatement();
   //rs = st.executeQuery(query);
   
    String query1 = "select a.*,branch_name from vcbranch_add a inner join vc_branchmaster b on b.branch_id=a.vcbranch where vid='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query1);  %>
  <%while(rs.next()){%>
    <tr>
          <td style="visibility: hidden;"><input type="hidden" name="vid" value="<%=no%>">
          <input type="hidden" name="formno" value="<%=rs.getString("Booking_no")%>"></td>
   	     <td bgcolor="#d2f7f3"><%-- <input name="item" style="background-color:white;width:100;color:black;" value="<%=rs.getString("items")%>"> --%>
   	     <% 
		                Connection con5 = null;
                        /* String url5 = "jdbc:mysql://localhost:3306/";
                        String db5 = "csdb";
                        
                        String driver5 = "com.mysql.jdbc.Driver";
                        String userName5 ="root";
                        String password5=""; */
                        // int sumcount=0;
                        Statement st5=null;
                        ResultSet rs5=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
con5= DriverManager.getConnection(url+dbName,userName,password);
						String query2 = "select branch_name,branch_id from vc_branchmaster";
						st5 = con5.createStatement();
 						rs5 = st5.executeQuery(query2);
						%>
					    <select name="vcbranch" class="amenc" id="vcbranch">
        					<option selected="selected"><%=rs.getString("branch_name")%></option>
							<%while(rs5.next()){%>
								
										<option  value="<%=rs5.getInt("branch_id")%>"><%=rs5.getString("branch_name")%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
				
   	     
   	     </td>
	    
       <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="#d2f7f3"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
	  
      </table>
      <br>
      <br>
     <center>
      <a href="vcbrancheditadd.jsp?id=<%=rs.getString("Booking_no")%>" >VC Branch Add</a>
    </center>
      
       <%}%>   
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </form>