<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageGSNET"%>
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
                   MailMessageGSNET mailMessage = new MailMessageGSNET();
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

//empid,full_name,depart,designation,reporting_officer,empmailid,emp_mob,requestBy,requestOption,req_Branch,remarks,desg,emp,mail
String f_date = request.getParameter("f_date");
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
String requestOption = request.getParameter("requestOption");

String currNExASID = request.getParameter("currentNExASID");

String req_Branch = request.getParameter("req_Branch");
String empBranch = request.getParameter("branch");

String[] gsnetBrCode = request.getParameterValues("gsnetBrCode[]");
String gsbrcod="";
for(int p=0;p<gsnetBrCode.length;p++)
    {
	if(p==0)
		gsbrcod=gsnetBrCode[p];
	else
		gsbrcod=gsbrcod+","+gsnetBrCode[p];
    }
System.out.println("gsnet branch code :"+gsbrcod);
String[] gsnetDiv = request.getParameterValues("gsnetDiv[]");
String gsdiv="";
for(int p=0;p<gsnetDiv.length;p++)
    {
	if(p==0)
		gsdiv=gsnetDiv[p];
	else
		gsdiv=gsdiv+","+gsnetDiv[p];
    }

System.out.println("gsnet  div :"+gsdiv);
String[] gsnetPdiv = request.getParameterValues("gsnetPdiv[]");
String gspdiv="";
for(int p=0;p<gsnetPdiv.length;p++)
    {
	if(p==0)
		gspdiv=gsnetPdiv[p];
	else
		gspdiv=gspdiv+","+gsnetPdiv[p];
    }
System.out.println("gsnet primary div :"+gspdiv);

String[] role = request.getParameterValues("role[]");
String rl="";
for(int p=0;p<role.length;p++)
    {
	if(p==0)
		rl=role[p];
	else
		rl=rl+","+role[p];
    }
System.out.println("gsnet user role:"+rl);

String remarks = request.getParameter("remarks");

//userid,username,compCode,costCCode,costCName,email,position,TVApp,empType,HRMenu,date1


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

try
  {
  psmt1001 = cn2.prepareStatement("SELECT max(idextend) FROM form15_gsnet WHERE form_no IN(SELECT form_no FROM form15_gsnet LEFT JOIN branch_master b ON(substr(form_no,12,2)=b.b_no) WHERE b.b_no=? GROUP BY form_no)");
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
 		    id2="NEIN/GSNET/"+req_Branch+"-";
         new_id = id2+String.valueOf(id);
	     }
	     catch(SQLException ex)
	        {
		    System.out.println("WXCEPTION : "+ex.toString());
	        }
       }
       System.out.println("Requ branch code: "+req_Branch);
       System.out.println("new id : "+new_id);

int idextend = id;
psmt = cn2.prepareStatement("INSERT INTO form15_gsnet(form_no,idextend,empid,full_name,depart,designation,r_officer,empmail,emp_mob,requestBy,requestOption,req_Branch,empBranch,curr_GSNETID,req_gsnet_brcode,req_gsnetDiv,req_gsnetPdiv,req_gsnetRole) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

//empid,full_name,depart,designation,r_officer,empmail,emp_mob,requestBy,requestOption,req_Branch,   req_gsnet_brcode,req_gsnetDiv,req_gsnetPdiv,	req_gsnetRole
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
psmt.setString(14,currNExASID);

psmt.setString(15,gsbrcod);
psmt.setString(16,gsdiv);
psmt.setString(17,gspdiv);
psmt.setString(18,rl);
int i = psmt.executeUpdate();


/* psmt4 = cn2.prepareStatement("INSERT INTO form12_nexas_otherVal(form_no,compCode,costCCode,costCName,userKind,opval,operationRangeOptional) VALUES(?,?,?,?,?,?,?)");

//userid,username,compCode,costCCode,costCName,email,position,TVApp,empType,HRMenu,date1
//userKind,opval,operationUnit,operationRangeOptional,dispUnit,dispRange
psmt4.setString(1,new_id);

psmt4.setString(2,compCode);
/* psmt4.setString(3,costCCode);
psmt4.setString(4,costCName);

psmt4.setString(5,userKind);
psmt4.setString(6,opval);
psmt4.setString(7,opRange); */
//int k = psmt4.executeUpdate(); */



//System.out.println("result..date...........1");

psmt2 = cn2.prepareStatement("INSERT INTO form15_gsnet_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
psmt2.setString(1,new_id);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,"Initiator");
psmt2.setString(5,remarks);
psmt2.setString(6,i_email_id);
psmt2.setString(7,emp_no);
psmt2.setString(8,"0");
int j = psmt2.executeUpdate();
psmt3 = cn2.prepareStatement("INSERT INTO form15_gsnet_item(form_no,desg,emp,status,remarks,mail,empid,levelno) VALUES(?,?,?,?,?,?,?,?)");
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

message = mailMessage.getMailMessageGSNET(new_id.trim());
postMail.postMail(i_email_id,i_name,"pass1234",mail,"NEIN-C2IT GSNET FORM :  " +new_id+ " ",i_name+  " "+  "request you to approve - GSNET User : FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              


message = null;




String msg = "GSNET__FORM__SAVED__AND__SENT__SUCCESSFULLY";
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