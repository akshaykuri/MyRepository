<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageInternetCard"%>
<%--@page import="CON2.MailMessageNet"--%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
MailMessageInternetCard mailMessage6 = new MailMessageInternetCard();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message6 = null;
	              %>
	              <%
	              
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              %>
<%
//form2_domain
//form2_no,f_date,idextend,branch,depart,full_name,designation,scopeOfWork,emp_code,reporting_officer,requestOption,requestBy,remarks

//String form_no = request.getParameter("form6_no");
String f_date = request.getParameter("f_date");
//String idextend = request.getParameter("idextend");

String branch = request.getParameter("branch");
String depart = request.getParameter("depart");
/* String full_name = request.getParameter("full_name"); */
String Nname = request.getParameter("full_name");
String full_name= Nname.toUpperCase();
String designation = request.getParameter("designation");
String scopeOfWork = request.getParameter("scopeOfWork");
String emp_code = request.getParameter("emp_code");
String r_officer = request.getParameter("reporting_officer");
String requestOption = request.getParameter("requestOption");
String requestBy = request.getParameter("requestBy");
String remarks = request.getParameter("remarks");
String ipAddress = request.getParameter("ipAddress");
String ComName = request.getParameter("ComName");



String i_name = request.getParameter("i_name");
String i_desg = request.getParameter("i_desg");
String i_city = request.getParameter("i_city");
String i_b_no = request.getParameter("i_b_no");
String i_admin = request.getParameter("i_admin");
String i_email_id = request.getParameter("i_email_id");


String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail");
String empid = request.getParameter("empid1");
String levelno = request.getParameter("levelno");
String EmpNo = (String) session.getAttribute("EmpNo");
String msg=null;
Date form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	form_date = new Date(sdf.parse(f_date).getTime());
   }
catch (Exception e) {
	e.printStackTrace();
}


String new_id = null;
int id=0;
String id2=null;
Connection cn_id = null; 
Statement st_id = null; 
ResultSet rs_id = null; 
PreparedStatement psmt1001=null;
PreparedStatement psmt=null,psmt2=null,psmt3=null;
try{
//psmt1001 = cn2.prepareStatement("SELECT MAX(idextend) FROM `sales_master` WHERE s_no IN(SELECT s_no FROM sales_master Left Join login On(substr(sales_master.s_no,12,2)=login.branch_no) WHERE login.branch_no=? GROUP BY s_no)");
psmt1001 = cn2.prepareStatement("SELECT max(idextend) FROM form6_internet   WHERE form6_no IN(SELECT form6_no FROM form6_internet   LEFT JOIN branch_master b ON(substr(form6_no,18,2)=b.b_no) WHERE b.b_no=? GROUP BY form6_no)");
psmt1001.setString(1,i_b_no);
rs_id = psmt1001.executeQuery();


if(rs_id.next()){
	
	try
	{
		id=rs_id.getInt(1);
		if(id==0)
 			id=1;
		     if(id2==null)
 			 id2="NEIN/CS/Internet/"+i_b_no+"-";
             id++;   
             new_id = id2+String.valueOf(id);
	}
	catch(SQLException ex)
	    {
		  System.out.println("WXCEPTION : "+ex.toString());
		 new_id = "NEIN/CS/Internet/"+i_b_no+"-1";
	    }

}


// REPLACING S_NO TO NEW_ID

int idextend = id;




//i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail
//40
psmt = cn2.prepareStatement("INSERT INTO form6_internet(form6_no,f_date,idextend,branch,depart,full_name,designation,scopeOfWork,emp_code,reporting_officer,requestOption,requestBy,remarks,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,ipAddress,ComName,form_name) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

//form2_no,f_date,idextend,branch,depart,full_name,designation,scopeOfWork,emp_code,reporting_officer,requestOption,requestBy,remarks
psmt.setString(1,new_id);
psmt.setDate(2,form_date);
psmt.setInt(3,idextend);
psmt.setString(4,branch);
psmt.setString(5,depart);
psmt.setString(6,full_name);
psmt.setString(7,designation);
psmt.setString(8,scopeOfWork);
psmt.setString(9,emp_code);
psmt.setString(10,r_officer);
psmt.setString(11,requestOption);
psmt.setString(12,requestBy);
psmt.setString(13,remarks);

//i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail
psmt.setString(14,i_name);
psmt.setString(15,i_desg);
psmt.setString(16,i_city);
psmt.setString(17,i_b_no);
psmt.setString(18,i_admin);
psmt.setString(19,i_email_id);
psmt.setString(20,desg);
psmt.setString(21,emp);
psmt.setString(22,mail);


psmt.setString(23,ipAddress);
psmt.setString(24,ComName);
psmt.setString(25,"Internet/FTP Access Request");

int i = psmt.executeUpdate();



PreparedStatement psmt10=null;
psmt10 =cn2.prepareStatement("UPDATE form6_internet SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form6_no=?");
psmt10.setString(1,"Pending");
psmt10.setString(2,"Pending");
psmt10.setString(3,remarks);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,new_id);
int b = psmt10.executeUpdate();


psmt2 = cn2.prepareStatement("INSERT INTO form6_internet_item(form6_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt2.setString(1,new_id);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,"Initiator");
psmt2.setString(5,remarks);
psmt2.setDate(6,form_date);
psmt2.setString(7,i_email_id);
psmt2.setString(8,"over");
psmt2.setString(9,EmpNo);
psmt2.setString(10,"00");

int j = psmt2.executeUpdate();


psmt3 = cn2.prepareStatement("INSERT INTO form6_internet_item(form6_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt3.setString(1,new_id);
psmt3.setString(2,desg);
psmt3.setString(3,emp);
psmt3.setString(4,"Pending");
psmt3.setString(5,"Pending");
psmt3.setDate(6,form_date);
psmt3.setString(7,mail);
psmt3.setString(8,"now");
psmt3.setString(9,empid);
psmt3.setString(10,levelno);
int k = psmt3.executeUpdate();

message6 = mailMessage6.getMailMessageNet(new_id.trim());
System.out.println("meassage ::::::::::::::: "+message6);
postMail.postMail(i_email_id,i_name,"pass1234",mail," INTERNET ACCESS FORM :  " +new_id+ " ",i_name+  " "+  "request you to approve -  Internet Access FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message6);

//postMail.postMail(i_email_id,"pass1234",mail," INTER ACCESS FORM :  " +form_no+ " ",i_name+  " "+  "request your approval for the following Internet Access FORM. " +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>"); 

message6 = null;




msg = "INTERNET__ACCESS__FORM__SAVED__AND__SENT__SUCCESSFULLY";
System.out.println("result..date..........."+form_date);
response.sendRedirect("InternetAccessPage.jsp?msg=" +msg);



}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st1,conn);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st3,cn2);
	DbUtil.closeDBResources(null,st4,null);
	DbUtil.closeDBResources(null,st5,null);
	DbUtil.closeDBResources(null,st6,null);
	DbUtil.closeDBResources(null,st7,null);
	DbUtil.closeDBResources(null,st8,null);
	DbUtil.closeDBResources(null,st9,null);
	DbUtil.closeDBResources(null,st11,null);
	DbUtil.closeDBResources(null,st_id,null);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt1001,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
  }

%>	              