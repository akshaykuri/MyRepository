<%@page import="CON2.MailMessageCheckListBranch"%>
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
                  MailMessageCheckListBranch mailMessage = new MailMessageCheckListBranch();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null;
	              String []id;
	              //String []headline;
	             /*  String []ps_raw=null;
	              String []ps_upsworking=null;
	              String []ps_upsbackup;
	              String []ps_upspreventive; */
	              String []si_drive=null;
	              String []si_harddisk=null;
	              String []si_usedspace=null;
	              String []si_freespace=null;
	              
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
//cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,isp_router,udb,cr_working,wg_firewall,fdb,

conn = dbConn.getConnection2();
st = conn.createStatement();
st11 = conn.createStatement();
cn2 = con.getConnection2();
st2 = cn2.createStatement();

/* cn3 = con.getConnection1();
st3 = cn3.createStatement();
cn4 = con.getConnection1();
st4 = cn4.createStatement();
cn5 = con.getConnection1();
st5 = cn5.createStatement();
cn6 = con.getConnection1();
st6 = cn6.createStatement();
cn7 = con.getConnection1();
st7 = cn7.createStatement();
cn8 = con.getConnection1();
st8 = cn8.createStatement(); */

String cs_id=request.getParameter("cs_id");
String cs_date=request.getParameter("cs_date");
String city = request.getParameter("city");
String e_Location = request.getParameter("e_Location");
String ps_raw = request.getParameter("ps_raw");
String ps_upsworking = request.getParameter("ps_upsworking");
String ps_upsbackup = request.getParameter("ps_upsbackup");
String ps_upspreventive = request.getParameter("ps_upspreventive");
String b_no = request.getParameter("b_no");
System.out.println("b_no.............. "+b_no);
System.out.println("cs_date defining.............. "+cs_date);
String cs_time = request.getParameter("cs_time");
String e_name=request.getParameter("e_name");
//System.out.println("e_name value.............. "+e_name);
String e_designation=request.getParameter("e_designation");
//System.out.println("e_designation value................. "+e_designation);
String desg=request.getParameter("desg");
//System.out.println("desg.............."+desg);
String emp=request.getParameter("emp");
//System.out.println("emp.................."+emp);
String theName=request.getParameter("theName");
String Initiator_mail_id=request.getParameter("Initiator_mail_id");
//ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,
String transId=request.getParameter("transid");
//System.out.println("transid...................."+transId);
String si_working = request.getParameter("si_working");
String isp_router = request.getParameter("isp_router");
String udb = request.getParameter("udb");
//String cr_working = request.getParameter("cr_working");
//String wg_firewall = request.getParameter("wg_firewall");
//String fdb = request.getParameter("fdb");
String ln_server = request.getParameter("ln_server");
String NEWINS = request.getParameter("NEWINS");
String sr_ac = request.getParameter("sr_ac");

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
String main_remarks = request.getParameter("main_remarks");
//quarter_r,main_remarks,idextend,
String mail=request.getParameter("mail");
//System.out.println("MAIL NAME/............."+mail);
String gmmail=request.getParameter("gmmail");
String brmail=request.getParameter("brmail");
String itmail=request.getParameter("itmail");
String admail=request.getParameter("admail");

System.out.println("gmmail VALUES "+gmmail);
System.out.println("hrmail VALUES "+brmail);
System.out.println("itmail VALUES "+itmail);
System.out.println("admail VALUES "+admail);


/* System.out.println("cs_id VALUES "+cs_id);
System.out.println("cs_date VALUES "+cs_date);
System.out.println("city VALUES "+city);
System.out.println("cs_time VALUES "+cs_time);
System.out.println("e_name VALUES "+e_name);
System.out.println("e_designation VALUES "+e_designation);
System.out.println("desg VALUES "+desg);

System.out.println("emp VALUES "+emp);
System.out.println("theName VALUES "+theName);
System.out.println("ps_raw VALUES "+ps_raw);
System.out.println("ps_upsworking VALUES "+ps_upsworking);
System.out.println("ps_upsbackup VALUES "+ps_upsbackup);
System.out.println("ps_upspreventive VALUES "+ps_upspreventive);

//System.out.println("si_working VALUES "+si_working);
System.out.println("isp_router VALUES "+isp_router);
System.out.println("udb VALUES "+udb);
//System.out.println("cr_working VALUES "+cr_working);
//System.out.println("wg_firewall VALUES "+wg_firewall);
//System.out.println("fdb VALUES "+fdb);
System.out.println("NEWINS VALUES "+NEWINS);
System.out.println("sr_ac VALUES "+sr_ac);
System.out.println("tele VALUES "+tele);


System.out.println("cctv VALUES "+cctv);
System.out.println("cctv_backup VALUES "+cctv_backup);
System.out.println("access_con VALUES "+access_con);
//System.out.println("cr_working VALUES "+cr_working);
System.out.println("fire_a VALUES "+fire_a);
System.out.println("fire_l VALUES "+fire_l);
System.out.println("ids_w VALUES "+ids_w);
System.out.println("ids_l VALUES "+ids_l);
System.out.println("ithardware_r VALUES "+ithardware_r);

System.out.println("ithardware_n VALUES "+ithardware_n);
System.out.println("preventive_e VALUES "+preventive_e);
System.out.println("quarter_r VALUES "+quarter_r);
System.out.println("main_remarks VALUES "+main_remarks);
System.out.println("mail VALUES "+mail); */
String newidvalue=null;
String id22=null;
String new_id = null;


int idextend= Integer.parseInt(request.getParameter("idextend"));
System.out.println("idextend ..............  "+idextend);
Date result=null;// = formater.parse(po_date);
//Date formatDate = null;

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;

//message = mailMessage.getMailMessage(mr_id.trim());

try{
	result = new Date(sdf.parse(cs_date).getTime());
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}

System.out.println("result..date..........."+result);

//st11.executeUpdate("update mr_master set mdradio='Approved' where mr_id = '"+mr_id+"' and  desg = "+session.getAttribute("theName")+" ");
PreparedStatement psmt = null,psmtString1=null,psmtString2=null,psmtString3=null,psmtString4=null,psmtString5=null;


//rs = st2.executeQuery("select cs_id,max(idextend) as idd from cs_master where cs_id='"+cs_id+"'");SELECT substr(cs_id,9,2) FROM cs_master
//rs = st2.executeQuery("select max(idextend) as idd from cs_master WHERE substr(cs_id,9,2)='"+b_no+"' ");
rs = st2.executeQuery("SELECT max( idextend ),(SELECT MAX(substr(cs_id,12,4)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no) AS increval,(SELECT MAX(substr(cs_id,1,11)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no) AS increLoc  FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no");
//select max(idextend) as idd,(SELECT MAX(cs_id) FROM cs_master WHERE substr(cs_id,9,2)) as csid from cs_master WHERE substr(cs_id,9,2)='90'
if(rs.next()){
	int incre = 0;
	int id2=0;
	  				
  					
	try
	{
		
		id2=rs.getInt(1);
		System.out.println("\n id of sequence no, "+id2);
		if(id2==0)
			id2=1;
		id22= rs.getString("increLoc");
		if(id22==null)
			id22="NEIN/CS/"+b_no+"-";
		System.out.println("id of idextend no, "+id22);
		System.out.println("location lets see *****:  "+b_no);
             id2++;     
		//	System.out.println("Gen id "  +rs_id.getInt(1));
			//new_id = "" +String.valueOf(id2);
			new_id =id22+String.valueOf(id2);
			System.out.println("CS NO "  +new_id);
		//	new_id = "" +String.valueOf(id);
	}
	catch(SQLException ex)
	{
		  System.out.println(ex.toString());
		 new_id = "NEIN/CS/90-1";
	    }

			
			try
			{
				psmt = conn.prepareStatement("insert into cs_master(idextend,cs_id,cs_date,city,e_Location,cs_time,e_name,e_designation,desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,isp_router,udb,ln_server,NEWINS,sr_ac,tm,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,mail,Initiator_mail_id,gmmail,brmail,itmail,admail,si_working,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
				System.out.println("dddd"+id2+"new :"+new_id+"result :"+result+""+"city :"+city+"5 b_no "+b_no+"6 cs_time :"+cs_time+"6 e_name :"+e_name+"e_designation :"+e_designation+"desg :"+desg+"emp :"+emp);
				psmt.setString(11,theName);
				psmt.setString(12,transId);
				psmt.setString(13,ps_raw);
				psmt.setString(14,ps_upsworking);
				psmt.setString(15,ps_upsbackup);
				psmt.setString(16,ps_upspreventive);
				psmt.setString(17,isp_router);
				psmt.setString(18,udb);
				psmt.setString(19,ln_server);
				psmt.setString(20,NEWINS);
				System.out.println("theName :"+theName+"transId :"+transId+"ps_raw :"+ps_raw+""+"ps_upsworking :"+ps_upsworking+"ps_upsbackup "+ps_upsbackup+"6 ps_upspreventive :"+ps_upspreventive+"6 isp_router :"+isp_router+"udb :"+udb+"ln_server :"+ln_server+"NEWINS :"+NEWINS);
				//'"+tm+"','"+tele+"','"+cctv+"','"+cctv_backup+"','"+access_con+"','"+fire_a+"','"+fire_l+"','"+ids_w+"','"+ids_l+"',
				//'"+ithardware_r+"','"+ithardware_n+"','"+preventive_e+"','"+quarter_r+"','"+main_remarks+"','"+mail+"','"+Initiator_mail_id+"',
				//'"+gmmail+"','"+brmail+"','"+itmail+"','"+admail+"','"+si_working+"','normal')");
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
				System.out.println("tm :"+tm+"tele :"+tele+"cctv :"+cctv+""+"cctv_backup :"+cctv_backup+"access_con "+access_con+"fire_a :"+fire_a+"fire_l :"+fire_l+"ids_w :"+ids_w+"ids_l :"+ids_l+"ithardware_r :"+ithardware_r);
				psmt.setString(32,ithardware_n);
				psmt.setString(33,preventive_e);
				psmt.setString(34,quarter_r);
				psmt.setString(35,main_remarks);
				psmt.setString(36,mail);
				psmt.setString(37,Initiator_mail_id);
				psmt.setString(38,gmmail);
				psmt.setString(39,brmail);
				psmt.setString(40,itmail);
				psmt.setString(41,admail);
				System.out.println("ithardware_n :"+ithardware_n+"preventive_e :"+preventive_e+"quarter_r :"+quarter_r+""+"main_remarks :"+main_remarks+"mail "+mail+"Initiator_mail_id :"+Initiator_mail_id+"gmmail :"+gmmail+"brmail :"+brmail+"itmail :"+itmail+"admail :"+admail);
				psmt.setString(42,si_working);
				psmt.setString(43,"normal");
				System.out.println("si_working :"+si_working);
				
				
				
				
				
				i= psmt.executeUpdate();
			}
			catch(Exception e)
			{
				System.out.println("Exception "+e);
			}
			
			
			
}

  // conn.commit();
%>

<% 
   
if(i>=0){
	   
   if(request.getParameter("mpls_name")!= null)
   {
		
		String []item;
	       
	        
	       // System.out.println("length "+ps_raw.length);
	       // String si_drive[] = request.getParameterValues("si_drive");
			//String si_harddisk[]= request.getParameterValues("si_harddisk");
			//String si_usedspace[]= request.getParameterValues("si_usedspace");
			//String si_freespace[]= request.getParameterValues("si_freespace");
			
			String mpls_name[]= request.getParameterValues("mpls_name");
			
			String mpls_remarks[]= request.getParameterValues("mpls_remarks");
			
			System.out.println("mpls_name length---- "+mpls_name.length);
			
			//String int_name[]= request.getParameterValues("int_name");
		  //  String internet[]= request.getParameterValues("internet");
		   
			
		//	String bkup_name[]= request.getParameterValues("bkup_name");
			//String bkup[]= request.getParameterValues("bkup");
			 
			
			String phto_name[]= request.getParameterValues("phto_name");
			//String phto[]= request.getParameterValues("phto");
			
				
			String prt_name[]= request.getParameterValues("prt_name");
			//String prt[]= request.getParameterValues("prt");
			 
			
			String fx_name[]= request.getParameterValues("fx_name");
			//String fx[]= request.getParameterValues("fx");
			
				
			String br_name[]= request.getParameterValues("br_name");
			//String br[]= request.getParameterValues("br");
			
			
			
			/* System.out.println("si_drive"+si_drive);
			System.out.println("si_harddisk"+si_harddisk);
			System.out.println("si_usedspace"+si_usedspace);
			System.out.println("si_freespace"+si_freespace);
		    System.out.println("mpls_name"+mpls_name);
			System.out.println("mpls"+mpls);
			System.out.println("mpls_remarks"+mpls_remarks);
			System.out.println("int_name"+int_name);
			System.out.println("internet"+internet);
			System.out.println("bkup_name"+bkup_name);
			System.out.println("bkup"+bkup);
			System.out.println("phto_name"+phto_name);
			System.out.println("phto"+phto);
			System.out.println("prt_name"+prt_name);
			System.out.println("prt"+prt);
			System.out.println("fx_name"+fx_name);
			System.out.println("fx"+fx);
			System.out.println("br_name"+br_name);
			System.out.println("br"+br); */
		  	/* 
		  	 String ps_raw[] = request.getParameterValues("ps_raw");
		  	String ps_upsworking[] = request.getParameterValues("ps_upsworking");
			String ps_upsbackup[] = request.getParameterValues("ps_upsbackup");
			String ps_upspreventive[] = request.getParameterValues("ps_upspreventive"); */
			/* need to try //	for(int k=1;k<si_drive.length-1;k++)
			//if(i>1) */
			
			/* tried and got these result and result 
			//if(i>=0) - java.lang.ArrayIndexOutOfBoundsException: 2
			//if(i>0) - java.lang.ArrayIndexOutOfBoundsException: 1 */
		
	     
		/* conn = dbConn.getConnection2();
			try{
				
				st1 = conn.createStatement();
				for(int k=1;k<si_drive.length;k++)
		    	{
					String si_cs_id= request.getParameter("si_cs_id"+k);
					st1.executeUpdate("insert into serveritem(si_cs_id,si_drive,si_harddisk,si_usedspace,si_freespace,transId) values('"+new_id+"','"+si_drive[k]+"','"+si_harddisk[k]+"','"+si_usedspace[k]+"','"+si_freespace[k]+"','"+transId+"')");
				}
				System.out.println("First for loop");
		 	 }
			catch(Exception e){ System.out.println("Catch on k loop"); e.printStackTrace(); }	 */
			
		try{
				st3 = conn.createStatement();
				for(int l=1;l<mpls_name.length;l++)
				{
					String mpls= request.getParameter("mpls"+l);
					//st3.executeUpdate("insert into mpls_item(mi_cs_id,mpls_name,mpls,mpls_remarks,transId) values
							//('"+new_id+"','"+mpls_name[l]+"','"+mpls+"','"+mpls_remarks[l]+"','"+transId+"')");
					psmtString1 = conn.prepareStatement("insert into mpls_item(mi_cs_id,mpls_name,mpls,mpls_remarks,transId) values(?,?,?,?,?)");
					psmtString1.setString(1,new_id);
					psmtString1.setString(2,mpls_name[l]);
					psmtString1.setString(3,mpls);
					psmtString1.setString(4,mpls_remarks[l]);
					psmtString1.setString(5,transId);
					
				int ll=	psmtString1.executeUpdate();
					
				}
				System.out.println("Second for loop");
   			}
			catch(Exception e){System.out.println("Catch on l loop"); e.printStackTrace(); }
				
		
			
		try{	
				st6 = conn.createStatement();
				for(int o=1;o<phto_name.length;o++)
				{
					String phto= request.getParameter("phto"+o);
					//st6.executeUpdate("insert into photocopier_item(pi_cs_id,phto_name,phto,transId) values
							//('"+new_id+"','"+phto_name[o]+"','"+phto+"','"+transId+"')");
					psmtString2 = conn.prepareStatement("insert into photocopier_item(pi_cs_id,phto_name,phto,transId) values (?,?,?,?)");
					psmtString2.setString(1,new_id);
					psmtString2.setString(2,phto_name[o]);
					psmtString2.setString(3,phto);
					psmtString2.setString(4,transId);
					
					
					int oo = psmtString2.executeUpdate();
				}
				System.out.println("5 for loop");
		}
		catch(Exception e){System.out.println("Catch on o loop"); e.printStackTrace(); }
				
		try{
				st7 = conn.createStatement();
				for(int p=1;p<prt_name.length;p++)
				{
					String prt= request.getParameter("prt"+p);
					//st7.executeUpdate("insert into printer_item(prt_cs_id,prt_name,prt,transId) 
					//values('"+new_id+"','"+prt_name[p]+"','"+prt+"','"+transId+"')");
					
					psmtString3 = conn.prepareStatement("insert into printer_item(prt_cs_id,prt_name,prt,transId) VALUES(?,?,?,?)");
					psmtString3.setString(1,new_id);
					psmtString3.setString(2,prt_name[p]);
					psmtString3.setString(3,prt);
					psmtString3.setString(4,transId);
					
					int pp=psmtString3.executeUpdate();
				}
				System.out.println("6 for loop");
		}
		catch(Exception e){System.out.println("Catch on p loop"); e.printStackTrace(); }	
		
		
		try {
				st8 = conn.createStatement();
				for(int q=1;q<fx_name.length;q++)
				{
					String fx= request.getParameter("fx"+q);
					//st8.executeUpdate("insert into fax_item(fx_cs_id,fx_name,fx,transId) values('"+new_id+"','"+fx_name[q]+"','"+fx+"','"+transId+"')");
					
					psmtString4 = conn.prepareStatement("insert into fax_item(fx_cs_id,fx_name,fx,transId) values(?,?,?,?)");
					psmtString4.setString(1,new_id);
					psmtString4.setString(2,fx_name[q]);
					psmtString4.setString(3,fx);
					psmtString4.setString(4,transId);
					
					int qq = psmtString4.executeUpdate();
					
				
				}
				System.out.println("7 for loop");
				}
		catch(Exception e){System.out.println("Catch on q loop"); e.printStackTrace(); }
		
		try{
				st9 = conn.createStatement();
				for(int r=1;r<br_name.length;r++)
				{
					String br= request.getParameter("br"+r);
					//st9.executeUpdate("insert into barcode_item(br_cs_id,br_name,br,transId) values('"+new_id+"','"+br_name[r]+"','"+br+"','"+transId+"')");
					psmtString5 = conn.prepareStatement("insert into barcode_item(br_cs_id,br_name,br,transId) values(?,?,?,?)");
					psmtString5.setString(1,new_id);
					psmtString5.setString(2,br_name[r]);
					psmtString5.setString(3,br);
					psmtString5.setString(4,transId);
					
					int rr = psmtString5.executeUpdate();
					
					//out.println("   Items '"+itemName[i]+"'are inserted Successfully ");
				}
				//postMail.postMail("POSOFT@NITTSU.CO.IN","pass1234",mail,mr_id+ " Report",e_name+  " "+  "Request your approval for the following Material Requisition '\n' open URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN) '\n' http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain)");
				//postMail.postMail("frksh27@gmail.com","farooq!@12",mail,mr_id+ " Report",e_name+  " "+  "request your approval for the following Material Requisition. <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office)");
				//postMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office) <br><br><br><br>"+message);
				System.out.println("8 for loop");
			}
			catch(Exception e){ System.out.println("Catch on r loop"); e.printStackTrace(); }
		
		
	} 
   
   //spostMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office) <br><br><br><br>"+message);

}

System.out.println("GM-----------------------"+gmmail);

message = mailMessage.getMailMessage2(new_id.trim());
//postMail.postMail(Initiator_mail_id,"pass1234",mail," Check Sheet :  " +cs_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);              
pdf.getAttachmentFileOtherBranch(new_id);
//if(itmail!=null){
//postMail.postMail(Initiator_mail_id,"pass1234",itmail," Check Sheet :  " +cs_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);
postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234","prasanna.v@nittsu.co.in"," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);

System.out.println("Sending Check List Mail With Attachment  To It mail:"+itmail);
//}
if(admail!=null){
//postMail.postMail(Initiator_mail_id,"pass1234",admail," Check Sheet :  " +cs_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);
	postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234",admail," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);
	System.out.println("Sending Check List Mail With Attachment  To ad mail :"+admail);
}if(gmmail!=null){
//postMail.postMail(Initiator_mail_id,"pass1234",gmmail," Check Sheet :  " +cs_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);
	postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234",gmmail," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);
	System.out.println("Sending Check List Mail With Attachment  To gmmail :"+gmmail);
}if(brmail!=null){
//postMail.postMail(Initiator_mail_id,"pass1234",brmail," Check Sheet :  " +cs_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);
	postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234",brmail," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +cs_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);
	System.out.println("Sending Check List Mail With Attachment  To brmail :"+brmail);
}




System.out.println("csssss    ::   "+new_id);




//byte [] bytes = pdf.getPDFattachment(new_id);
//postMail.postMailAttachedFile(Initiator_mail_id,"pass1234",gmmail," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message,bytes);

pdf.getAttachmentFileOtherBranch(new_id);
//pdf.getAttachmentFile(new_id);
// with message .....   postMail.postMailAttachedFile(Initiator_mail_id,"pass1234","farooq.s@nittsu.co.in"," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message,new_id);
//postMail.postMailAttachedFile(Initiator_mail_id,e_name,"pass1234","farooqsha27@gmail.com"," Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>",new_id);
message = null;
				msg = "MAIL__SENT__SUCCESSFULLY......";
		    //System.out.println("we are getting this msggetting ? " +message);

		     /* response.sendRedirect("CheckList_PageOne_HO.jsp?msg=" +msg); */
		     
		     response.sendRedirect("CheckListAdmin.jsp?msg=" +msg);
%>
  






</b>
</font>
</center>
<center>
<table>
<tr>

<%--<td><input type="button" value="pdf" onclick="link();"/></td> --%>

<td><input type="button" value="OK" onclick="btnClick();"/></td>
</tr>

</table>
</center>
</form>

</div>




</body>
</html>
