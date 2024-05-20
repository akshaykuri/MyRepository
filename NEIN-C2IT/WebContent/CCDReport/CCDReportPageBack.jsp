<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageCCDReport"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
                  MailMessageCCDReport mailMessage = new MailMessageCCDReport();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String message = null;
	              %>
	              <%
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              %>
<%

//empid,full_name,depart,designation,reporting_officer,empmailid,emp_mob,requestBy,remarks,desg,emp,mail
//String f_date = request.getParameter("f_date");
//String idextend = request.getParameter("idextend");
String empid = request.getParameter("empid");
String Nname = request.getParameter("full_name");
String full_name= Nname.toUpperCase();
String depart = request.getParameter("depart");
String designation = request.getParameter("designation");
String r_officer = request.getParameter("reporting_officer");
String empmail = request.getParameter("empmailid");
String emp_mob = request.getParameter("emp_mob");
String requestBy = request.getParameter("requestBy");
String empBranch = request.getParameter("branch");

//  empid,full_name,depart,branch,designation,reporting_officer,empmailid,emp_mob,requestBy,dbName, se1,se1text,se2,se2text,date_time,date_time1,remarks
// mail11, mail1,  empid1, emp, desg, mail, levelno      



String dbName = request.getParameter("dbName");
String se1 = request.getParameter("se1");
String se1text = request.getParameter("se1text");
String se2 = request.getParameter("se2");
String se2text = request.getParameter("se2text");
//System.out.println("User Kund  :"+userKind);
String datefrom = request.getParameter("date_time");
String dateto = request.getParameter("date_time1");
String remarks = request.getParameter("remarks");

String desg = request.getParameter("desg");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail");
String empid1 = request.getParameter("empid1");
String levelno = request.getParameter("levelno");

String i_name = request.getParameter("i_name");
String i_desg = request.getParameter("i_desg");
String i_city = request.getParameter("i_city");
String i_b_no = request.getParameter("i_b_no");
String i_admin = request.getParameter("i_admin");
String i_email_id = request.getParameter("i_email_id");
String emp_no = (String)session.getAttribute("emp_no");


String new_id = null;
int id=0;
String id2=null;
Connection cn_id = null; 
Statement st_id = null,smt2=null; 
ResultSet rs_id = null; 
PreparedStatement psmt1001=null;

PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null;
System.out.println("Branch no i_b_no: "+i_b_no);
try{
//psmt1001 = cn2.prepareStatement("SELECT MAX(idextend) FROM `sales_master` WHERE s_no IN(SELECT s_no FROM sales_master Left Join login On(substr(sales_master.s_no,12,2)=login.branch_no) WHERE login.branch_no=? GROUP BY s_no)");
psmt1001 = cn2.prepareStatement("SELECT max(idextend) FROM form13_ccdreport WHERE form_no IN(SELECT form_no FROM form13_ccdreport LEFT JOIN branch_master b ON(substr(form_no,10,2)=b.b_no) WHERE b.b_no=? GROUP BY form_no)");
psmt1001.setString(1,i_b_no);
rs_id = psmt1001.executeQuery();


if(rs_id.next()){
	
	try
	    {
		id=rs_id.getInt(1);
		if(id==0)
 			id=1;
		else
			id++;
		if(id2==null)
 		    id2="NEIN/CCD/"+i_b_no+"-";
         new_id = id2+String.valueOf(id);
	}
	catch(SQLException ex)
	    {
		System.out.println("WXCEPTION : "+ex.toString());
	    }

}
System.out.println("Requ branch code: "+i_b_no);
System.out.println("new id : "+new_id);
// REPLACING S_NO TO NEW_ID

int idextend = id;
psmt = cn2.prepareStatement("INSERT INTO form13_ccdreport(form_no,idextend,empid,full_name,depart,designation,r_officer,empmail,emp_mob,requestBy,requestOption,req_Branch,empBranch) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

//empid,full_name,depart,designation,r_officer,empmail,emp_mob,requestBy,requestOption,req_Branch
psmt.setString(1,new_id);
psmt.setInt(2,idextend);
psmt.setString(3,empid);
psmt.setString(4,full_name);
psmt.setString(5,depart);
psmt.setString(6,designation);
psmt.setString(7,r_officer);
psmt.setString(8,empmail);
psmt.setString(9,emp_mob);
psmt.setString(10,requestBy);
psmt.setString(11,"new");
psmt.setString(12,i_b_no);
psmt.setString(13,empBranch);
int i = psmt.executeUpdate();


psmt4 = cn2.prepareStatement("INSERT INTO form13_ccdreport_otherVal(form_no,selBranch,selOption1,selOption1Txt,selOption2,selOption2Txt,fromDate,toDate) VALUES(?,?,?,?,?,?,?,?)");

psmt4.setString(1,new_id);
psmt4.setString(2,dbName);
psmt4.setString(3,se1);
psmt4.setString(4,se1text);

psmt4.setString(5,se2);
psmt4.setString(6,se2text);
psmt4.setString(7,datefrom);
psmt4.setString(8,dateto);
int k = psmt4.executeUpdate();



//System.out.println("result..date...........1");

psmt2 = cn2.prepareStatement("INSERT INTO form13_ccdreport_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
psmt2.setString(1,new_id);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,"Initiator");
psmt2.setString(5,remarks);
psmt2.setString(6,i_email_id);
psmt2.setString(7,emp_no);
psmt2.setString(8,"0");
int j = psmt2.executeUpdate();
psmt3 = cn2.prepareStatement("INSERT INTO form13_ccdreport_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
psmt3.setString(1,new_id);
psmt3.setString(2,desg);
psmt3.setString(3,emp);
psmt3.setString(4,"Pending");
psmt3.setString(5,"Pending");
psmt3.setString(6,mail);
psmt3.setString(7,empid1);
psmt3.setString(8,levelno);
int j1 = psmt3.executeUpdate();


//System.out.println("result..date...........2");

message = mailMessage.getMailMessageCCDReport(new_id.trim());
postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT CCD REPORT FORM :  " +new_id+ " ",i_name+  " "+  "Request you to approve - CCD Report : FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              


message = null;




String msg = "CCD__FORM__NO__:__'"+new_id+"'__SAVED__AND__SENT__SUCCESSFULLY";
//System.out.println("result..date..........."+form_date);
response.sendRedirect("../adminHR.jsp?msg=" +msg);

}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st1,conn);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt1001,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
  }
 

%>	              