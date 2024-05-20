
<%@page import="CON2.DbUtil"%>
<%@page import="CON2.ImsDailyReport"%>
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
                  ImsDailyReport mailMessage = new ImsDailyReport();
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




String sysAdminMail = request.getParameter("sysAdminMail");
String Send_date = request.getParameter("Send_date");
String admin_name = request.getParameter("admin_name");
String time_in = request.getParameter("time_in");
String time_out = request.getParameter("time_out");
String emp = request.getParameter("emp");
String desg = request.getParameter("desg");
String mail = request.getParameter("mail");
String admin_city = request.getParameter("admin_city");
//String ims_id = request.getParameter("ims_id");
String idextend = request.getParameter("idextend");
String new_id = null;
int id=0;
String id22=null;

/* String gmmail=request.getParameter("gmmail");
String brmail=request.getParameter("brmail");
String itmail=request.getParameter("itmail");
String admail=request.getParameter("admail");

System.out.println("gmmail VALUES "+gmmail);
System.out.println("hrmail VALUES "+brmail);
System.out.println("itmail VALUES "+itmail);
System.out.println("admail VALUES "+admail); */

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
System.out.println("part111111 : "+part1);//VANI
System.out.println("part2 222222: "+part2);//HR MANAGER
System.out.println("part32222222222 : "+part3);//farooq.s@nittsu.co.in



String e_LocationNo=request.getParameter("e_LocationNo");
Date result=null;// = formater.parse(po_date);
//Date formatDate = null;

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;

try{
	result = new Date(sdf.parse(Send_date).getTime());
	
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
System.out.println("AFTER converting po date is"+result);


PreparedStatement psmt=null,psmtArray=null,psmtString55=null;
//rs = st2.executeQuery("select ims_id from ims_master where ims_id='"+ims_id+"'");
/* rs = st2.executeQuery("SELECT max(idextend),(SELECT max(substr(ims_id,16,4)) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+e_LocationNo+"'=branch_master.b_no)AS increval,(SELECT max(substr(ims_id,1,15)) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+e_LocationNo+"'=branch_master.b_no)AS increLoc FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+e_LocationNo+"'=branch_master.b_no"); */
rs = st2.executeQuery("SELECT max(idextend),(SELECT max(idextend) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+e_LocationNo+"'=branch_master.b_no)AS increval,(SELECT max(substr(ims_id,1,15)) FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+e_LocationNo+"'=branch_master.b_no)AS increLoc FROM ims_master LEFT JOIN branch_master ON(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+e_LocationNo+"'=branch_master.b_no");
 if(rs.next()){
	
	 try
 	{
 		//id=rs_id.getInt(1);
 		id=rs.getInt("increval");
 		System.out.println("Value for end ims : "+id);
 		if(id==0)
 			id=1;
 		System.out.println("id value *** "+id);
 		id22= rs.getString("increLoc");
 		if(id22==null)
 			id22="NEIN/CS/IMS/"+e_LocationNo+"-";
              id++;     
              System.out.println("id 22 value *** "+id22);
 			System.out.println("Gen id "  +rs.getInt(1));
 			new_id =id22+String.valueOf(id);
 			System.out.println("NEW ID************************************************  "+new_id);
 	}
 	catch(SQLException ex)
 	{
 		  System.out.println(ex.toString());
 		 new_id = "NEIN/CS/IMS/90-1";
 	    }
             }

  
	//i=st.executeUpdate("insert into ims_master(Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend,e_Location) values
			//('"+result+"','"+admin_name+"','"+time_in+"','"+admin_city+"','"+time_out+"','"+new_id+"','"+desg+"','"+emp+"','"+mail+"','"+id+"','"+e_LocationNo+"')");
	
	psmt = conn.prepareStatement("insert into ims_master(Send_date,admin_name,time_in,admin_city,time_out,ims_id,desg,emp,mail,idextend,e_Location) values(?,?,?,?,?,?,?,?,?,?,?)");
	psmt.setDate(1,result);
	psmt.setString(2,admin_name);
	psmt.setString(3,time_in);
	psmt.setString(4,admin_city);
	psmt.setString(5,time_out);
	psmt.setString(6,new_id);
	psmt.setString(7,desg);
	psmt.setString(8,emp);
	psmt.setString(9,mail);
	psmt.setInt(10,id);
	psmt.setString(11,e_LocationNo);
	
	
	i = psmt.executeUpdate();
   msg = "MAIL__SENT__SUCCESSFULLY";
  //  out.println("MAIL SENT SUCCESSFULLY TO '"+emp+"'");
	

  // conn.commit();
%>
<% 
   
if(i>0){
	//complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks 
   if(new_id != null && request.getParameter("cm_location") != null){
		
		String []item;
	    	String complain_id[] = request.getParameterValues("complain_id");
		  	String cm_name[] = request.getParameterValues("cm_name");
			String cm_location[] = request.getParameterValues("cm_location");
			String cm_type[] = request.getParameterValues("cm_type");
			String cm_prob[] = request.getParameterValues("cm_prob");
			String cm_reported[] = request.getParameterValues("cm_reported");
			String cm_completed[]= request.getParameterValues("cm_completed");
			//String cm_time_diff[]= request.getParameterValues("cm_time_diff");
			String cm_time_diff[]= request.getParameterValues("cm_timeString");
			String cm_status[]= request.getParameterValues("cm_status");
			String admin_remarks[]= request.getParameterValues("admin_remarks");
	     
		  try{ System.out.println("inside for try");
				conn = dbConn.getConnection2();
				st1 = conn.createStatement();
				
				for(int k=0;k<complain_id.length;k++)
				{
					System.out.println("inside for loop");
					
					/*  System.out.println("complain_id[k] "+complain_id[k]);
					System.out.println("new_id "+new_id);
					System.out.println("cm_name[k] "+cm_name[k]);
					System.out.println("cm_location[k] "+cm_location[k]);
					System.out.println("cm_prob[k] "+cm_prob[k]);
					System.out.println("cm_reported[k] "+cm_reported[k]);
					System.out.println("cm_completed[k] "+cm_completed[k]);
					System.out.println("cm_time_diff[k] "+cm_time_diff[k]);
					System.out.println("cm_status[k] "+cm_status[k]);
					System.out.println("admin_remarks[k] "+admin_remarks[k]);
					System.out.println("result "+result);
					System.out.println("admin_city "+admin_city);
					System.out.println("cm_type[k] "+cm_type[k]); */
					 
					//st1.executeUpdate("insert into ims_item(complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks,Send_date,admin_city,cm_type) values
							//('"+complain_id[k]+"','"+new_id+"','"+cm_name[k]+"','"+cm_location[k]+"','"+cm_prob[k]+"','"+cm_reported[k]+"',
									//'"+cm_completed[k]+"','"+cm_time_diff[k]+"','"+cm_status[k]+"','"+admin_remarks[k]+"',
									//'"+result+"','"+admin_city+"','"+cm_type[k]+"')");
					
					psmtArray = conn.prepareStatement("insert into ims_item(complain_id,ims_id,cm_name,cm_location,cm_prob,cm_reported,cm_completed,cm_time_diff,cm_status,admin_remarks,Send_date,admin_city,cm_type) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
					psmtArray.setString(1,complain_id[k]);
					psmtArray.setString(2,new_id);
					psmtArray.setString(3,cm_name[k]);
					psmtArray.setString(4,cm_location[k]);
					psmtArray.setString(5,cm_prob[k]);
					psmtArray.setString(6,cm_reported[k]);
					psmtArray.setString(7,cm_completed[k]);
					psmtArray.setString(8,cm_time_diff[k]);
					psmtArray.setString(9,cm_status[k]);
					psmtArray.setString(10,admin_remarks[k]);
					psmtArray.setDate(11,result);
					psmtArray.setString(12,admin_city);
					psmtArray.setString(13,cm_type[k]);
					
					int kk = psmtArray.executeUpdate();
					System.out.println("outside for loop");
				 }
			}
			catch(Exception e){
				
				
				     e.printStackTrace();
			}
			   System.out.println("After try catch ");
	} 
   System.out.println("Sending mail before");
   //spostMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office) <br><br><br><br>"+message);
   message = mailMessage.getMailMessagePayment(new_id.trim());
  // postMail.postMail(mail,"pass1234",mail," IMS DAILY WORK LOG : For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);
   pdf.getAttachmentFileIMS(new_id);
  // System.out.println("itmail :"+itmail+"  Admail :"+admail+"  gmail "+gmmail+"br mail "+brmail);
   //if(itmail!=null)
   //{ 
	   postMail.postMailAttachedFileIMS(sysAdminMail,admin_name,"pass1234","prasanna.v@nittsu.co.in"," IMS DAILY WORK LOG : For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
	   //}
   System.out.println("itmail");
  /*  if(admail!=null)
   { postMail.postMailAttachedFileIMS(sysAdminMail,"pass1234",admail," IMS DAILY WORK LOG : For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);}
   System.out.println("admail");
   if(gmmail!=null)
   { postMail.postMailAttachedFileIMS(sysAdminMail,"pass1234",gmmail," IMS DAILY WORK LOG : For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);}
   System.out.println("gmmail");
   if(brmail!=null)
   { postMail.postMailAttachedFileIMS(sysAdminMail,"pass1234",brmail," IMS DAILY WORK LOG : For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);
   } */
   
   for(int u=0;u<mailingCheck.length;u++)
   {
  	 System.out.println("mailingCheck"+mailingCheck[u]);
  	 String[] parts = mailingCheck[u].split("--");
  	  part1 = parts[0]; // 004
  	  part2 = parts[1]; // 004
  	  part3 = parts[2]; // 004
  	 //String part2 = parts[1]; // 034556
  	 System.out.println("part1 : "+part1);//VANI
  	 System.out.println("part2 : "+part2);//HR MANAGER
  	 System.out.println("part3 : "+part3);//farooq.s@nittsu.co.in
  	 
  	 psmtString55 = conn.prepareStatement("insert into imsmaillist(ims_id,name,post,mailid) values(?,?,?,?)");
  		psmtString55.setString(1,new_id);
  		psmtString55.setString(2,part1);
  		psmtString55.setString(3,part2);
  		psmtString55.setString(4,part3);
  		
  		
  		int rrr = psmtString55.executeUpdate();
  		 
  	 
  	 
   //postMail.postMail(Initiator_mail_id,"pass1234",mailingCheck[u],"ACCESS CARD FORM :  " +form_no+ " ",i_name+  " "+  "Approved Form No.:" +form_no+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);
   //postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234",part3," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>",new_id);
   postMail.postMailAttachedFileIMS(sysAdminMail,admin_name,"pass1234",part3," IMS DAILY WORK LOG :"+ new_id +" , For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
  // postMail.postMailAttachedFileIMS(sysAdminMail,admin_name,"pass1234",sysAdminMail,"IMS DAILY WORK LOG : Copy Of :"+ new_id +" , For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
   //postMail.postMailAttachedFileIMS("farooqsha27@gmail.com",admin_name,"pass1234",part3," IMS DAILY WORK LOG :"+ new_id +" , For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);	 
   }
   postMail.postMailAttachedFileIMS(sysAdminMail,admin_name,"pass1234",sysAdminMail,"IMS DAILY WORK LOG : Copy Of :"+ new_id +" , For Date:  " +Send_date+ " ",  "<b> " +admin_name+  " "+  "</b>Sent You IMS DAILY WORK LOG <font color=blue>" +new_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
   System.out.println("brmail");
   msg = "MAIL__SENT__SUCCESSFULLY__WITH__IMS__NO__:__'"+new_id+"'";
   message = null;
   
  response.sendRedirect("OtherPage.jsp?msg=" +msg);
}%>
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
