
<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageIncidentLog"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 

    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<script type="text/javascript">

 function link() {
    document.form.action="jasperGenerate";
    document.form.method="post";
    document.form.submit();
    }		 
	
function btnClick() { 
         close(); 
}
</script>
<%! 
				  MailMessageIncidentLog mailMessage = new MailMessageIncidentLog();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st11=null,st2=null;
	              ResultSet rs = null;
	              
	              String msg = null;
	              String output =null;
	              Connection2 dbConn = new Connection2();
	              StringBuffer strBuff = null;
	              
	              String message = null;
	            //  complain_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks
	              String []complain_id=null;
	              String []cm_name=null;
	              String []cm_location=null;
	              String []cm_type=null;
	              String []cm_prob=null;
	              String []cm_reported=null;
	              String []cm_completed=null;
	              String []cm_time_diff=null;
	              String []cm_status=null;
	              String []admin_remarks=null;
	              
	              %>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">
<form name=form>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>IMS DETAILS</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET MESSAGE PAGE</font></strong></td></tr>
</table>


<center><font size=4 ><b>

<br>
<br />
<br />

<%
try{
conn = dbConn.getConnection2();
st = conn.createStatement();
st11 = conn.createStatement();
cn2 = con.getConnection2();
st2 = cn2.createStatement();
////Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend
//complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks



String f_date = request.getParameter("f_date");//new feild added
String from_date = request.getParameter("from_date");
String to_date = request.getParameter("to_date");
String sessionName = request.getParameter("SessionName");
String sessionDesg = request.getParameter("SessionDesg");
String location = request.getParameter("location");
//String sessionBranch = request.getParameter("SessionCity");
String sessionBranchNo = request.getParameter("SessionCityNo");
String sessionEmail = request.getParameter("SessionEmail");
String createdDate = request.getParameter("Created_date");
String mailCheck = request.getParameter("mailingCheck");//lljhkhjkjhk--MANAGER - HR & ADMIN--farooq.s@nittsu.co.in

Date f_datee=null;
SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");

try{
	f_datee = new Date(sdf2.parse(f_date).getTime());
   }
catch (Exception e) {
	e.printStackTrace();
}
System.out.println("from date :"+from_date);
System.out.println("to_date"+to_date);
System.out.println("sessionName"+sessionName);
System.out.println("sessionDesg"+sessionDesg);
System.out.println("Location :"+location);
System.out.println("sessionBranchNo"+sessionBranchNo);
System.out.println("createdDate"+createdDate);
System.out.println("mailCheck"+mailCheck);
String mailingCheck[] = request.getParameterValues("mailingCheck");
String part1=null;
String part2=null;
String part3=null;
for(int k=0;k<mailingCheck.length;k++)
{
System.out.println("mailingCheck"+mailingCheck[k]);
String[] parts = mailingCheck[k].split("--");
 part1 = parts[0]; // 004
 part2 = parts[1]; // 004
 part3 = parts[2]; // 004
//String part2 = parts[1]; // 034556
System.out.println("part1 : "+part1);//VANI
System.out.println("part2 : "+part2);//HR MANAGER
System.out.println("part3 : "+part3);//farooq.s@nittsu.co.in
}

%>
<%


Date result=null;// = formater.parse(po_date);


SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;

try{
	result = new Date(sdf.parse(createdDate).getTime());
	
	
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
System.out.println("AFTER converting created Date is"+result);

%>
<%
String[] dateString = from_date.split("-");

System.out.println(dateString[1]);

if (dateString[1].equals("Jan"))
{
	  dateString[1]="01";
}
if (dateString[1].equals("Feb"))
{
	  dateString[1]="02";
}
if (dateString[1].equals("Mar"))
{
	  dateString[1]="03";
}
if (dateString[1].equals("Apr"))
{
	  dateString[1]="04";
}
if (dateString[1].equals("May"))
{
	  dateString[1]="05";
}
if (dateString[1].equals("Jun"))
{
	  dateString[1]="06";
}
if (dateString[1].equals("Jul"))
{
	  dateString[1]="07";
}
if (dateString[1].equals("Aug"))
{
	  dateString[1]="08";
}
if (dateString[1].equals("Sep"))
{
	  dateString[1]="09";
}
if (dateString[1].equals("Oct"))
{
	  dateString[1]="10";
}
if (dateString[1].equals("Nov"))
{
	  dateString[1]="11";
}
if (dateString[1].equals("Dec"))
{
	  dateString[1]="12";
}

String dateF = dateString[0]+"-"+dateString[1]+"-"+dateString[2];
String[] dateString2 = to_date.split("-");

System.out.println(dateString2[1]);

if (dateString2[1].equals("Jan"))
{
	  dateString2[1]="01";
}
if (dateString2[1].equals("Feb"))
{
	  dateString2[1]="02";
}
if (dateString2[1].equals("Mar"))
{
	  dateString2[1]="03";
}
if (dateString2[1].equals("Apr"))
{
	  dateString2[1]="04";
}
if (dateString2[1].equals("May"))
{
	  dateString2[1]="05";
}
if (dateString2[1].equals("Jun"))
{
	  dateString2[1]="06";
}
if (dateString2[1].equals("Jul"))
{
	  dateString2[1]="07";
}
if (dateString2[1].equals("Aug"))
{
	  dateString2[1]="08";
}
if (dateString2[1].equals("Sep"))
{
	  dateString2[1]="09";
}
if (dateString2[1].equals("Oct"))
{
	  dateString2[1]="10";
}
if (dateString2[1].equals("Nov"))
{
	  dateString2[1]="11";
}
if (dateString2[1].equals("Dec"))
{
	  dateString2[1]="12";
}

String dateFF = dateString2[0]+"-"+dateString2[1]+"-"+dateString2[2];

System.out.println("FROM Date "+dateF);
System.out.println("TO Date "+dateFF);

%>
<%
String new_id = null;
int id=0;
String id22=null;
ResultSet rs=null;
rs = st2.executeQuery("SELECT max(idextend) FROM form9_incident_log WHERE form9_no IN(SELECT form9_no FROM form9_incident_log LEFT JOIN branch_master b ON(substr(form9_no,12,2)=b.b_no) WHERE b.b_no='"+sessionBranchNo+"' GROUP BY form9_no)");
if(rs.next()){
	
	try
	{
		id=rs.getInt(1);
		if(id==0)
 			id=1;
		     if(id22==null)
 			 id22="NEIN/CS/IL/"+sessionBranchNo+"-";
             id++;   
             new_id = id22+String.valueOf(id);
             System.out.println("NEW ID : "+new_id);
	}
	catch(SQLException ex)
	    {
		  System.out.println("WXCEPTION : "+ex.toString());
		 new_id = "NEIN/CS/IL/"+sessionBranchNo+"-1";
	    }

}


// REPLACING S_NO TO NEW_ID

int idextend = id;
System.out.println("FORM9 Number :"+new_id);
System.out.println("FORM9 Number next number :"+idextend);
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmtArray=null;




psmt = cn2.prepareStatement("INSERT INTO form9_incident_log(form9_no,SessionName,SessionDesg,SessionCity,SessionCityNo,Created_date,mailingCheck,from_date,"
		                                                    +"to_date,Approval_f_date,Approval_emp,Approval_desg,Approval_mailId,reminder,idextend,SessionEmail,status,f_date"
		                                                    +") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");//6
psmt.setString(1,new_id);
psmt.setString(2,sessionName);
psmt.setString(3,sessionDesg);
psmt.setString(4,location);
psmt.setString(5,sessionBranchNo);
psmt.setDate(6,result);
psmt.setString(7,mailCheck);
psmt.setString(8,dateF);
psmt.setString(9,dateFF);
psmt.setDate(10,result);
psmt.setString(11,part1);
psmt.setString(12,part2);
psmt.setString(13,part3);
psmt.setString(14,"NULL");
psmt.setInt(15,idextend);
psmt.setString(16,sessionEmail);
psmt.setString(17,"Pending");
psmt.setDate(18,f_datee);

System.out.println("BEFORE EXECUTE UPDATE OF I ");
int j = psmt.executeUpdate();
System.out.println("AFTER EXECUTE UPDATE OF I ");
if(j>0){

		if(new_id != null && sessionName != null){
		
						/* String I_date = request.getParameter("I_date");
						String I_time = request.getParameter("I_time");
						String I_viewedBy = request.getParameter("I_viewedBy");
						String I_Remarks = request.getParameter("I_Remarks"); */
					    //String []item;
			
					  	String I_date[] = request.getParameterValues("I_date");
						String I_time[] = request.getParameterValues("I_time");
						String I_viewedBy[] = request.getParameterValues("I_viewedBy");
						String I_Remarks[] = request.getParameterValues("I_Remarks");
						String I_IncidentR[] = request.getParameterValues("IncidentR");
						String I_viewedByIT[] = request.getParameterValues("I_viewedByIT");
						//Incident_Reported
				     
					    try{ System.out.println("inside for try");
							conn = dbConn.getConnection2();
							st1 = conn.createStatement();
							
							for(int k=1;k<I_date.length;k++)
							{
								System.out.println("inside for loop");
								
							    psmtArray = conn.prepareStatement("insert into form9_incident_item(form9_no,I_date,I_time,I_viewedBy,I_Remarks,Created_Date,Incident_Reported,viewedByIT) VALUES(?,?,?,?,?,?,?,?)");
								psmtArray.setString(1,new_id);
								psmtArray.setString(2,I_date[k]);
								psmtArray.setString(3,I_time[k]);
								psmtArray.setString(4,I_viewedBy[k]);
								psmtArray.setString(5,I_Remarks[k]);
								psmtArray.setDate(6,result);
								psmtArray.setString(7,I_IncidentR[k]);
								psmtArray.setString(8,I_viewedByIT[k]);
								int kk = psmtArray.executeUpdate();
								System.out.println("outside for loop");
							 }
						}
						catch(Exception e){
							
							
							     e.printStackTrace();
						}
						   System.out.println("After try catch ");
				     } 



	psmt2 = cn2.prepareStatement("INSERT INTO form9_incident_log_item(form9_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
	psmt2.setString(1,new_id);
	psmt2.setString(2,sessionDesg);
	psmt2.setString(3,sessionName);
	psmt2.setString(4,"Initiator");
	psmt2.setString(5,"Initiated");
	psmt2.setDate(6,result);
	psmt2.setString(7,sessionEmail);
	psmt2.setString(8,"over");//presence
	int k = psmt2.executeUpdate();
	System.out.println("AFTER EXECUTE UPDATE OF j ");

	psmt3 = cn2.prepareStatement("INSERT INTO form9_incident_log_item(form9_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
	psmt3.setString(1,new_id);
	psmt3.setString(2,part2);
	psmt3.setString(3,part1);
	psmt3.setString(4,"Pending");
	psmt3.setString(5,"Pending");
	psmt3.setDate(6,result);
	psmt3.setString(7,part3);
	psmt3.setString(8,"now");//presence

	int l = psmt3.executeUpdate();
	System.out.println("AFTER EXECUTE UPDATE OF k ");	
	
	
}

message = mailMessage.getMailMessageIncidentLog(new_id.trim());
postMail.postMail(sessionEmail,sessionName,"pass1234",part3,"NEIN-C2IT INCIDENT LOG FORM :  " +new_id+ " ",sessionName+  " "+  "request you to approve - INCIDENT LOG FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              

System.out.println("AFTER post mail ");
message = null;




msg = "Incident__log__SAVED__AND__SENT__SUCCESSFULLY..";
//System.out.println("result..date..........."+result1);
response.sendRedirect("IncidentLog.jsp?msg=" +msg);

%>

<%


		    //System.out.println("we are getting this msggetting ? " +message);

		    // not working  response.sendRedirect("ims_HO_Back.jsp?msg=" +msg);
		    
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(null,st1,cn2);
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st11,null);
  }
%>
  






</b>
</font>
</center>


<br />
<br />
<br />

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="ims_Branch.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<center>
<%-- <table>
<tr>

<td><input type="button" value="pdf" onclick="link();"/></td>

<td><input type="button" value="OK" onclick="btnClick();"/></td>
</tr>

</table> --%>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"><marquee> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </marquee> </font></strong></td>
    
  </tr>
</table>
</center>
</form>

</div>




</body>
</html>
