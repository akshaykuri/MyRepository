<%@page import="CON2.MailMessageNExAS"%>
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 


<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
MailMessageNExAS mailMessage = new MailMessageNExAS();
String msg="",crname="",crmail="",ganame="",gamail="";
Connection cn = null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null,rs_id=null; 
PreparedStatement psmt1001=null,psmt3=null;
try
   {
   cn = con.getConnection2();
   st=cn.createStatement();
   st2=cn.createStatement();
   //idRETURNABLE_NON,idtakeby,iddesg,iddate_time,idtrnsfrom,idtrnsto,idITPName,idScPName,idexpDateReturn,idvname,idpurpos
   String formno=request.getParameter("formno");
   String status=request.getParameter("approved");
   String remarks=request.getParameter("remarksAp1");
   rs=st.executeQuery("select createdBy,createrEmailid,ganame,gamail from gatepassform where formno='"+formno+"'");
   while(rs.next())
       {
	   crname=rs.getString(1);
	   crmail=rs.getString(2);
	   ganame=rs.getString(3);
	   gamail=rs.getString(4);
       }
   Date dNow = new Date( );
   java.text.DateFormat aprdate = new SimpleDateFormat("dd/MM/yyyy"); 
   String apdate=aprdate.format(dNow);
  int i=st2.executeUpdate("update gatepassform set approvalStatus='"+status+"',gaApproverRemarks='"+remarks+"',gaApprovedDate='"+apdate+"' where formno='"+formno+"'");
  // message = "";
   postMail.postMail(gamail,ganame,"pass1234",crmail,"NEIN-C2IT GatePass FORM :  " +formno+ " ","Dear "+ crname + ",<br><br><br>Your Gate Pass Form No.:"+formno+" has been "+status+". <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");              
   msg = "Approved__And__Sent__Successfully....";
   response.sendRedirect("../adminPage.jsp?msg=1");
%>
<%

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally {
	//DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs2,st,cn );
	DbUtil.closeDBResources(rs,st2,null);
	
}
%>


