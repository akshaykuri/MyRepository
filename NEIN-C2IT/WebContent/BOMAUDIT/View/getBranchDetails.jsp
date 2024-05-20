<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
Connection cn5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password);
Statement stcsdb = cn5.createStatement();
Statement stcsout = cn5.createStatement();

String branch="",branchArr[]=null,brCode="",brName="";
branch		=	request.getParameter("branch");
branchArr	=	branch.split("-");
brName		=	branchArr[0].trim();
brCode		=	branchArr[1].trim();

String loa="",br="",vs="",vb="",vo="",vr="",vfn="",vfp="",vfu="",vfo="",vfr="";
String buffer="<div id='resultFromAjax' style='display:none;'><table style='width: 100%;border: 1;'>";

try{
	ResultSet rscsdb = stcsdb.executeQuery("select listOfApplications as loa,concat(branchName,' - ',branchNo) as br,ifnull(verificationStatus,'-') as vs,ifnull(verifiedBy,'-') as vb,ifnull(verifiedOn,'-') as vo,ifnull(verifierRemarks,'-') as vr,ifnull(verifiedFileName,'-') as vfn,ifnull(verifiedFilePath,'-') as vfp,ifnull(verifiedFileUploadedBy,'-') as vfu,ifnull(verifiedFileUploadedOn,'-') as vfo,ifnull(verifiedFileUploaderRemarks,'-') as vfr from c2itreviewfrommain a left outer join c2itreviewfrommainitems b on a.requestNo=b.reqNo where branchName='"+brName+"' and branchNo='"+brCode+"'");
	while(rscsdb.next()){
		loa = rscsdb.getString("loa");
		br = rscsdb.getString("br");
		vs = rscsdb.getString("vs");
		vb = rscsdb.getString("vb");
		vo = rscsdb.getString("vo");
		vr = rscsdb.getString("vr");
		vfn = rscsdb.getString("vfn");
		vfp = rscsdb.getString("vfp");
		vfu = rscsdb.getString("vfu");
		vfo = rscsdb.getString("vfo");
		vfr = rscsdb.getString("vfr");

		buffer = buffer + "<tr><th style='text-align: center;vertical-align: middle;' nowrap colspan='11'>List Of Applications</th></tr><tr>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Application</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Branch</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Verification Status</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Verified By</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Verified On</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Verifier Remarks</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Uploaded File</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Uploaded By</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Uploaded On</th>";
		buffer = buffer + "<th style='text-align: center;vertical-align: middle;' nowrap>Uploader Remarks</th></tr>";
		
		ResultSet rscsdb1 = stcsout.executeQuery("select app_name from listofapplications where id in ("+loa+") order by id");
		while(rscsdb1.next()){
			loa = rscsdb1.getString("app_name");
			buffer = buffer + "<tr>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;' nowrap>"+loa+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;' nowrap>"+br+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vs+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vb+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vo+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vr+"</td>";
			if(!vfp.equalsIgnoreCase("-")){
				buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'><a href="+vfp+">"+vfn+"</a></td>";
			}else{
				buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'> - </td>";				
			}
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vfu+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vfo+"</td>";
			buffer = buffer + "<td style='text-align: left;vertical-align: middle;width: 9%;'>"+vfr+"</td>";
			buffer = buffer + "</tr>";
		}
	}

	buffer=buffer+"</table></div>";

	response.getWriter().print(buffer);
}catch(Exception e){
	System.out.println(e);
}finally{
	cn5.close();
}
%>