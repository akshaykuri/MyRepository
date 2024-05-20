<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@ include file="../../../banner.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE body PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<body background="images/u.jpg">
<form >


<%!String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null; %>
<%SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
 
%>
<br />
<br /><center><label style="font: bold; size: 3">PENDING STATUS</label></center> <br />
<table border="1" width="60%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	
<%
 String no=request.getParameter("form_no");
 System.out.println("wat is the getting value ******************************************  :"+no); 
 String req = request.getParameter(no);
 System.out.println("wat is the getting value 2 ***************************************************:"+req); 
 Connection conn=null;
 Statement st=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st11=null;
 ResultSet rs=null,rs2=null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs11=null;
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");  
 
 try 
 
 {
 //NEIN/CS/Domain/90-212
 String[] parts = req.split("CS/");
 String first = parts[0];
 String second = parts[1];
 System.out.println("FIRST : "+first);//FIRST : NEIN/
 System.out.println("SECOND : "+second);//  Domain/90-212

	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
 Class.forName(driver).newInstance();
 conn = DriverManager.getConnection(url+dbName,userName,password); 
  //String query = "SELECT complain_id,cm_name,emp,cm_type,cm_problem,cm_location,cm_status  FROM complain_master_item WHERE emp='"+req+"' AND cm_date='"+cs_date+"'";
  //String query = "SELECT form1_no FROM form1_it_clearance  WHERE form1_no='"+req+"' AND cm_status='Pending' ORDER BY cm_date DESC";
  String query = "SELECT form1_no FROM form1_it_clearance  WHERE SUBSTRING(form1_no,9,20)='"+second+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  String query2 = "SELECT form2_no FROM form2_domain  WHERE SUBSTRING(form2_no,9,20)='"+second+"'";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2); 
  String query3 = "SELECT form3_no FROM form3_lotus  WHERE SUBSTRING(form3_no,9,20)='"+second+"'";
   st3 = conn.createStatement();
   rs3 = st3.executeQuery(query3); 
  String query4 = "SELECT form4_no FROM form4_accesscard  WHERE SUBSTRING(form4_no,9,20)='"+second+"'";
   st4 = conn.createStatement();
   rs4 = st4.executeQuery(query4); 
  String query5 = "SELECT form5_no FROM form5_folder  WHERE SUBSTRING(form5_no,9,20)='"+second+"'";
   st5= conn.createStatement();
   rs5 = st5.executeQuery(query5); 
  String query6 = "SELECT form6_no FROM form6_internet  WHERE SUBSTRING(form6_no,9,20)='"+second+"'";
   st6 = conn.createStatement();
   rs6 = st6.executeQuery(query6); 
  String query7 = "SELECT form7_no FROM form7_newins  WHERE SUBSTRING(form7_no,9,20)='"+second+"'";
   st7 = conn.createStatement();
   rs7 = st7.executeQuery(query7); 
   String query8 = "SELECT form8_no FROM form8_lotus_traveler  WHERE SUBSTRING(form8_no,9,20)='"+second+"'";
   st8 = conn.createStatement();
   rs8 = st8.executeQuery(query8); 
   String query11 = "SELECT form11_no FROM form11_dsc  WHERE SUBSTRING(form11_no,9,20)='"+second+"'";
   st11 = conn.createStatement();
   rs11 = st11.executeQuery(query11); 
   
  int k=0;
  if(rs.next()){
	  String rss = rs.getString(1);
	              System.out.println("IT CLEARANCE: is correct "+rss);
	              response.sendRedirect("ITFORMS/FormApproval/Reminders/ITclearanceReminder.jsp?rss="+rss);
               }
  else if(rs2.next()){
	  String rss = rs2.getString(1);
                          System.out.println("DOMAIN : is correct : "+rss);
                          response.sendRedirect("DomainUser/FormApproval/Reminders/DomainReminder.jsp?rss="+rss);
                   }
  else if(rs3.next()) {
	  String rss = rs3.getString(1);
	                      System.out.println("LOTUS : is .....................correct : "+rss);
	                      response.sendRedirect("LOTUS/FormApproval/Reminders/LotusReminder.jsp?rss="+rss);
                      }
  else if(rs4.next()) {
	  String rss = rs4.getString(1);
	                      System.out.println("ACCESS CARD: is .....................correct : "+rss);
	                      response.sendRedirect("AccessCard/FormApproval/Reminders/AccessCardReminder.jsp?rss="+rss);
                      }
  else if(rs5.next()) {
	  String rss = rs5.getString(1);
	                      System.out.println("SHARED FOLDER : is .....................correct : "+rss);
	                      response.sendRedirect("SharedFolder/FormApproval/Reminders/SharedFolderReminder.jsp?rss="+rss);
                      }
  else if(rs6.next()) {
	  String rss = rs6.getString(1);
	                      System.out.println("INTERNET ACCESS : is .....................correct : "+rss);
	                      response.sendRedirect("InternetAccess/FormApproval/Reminders/InternetAccessReminder.jsp?rss="+rss);
                      }
  else if(rs7.next()) {
	  String rss = rs7.getString(1);
	                      System.out.println("NEWINS: is .....................correct : "+rss);
	                      response.sendRedirect("Newins/FormApproval/Reminders/NewinsReminder.jsp?rss="+rss);
                      }
  else if(rs8.next()) {
	  String rss = rs8.getString(1);
	                      System.out.println("LOTUS TRAVELER: is .....................correct : "+rss);
	                      response.sendRedirect("LotusTraveler/FormApproval/Reminders/LotusReminder.jsp?rss="+rss);
                      }
  else
  {
	  System.out.println("SORRY ");
  }
     %>
      </table>

<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs2,st2,null);
			DbUtil.closeDBResources(rs3,st3,null);
			DbUtil.closeDBResources(rs4,st4,null);
			DbUtil.closeDBResources(rs5,st5,null);
			DbUtil.closeDBResources(rs6,st6,null);
			DbUtil.closeDBResources(rs7,st7,null);
			DbUtil.closeDBResources(rs8,st8,null);
			DbUtil.closeDBResources(rs11,st11,null);
			} %>

<br><br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="right"> 
    <center><p style="font-size:16px;color:black"> 
        <a href="javascript:location.replace('HOME.jsp')"><b>Back To Home Page</b></a></p></center>
</td> 
</tr> 
</table>




 
 <br>

      </form>
      </body></html>