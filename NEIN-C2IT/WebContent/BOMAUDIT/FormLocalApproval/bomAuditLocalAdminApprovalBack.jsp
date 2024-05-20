<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import = "java.sql.*" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import="CON2.DbUtil.*"%>
<%@page import="sun.org.mozilla.javascript.internal.regexp.SubString"%>
<%@page import="CON2.MailMessageRegistration" %>
<jsp:useBean id = "postMail" class="CON2.PostMail" />
<%@page import="CON2.Connection2" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<jsp:useBean id="con" class="CON2.Connection2" />
<jsp:useBean id="con1" class="CON2.ConnectionLMS" />

<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg2=null;
	msg2="Session__Time__Out__ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}else{
%>

<% 
Connection conCSDB = con.getConnection2();
PreparedStatement psmt1=null,psmt2=null,psmt3=null,psmt4=null,psmt5=null;

//for branch-IT level
psmt1 = conCSDB.prepareStatement("insert into c2itreviewfrom_verify (requestNo,applicationName,verificationStatus,verifierRemarks,branchNo,branchName) values (?,?,?,?,?,?)");
psmt2 = conCSDB.prepareStatement("insert into c2itreviewfromitem (reqNo,empId,empName,empDesg,empBranchNo,empMailId,levelNo,status,presence,appDate,remarks,clarifyCol) select ?,?,?,?,?,?,?,?,?,current_timestamp(),?,? where not exists (select reqNo from c2itreviewfrommainitems where ifnull(verificationStatus,'0')=0)");
psmt3 = conCSDB.prepareStatement("update c2itreviewfromitem set status=?,presence=?,appDate=current_timestamp(),remarks=? where reqNo=? and empBranchNo=? and status=? and presence=?");
psmt4 = conCSDB.prepareStatement("update c2itreviewfromitem set remarks=? where reqNo=? and empBranchNo=? and empId<>?");
psmt5 = conCSDB.prepareStatement("update c2itreviewfrommainitems set verificationStatus=?,verifiedBy=?,verifiedOn=current_timestamp(),verifierRemarks=? where reqNo=? and branchNo=?");

String sesEmpID		= (String) session.getAttribute("EmpNo");
String sesName		= (String) session.getAttribute("Nname");
String sesDesg		= (String) session.getAttribute("desg");
String sesCity		= (String) session.getAttribute("city");
String sesBno		= (String) session.getAttribute("b_no");
String sesMailid	= (String) session.getAttribute("Nmail");

int sno=0;
String name="",value="",lvlNo="",reqNo="",status="",itemName="",empid1="",emp="",desg="",mail1="",levelno="",app_name="",verStatus="",verRemarks="",branchCode="",finalRemarks="",brCode="",brName="";
%>

<%
try{
	List<String> appNameArr		=	new ArrayList<String>();
	List<String> verStatusArr	=	new ArrayList<String>();
	List<String> verRemarksArr	=	new ArrayList<String>();
	ArrayList<String> filenameList = new ArrayList<String>();
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);    

	if(!isMultipart){
		
	}else{
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try{
			items = upload.parseRequest(request);
		}catch(FileUploadException e){
			e.printStackTrace();
		}

		Iterator itr = items.iterator();

		while(itr.hasNext()){

			FileItem item = (FileItem) itr.next();

			if(item.isFormField()){
				name = item.getFieldName();
				value = item.getString();

				if(name.equals("lvlNo")){
					lvlNo = value;
				}
				if(name.equals("reqNo")){
					reqNo = value;
				}
				if(name.equals("sno")){
					sno = Integer.parseInt(value);
				}
				if(name.equals("status")){
					status = value;
				}
				if(name.equals("empid1")){
					empid1 = value;
				}
				if(name.equals("emp")){
					emp = value;
				}
				if(name.equals("desg")){
					desg = value;
				}
				if(name.equals("mail1")){
					mail1 = value;
				}
				if(name.equals("levelno")){
					levelno = value;
				}
				if(name.equals("branchCode")){
					branchCode = value;
				}
				if(name.equals("finalRemarks")){
					finalRemarks = value;
				}
				if(name.equals("brCode")){
					brCode = value;
				}
				if(name.equals("brName")){
					brName = value;
				}
				for(int i=1; i<=sno; i++){
					String appNameField = "app_name" + i;
				    String verStatusField = "verStatus" + i;
				    String verRemarksField = "verRemarks" + i;
					if(name.equalsIgnoreCase(appNameField)){
						app_name = value;
						appNameArr.add(app_name);
					}
					if(name.equalsIgnoreCase(verStatusField)){
						verStatus = value;
						verStatusArr.add(verStatus);
					}
					if(name.equalsIgnoreCase(verRemarksField)){
						verRemarks = value;
						verRemarksArr.add(verRemarks);
					}
				}

			}else{
				try{
					itemName = item.getName();
					File savedFile = new File("E:/neinSoft/C2IT/BOMAUDIT/"+reqNo);
					if(!savedFile.exists()){
						savedFile.mkdirs();
						savedFile.setWritable(true);
					}
					File  insertFile = new File("E:/neinSoft/C2IT/BOMAUDIT/"+reqNo+"/"+itemName);
					item.write(insertFile);
				}catch(Exception e){
					System.out.println(e);
				}
			}
		}

		if(lvlNo.equalsIgnoreCase("0")){
			for(int i=0; i<sno; i++){
				psmt1.setString(1, reqNo);
				psmt1.setString(2, appNameArr.get(i));
				psmt1.setString(3, verStatusArr.get(i));
				psmt1.setString(4, verRemarksArr.get(i));
				psmt1.setString(5, brCode);
				psmt1.setString(6, brName);
				psmt1.executeUpdate();
			}

			psmt3.setString(1, "Verified");
			psmt3.setString(2, "over");
			psmt3.setString(3, finalRemarks);
			psmt3.setString(4, reqNo);
			psmt3.setString(5, sesBno);
			psmt3.setString(6, "Pending");
			psmt3.setString(7, "now");
			psmt3.executeUpdate();

			psmt4.setString(1, "No Action Performed");
			psmt4.setString(2, reqNo);
			psmt4.setString(3, sesBno);
			psmt4.setString(4, sesEmpID);
			psmt4.executeUpdate();

			psmt5.setString(1, "1");
			psmt5.setString(2, sesEmpID);
			psmt5.setString(3, finalRemarks);
			psmt5.setString(4, reqNo);
			psmt5.setString(5, sesBno);
			psmt5.executeUpdate();

			psmt2.setString(1, reqNo);
			psmt2.setString(2, empid1);
			psmt2.setString(3, emp);
			psmt2.setString(4, desg);
			psmt2.setString(5, branchCode);
			psmt2.setString(6, mail1);
			psmt2.setString(7, levelno);
			psmt2.setString(8, "Pending");
			psmt2.setString(9, "now");
			psmt2.setString(10, "Pending");
			psmt2.setString(11, "0");
			psmt2.executeUpdate();

		}else if(lvlNo.equalsIgnoreCase("1")){
			System.out.println("here in else if");
		}
	}

	String msg = "Verified__and__sent__successfully.";
	response.sendRedirect("../../adminHR.jsp?msg="+msg);      
}catch(Exception e){
	System.out.println(e);
}finally{
	DbUtil.closeDBResources(null,psmt1,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
	DbUtil.closeDBResources(null,psmt4,null);
	DbUtil.closeDBResources(null,psmt5,conCSDB);
}
%>

<%}%>