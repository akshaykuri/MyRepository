<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageIncidentLog"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page import="java.io.File" %>
<%@page import = "java.util.Arrays" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<%! 
MailMessageIncidentLog mailMessage = new MailMessageIncidentLog();
Connection conn = null; 
Statement st2=null,st4=null;
ResultSet rs=null,rs4=null; 
String msg = null;
String output =null;
Connection2 dbConn = new Connection2();
String message = null;
PreparedStatement psmt=null,psmt2=null,psmt3=null,psmtArray=null;
%>
<%
try{
String new_id="";
String count="",f_date="",from_date="",to_date="",sessionName="",sessionDesg="",SessionCity="",location="",SessionCityNo="",sessionEmail="",createdDate="",I_location="",I_Location="",I_date="",I_time="",I_viewedBy="",I_Remarks="",I_IncidentR="",I_viewedByIT="",I_b_no="",pCount="",part1="",part2="",part3="",sessionBranchNo="",mailCheck="",branch2="";
String itemName =null;
FileItem item = null;
ArrayList<String> filenameList;

conn 	= dbConn.getConnection2();
st2 	= conn.createStatement();
st4		= conn.createStatement();

String formNo_forMail="";

String branch="",branch1="",assignedLocation="",fileName="";

int idextend=0;
int id=0;
String id22=null;
ResultSet rs=null;

//Define the directory where you want to create folders
String baseDir = "E:/neinSoft/C2IT/IncidentLog/";

//Check if it's a multipart request (file upload)
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if(isMultipart){
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
 
    try{
        // Parse the request
        List<FileItem> items = upload.parseRequest(request);
        Iterator<FileItem> iter = items.iterator();
		
		while (iter.hasNext()){
            item = iter.next();
		
			 if (item.isFormField()){
	                 
	            	String name = item.getFieldName();
	                String value = item.getString();

	                if(name.equals("pCount")){
	                	count=value;
	                }if(name.equals("f_date")){
	                	f_date = value;
					}if(name.equals("from_date")){
						from_date = value;
					}if(name.equals("to_date")){
						to_date = value;
					}if(name.equals("SessionName")){
						sessionName = value;
					}if(name.equals("SessionDesg")){
						sessionDesg = value;
					}if(name.equals("location")){
						location = value;
                   	}if(name.equals("SessionCityNo")){
                   		sessionBranchNo = value;
                   	}if(name.equals("SessionEmail")){
                   		sessionEmail=value;
                   	}if(name.equals("Created_date")){
                   		createdDate=value;
                  	}if(name.equals("SessionCity")){
                  		SessionCity=value;
                  	}if(name.equals("I_date")){
                  		I_date=value;
                  	}if(name.equals("I_time")){
                  		I_time=value;						
                  	}if(name.equals("I_viewedBy")){
                  		I_viewedBy=value;
                  	}if(name.equals("I_Remarks")){
                  		I_Remarks=value;
                  	}if(name.equals("IncidentR")){
                  		I_IncidentR=value;
                  	}if(name.equals("I_viewedByIT")){
                  		I_viewedByIT=value;
                  	}if(name.equals("I_b_no")){
                  		I_b_no=value;
                  	}if(name.equals("pCount")){
                  		pCount=value;
                  	}if(name.equals("emp")){
                  		part1=value;
                  	}if(name.equals("desg")){
                  		part2=value;
                  	}if(name.equals("mail1")){
                  		part3=value;
                  	}
				}else{
	                // It's a file, so process it
	                fileName = item.getName();
	                rs4 = st4.executeQuery("select distinct b_no from branch_master where b_name in ('"+location+"')");
	                while (rs4.next()){
	                	sessionBranchNo = rs4.getString("b_no");
	                	branch = rs4.getString("b_no");
           	
           	if(!branch1.contains(branch)){
           		branch2 += branch+",";
	                rs = st2.executeQuery("SELECT ifnull(max(idextend),'0') FROM form9_incident_log WHERE form9_no IN(SELECT form9_no FROM form9_incident_log LEFT JOIN branch_master b ON(substr(form9_no,12,2)=b.b_no) WHERE b.b_no='"+sessionBranchNo+"' GROUP BY form9_no)");
	                if(rs.next()){
	                	try{
	                		id=rs.getInt(1);
                			id22="NEIN/CS/IL/"+sessionBranchNo+"-";
	                        id++;   
	                        new_id = id22+String.valueOf(id);
	                	}catch(SQLException ex){
							System.out.println("WXCEPTION : "+ex.toString());
	                		new_id = "NEIN/CS/IL/"+sessionBranchNo+"-1";
	                	}
	                }
	                idextend = id;
	                System.out.println("FORM9 Number :"+new_id);
           	}
	                
            if (fileName != null && !fileName.isEmpty()) {
                // Create a dynamic folder based on new_id
                String dynamicPath = baseDir + new_id;
                File dynamicDir = new File(dynamicPath);
                if(!dynamicDir.exists()){
                    dynamicDir.mkdirs();
                }
                // Construct the full file path
                String fullFilePath = dynamicPath + File.separator + fileName;
                // Save the file
                File uploadedFile = new File(fullFilePath);
                item.write(uploadedFile);    
                // Now, the file is uploaded to the dynamic folder
            }
		mailCheck = part1+"--"+part2+"--"+part3;

		Date result=null;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		int i = 0;
		
		try{
			result = new Date(sdf.parse(createdDate).getTime());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		String[] dateString = from_date.split("-");
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
		
		Date f_datee=null;
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
		
		try{
			f_datee = new Date(sdf2.parse(f_date).getTime());
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("line item table");
		psmtArray = conn.prepareStatement("insert into form9_incident_item(form9_no,I_date,I_Location,I_time,I_viewedBy,I_Remarks,Created_Date,Incident_Reported,viewedByIT,incidentlogFile) VALUES(?,?,?,?,?,?,?,?,?,?)");
		psmtArray.setString(1,new_id);
		psmtArray.setString(2,I_date);
		psmtArray.setString(3,location);
		psmtArray.setString(4,I_time);
		psmtArray.setString(5,I_viewedBy);
		psmtArray.setString(6,I_Remarks);
		psmtArray.setDate(7,result);
		psmtArray.setString(8,I_IncidentR);
		psmtArray.setString(9,I_viewedByIT);
		psmtArray.setString(10,fileName);
		int kk = psmtArray.executeUpdate();

	if(!branch1.contains(branch)){
		branch1 += I_b_no+",";
		System.out.println("Main table");
		psmt = conn.prepareStatement("INSERT INTO form9_incident_log(form9_no,SessionName,SessionDesg,SessionCity,SessionCityNo,Created_date,mailingCheck,from_date,to_date,Approval_f_date,Approval_emp,Approval_desg,Approval_mailId,reminder,idextend,SessionEmail,status,f_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		psmt.setString(1,new_id);
		psmt.setString(2,sessionName);
		psmt.setString(3,sessionDesg);
		psmt.setString(4,SessionCity);
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
		int j = psmt.executeUpdate();
			
		System.out.println("Approval table");
		psmt2 = conn.prepareStatement("INSERT INTO form9_incident_log_item(form9_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
		psmt2.setString(1,new_id);
		psmt2.setString(2,sessionDesg);
		psmt2.setString(3,sessionName);
		psmt2.setString(4,"Initiator");
		psmt2.setString(5,"Initiated");
		psmt2.setDate(6,result);
		psmt2.setString(7,sessionEmail);
		psmt2.setString(8,"over");
		int kkk = psmt2.executeUpdate();
		
		psmt3 = conn.prepareStatement("INSERT INTO form9_incident_log_item(form9_no,desg,emp,status,remarks,f_date,mail,presence) VALUES(?,?,?,?,?,?,?,?)");
		psmt3.setString(1,new_id);
		psmt3.setString(2,part2);
		psmt3.setString(3,part1);
		psmt3.setString(4,"Pending");
		psmt3.setString(5,"Pending");
		psmt3.setDate(6,result);
		psmt3.setString(7,part3);
		psmt3.setString(8,"now");
		int l = psmt3.executeUpdate();	
	}
}
		//out.println("<br>new_id===="+new_id+"<br><br>");
		if(!formNo_forMail.contains(new_id)){
		    formNo_forMail += new_id+",";
		}
}
}
}catch(Exception e){
	e.printStackTrace();
}
}

out.println("<br>formNo_forMail===="+formNo_forMail);

String[] forMail = formNo_forMail.split(",");

for(int zz=0;zz<forMail.length;zz++){
	message = mailMessage.getMailMessageIncidentLog(forMail[zz].trim());
	//postMail.postMailIncidentLogReportAttachedFile(sessionEmail,sessionName, "neinsoft.support@nipponexpress.com", "neinsoft.support@nipponexpress.com","NEIN-C2IT INCIDENT LOG FORM : " +forMail[zz]+ " ",sessionName+  " "+  "request you to approve - INCIDENT LOG FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message, forMail[zz]);
	
    postMail.postMailIncidentLogReportAttachedFile(sessionEmail,sessionName,part3,"chintu.kumar@nipponexpress.com","NEIN-C2IT INCIDENT LOG FORM :  " +forMail[zz]+ " ",sessionName+  " "+  "request you to approve - INCIDENT LOG FORM. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message,forMail[zz]); 
}

message = null;
msg = "Incident__log__SAVED__AND__SENT__SUCCESSFULLY..";
response.sendRedirect("IncidentLog.jsp?msg=" +msg);

}catch (Exception e){System.out.println(e);}
finally{
	DbUtil.closeDBResources(rs,st2,conn);
	DbUtil.closeDBResources(rs4,st4,null);
	DbUtil.closeDBResources(null,psmtArray,null);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
}
%>