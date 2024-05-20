<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageCheckListBranch"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
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
function btnClick() 
    { 
    close(); 
    }
</script>
                  <%! 
                  MailMessageCheckListBranch mailMessage = new MailMessageCheckListBranch();
                  Connection conn = null, conn1 = null,cn2=null,connbh=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null,stbh=null;
	              ResultSet rs = null,rsbh=null;
	              String []id;
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
st8 = cn8.createStatement(); totlength*/




String mailingCheck[] = request.getParameterValues("mailingCheck");

String b_no = request.getParameter("b_no");
String main_remarks = request.getParameter("main_remarks");
String mail=request.getParameter("mail");










String totlength=request.getParameter("totlength");
int len=0;
while(len<Integer.parseInt(totlength))
   {
	    conn = dbConn.getConnection2();
	    st = conn.createStatement();
	    st11 = conn.createStatement();
	    cn2 = con.getConnection2();
	    st2 = cn2.createStatement();
	    String trval="transid"+len;
	    
	    
	    
	    
	    
	    
	    String cs_id=request.getParameter("cs_id"+len);
	    String cs_date=request.getParameter("cs_date"+len);
	    String city = request.getParameter("city"+len);
	    String e_Location = request.getParameter("e_Location"+len);
	    String ps_raw = request.getParameter("ps_raw"+len);
	    String ps_upsworking = request.getParameter("ps_upsworking"+len);
	    String ps_upsbackup = request.getParameter("ps_upsbackup"+len);
	    String ps_upspreventive = request.getParameter("ps_upspreventive"+len);
	   

	    //System.out.println("cs_date defining.............. "+cs_date);
	    String cs_time = request.getParameter("cs_time"+len);
	    String e_name=request.getParameter("e_name"+len);
	    //System.out.println("e_name value.............. "+e_name);
	    String e_designation=request.getParameter("e_designation"+len);
	    //System.out.println("e_designation value................. "+e_designation);
	    String desg=request.getParameter("desg"+len);
	    //System.out.println("desg.............."+desg);
	    String emp=request.getParameter("emp"+len);
	    //System.out.println("emp.................."+emp);
	    String theName=request.getParameter("theName"+len);
	    String Initiator_mail_id=request.getParameter("Initiator_mail_id"+len);
	    //ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,

	    //System.out.println("transid...................."+transId);
	    String si_working = request.getParameter("si_working"+len);
	    String isp_router = request.getParameter("isp_router"+len);
	                                           //String udb = request.getParameter("udb"+len);
	    //String cr_working = request.getParameter("cr_working");
	    //String wg_firewall = request.getParameter("wg_firewall");
	    //String fdb = request.getParameter("fdb");
	                                            //String ln_server = request.getParameter("ln_server"+len);
	    String NEWINS = request.getParameter("NEWINS"+len);
	    String sr_ac = request.getParameter("sr_ac"+len);
	    String tm = request.getParameter("tm"+len);
	    String tele = request.getParameter("tele"+len);
	    String cctv = request.getParameter("cctv"+len);
	    String cctv_backup = request.getParameter("cctv_backup"+len);
	    String access_con = request.getParameter("access_con"+len);
	    String fire_a = request.getParameter("fire_a"+len);
	    String fire_l = request.getParameter("fire_l"+len);
	    String ids_w = request.getParameter("ids_w"+len);
	    String ids_l = request.getParameter("ids_l"+len);
	    String ithardware_r = request.getParameter("ithardware_r"+len);
	    String ithardware_n = request.getParameter("ithardware_n"+len);
	    String preventive_e = request.getParameter("preventive_e"+len);
	    String quarter_r = request.getParameter("quarter_r"+len);
	    
	    //System.out.println("MAIL NAME/............."+mail);
	    /* String gmmail=request.getParameter("gmmail");
	    String brmail=request.getParameter("brmail");
	    String itmail=request.getParameter("itmail");
	    String admail=request.getParameter("admail");
	    System.out.println("gmmail VALUES "+gmmail);
	    System.out.println("hrmail VALUES "+brmail);
	    System.out.println("itmail VALUES "+itmail);
	    System.out.println("admail VALUES "+admail); */
	    
	    
	    System.out.println("trval.............. "+trval); 
	    String transId=request.getParameter(trval);
	    System.out.println("b_no.............. "+b_no);    
	    System.out.println("transId.............. "+transId); 
    
	    
   PreparedStatement psmt100=null,psmtArray31=null;
   //rs = st2.executeQuery("select m_b_name from branch_master_main where m_b_name='"+b_name+"'");
   String selectSQL = "SELECT cs_id FROM cs_master WHERE transid=?";
   psmt100 = conn.prepareStatement("SELECT cs_id FROM cs_master WHERE transid=?");
   psmt100.setString(1,transId);
   ResultSet rs100 = psmt100.executeQuery();
   if(rs100.next())
        {
	    msg = "ALREADY EXIST.......";
        }
     else
        {
        String part1=null;
        String part2=null;
        String part3=null;
        for(int k=0;k<mailingCheck.length;k++)
            {
            //System.out.println("mailingCheck"+mailingCheck[k]);
            String[] parts = mailingCheck[k].split("--");
            part1 = parts[0]; // 004
            part2 = parts[1]; // 004
            part3 = parts[2]; // 004
            //String part2 = parts[1]; // 034556
            }
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
//int idextend= Integer.parseInt(request.getParameter("idextend"));
Date result=null;// = formater.parse(po_date);
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;
try
   {
   result = new Date(sdf.parse(cs_date).getTime());
   }
   catch (Exception e) 
     {
	 // TODO: handle exception
	 e.printStackTrace();
     }
   //System.out.println("result..date..........."+result);
   PreparedStatement psmt = null,psmtString1=null,psmtString2=null,psmtString3=null,psmtString4=null,psmtString5=null,psmtString55=null;
   rs = st2.executeQuery("SELECT max( idextend ),(SELECT MAX(substr(cs_id,12,4)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no) AS increval,(SELECT MAX(substr(cs_id,1,11)) FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no) AS increLoc  FROM cs_master Left Join branch_master On(substr(cs_id,9,2)=branch_master.b_no) WHERE '"+b_no+"'=branch_master.b_no");
   if(rs.next())
       {
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
				psmt = conn.prepareStatement("insert into cs_master(idextend,cs_id,cs_date,city,e_Location,cs_time,e_name,e_designation"+
						",desg,emp,theName,transId,ps_raw,ps_upsworking,ps_upsbackup,ps_upspreventive,isp_router,udb,ln_server,NEWINS"+
						",sr_ac,tm,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,"+
						"quarter_r,main_remarks,mail,Initiator_mail_id,gmmail,brmail,itmail,admail,si_working,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
				psmt.setString(19,"");
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
				psmt.setString(43,"normal");
				i= psmt.executeUpdate();
				
				System.out.println("Insert CS master................................");
			    }
			    catch(Exception e)
			       {
				   System.out.println("Exception "+e);
			       }
	  }
      %>
      <% 
      if(i>=0)
         {
        /*  if(request.getParameter("mpls_name"+len)!= null)
              { */
		      String []item;
	          String mpls_name[]= request.getParameterValues("mpls_name"+len);
			  String mpls_remarks[]= request.getParameterValues("mpls_remarks"+len);
			  System.out.println("mpls_name length---- "+mpls_name.length);
			  String int_name[]= request.getParameterValues("int_name"+len);
		      String phto_name[]= request.getParameterValues("phto_name"+len);
			  String prt_name[]= request.getParameterValues("prt_name"+len);
			  String fx_name[]= request.getParameterValues("fx_name"+len);
			  String br_name[]= request.getParameterValues("br_name"+len);
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
		  	try
			    {
				st3 = conn.createStatement();
				for(int l=1;l<mpls_name.length;l++)
				    {
					String mpls= request.getParameter("mpls"+l);
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
			try
			    {
				st4 = conn.createStatement();
				for(int m=1;m<int_name.length;m++)
				    {
					String internet= request.getParameter("internet"+m);
					psmtArray31 = conn.prepareStatement("insert into internet_item(ii_cs_id,int_name,internet,transId) values(?,?,?,?)");
					psmtArray31.setString(1,new_id);
					psmtArray31.setString(2,int_name[m]);
					psmtArray31.setString(3,internet);
					psmtArray31.setString(4,transId);
					int mm = psmtArray31.executeUpdate();
				    }
				    System.out.println("internet for loop");
			    }
			   catch(Exception e){System.out.println("Catch on m loop"); e.printStackTrace(); }
			   try
			      {	
				  st6 = conn.createStatement();
				  for(int o=1;o<phto_name.length;o++)
				      {
					  String phto= request.getParameter("phto"+o);
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
		      try
		        {
				st7 = conn.createStatement();
				for(int p=1;p<prt_name.length;p++)
				     {
					 String prt= request.getParameter("prt"+p);
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
		       try 
		          {
				  st8 = conn.createStatement();
				  for(int q=1;q<fx_name.length;q++)
				      {
					  String fx= request.getParameter("fx"+q);
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
		         try
		           {
				   st9 = conn.createStatement();
				   for(int r=1;r<br_name.length;r++)
				        {
					    String br= request.getParameter("br"+r);
					    psmtString5 = conn.prepareStatement("insert into barcode_item(br_cs_id,br_name,br,transId) values(?,?,?,?)");
					    psmtString5.setString(1,new_id);
					    psmtString5.setString(2,br_name[r]);
					    psmtString5.setString(3,br);
					    psmtString5.setString(4,transId);
 					    int rr = psmtString5.executeUpdate();
				        }
				        System.out.println("8 for loop");
			      }
			      catch(Exception e){ System.out.println("Catch on r loop"); e.printStackTrace(); }
	    } 
   //}

message = mailMessage.getMailMessage2(new_id.trim());
//pdf.getAttachmentFileOtherBranch(new_id);

pdf.getAttachmentFileOtherBranch1(new_id);

//String ccmail1="chintu.kumar@nipponexpress.com,"+Initiator_mail_id;
System.out.println("after jasper creation.....");

String ccmail1="prasanna.kumar@nipponexpress.com,sharath.kumara@nipponexpress.com,kishan.gowda@nipponexpress.com,chintu.kumar@nipponexpress.com,"+Initiator_mail_id;
//String ccmail1="";
String bhMailId="";


try
	{
	connbh = dbConn.getConnection2();
	stbh=connbh.createStatement();
	rsbh = stbh.executeQuery("SELECT  empmailid FROM formapproval WHERE formtype='CHECKLIST' and levelno='2' AND branch= '"+b_no+"'");
	while(rsbh.next())
	    {
		bhMailId=rsbh.getString("empmailid");
	    } 
    } catch (SQLException ex) { ex.printStackTrace();} 
  finally { 
         }

  String ccmail=ccmail1+","+bhMailId;


  /* System.out.println("ccmail.....CS mail111111111111111111111111111111..........................."+ccmail);
  System.out.println("Initiator_mail_id.....CS mail111111111111111111111111111111..........................."+Initiator_mail_id);
  System.out.println("e_name.....CS mail111111111111111111111111111111..........................."+e_name);
  System.out.println("part3.....CS mail111111111111111111111111111111..........................."+part3);
  System.out.println("new_id.....CS mail111111111111111111111111111111..........................."+new_id); */


postMail.postMailAttachedFile(ccmail1,Initiator_mail_id,e_name,"pass1234",part3,"NEIN-C2IT Check Sheet :  " +new_id+ " ",e_name+  " "+  "Sent Daily Report Check Sheet  " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",new_id);
System.out.println("Length ############################################################## :");
        }
 len++;	
  
}

message = null;
msg = "MAIL__SENT__SUCCESSFULLY";
response.sendRedirect("OtherPage.jsp?msg=" +msg);
conn.close();
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
