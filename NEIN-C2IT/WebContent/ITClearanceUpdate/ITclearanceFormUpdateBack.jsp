<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageITclearance"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id ="successpoSender" class="CON2.ItNonitMailSender" /> 
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
MailMessageITclearance mailMessage = new MailMessageITclearance();
Connection cn2=null; 
Statement st2=null;
ResultSet rs = null;
String message = null;
String form_no =null;
%>
<%
cn2 = con.getConnection2();

PreparedStatement psmt11=null,psmt4=null,psmt19=null,psmt=null;
%>
<%
String Iremarks1="",Iremarks2="",Iremarks3="",Iremarks4="",Iremarks5="",Iremarks6="",Iremarks7="",Iremarks8="",Iremarks9="",Iremarks10="",Iremarks11="",Iremarks12="",Iremarks13="",Iremarks14="",Iremarks15="",Iremarks16="",Iremarks17="",Iremarks18="",Iremarks19="",Iremarks20="";
String Mremarks1="",Mremarks2="",Mremarks3="",Mremarks4="",Mremarks5="",Mremarks6="",Mremarks7="",Mremarks8="",Mremarks9="",Mremarks10="",Mremarks11="",Mremarks12="",Mremarks13="",Mremarks14="",Mremarks15="",Mremarks16="",Mremarks17="",Mremarks18="",Mremarks19="",Mremarks20="";
String acValue="",acRemarks="",rairLin="",itrairLin="";

String rsophos=null,itrsophos=null;
String rforti=null,itrforti=null;

String form_no     = request.getParameter("formNo");

acValue  = request.getParameter("acValue");
acRemarks  = request.getParameter("acRemarks");

Iremarks1   = request.getParameter("Iremarks1");
Iremarks2   = request.getParameter("Iremarks2");
Iremarks3   = request.getParameter("Iremarks3");
Iremarks4   = request.getParameter("Iremarks4");
Iremarks5   = request.getParameter("Iremarks5");
Iremarks6   = request.getParameter("Iremarks6");
Iremarks7   = request.getParameter("Iremarks7");
Iremarks8   = request.getParameter("Iremarks8");
Iremarks9   = request.getParameter("Iremarks9");
Iremarks10  = request.getParameter("Iremarks10");
Iremarks11  = request.getParameter("Iremarks11");
Iremarks12  = request.getParameter("Iremarks12");
Iremarks13  = request.getParameter("Iremarks13");
Iremarks14  = request.getParameter("Iremarks14");
Iremarks15  = request.getParameter("Iremarks15");
Iremarks16  = request.getParameter("Iremarks16");
Iremarks17  = request.getParameter("Iremarks17");
Iremarks18  = request.getParameter("Iremarks18");
Iremarks19  = request.getParameter("Iremarks19");
Iremarks20  = request.getParameter("Iremarks20");
Mremarks1   = request.getParameter("Mremarks1");
Mremarks2   = request.getParameter("Mremarks2");
Mremarks3   = request.getParameter("Mremarks3");
Mremarks4   = request.getParameter("Mremarks4");
Mremarks5   = request.getParameter("Mremarks5");
Mremarks6   = request.getParameter("Mremarks6");
Mremarks7   = request.getParameter("Mremarks7");
Mremarks8   = request.getParameter("Mremarks8");
Mremarks9   = request.getParameter("Mremarks9");
Mremarks10  = request.getParameter("Mremarks10");
Mremarks11  = request.getParameter("Mremarks11");
Mremarks12  = request.getParameter("Mremarks12");
Mremarks13  = request.getParameter("Mremarks13");
Mremarks14  = request.getParameter("Mremarks14");
Mremarks15  = request.getParameter("Mremarks15");
Mremarks16  = request.getParameter("Mremarks16");
Mremarks17  = request.getParameter("Mremarks17");
Mremarks18  = request.getParameter("Mremarks18");
Mremarks19  = request.getParameter("Mremarks19");
Mremarks20  = request.getParameter("Mremarks20");

rairLin  = request.getParameter("rairLin");
itrairLin  = request.getParameter("itrairLin");
rsophos  = request.getParameter("rsophos");
itrsophos  = request.getParameter("itrsophos");
rforti  = request.getParameter("rforti");
itrforti  = request.getParameter("itrforti");
 
Date result1=null,result2=null,form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
try
{
String allMails=null,initiatorNameIfNotApproved=null;
psmt4 = cn2.prepareStatement("SELECT id FROM form1_it_clearance_item WHERE form1_no=? ");
psmt4.setString(1,form_no);
ResultSet rs = psmt4.executeQuery();
while(rs.next())
{
String idRemarks="",idDate="",id="",remID="",dtID="",appStatusS="";
id = rs.getString(1); 
appStatusS=request.getParameter("appStatusS"+id);
idRemarks= request.getParameter("aRemarks"+id);
idDate= request.getParameter("approverDate"+id);
	

String[] dateString = idDate.split("-");

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
try{
form_date = new Date(sdf.parse(dateF).getTime());
}
catch (Exception e){
e.printStackTrace();
}

psmt19 = cn2.prepareStatement("UPDATE form1_it_clearance_item  SET status=?,remarks=?,f_date=? WHERE id=? "); 
psmt19.setString(1,appStatusS);
psmt19.setString(2,idRemarks);
psmt19.setDate(3,form_date);
psmt19.setString(4,id);
int i = psmt19.executeUpdate();
}

psmt11 = cn2.prepareStatement("UPDATE form1_it_clearance SET r_model=?,r_data_card=?,r_email=?,r_newins=?,r_domain=?,r_mobile_model=?,r_mobile_no=?,r_access_card=?,r_drive=?,r_nexas=?,r_other_asset=?, it1a=?,it2b=?,it3c=?,it4d=?,it5e=?,it6f=?,it7g=?,it8h=?,it9i=?,it10jnexas=?,it10j=?,a_document_ac=?,r_document_ac=?,rairLin=?,itrairLin=?,r_compmobile_no=?,r_shared_card=?,r_internet=?,r_gsnet=?,r_internal=?,r_dsc=?,rvpn=?,r_nexglow=?,r_model_info=?,it11k=?,it12l=?,it13m=?,it14n=?,it15o=?,it16p=?,it17q=?,it19s=?,it18r=?,r_sophos=?,r_forti=?,itrsophos=?,itrforti=? WHERE form1_no=?");
psmt11.setString(1,Iremarks1.trim());
psmt11.setString(2,Iremarks2.trim());
psmt11.setString(3,Iremarks3.trim());
psmt11.setString(4,Iremarks4.trim());
psmt11.setString(5,Iremarks5.trim());
psmt11.setString(6,Iremarks6.trim());
psmt11.setString(7,Iremarks7.trim());
psmt11.setString(8,Iremarks8.trim());
psmt11.setString(9,Iremarks9.trim());
psmt11.setString(10,Iremarks10.trim());
psmt11.setString(11,Iremarks11.trim());
psmt11.setString(12,Mremarks1.trim());
psmt11.setString(13,Mremarks2.trim());
psmt11.setString(14,Mremarks3.trim());
psmt11.setString(15,Mremarks4.trim());
psmt11.setString(16,Mremarks5.trim());
psmt11.setString(17,Mremarks6.trim());
psmt11.setString(18,Mremarks7.trim());
psmt11.setString(19,Mremarks8.trim());
psmt11.setString(20,Mremarks9.trim());
psmt11.setString(21,Mremarks10.trim());
psmt11.setString(22,Mremarks11.trim());
psmt11.setString(23,acValue);
psmt11.setString(24,acRemarks);
psmt11.setString(25,rairLin);
psmt11.setString(26,itrairLin);
psmt11.setString(27,Iremarks12.trim());
psmt11.setString(28,Iremarks13.trim());
psmt11.setString(29,Iremarks14.trim());
psmt11.setString(30,Iremarks15.trim());
psmt11.setString(31,Iremarks16.trim());
psmt11.setString(32,Iremarks17.trim());
psmt11.setString(33,Iremarks18.trim());
psmt11.setString(34,Iremarks19.trim());
psmt11.setString(35,Iremarks20.trim());
psmt11.setString(36,Mremarks12.trim());
psmt11.setString(37,Mremarks13.trim());
psmt11.setString(38,Mremarks14.trim());
psmt11.setString(39,Mremarks15.trim());
psmt11.setString(40,Mremarks16.trim());
psmt11.setString(41,Mremarks17.trim());
psmt11.setString(42,Mremarks18.trim());
psmt11.setString(43,Mremarks19.trim());
psmt11.setString(44,Mremarks20.trim());
psmt11.setString(45,rsophos.trim());
psmt11.setString(46,rforti.trim());
psmt11.setString(47,itrsophos.trim());
psmt11.setString(48,itrforti.trim());
psmt11.setString(49,form_no);
int r = psmt11.executeUpdate();

String[] appDesig=request.getParameterValues("approverDesg");
String[] appName=request.getParameterValues("approverName");
String[] appStatus=request.getParameterValues("appStatus");
String[] apRemarks=request.getParameterValues("appRemarks");
String[] appDate=request.getParameterValues("appDate");

int n=appDesig.length;		
psmt = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence,empMail,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
for(int i=1;i<n;i++)
{			
psmt.setString(1,form_no);
psmt.setString(2,appDesig[i]);
psmt.setString(3,appName[i]);
psmt.setString(4,appStatus[i]);
psmt.setString(5,apRemarks[i]);
	 
String[] dateString = appDate[i].split("-");
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
try{
form_date = new Date(sdf.parse(dateF).getTime());
}
catch (Exception e) {
e.printStackTrace();
}

psmt.setDate(6,form_date);
psmt.setString(7,"NA");
psmt.setString(8,"NA");
psmt.setString(9,"NA");
psmt.setString(10,"NA");
psmt.setString(11,"NA");
int r1 = psmt.executeUpdate();
}

String msg = "IT__CLEARANCE__UPDATED__AND__SAVED__SUCCESSFULLY";
response.sendRedirect("ItClearanceUpdateForm.jsp?msg=" +msg); 
}
catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
DbUtil.closeDBResources(null,st2,cn2);
}
%>
</html>