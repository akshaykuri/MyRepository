<%@page import="CON2.DbUtil"%>
<%@page import="CON2.CreateAttachment"%>
<%@page import="CON2.MailMessageCheckList"%>
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
                  MailMessageCheckList mailMessage = new MailMessageCheckList();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              Statement st100=null;
	              ResultSet rs = null;
	              String []id;
	              String []si_drive=null;
	              String []si_harddisk=null;
	              String []hdd_space=null;
	              String []si_drive_type=null;
	              String []si_usedspace=null;
	              String []si_freespace=null;
	              String []si_drive_type_free=null;
	              String []mpls_name=null;
	              String []mpls=null;
	              String []mpls_remarks=null;
	              String []int_name=null;
	              String []internet=null;
	              String []bkup_name=null;
	              String []bkup=null;
	             String []phto_name=null;
	              String []phto=null;
	              String []prt_name=null;
	              String []prt=null;
	              String []fx_name=null;
	              String []fx=null;
	              String []br_name=null;
	              String []br=null;
	              String []transId=null;
	              String msg = null;
	              String output =null;
	              Connection2 dbConn = new Connection2();
	              StringBuffer strBuff = null;
	              String message = null;
	              
	              %>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">
<form name=form>


<center><font size=4 ><b>
<%
conn = dbConn.getConnection2();
st = conn.createStatement();
st11 = conn.createStatement();
cn2 = con.getConnection2();
st2 = cn2.createStatement();
String cs_id=request.getParameter("cs_id");
String cs_date=request.getParameter("cs_date");
String city = request.getParameter("city");
String ps_raw = request.getParameter("ps_raw");
String ps_upsworking = request.getParameter("ps_upsworking");
String ps_upsbackup = request.getParameter("ps_upsbackup");
String ps_upspreventive = request.getParameter("ps_upspreventive");
String cs_time = request.getParameter("cs_time");
String e_name=request.getParameter("e_name");
String e_designation=request.getParameter("e_designation");
String desg=request.getParameter("desg");
String emp=request.getParameter("emp");
String theName=request.getParameter("theName");
String Initiator_mail_id=request.getParameter("Initiator_mail_id");
String transId=request.getParameter("transid");
String si_working = request.getParameter("si_working");
String isp_router = request.getParameter("isp_router");
               // String udb = request.getParameter("udb");
String cr_working = request.getParameter("cr_working");
String wg_firewall = request.getParameter("wg_firewall");
//String fdb = request.getParameter("fdb");
String ln_server = request.getParameter("ln_server");
String NEWINS = request.getParameter("NEWINS");
String sr_ac = request.getParameter("sr_ac");
String b_no = request.getParameter("b_no");
String tm = request.getParameter("tm");
String tele = request.getParameter("tele");
String cctv = request.getParameter("cctv");
String cctv_backup = request.getParameter("cctv_backup");
String access_con = request.getParameter("access_con");
String fire_a = request.getParameter("fire_a");
String fire_l = request.getParameter("fire_l");
String ids_w = request.getParameter("ids_w");
String ids_l = request.getParameter("ids_l");
String ithardware_r = request.getParameter("ithardware_r");
String ithardware_n = request.getParameter("ithardware_n");
String preventive_e = request.getParameter("preventive_e");
String quarter_r = request.getParameter("quarter_r");
String main_remarks2 = request.getParameter("main_remarks");
String main_remarks = (main_remarks2.replaceAll("\\s+", " ").trim());
String mail=request.getParameter("mail");
String mailingCheck[] = request.getParameterValues("mailingCheck");
String part1=null;
String part2=null;
String part3=null;
for(int k=0;k<mailingCheck.length;k++)
{
//System.out.println("mailingCheck"+mailingCheck[k]);
String[] parts = mailingCheck[k].split("--");
 part1 = parts[0];
 part2 = parts[1];
 part3 = parts[2];

}

String newidvalue=null;
String id22=null;
String new_id = null;
PreparedStatement psmt100=null;
try{
String selectSQL = "SELECT cs_id FROM cs_master WHERE transid=?";
psmt100 = conn.prepareStatement("SELECT cs_id FROM cs_master WHERE transid=?");
psmt100.setString(1,transId);
ResultSet rs100 = psmt100.executeQuery();
if(rs100.next()){
	 msg = "...'"+cs_id+"'__IS__ALREADY EXIST.......";
}
else if(mailingCheck == null || b_no == null)
{
	String msgg=null;
	msgg = "YOU__HAVE__NOT__ENTERED__HIGHER__AUTHORITY__DETAILS \\n \\n \\n __ __ __ __KINDLY__MAKE__SURE__YOU__HAVE__REPORTING__OFFICER";
	response.sendRedirect("OtherPage.jsp?msg="+msgg);
	
}
else{

PreparedStatement psmt=null,psmtArray1=null,psmtArray2=null,psmtArray3=null,psmtArray4=null,psmtArray5=null,psmtArray6=null,psmtarray7=null,psmtarray8=null,psmtarray9=null,psmtString55=null;

int idextend= Integer.parseInt(request.getParameter("idextend"));
Date result=null;// = formater.parse(po_date);
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;
try{
	result = new Date(sdf.parse(cs_date).getTime());
	
}
catch (Exception e) {
	e.printStackTrace();
}
rs = st2.executeQuery("SELECT max( idextend ),(SELECT MAX(substr(cs_id,12,4)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no) AS increval,(SELECT MAX(substr(cs_id,1,11)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no) AS increLoc  FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no");
if(rs.next()){
	int incre = 0;
	int id2=0;
	  				
					
	try
	{
		
		id2=rs.getInt(1);
		
		if(id2==0)
			id2=1;
		id22= rs.getString("increLoc");
		if(id22==null)
			id22="NEIN/CS/"+b_no+"-";
		   id2++;     
		   new_id =id22+String.valueOf(id2);
		
	}
	catch(SQLException ex)
	{
	 new_id = "NEIN/CS/90-1";
	    }
                psmt = conn.prepareStatement("insert into cs_master(idextend,cs_id,cs_date,city,e_Location,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,isp_router,udb,ln_server,NEWINS,sr_ac,tm,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,mail,Initiator_mail_id,gmmail,brmail,itmail,admail,si_working,cr_working,wg_firewall,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				psmt.setInt(1,id2);
				psmt.setString(2,new_id);
				psmt.setDate(3,result);
				psmt.setString(4,city);
				psmt.setString(5,b_no);
				psmt.setString(6,cs_time);
				psmt.setString(7,e_name);
				psmt.setString(8,e_designation);
				psmt.setString(9,desg);
				psmt.setString(10,emp);
				psmt.setString(11,theName);
				psmt.setString(12,transId);
				psmt.setString(13,ps_raw);
				psmt.setString(14,ps_upsworking);
				psmt.setString(15,ps_upsbackup);
				psmt.setString(16,ps_upspreventive);
				psmt.setString(17,isp_router);
				psmt.setString(18,"");
				psmt.setString(19,ln_server);
				psmt.setString(20,NEWINS);
				psmt.setString(21,sr_ac);
				psmt.setString(22,tm);
				psmt.setString(23,tele);
				psmt.setString(24,cctv);
				psmt.setString(25,cctv_backup);
				psmt.setString(26,access_con);
				psmt.setString(27,fire_a);
				psmt.setString(28,fire_l);
				psmt.setString(29,ids_w);
				psmt.setString(30,ids_l);
				psmt.setString(31,ithardware_r);
				psmt.setString(32,ithardware_n);
				psmt.setString(33,preventive_e);
				psmt.setString(34,quarter_r);
				psmt.setString(35,main_remarks);
				psmt.setString(36,mail);
				psmt.setString(37,Initiator_mail_id);
				psmt.setString(38,"NULL");
				psmt.setString(39,"NULL");
				psmt.setString(40,"NULL");
				psmt.setString(41,"NULL");
				psmt.setString(42,si_working);
				psmt.setString(43,cr_working);
				psmt.setString(44,wg_firewall);
				 //psmt.setString(45,fdb);
				psmt.setString(45,"normal");
				
				
				
				
				
			i=psmt.executeUpdate();	

}

%>

<% 
   
if(i>=0){
	   
   if(request.getParameter("mpls_name")!= null)
   {
		
		String []item;
	       
	        
	       // System.out.println("length "+ps_raw.length);
	        String si_drive[] = request.getParameterValues("si_drive");
			String si_harddisk[]= request.getParameterValues("si_harddisk");
			String hdd_space[] = request.getParameterValues("hdd_space");
			String si_drive_type[] = request.getParameterValues("si_drive_type");
			String si_usedspace[]= request.getParameterValues("si_usedspace");
			
			Double [] itemTax;
			String itemTaxString[] = request.getParameterValues("si_usedspace");
			itemTax = new Double [itemTaxString.length];
			for(int o=0;o<itemTaxString.length; o++)
			{   
				//System.out.println("thhh itemTax : "+itemTaxString[o]);
				if (!itemTaxString[o].trim().equals(null)||!itemTaxString[o].trim().equals(""));
			     	{
					itemTaxString[o]=itemTaxString[o].replace(",","");
					itemTax[o]= Double.valueOf(itemTaxString[o]);
				    }
			}
			
			String si_freespace[]= request.getParameterValues("si_freespace");
			String si_drive_type_free[] = request.getParameterValues("si_drive_type_free");
			String mpls_name[]= request.getParameterValues("mpls_name");
			String mpls_remarks[]= request.getParameterValues("mpls_remarks");
			String int_name[]= request.getParameterValues("int_name");
		    CreateAttachment ca =  new CreateAttachment();
			String bkup_name[]= request.getParameterValues("bkup_name");
			String bkup[]= request.getParameterValues("bkup");
			String phto_name[]= request.getParameterValues("phto_name");
			String prt_name[]= request.getParameterValues("prt_name");
			String fx_name[]= request.getParameterValues("fx_name");
			String br_name[]= request.getParameterValues("br_name");
		try{
				conn = dbConn.getConnection2();
				st1 = conn.createStatement();
				for(int k=0;k<si_drive.length;k++)
		    	    {
			  	    psmtArray1 = conn.prepareStatement("insert into serveritem(si_cs_id,si_drive,si_harddisk,hdd_space,si_drive_type,si_usedspace,si_freespace,transId,si_drive_type_free) values (?,?,?,?,?,?,?,?,?)");
					psmtArray1.setString(1,new_id);
					psmtArray1.setString(2,si_drive[k]);
					psmtArray1.setString(3,si_harddisk[k]);
					psmtArray1.setString(4,hdd_space[k]);
					psmtArray1.setString(5,si_drive_type[k]);
					psmtArray1.setDouble(6,itemTax[k]);
					psmtArray1.setString(7,si_freespace[k]);
					psmtArray1.setString(8,transId);
					psmtArray1.setString(9,si_drive_type_free[k]);
					int kk = psmtArray1.executeUpdate();
				}
				//System.out.println("First for loop");
		 	 }
			catch(Exception e){ System.out.println("Catch on k loop"); e.printStackTrace(); }
		
			
			
		try{
				st3 = conn.createStatement();
				for(int l=1;l<mpls_name.length;l++)
				{
					String mpls= request.getParameter("mpls"+l);
					psmtArray2 = conn.prepareStatement("insert into mpls_item(mi_cs_id,mpls_name,mpls,mpls_remarks,transId) values(?,?,?,?,?)");
					psmtArray2.setString(1,new_id);
					psmtArray2.setString(2,mpls_name[l]);
					psmtArray2.setString(3,mpls);
					psmtArray2.setString(4,mpls_remarks[l]);
					psmtArray2.setString(5,transId);
					
					int ll = psmtArray2.executeUpdate();
					
				}
				//System.out.println("Second for loop");
   			}
			catch(Exception e){System.out.println("Catch on l loop"); e.printStackTrace(); }
		
		try{
				st4 = conn.createStatement();
				for(int m=1;m<int_name.length;m++)
				{
					String internet= request.getParameter("internet"+m);
					psmtArray3 = conn.prepareStatement("insert into internet_item(ii_cs_id,int_name,internet,transId) values(?,?,?,?)");
					psmtArray3.setString(1,new_id);
					psmtArray3.setString(2,int_name[m]);
					psmtArray3.setString(3,internet);
					psmtArray3.setString(4,transId);
					
					int mm = psmtArray3.executeUpdate();
				}
				//System.out.println("3 for loop");
			}
			catch(Exception e){System.out.println("Catch on m loop"); e.printStackTrace(); }
			
		try{
				st5 = conn.createStatement();
				for(int n=0;n<bkup_name.length;n++)
				{
					String bkuph= request.getParameter("bkup"+n);
					psmtArray4 = conn.prepareStatement("insert into backup_item(bi_cs_id,bkup_name,bkup,transId) values(?,?,?,?)");
					psmtArray4.setString(1,new_id);
					psmtArray4.setString(2,bkup_name[n]);
					psmtArray4.setString(3,bkup[n]);
					psmtArray4.setString(4,transId);
					
					int nn = psmtArray4.executeUpdate();
					
				}
			//	System.out.println("4 for loop");
			}
			catch(Exception e){System.out.println("Catch on n loop"); e.printStackTrace(); }
		
		try{	
				st6 = conn.createStatement();
				for(int o=1;o<phto_name.length;o++)
				{
					String phto= request.getParameter("phto"+o);
					psmtArray5 = conn.prepareStatement("insert into photocopier_item(pi_cs_id,phto_name,phto,transId) values(?,?,?,?)");
					psmtArray5.setString(1,new_id);
					psmtArray5.setString(2,phto_name[o]);
					psmtArray5.setString(3,phto);
					psmtArray5.setString(4,transId);
					
					int oo = psmtArray5.executeUpdate();
				}
				//System.out.println("5 for loop");
		}
		catch(Exception e){System.out.println("Catch on o loop"); e.printStackTrace(); }
			
		try{
				st7 = conn.createStatement();
				for(int p=1;p<prt_name.length;p++)
				{
					String prt= request.getParameter("prt"+p);
					psmtArray6 = conn.prepareStatement("insert into printer_item(prt_cs_id,prt_name,prt,transId) values(?,?,?,?)");
					psmtArray6.setString(1,new_id);
					psmtArray6.setString(2,prt_name[p]);
					psmtArray6.setString(3,prt);
					psmtArray6.setString(4,transId);
					
					int pp = psmtArray6.executeUpdate();
				}
				//System.out.println("6 for loop");
		}
		catch(Exception e){System.out.println("Catch on p loop"); e.printStackTrace(); }	
	
		
		try {
				st8 = conn.createStatement();
				for(int q=1;q<fx_name.length;q++)
				{
					String fx= request.getParameter("fx"+q);
					psmtarray7 = conn.prepareStatement("insert into fax_item(fx_cs_id,fx_name,fx,transId) values(?,?,?,?)");
					psmtarray7.setString(1,new_id);
					psmtarray7.setString(2,fx_name[q]);
					psmtarray7.setString(3,fx);
					psmtarray7.setString(4,transId);
					
					int qq = psmtarray7.executeUpdate();
					
				}
			//	System.out.println("7 for loop");
				}
		catch(Exception e){System.out.println("Catch on q loop"); e.printStackTrace(); }
		
		try{
				st9 = conn.createStatement();
				for(int r=1;r<br_name.length;r++)
				{
					String br= request.getParameter("br"+r);
					psmtarray8 = conn.prepareStatement("insert into barcode_item(br_cs_id,br_name,br,transId) values(?,?,?,?)");
					psmtarray8.setString(1,new_id);
					psmtarray8.setString(2,br_name[r]);
					psmtarray8.setString(3,br);
					psmtarray8.setString(4,transId);
					
					int rr = psmtarray8.executeUpdate();
				    }
			}
			catch(Exception e){ System.out.println("Catch on r loop"); e.printStackTrace(); }
	} 
 }

message = mailMessage.getMailMessage(new_id.trim());
//pdf.getAttachmentFile(new_id);
pdf.getAttachmentFileHO(new_id);
for(int u=0;u<mailingCheck.length;u++)
     { 
	
	 String[] parts = mailingCheck[u].split("--");
	  part1 = parts[0]; 
	  part2 = parts[1]; 
	  part3 = parts[2]; 
	  psmtString55 = conn.prepareStatement("insert into checkListMails(cs_id,name,post,mailid,transId) values(?,?,?,?,?)");
		psmtString55.setString(1,new_id);
		psmtString55.setString(2,part1);
		psmtString55.setString(3,part2);
		psmtString55.setString(4,part3);
		psmtString55.setString(5,transId);
		
		int rrr = psmtString55.executeUpdate();
		//postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234",part3,"NEIN-C2IT Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
	
}

String ccmail1="sharath.kumara@nipponexpress.com,kishan.gowda@nipponexpress.com,chintu.kumar@nipponexpress.com,"+Initiator_mail_id;
//String ccmail1="chintu.kumar@nipponexpress.com,chintu.kumar@nipponexpress.com";
//String ccmail=ccmail1+","+Initiator_mail_id;
part3="prasanna.kumar@nipponexpress.com";// To addreess 
postMail.postMailAttachedFile(ccmail1,Initiator_mail_id,e_name,"pass1234",part3,"NEIN-C2IT Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
System.out.println("Length ############################################################## :");



 // postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234","prasanna.kumar@nipponexpress.com","NEIN-C2IT Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
 // postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234",Initiator_mail_id,"NEIN-C2IT Check Sheet Copy Of Mail:  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
 // pdf.getAttachmentFile(new_id);
 
 
 
  message = null;
  msg = "MAIL__SENT__SUCCESSFULLY.......";
  response.sendRedirect("OtherPage.jsp?msg=" +msg);
		     
}		     
%>
  


<%
}
catch(Exception e){ System.out.println("End of Check List"+e); e.printStackTrace(); }
finally{
	DbUtil.closeDBResources(null,null,conn);
}
%>



</b>
</font>
</center>
<center>
<table>
<tr>

<%--<td><input type="button" value="pdf" onclick="link();"/></td> --%>

<td>
    <p style="text-align: center;color: red;">
    <img style="text-align: center;"height="42" width="42"  alt="Error" src="images/error.jpg"><br>
Session Time Out <br>
<br> Login Again!
<!-- <input onclick = "history.go(-1)" type="button" value="Back"> -->
<br><br>
<a href="http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/loginho.jsp?msg=1">HOME</a>
</p>
</td>
</tr>

</table>
</center>
</form>

</div>




</body>
</html>
