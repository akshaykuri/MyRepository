<%@page import="CON2.DbUtil"%>
  <%@page import="CON2.MailMessageTMSUser"%>
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
                   MailMessageTMSUser mailMessage = new MailMessageTMSUser();
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

//emptype,empid,full_name,depart,designation,reporting_officer,empmailid,emp_mob,requestBy,requestOption,req_Branch,remarks,desg,emp,mail
String f_date = request.getParameter("f_date");
//String idextend = request.getParameter("idextend");
String emptype = request.getParameter("emptype");
System.out.println("Employee Type :"+emptype);

String empid = request.getParameter("empid"+emptype);
String Nname = request.getParameter("full_name"+emptype);
String full_name= Nname.toUpperCase();
String depart = request.getParameter("depart"+emptype);
String designation = request.getParameter("designation"+emptype);
String r_officer = request.getParameter("reporting_officer"+emptype);
String empmail = request.getParameter("empmailid"+emptype);
String emp_mob = request.getParameter("emp_mob"+emptype);
String requestBy = request.getParameter("requestBy"+emptype);
String requestOption = request.getParameter("requestOption"+emptype);
String deptType = request.getParameter("deptType"+emptype);
String req_Branch = request.getParameter("req_Branch"+emptype);
String empBranch = request.getParameter("branch"+emptype);



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

PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmtfe=null;

try
  {
  psmt1001 = cn2.prepareStatement("SELECT max(idextend) FROM form16_tmsuser WHERE form_no IN(SELECT form_no FROM form16_tmsuser LEFT JOIN branch_master b ON(substr(form_no,14,2)=b.b_no) WHERE b.b_no=? GROUP BY form_no)");
  psmt1001.setString(1,req_Branch);
  rs_id = psmt1001.executeQuery();
  if(rs_id.next())
      {
	  try
	    {
		id=rs_id.getInt(1);
		if(id==0)
 			id=1;
		else
			id++;
		if(id2==null)
 		    id2="NEIN/TMSUSER/"+req_Branch+"-";
         new_id = id2+String.valueOf(id);
	     }
	     catch(SQLException ex)
	        {
		    System.out.println("WXCEPTION : "+ex.toString());
	        }
       }
       //System.out.println("Requ branch code: "+req_Branch);
       System.out.println("new id : "+new_id);

int idextend = id;
psmt = cn2.prepareStatement("INSERT INTO form16_tmsuser(form_no,idextend,empid,full_name,depart,designation,r_officer,empmail,emp_mob,requestBy,requestOption,req_Branch,empBranch,ftype,emptype) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

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
psmt.setString(11,requestOption);
psmt.setString(12,req_Branch);
psmt.setString(13,empBranch);
psmt.setString(14,deptType);
psmt.setString(15,emptype);
int i = psmt.executeUpdate();


psmt2 = cn2.prepareStatement("INSERT INTO form16_tmsuser_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
psmt2.setString(1,new_id);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,"Initiator");
psmt2.setString(5,remarks);
psmt2.setString(6,i_email_id);
psmt2.setString(7,emp_no);
psmt2.setString(8,"0");
int j = psmt2.executeUpdate();




Statement  stlevel1= cn2.createStatement(); 
ResultSet rslevel1=null;
rslevel1 = stlevel1.executeQuery("Select empid from formapproval WHERE branch='"+req_Branch+"' and formtype='TMSUser' and levelno='2'");
int flag=0;
String secempid="";
while(rslevel1.next())
	{ 
	secempid=rslevel1.getString(1);
	if(empid1.equals(secempid) && deptType.equals("IT"))
	    {
		 flag=1;	 
	    }
	}



psmt3 = cn2.prepareStatement("INSERT INTO form16_tmsuser_item (form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
psmt3.setString(1,new_id);
psmt3.setString(2,desg);
psmt3.setString(3,emp);
psmt3.setString(4,"Pending");
psmt3.setString(5,"Pending");
psmt3.setString(6,mail);
psmt3.setString(7,empid1);
if(flag==1)
    {
	psmt3.setString(8,"2");	 
    }
else
    {
	psmt3.setString(8,"1");
    }

int j1 = psmt3.executeUpdate();


//System.out.println("result..date...........2");

message = mailMessage.getMailMessageTMSUser(new_id.trim());
postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT TMSUSER FORM :  " +new_id+ " ",i_name+  " "+  "request you to approve - TMS User : FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              


message = null;




String msg = "TMSUSER__FORM__NO__:__'"+new_id+"'__SAVED__AND__SENT__SUCCESSFULLY";
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