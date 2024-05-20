package CON2;

import java.io.IOException;
import  java.sql.*;
import CON2.Connection2;
import CON2.DbUtil;
import java.util.Timer;

import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;
import java.text.SimpleDateFormat;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * Servlet implementation class MgmtReport
 */
@WebServlet("/MgmtReport")
public class MgmtReport implements Job {
	

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		try {
			Report();
			BranchesReport();
			
								
		       } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		     } catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	}
	
	// This Is For Ho All Branches Month Wise Report
public void Report() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
    {
	String cdate=null;
	int year;
	String body;
	String gamail,to=null,to1="",type=null;
	String CCList1,cc=null,cc1="";
	Connection conn,con;
	Connection2 dbConn = new Connection2();
	ConnectionLMS lms=new ConnectionLMS();
	
	int domain1=0,domain2=0;
	int sum_osd=0,sum_domain=0,sum_email=0,sum_acard=0,sum_shared=0,sum_gsnet=0,sum_nexas=0,sum_usb=0,sum_nein=0,sum_log=0,sum_newins=0,sum_incident=0,sum_vpn=0;
    int sum_osd1=0,sum_domain1=0,sum_email1=0,sum_acard1=0,sum_shared1=0,sum_gsnet1=0,sum_nexas1=0,sum_usb1=0,sum_nein1=0,sum_log1=0,sum_newins1=0,sum_incident1=0,sum_vpn1=0; 
	String toempid=null,ccempid=null;
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");
	Date d1=new Date();
	StringBuffer stringBuffer = new StringBuffer();
	   cdate=formatter.format(d1);
	   
	   System.out.println(cdate);
	   String [] Mon=cdate.split("/");
	   String[] dateString = cdate.split("/");
	     year=Integer.parseInt(dateString[2]);
	     year=year-1;
	     String year1=Integer.toString(year);
	     System.out.println("For January Month Year....."+year1 );
	     System.out.println(dateString[1]);
	    
	     if (dateString[1].equals("Jan"))
	     {
	   	  dateString[0]="01";
	   	  dateString[1]="12";
	   	  Mon[1]="December";
	   	  dateString[2]=year1;
	     }
	     if (dateString[1].equals("Feb"))
	     {
	   	  dateString[0]="01";
	   	dateString[1]="01";
	   	Mon[1]="January";
	     }
	     if (dateString[1].equals("Mar"))
	     {
	   	  dateString[1]="02";
	   	dateString[0]="01";
	   	Mon[1]="February";
	     }
	     if (dateString[1].equals("Apr"))
	     {
	   	  dateString[1]="03";
	   	dateString[0]="01";
	   	Mon[1]="Mar";
	     }
	     if (dateString[1].equals("May"))
	     {
	   	  dateString[1]="04";
	   	dateString[0]="01";
	   	Mon[1]="April";
	     }
	     if (dateString[1].equals("Jun"))
	     {
	   	  dateString[1]="05";
	   	dateString[0]="01";
	   	Mon[1]="May";
	     }
	     if (dateString[1].equals("Jul"))
	     {
	   	  dateString[1]="06";
	   	dateString[0]="01";
	   	Mon[1]="June";
	     }
	     if (dateString[1].equals("Aug"))
	     {
	   	  dateString[1]="07";
	   	dateString[0]="01";
	   	Mon[1]="July";
	     }
	     if (dateString[1].equals("Sep"))
	     {
	   	  dateString[1]="08";
	   	dateString[0]="01";
	   	Mon[1]="August";
	     }
	     if (dateString[1].equals("Oct"))
	     {
	   	  dateString[1]="9";
	   	dateString[0]="01";
	   	Mon[1]="September";
	     }
	     if (dateString[1].equals("Nov"))
	     {
	   	  dateString[1]="10";
	   	dateString[0]="01";
	   	Mon[1]="October";
	     }
	     if (dateString[1].equals("Dec"))
	     {
	   	  dateString[1]="11";
	   	dateString[0]="01";
	   	Mon[1]="November";
	     }
	     
	     String start = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
	     String rname=Mon[1]+" "+Mon[2];	     
	String[] dateString1 = cdate.split("/");
	     
	     System.out.println(dateString1[1]);
	    
	     if (dateString1[1].equals("Jan"))
	     {
	   	  dateString1[0]="31";
	   	  dateString1[1]="12";
	   	  dateString1[2]=year1;
	     }
	     if (dateString1[1].equals("Feb"))
	     {
	   	  dateString1[0]="31";
	   	dateString1[1]="01";
	     }
	     if(dateString1[1].equals("Mar"))
	     {
	   	  dateString1[0]="30";
	   	dateString1[1]="02";
	     }
	     
	     if (dateString1[1].equals("Apr"))
	     {
	   	  dateString1[0]="31";
	   	dateString1[1]="03";
	     }
	     if (dateString1[1].equals("May"))
	     {
	   	  dateString1[0]="30";
	   	dateString1[1]="04";
	     }
	     if (dateString1[1].equals("Jun"))
	     {
	   	  dateString1[0]="31";
	   	dateString1[1]="05";
	     }
	     if (dateString1[1].equals("Jul"))
	     {
	   	  dateString1[0]="30";
	   	dateString1[1]="06";
	     }
	     if (dateString1[1].equals("Aug"))
	     {
	   	  dateString1[0]="31";
	   	dateString1[1]="07";
	     }
	     if (dateString1[1].equals("Sep"))
	     {
	   	  dateString1[0]="31";
	   	dateString1[1]="08";
	     }
	     if (dateString1[1].equals("Oct"))
	     {
	   	  dateString1[0]="30";
	   	dateString1[1]="09";
	     }
	     if (dateString1[1].equals("Nov"))
	     {
	   	  dateString1[0]="31";
	   	dateString1[1]="10";
	     }
	     if (dateString1[1].equals("Dec"))
	     {
	   	  dateString1[0]="30";
	   	dateString1[1]="11";
	     }
	     String end = dateString1[2]+"-"+dateString1[1]+"-"+dateString1[0];
	     stringBuffer.append("<html>"+"<head></head>");
	   

	     stringBuffer.append("<body> <p> Dear Sir,</p>"+
	   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp "+
       "Please find C2IT Application forms report for the month "+rname+".");
	   Connection cn3 = null,cn15=null,cn16=null;
	   Statement st=null,st1=null,st3= null,st2=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st10=null,st11=null,st12=null,st13=null,st14=null,st15=null,st16=null,st17=null; 
	   ResultSet rs=null,rs1=null,rs3 = null,rs2=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null,rs12=null,rs13=null,rs14=null,rs15=null,rs16=null,rs17=null;
	   String osd=null,domain=null,Email=null,Access=null,Shared=null,incident=null,Gsnet=null,nexas=null,USB=null,nein=null,Com=null,newins=null,name=null,bno=null,VPN=null;
	   int iosd=0,idomain=0,iemail=0,iaccess=0,ishared=0,igsnet=0,inexas=0,iusb=0,inein=0,ilog=0,inewins=0,iincident=0,ivpn=0;
	   stringBuffer.append(
	   "<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border_collapse=\"Collapse\">"+
	   	"<tr>"+
	   	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">MONTHLY REPORT</font></b></td>"+
	   	"</tr>"+
	   	"<tr>"+
	   	"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname+"</font></b></td>"+
	   	"</tr>"+
	   	"<tr>"+
		"<th>BRANCH</th>"+
		"<th>OSD</th>"+
		"<th>DOMAIN</th>"+
		"<th>EMAIL</th>"+
		"<th>ACCESS CARD</th>"+
		"<th>SHARED FOLDER</th>"+
		"<th>GSNET</th>"+
		"<th>NEXAS</th>"+
		"<th>USB</th>"+
		"<th>VPN</th>"+
		"<th>NEIN INTERNAL S/W</th>"+
		"<th>LOG COMPLAINTS</th>"+
		"<th>NEWINS</th>"+
		"<th>INCIDENT REPORT</th></tr>");
		
	   con=dbConn.getConnection2();
conn = dbConn.getConnection2();	  			
st14=conn.createStatement();
rs14=st14.executeQuery("select * From branch_master_main where m_b_no in('10','90','31','51','20','54','40','30')");
while(rs14.next()){
	name=rs14.getString("m_b_name");
	 bno=rs14.getString("m_b_no");
if(bno.equals("90") || bno.equals("10") || bno.equals("31") || bno.equals("51")){
	System.out.println("Working");
st6=conn.createStatement();
 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')");
while(rs6.next()){
	osd=rs6.getString("Total");
	iosd=Integer.parseInt(osd);
	sum_osd=sum_osd+iosd;

}
st5=conn.createStatement();
rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*) AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs5.next()){
domain=rs5.getString(1);
idomain=Integer.parseInt(domain);
sum_domain=sum_domain+idomain;

}
st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email=sum_email+iemail;
}
st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard=sum_acard+iaccess;
}
st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')))AS combinedResults ");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared=sum_shared+ishared;
}
st7=conn.createStatement();
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet=sum_gsnet+igsnet;
}
st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas=sum_nexas+inexas;
}
st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb=sum_usb+iusb;
}

st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"'");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn=sum_vpn+ivpn;
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')))AS combinedResults ");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein=sum_nein+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log=sum_log+ilog;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident=sum_incident+iincident;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch='"+bno+"')UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins=sum_newins+inewins;

}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else if(bno.equals("30")){
	 System.out.println("Mumbai......");
	 st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd=sum_osd+iosd;

	}
	
	 

	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain=sum_domain+idomain;
	 }
	 


st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email=sum_email+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard=sum_acard+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared=sum_shared+ishared;
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet=sum_gsnet+igsnet;
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas=sum_nexas+inexas;
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb=sum_usb+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn=sum_vpn+ivpn;
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein=sum_nein+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log=sum_log+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins=sum_newins+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident=sum_incident+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else if(bno.equals("40")){
	System.out.println("dghdfhfdjfjfjf");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd=sum_osd+iosd;
	}

	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo) AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	domain1=Integer.parseInt(domain);
	domain2=domain2+domain1;
	System.out.println("domain value"+domain2);
	System.out.println("the domain value for chennai"+domain);
	idomain=Integer.parseInt(domain);
	System.out.println("the parsing domain value for chennai"+domain);
	sum_domain=sum_domain+idomain;
	System.out.println("the sum domain value for chennai"+sum_domain);
	 }


st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email=sum_email+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard=sum_acard+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared=sum_shared+ishared;
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet=sum_gsnet+igsnet;
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas=sum_nexas+inexas;

}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb=sum_usb+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn=sum_vpn+ivpn;
}
st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '\"+start+\"' AND '\"+end+\"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein=sum_nein+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log=sum_log+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins=sum_newins+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident=sum_incident+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else if(bno.equals("54")){
	System.out.println("Remainin");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd=sum_osd+iosd;
	}

	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain=sum_domain+idomain;
	 }
	
st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email=sum_email+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard=sum_acard+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared=sum_shared+ishared;
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet=sum_gsnet+igsnet;

}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas=sum_nexas+inexas;

}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb=sum_usb+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn=sum_vpn+ivpn;
}
st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein=sum_nein+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log=sum_log+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins=sum_newins+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident=sum_incident+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else{
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd=sum_osd+iosd;
	}
	
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain=sum_domain+idomain;
	 }
	

st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email=sum_email+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard=sum_acard+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared=sum_shared+ishared;
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet=sum_gsnet+igsnet;
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas=sum_nexas+inexas;
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb=sum_usb+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn=sum_vpn+ivpn;
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein=sum_nein+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log=sum_log+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ( (SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins=sum_newins+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident=sum_incident+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">TOTAL</td>"+
"<td align=\"center\">"+sum_osd+"</td>"+
"<td align=\"center\">"+sum_domain+"</td>"+
"<td align=\"center\">"+sum_email+"</td>"+
"<td align=\"center\">"+sum_acard+"</td>"+
"<td align=\"center\">"+sum_shared+"</td>"+
"<td align=\"center\">"+sum_gsnet+"</td>"+
"<td align=\"center\">"+sum_nexas+"</td>"+
"<td align=\"center\">"+sum_usb+"</td>"+
"<td align=\"center\">"+sum_vpn+"</td>"+
"<td align=\"center\">"+sum_nein+"</td>"+
"<td align=\"center\">"+sum_log+"</td>"+
"<td align=\"center\">"+sum_newins+"</td>"+
"<td align=\"center\">"+sum_incident+"</td>"+
"</tr>"+"</table>"+"<br/>");







//this is for HO All Branches Cumulative report





String dateString2[]=cdate.split("/");
if(dateString2[1].equals("Jan")){
	dateString2[0]="31";
	dateString2[1]="12";
	dateString2[2]=year1;
}
if(dateString2[1].equals("Feb")){
	dateString2[0]="31";
	dateString2[1]="01";
	
}
if(dateString2[1].equals("Mar")){
	dateString2[0]="30";
	dateString2[1]="02";
}

if(dateString2[1].equals("Apr")){
	dateString2[0]="31";
	dateString2[1]="03";
}
if(dateString2[1].equals("May")){
	dateString2[0]="30";
	dateString2[1]="04";
}
if(dateString2[1].equals("Jun"))		
{
	dateString2[0]="31";
	dateString2[1]="05";
}
if(dateString2[1].equals("Jul")){
	dateString2[0]="30";
	dateString2[1]="06";
}
if(dateString2[1].equals("Aug")){
	dateString2[0]="31";
	dateString2[1]="07";
}
if(dateString2[1].equals("Sep")){
	dateString2[0]="31";
	dateString2[1]="08";
}
if(dateString2[1].equals("Oct")){
	dateString2[0]="30";
	dateString2[1]="09";
	
}
if(dateString2[1].equals("Nov")){
	dateString2[0]="31";
	dateString2[1]="10";
}
if(dateString2[1].equals("Dec")){
	dateString2[0]="30";
	dateString2[1]="11";
}
start=dateString2[2]+"-"+"01"+"-"+"01";
end=dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
String rname1="YTD"+"--"+Mon[1]+" "+Mon[2];
stringBuffer.append("<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+
"<tr>"+
	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">CUMULATIVE REPORT</font></b></td>"+
	"</tr>"+
"<tr>"+
"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname1+"</font></b></td>"+
"</tr>"+

"<tr>"+
"<th>BRANCH</th>"+
"<th>OSD</th>"+
"<th>DOMAIN</th>"+
"<th>EMAIL</th>"+
"<th>ACCESS CARD</th>"+
"<th>SHARED FOLDER</th>"+
"<th>GSNET</th>"+
"<th>NEXAS</th>"+
"<th>USB</th>"+
"<th>VPN</th>"+
"<th>NEIN INTERNAL S/W</th>"+
"<th>LOG COMPLAINTS</th>"+
"<th>NEWINS</th>"+
"<th>INCIDENT REPORT</th></tr>");

con=dbConn.getConnection2();
conn = dbConn.getConnection2();	  			
st14=conn.createStatement();
rs14=st14.executeQuery("select * From branch_master_main where m_b_no in('10','90','31','51','20','54','40','30')");
while(rs14.next()){
	name=rs14.getString("m_b_name");
	 bno=rs14.getString("m_b_no");
if(bno.equals("90") || bno.equals("10") || bno.equals("31") || bno.equals("51")){
	System.out.println("Working");
st6=conn.createStatement();
 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')");
while(rs6.next()){
	osd=rs6.getString("Total");
	iosd=Integer.parseInt(osd);
	sum_osd1=sum_osd1+iosd;
}
st5=conn.createStatement();
rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs5.next()){
domain=rs5.getString(1);
idomain=Integer.parseInt(domain);
sum_domain1=sum_domain1+idomain;
}
st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email1=sum_email1+iemail;
}
st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard1=sum_acard1+iaccess;
}
st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared1=sum_shared1+ishared;
}
st7=conn.createStatement();
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet1=sum_gsnet1+igsnet;
}
st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas1=sum_nexas1+inexas;
}
st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb1=sum_usb1+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn1=sum_vpn1+ivpn;
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein1=sum_nein1+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log1=sum_log1+ilog;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident1=sum_incident1+iincident;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins1=sum_newins1+inewins;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else if(bno.equals("30")){
	 System.out.println("Mumbai......");
	 st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd1=sum_osd1+iosd;

	}
	
	 

	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain1=sum_domain1+idomain;
	 }
	 


st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email1=sum_email1+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard1=sum_acard1+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared1=sum_shared1+ishared;
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet1=sum_gsnet1+igsnet;
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas1=sum_nexas1+inexas;
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb1=sum_usb1+iusb;
}

st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn1=sum_vpn1+ivpn;
}


st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein1=sum_nein1+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log1=sum_log1+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins1=sum_newins1+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident1=sum_incident1+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else if(bno.equals("40")){
	System.out.println("dghdfhfdjfjfjf");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd1=sum_osd1+iosd;
	}

	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain1=sum_domain1+idomain;
	 }


st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email1=sum_email1+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard1=sum_acard1+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared1=sum_shared1+ishared;
}


st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet1=sum_gsnet1+igsnet;
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas1=sum_nexas1+inexas;
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb1=sum_usb1+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn1=sum_vpn1+ivpn;
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein1=sum_nein1+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log1=sum_log1+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins1=sum_newins1+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident1=sum_incident1+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else if(bno.equals("54")){
	System.out.println("Remainin");
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd1=sum_osd1+iosd;
	}

	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain1=sum_domain1+idomain;
	 }
	
st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email1=sum_email1+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard1=sum_acard1+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared1=sum_shared1+ishared;
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet1=sum_gsnet1+igsnet;
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas1=sum_nexas1+inexas;
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb1=sum_usb1+iusb;
}

st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn1=sum_vpn1+ivpn;
}
st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein1=sum_nein1+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log1=sum_log1+ilog;
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins1=sum_newins1+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident1=sum_incident1+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}else{
	st6=conn.createStatement();
	 rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs6.next()){
		osd=rs6.getString("Total");
		iosd=Integer.parseInt(osd);
		sum_osd1=sum_osd1+iosd;
	}
	
	 st5=conn.createStatement();
	 rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	 "UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	 while(rs5.next()){
	domain=rs5.getString(1);
	idomain=Integer.parseInt(domain);
	sum_domain1=sum_domain1+idomain;
	 }
	

st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
iemail=Integer.parseInt(Email);
sum_email1=sum_email1+iemail;
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
iaccess=Integer.parseInt(Access);
sum_acard1=sum_acard1+iaccess;
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
ishared=Integer.parseInt(Shared);
sum_shared1=sum_shared1+ishared;

}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
igsnet=Integer.parseInt(Gsnet);
sum_gsnet1=sum_gsnet1+igsnet;

}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '\"+start+\"' AND '\"+end+\"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
inexas=Integer.parseInt(nexas);
sum_nexas1=sum_nexas1+inexas;
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
iusb=Integer.parseInt(USB);
sum_usb1=sum_usb1+iusb;
}
st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28')");
while(rs16.next()){
VPN=rs16.getString(1);
ivpn=Integer.parseInt(VPN);
sum_vpn1=sum_vpn1+ivpn;
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
inein=Integer.parseInt(nein);
sum_nein1=sum_nein1+inein;
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')");
while(rs11.next()){
Com=rs11.getString(1);
ilog=Integer.parseInt(Com);
sum_log1=sum_log1+ilog;

}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
inewins=Integer.parseInt(newins);
sum_newins1=sum_newins1+inewins;
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
while(rs12.next()){
incident=rs12.getString(1);
iincident=Integer.parseInt(incident);
sum_incident1=sum_incident1+iincident;
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>");
}
}
stringBuffer.append(
"<tr>"+
"<td align=\"left\">TOTAL</td>"+
"<td align=\"center\">"+sum_osd1+"</td>"+
"<td align=\"center\">"+sum_domain1+"</td>"+
"<td align=\"center\">"+sum_email1+"</td>"+
"<td align=\"center\">"+sum_acard1+"</td>"+
"<td align=\"center\">"+sum_shared1+"</td>"+
"<td align=\"center\">"+sum_gsnet1+"</td>"+
"<td align=\"center\">"+sum_nexas1+"</td>"+
"<td align=\"center\">"+sum_usb1+"</td>"+
"<td align=\"center\">"+sum_vpn1+"</td>"+
"<td align=\"center\">"+sum_nein1+"</td>"+
"<td align=\"center\">"+sum_log1+"</td>"+
"<td align=\"center\">"+sum_newins1+"</td>"+
"<td align=\"center\">"+sum_incident1+"</td>"+
"</tr>"+
"</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" +
"<br><br><br><br><br><br><br><br><br><br><br><br><br><h3><b>Note : This is a system generated Email.</b></h3>");

String c2iturl="https://neinsoft.nittsu.co.in:8185/NEIN-C2IT";
String nurl="https://neinsoft.nittsu.co.in:8185/NEIN";
stringBuffer.append("<h3>"+ c2iturl+ " <br>"+ nurl+" </h3>"
+ "</body>"+
   		"</html>"); 
body=stringBuffer.toString();
st1=conn.createStatement();
rs1=st1.executeQuery("SELECT b.email,a.Mail_Type FROM leavemanagement.user b INNER JOIN csdb.mail_notifications a on b.emp_id=a.empid where a.branch_no='91'");
while(rs1.next()){
	gamail=rs1.getString(1);
	type=rs1.getString(2);
	if(type.equals("To")){
	to=gamail.concat(",");
	to1=to+to1;
	}else{
		cc=gamail.concat(",");
		cc1=cc1+cc;
	}
		
	}

	/*
	 * to1="neinsoft.support@nipponexpress.com"; cc1="";
	 */
System.out.println("The CC Values is...."+cc1);
System.out.println("The to Values is...."+to1);

new NormalMail().sendMail("C2IT Report",to1,cc1,body, "NEIN-C2IT : APPLICATION FORMS REPORT: "+rname+"");

}



public void BranchesReport() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, UnsupportedEncodingException
{
	String cdate=null;
	int year;
	String body;
	String gamail=null;
	String type=null;
	Connection conn,con;
	Connection2 dbConn = new Connection2();
	ConnectionLMS lms=new ConnectionLMS();
	 Connection cn3 = null;
	   Statement st=null,st1=null,st3= null,st2=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st10=null,st11=null,st12=null,st13=null,st14=null,st15=null,st16=null; 
	   ResultSet rs=null,rs1=null,rs3 = null,rs2=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null,rs12=null,rs13=null,rs14=null,rs15=null,rs16=null;
	   String osd=null,domain=null,Email=null,Access=null,Shared=null,incident=null,Gsnet=null,nexas=null,USB=null,nein=null,Com=null,newins=null,name=null,bno=null
	   ,cc=null,cc1="",to=null,to1="",VPN=null;

	     
		   con=dbConn.getConnection2();
		   conn = dbConn.getConnection2();
		   st14=conn.createStatement();
		   rs14=st14.executeQuery("select * From branch_master_main where m_b_no in('10','90','31','51','20','54','40','30')");
		   while(rs14.next()){
		   	name=rs14.getString("m_b_name");
		   	 bno=rs14.getString("m_b_no");
		 	SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");
			Date d1=new Date();
			   cdate=formatter.format(d1);
			   System.out.println(cdate);
			   String [] Mon=cdate.split("/");
			   String[] dateString = cdate.split("/");
			     year=Integer.parseInt(dateString[2]);
			     year=year-1;
			     String year1=Integer.toString(year);
			     System.out.println(dateString[1]);
			    
			     if (dateString[1].equals("Jan"))
			     {
			   	  dateString[0]="01";
			   	  dateString[1]="12";
			   	  dateString[2]=year1;
			   	 Mon[1]="December";
			     }
			     if (dateString[1].equals("Feb"))
			     {
			   	  dateString[0]="01";
			   	dateString[1]="01";
			   	Mon[1]="January";
			     }
			     if (dateString[1].equals("Mar"))
			     {
			   	  dateString[1]="02";
			   	dateString[0]="01";
			   	Mon[1]="February";
			     }
			     if (dateString[1].equals("Apr"))
			     {
			   	  dateString[1]="03";
			   	dateString[0]="01";
			   	Mon[1]="March";
			     }
			     if (dateString[1].equals("May"))
			     {
			   	  dateString[1]="04";
			   	dateString[0]="01";
			   	Mon[1]="April";
			     }
			     if (dateString[1].equals("Jun"))
			     {
			   	  dateString[1]="05";
			   	dateString[0]="01";
			   	Mon[1]="May";
			     }
			     if (dateString[1].equals("Jul"))
			     {
			   	  dateString[1]="06";
			   	dateString[0]="01";
			   	Mon[1]="June";
			     }
			     if (dateString[1].equals("Aug"))
			     {
			   	  dateString[1]="07";
			   	dateString[0]="01";
			   	Mon[1]="July";
			     }
			     if (dateString[1].equals("Sep"))
			     {
			   	  dateString[1]="08";
			   	dateString[0]="01";
			   	Mon[1]="August";
			     }
			     if (dateString[1].equals("Oct"))
			     {
			   	  dateString[1]="9";
			   	dateString[0]="01";
			   	Mon[1]="September";
			     }
			     if (dateString[1].equals("Nov"))
			     {
			   	  dateString[1]="10";
			   	dateString[0]="01";
			   	Mon[1]="October";
			     }
			     if (dateString[1].equals("Dec"))
			     {
			   	  dateString[1]="11";
			   	dateString[0]="01";
			   	Mon[1]="November";
			     }
			     
			     String start = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
			     String rname=Mon[1]+" "+Mon[2];
			     
			String[] dateString1 = cdate.split("/");
			     
			     System.out.println(dateString1[1]);
			    
			     if (dateString1[1].equals("Jan"))
			     {
			   	  dateString1[0]="31";
			   	  dateString1[1]="12";
			   	  dateString1[2]=year1;
			     }
			     if (dateString1[1].equals("Feb"))
			     {
			   	  dateString1[0]="31";
			   	dateString1[1]="01";
			     }
			     if (dateString1[1].equals("Mar"))
			     {
			   	  dateString1[0]="30";
			   	dateString1[1]="02";
			     }
			     if (dateString1[1].equals("Apr"))
			     {
			   	  dateString1[0]="31";
			   	dateString1[1]="03";
			     }
			     if (dateString1[1].equals("May"))
			     {
			   	  dateString1[0]="30";
			   	dateString1[1]="04";
			     }
			     if (dateString1[1].equals("Jun"))
			     {
			   	  dateString1[0]="31";
			   	dateString1[1]="05";
			     }
			     if (dateString1[1].equals("Jul"))
			     {
			   	  dateString1[0]="30";
			   	dateString1[1]="06";
			     }
			     if (dateString1[1].equals("Aug"))
			     {
			   	  dateString1[0]="31";
			   	dateString1[1]="07";
			     }
			     if (dateString1[1].equals("Sep"))
			     {
			   	  dateString1[0]="31";
			   	dateString1[1]="08";
			     }
			     if (dateString1[1].equals("Oct"))
			     {
			   	  dateString1[0]="30";
			   	dateString1[1]="09";
			     }
			     if (dateString1[1].equals("Nov"))
			     {
			   	  dateString1[0]="31";
			   	dateString1[1]="10";
			     }
			     if (dateString1[1].equals("Dec"))
			     {
			   	  dateString1[0]="30";
			   	dateString1[1]="11";
			     }
			     String end = dateString1[2]+"-"+dateString1[1]+"-"+dateString1[0];	   	 
	     
	     body="<html>"+"<head></head>";
		  /* body=body+"<style>"+"table{position:absolute; " +"z-index:2;"+"left:50%;"+"transform:translate(-50%,-50%);"+"width:60%"+"border-collapse:collapse;"+
		   "border-spacing:0;"+"border-radius:12px 12px 0 0;"+"overflow:auto;"+"box-shadow:0 12px rgba(32,32,32,.3);"+"background:#fafafa;"+"text-align:center;}"+"th,td{padding:10px 10px;}"+"th{backgroun:#ba68c8;"+"color:#fafafa;"+"text-transform:uppercase;"+"font-family:sans-serif;"+"td:nth-child(odd){backgrounf-color:#eeeeee;}";
		   body=body+"</style>"+"</head>";*/
		   body=body+"<body> <p> Dear Sir,</p>"+
		   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp"+
		   "Please find C2IT Application forms report for the month "+rname+".";
	
	  
	 body=body+
	"<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+

   	"<tr>"+
   	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">MONTHLY REPORT</font></b></td>"+
   	"</tr>"+
   	"<tr>"+
   	"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname+"</font></b></td>"+
   	"</tr>"+
   	"<tr>"+
   	"<th>BRANCH</th>"+
	"<th>OSD</th>"+
	"<th>DOMAIN</th>"+
	"<th>EMAIL</th>"+
	"<th>ACCESS CARD</th>"+
	"<th>SHARED FOLDER</th>"+
	"<th>GSNET</th>"+
	"<th>NEXAS</th>"+
	"<th>USB</th>"+
	"<th>VPN</th>"+
	"<th>NEIN INTERNAL S/W</th>"+
	"<th>LOG COMPLAINTS</th>"+
	"<th>NEWINS</th>"+
	"<th>INCIDENT REPORT</th></tr>";
	
	 if(bno.equals("10") || bno.equals("90") || bno.equals("31") || bno.equals("51")){
st6=conn.createStatement();
rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')");
while(rs6.next()){
	osd=rs6.getString("Total");
}

st5=conn.createStatement();
rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs5.next()){
domain=rs5.getString(1);
}

st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
}

st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"')");
while(rs16.next()){
VPN=rs16.getString(1);

}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')");
while(rs11.next()){
Com=rs11.getString(1);
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')");
while(rs12.next()){
incident=rs12.getString(1);
}
body=body+
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>";
body=body+"</table><br>";


String dateString2[]=cdate.split("/");
if(dateString2[1].equals("Jan")){
	dateString2[0]="31";
	dateString2[1]="12";
	dateString2[2]=year1;
}
if(dateString2[1].equals("Feb")){
	dateString2[0]="31";
	dateString2[1]="01";
	
}
if (dateString2[1].equals("Mar"))
{
	  dateString2[0]="30";
	dateString2[1]="02";
}

if(dateString2[1].equals("Apr")){
	dateString2[0]="31";
	dateString2[1]="03";
}
if(dateString2[1].equals("May")){
	dateString2[0]="30";
	dateString2[1]="04";
}
if(dateString2[1].equals("Jun"))		
{
	dateString2[0]="31";
	dateString2[1]="05";
}
if(dateString2[1].equals("Jul")){
	dateString2[0]="30";
	dateString2[1]="06";
}
if(dateString2[1].equals("Aug")){
	dateString2[0]="31";
	dateString2[1]="07";
}
if(dateString2[1].equals("Sep")){
	dateString2[0]="31";
	dateString2[1]="08";
}
if(dateString2[1].equals("Oct")){
	dateString2[0]="30";
	dateString2[1]="09";
	
}
if(dateString2[1].equals("Nov")){
	dateString2[0]="31";
	dateString2[1]="10";
}
if(dateString2[1].equals("Dec")){
	dateString2[0]="30";
	dateString2[1]="11";
}
start=dateString2[2]+"-"+"01"+"-"+"01";
end=dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
String rname1="YTD"+"--"+Mon[1]+" "+Mon[2];
body=body+"<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+
"<tr>"+
"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">CUMULATIVE REPORT</font></b></td>"+
"</tr>"+
"<tr>"+
"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname1+"</font></b></td>"+
"</tr>"+
"<tr>"+
"<th>BRANCH</th>"+
"<th>OSD</th>"+
"<th>DOMAIN</th>"+
"<th>EMAIL</th>"+
"<th>ACCESS CARD</th>"+
"<th>SHARED FOLDER</th>"+
"<th>GSNET</th>"+
"<th>NEXAS</th>"+
"<th>USB</th>"+
"<th>VPN</th>"+
"<th>NEIN INTERNAL S/W</th>"+
"<th>LOG COMPLAINTS</th>"+
"<th>NEWINS</th>"+
"<th>INCIDENT REPORT</th></tr>";
con=dbConn.getConnection2();
conn=dbConn.getConnection2();
st6=conn.createStatement();
rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('"+bno+"')");
while(rs6.next()){
	osd=rs6.getString("Total");
}



st5=conn.createStatement();
rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs5.next()){
domain=rs5.getString(1);
}



st4=conn.createStatement();
rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs4.next()){
Email=rs4.getString(1);
}

st3=conn.createStatement();
rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo) AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('"+bno+"')))AS combinedResults");
while(rs3.next()){
Access=rs3.getString(1);
}

st2=conn.createStatement();
rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('"+bno+"')))AS combinedResults");
while(rs2.next()){
Shared=rs2.getString(1);
}

st7=conn.createStatement();    
rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs7.next()){
Gsnet=rs7.getString(1);
}

st9=conn.createStatement();
rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('"+bno+"')))AS combinedResults");
while(rs9.next()){
nexas=rs9.getString(1);
}

st10=conn.createStatement();
rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('"+bno+"')))AS combinedResults");
while(rs10.next()){
USB=rs10.getString(1);
}

st16=conn.createStatement();
rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"')");
while(rs16.next()){
VPN=rs16.getString(1);
}

st15=conn.createStatement();
rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('"+bno+"')))AS combinedResults");
while(rs15.next()){
nein=rs15.getString(1);
}

st11=conn.createStatement();
rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('"+bno+"')");
while(rs11.next()){
Com=rs11.getString(1);
}

st13=conn.createStatement();
rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('"+bno+"'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('"+bno+"')))AS combinedResults");
while(rs13.next()){
newins=rs13.getString(1);
}

st12=conn.createStatement();
rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('"+bno+"')");
while(rs12.next()){
incident=rs12.getString(1);
}
body=body+
"<tr>"+
"<td align=\"left\">"+name+"</td>"+
"<td align=\"center\">"+osd+"</td>"+
"<td align=\"center\">"+domain+"</td>"+
"<td align=\"center\">"+Email+"</td>"+
"<td align=\"center\">"+Access+"</td>"+
"<td align=\"center\">"+Shared+"</td>"+
"<td align=\"center\">"+Gsnet+"</td>"+
"<td align=\"center\">"+nexas+"</td>"+
"<td align=\"center\">"+USB+"</td>"+
"<td align=\"center\">"+VPN+"</td>"+
"<td align=\"center\">"+nein+"</td>"+
"<td align=\"center\">"+Com+"</td>"+
"<td align=\"center\">"+newins+"</td>"+
"<td align=\"center\">"+incident+"</td>"+
"</tr>"+
"</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" +
"<h3><b>Note : This is a system generated Email.</b></h3>";
String c2iturl="https://neinsoft.nittsu.co.in:8185/NEIN-C2IT";
String nurl="https://neinsoft.nittsu.co.in:8185/NEIN";
body=body+"<h3>"+ c2iturl+ " <br>"+ nurl+" </h3>";
body=body+ "</body>"+
	"</html>"; 
st1=conn.createStatement();
rs1=st1.executeQuery("SELECT b.email,a.Mail_Type FROM leavemanagement.user b INNER JOIN csdb.mail_notifications a on b.emp_id=a.empid where a.branch_no='"+bno+"'");
while(rs1.next()){
	gamail=rs1.getString(1);
	type=rs1.getString(2);
	if(type.equals("To")){
	to=gamail.concat(",");
	to1=to+to1;
	}else{
		cc=gamail.concat(",");
		cc1=cc1+cc;
	}
		
	}

	/*
	 * to1="neinsoft.support@nipponexpress.com"; cc1="";
	 */
new NormalMail().sendMail("C2IT Report",to1,cc1,body, "NEIN-C2IT : APPLICATION FORMS REPORT: "+rname+"");

	 
}else if(bno.equals("20")) {
	conn=dbConn.getConnection2();
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}

st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}
st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs11.next()){
	Com=rs11.getString(1);
	}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>";
	body=body+"</table><br>";


	String dateString2[]=cdate.split("/");
	if(dateString2[1].equals("Jan")){
		dateString2[0]="31";
		dateString2[1]="12";
		dateString2[2]=year1;
	}
	if(dateString2[1].equals("Feb")){
		dateString2[0]="31";
		dateString2[1]="01";
		
	}
	if (dateString2[1].equals("Mar"))
	{
		  dateString2[0]="30";
		dateString2[1]="02";
	}

	if(dateString2[1].equals("Apr")){
		dateString2[0]="31";
		dateString2[1]="03";
	}
	if(dateString2[1].equals("May")){
		dateString2[0]="30";
		dateString2[1]="04";
	}
	if(dateString2[1].equals("Jun"))		
	{
		dateString2[0]="31";
		dateString2[1]="05";
	}
	if(dateString2[1].equals("Jul")){
		dateString2[0]="30";
		dateString2[1]="06";
	}
	if(dateString2[1].equals("Aug")){
		dateString2[0]="31";
		dateString2[1]="07";
	}
	if(dateString2[1].equals("Sep")){
		dateString2[0]="31";
		dateString2[1]="08";
	}
	if(dateString2[1].equals("Oct")){
		dateString2[0]="30";
		dateString2[1]="09";
		
	}
	if(dateString2[1].equals("Nov")){
		dateString2[0]="31";
		dateString2[1]="10";
	}
	if(dateString2[1].equals("Dec")){
		dateString2[0]="30";
		dateString2[1]="11";
	}
	start=dateString2[2]+"-"+"01"+"-"+"01";
	end=dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
	String rname1="YTD"+"--"+Mon[1]+" "+Mon[2];
	body=body+"<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+
	"<tr>"+
	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">CUMULATIVE REPORT</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname1+"</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<th>BRANCH</th>"+
	"<th>OSD</th>"+
	"<th>DOMAIN</th>"+
	"<th>EMAIL</th>"+
	"<th>ACCESS CARD</th>"+
	"<th>SHARED FOLDER</th>"+
	"<th>GSNET</th>"+
	"<th>NEXAS</th>"+
	"<th>USB</th>"+
	"<th>VPN</th>"+
	"<th>NEIN INTERNAL S/W</th>"+
	"<th>LOG COMPLAINTS</th>"+
	"<th>NEWINS</th>"+
	"<th>INCIDENT REPORT</th></tr>";
	con=dbConn.getConnection2();
	conn=dbConn.getConnection2();
  	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}

	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs11.next()){
	Com=rs11.getString(1);
	}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('20','21','88','89','22','23','24','25','26','27','28'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('20','21','88','89','22','23','24','25','26','27','28')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('20','21','88','89','22','23','24','25','26','27','28')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>"+
	"</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" +
	"<h3><b>Note : This is a system generated Email.</b></h3>";
	String c2iturl="https://neinsoft.nittsu.co.in:8185/NEIN-C2IT";
	String nurl="https://neinsoft.nittsu.co.in:8185/NEIN";
	body=body+"<h3>"+ c2iturl+ " <br>"+ nurl+" </h3>";
	body=body+ "</body>"+
		"</html>"; 
	st1=conn.createStatement();
	rs1=st1.executeQuery("SELECT b.email,a.Mail_Type FROM leavemanagement.user b INNER JOIN csdb.mail_notifications a on b.emp_id=a.empid where a.branch_no='"+bno+"'");
	while(rs1.next()){
		gamail=rs1.getString(1);
		type=rs1.getString(2);
		if(type.equals("To")){
		to=gamail.concat(",");
		to1=to+to1;
		}else{
			cc=gamail.concat(",");
			cc1=cc1+cc;
		}
			
		}

		/*
		 * to1="neinsoft.support@nipponexpress.com"; cc1="";
		 */
	new NormalMail().sendMail("C2IT Report",to1,cc1,body, "NEIN-C2IT : APPLICATION FORMS REPORT: "+rname+"");
	
	
}else if(bno.equals("30")) {
	conn=dbConn.getConnection2();
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}

	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')");
	while(rs11.next()){
	Com=rs11.getString(1);
	}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>";
	body=body+"</table><br>";


	String dateString2[]=cdate.split("/");
	if(dateString2[1].equals("Jan")){
		dateString2[0]="31";
		dateString2[1]="12";
		dateString2[2]=year1;
	}
	if(dateString2[1].equals("Feb")){
		dateString2[0]="31";
		dateString2[1]="01";
		
	}
	if (dateString2[1].equals("Mar"))
	{
		  dateString2[0]="30";
		dateString2[1]="02";
	}

	if(dateString2[1].equals("Apr")){
		dateString2[0]="31";
		dateString2[1]="03";
	}
	if(dateString2[1].equals("May")){
		dateString2[0]="30";
		dateString2[1]="04";
	}
	if(dateString2[1].equals("Jun"))		
	{
		dateString2[0]="31";
		dateString2[1]="05";
	}
	if(dateString2[1].equals("Jul")){
		dateString2[0]="30";
		dateString2[1]="06";
	}
	if(dateString2[1].equals("Aug")){
		dateString2[0]="31";
		dateString2[1]="07";
	}
	if(dateString2[1].equals("Sep")){
		dateString2[0]="31";
		dateString2[1]="08";
	}
	if(dateString2[1].equals("Oct")){
		dateString2[0]="30";
		dateString2[1]="09";
		
	}
	if(dateString2[1].equals("Nov")){
		dateString2[0]="31";
		dateString2[1]="10";
	}
	if(dateString2[1].equals("Dec")){
		dateString2[0]="30";
		dateString2[1]="11";
	}
	start=dateString2[2]+"-"+"01"+"-"+"01";
	end=dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
	String rname1="YTD"+"--"+Mon[1]+" "+Mon[2];
	body=body+"<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+
	"<tr>"+
	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">CUMULATIVE REPORT</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname1+"</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<th>BRANCH</th>"+
	"<th>OSD</th>"+
	"<th>DOMAIN</th>"+
	"<th>EMAIL</th>"+
	"<th>ACCESS CARD</th>"+
	"<th>SHARED FOLDER</th>"+
	"<th>GSNET</th>"+
	"<th>NEXAS</th>"+
	"<th>USB</th>"+
	"<th>VPN</th>"+
	"<th>NEIN INTERNAL S/W</th>"+
	"<th>LOG COMPLAINTS</th>"+
	"<th>NEWINS</th>"+
	"<th>INCIDENT REPORT</th></tr>";
	con=dbConn.getConnection2();
	conn = dbConn.getConnection2();	  			
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('30','53','32','11')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('30','53','32','11')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('30','53','32','11')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('30','53','32','11')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('30','53','32','11')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('30','53','32','11')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('30','53','32','11')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('30','53','32','11')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}

	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('30','53','32','11')");
	while(rs11.next()){
	Com=rs11.getString(1);
	}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('30','53','32','11'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('30','53','32','11')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('30','53','32','11')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>"+
	"</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" +
	"<h3><b>Note : This is a system generated Email.</b></h3>";
	String c2iturl="https://neinsoft.nittsu.co.in:8185/NEIN-C2IT";
	String nurl="https://neinsoft.nittsu.co.in:8185/NEIN";
	body=body+"<h3>"+ c2iturl+ " <br>"+ nurl+" </h3>";
	body=body+ "</body>"+
		"</html>"; 
	st1=conn.createStatement();
	rs1=st1.executeQuery("SELECT b.email,a.Mail_Type FROM leavemanagement.user b INNER JOIN csdb.mail_notifications a on b.emp_id=a.empid where a.branch_no='"+bno+"'");
	while(rs1.next()){
		gamail=rs1.getString(1);
		type=rs1.getString(2);
		if(type.equals("To")){
		to=gamail.concat(",");
		to1=to+to1;
		}else{
			cc=gamail.concat(",");
			cc1=cc1+cc;
		}
			
		}

		/*
		 * to1="neinsoft.support@nipponexpress.com"; cc1="";
		 */
	new NormalMail().sendMail("C2IT Report",to1,cc1,body, "NEIN-C2IT : APPLICATION FORMS REPORT: "+rname+"");
}else if(bno.equals("40")) {
	conn=dbConn.getConnection2();
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}

	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')");
	while(rs11.next()){
	Com=rs11.getString(1);
	}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>";
	body=body+"</table><br>";


	String dateString2[]=cdate.split("/");
	if(dateString2[1].equals("Jan")){
		dateString2[0]="31";
		dateString2[1]="12";
		dateString2[2]=year1;
	}
	if(dateString2[1].equals("Feb")){
		dateString2[0]="31";
		dateString2[1]="01";
		
	}
	if (dateString2[1].equals("Mar"))
	{
		  dateString2[0]="30";
		dateString2[1]="02";
	}

	if(dateString2[1].equals("Apr")){
		dateString2[0]="31";
		dateString2[1]="03";
	}
	if(dateString2[1].equals("May")){
		dateString2[0]="30";
		dateString2[1]="04";
	}
	if(dateString2[1].equals("Jun"))		
	{
		dateString2[0]="31";
		dateString2[1]="05";
	}
	if(dateString2[1].equals("Jul")){
		dateString2[0]="30";
		dateString2[1]="06";
	}
	if(dateString2[1].equals("Aug")){
		dateString2[0]="31";
		dateString2[1]="07";
	}
	if(dateString2[1].equals("Sep")){
		dateString2[0]="31";
		dateString2[1]="08";
	}
	if(dateString2[1].equals("Oct")){
		dateString2[0]="30";
		dateString2[1]="09";
		
	}
	if(dateString2[1].equals("Nov")){
		dateString2[0]="31";
		dateString2[1]="10";
	}
	if(dateString2[1].equals("Dec")){
		dateString2[0]="30";
		dateString2[1]="11";
	}
	start=dateString2[2]+"-"+"01"+"-"+"01";
	end=dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
	String rname1="YTD"+"--"+Mon[1]+" "+Mon[2];
	body=body+"<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+
	"<tr>"+
	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">CUMULATIVE REPORT</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname1+"</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<th>BRANCH</th>"+
	"<th>OSD</th>"+
	"<th>DOMAIN</th>"+
	"<th>EMAIL</th>"+
	"<th>ACCESS CARD</th>"+
	"<th>SHARED FOLDER</th>"+
	"<th>GSNET</th>"+
	"<th>NEXAS</th>"+
	"<th>USB</th>"+
	"<th>VPN</th>"+
	"<th>NEIN INTERNAL S/W</th>"+
	"<th>LOG COMPLAINTS</th>"+
	"<th>NEWINS</th>"+
	"<th>INCIDENT REPORT</th></tr>";
	con=dbConn.getConnection2();
	conn=dbConn.getConnection2();		
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('40','52','41','43')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('40','52','41','43')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('40','52','41','43')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('40','52','41','43')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('40','52','41','43')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('40','52','41','43')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('40','52','41','43')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('40','52','41','43')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}

	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('40','52','41','43')");
	while(rs11.next()){
	Com=rs11.getString(1);
	}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('40','52','41','43'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('40','52','41','43')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('40','52','41','43')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>"+
	"</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" +
	"<h3><b>Note : This is a system generated Email.</b></h3>";
	String c2iturl="https://neinsoft.nittsu.co.in:8185/NEIN-C2IT";
	String nurl="https://neinsoft.nittsu.co.in:8185/NEIN";
	body=body+"<h3>"+ c2iturl+ " <br>"+ nurl+" </h3>";
	body=body+ "</body>"+
		"</html>"; 
	st1=conn.createStatement();
	rs1=st1.executeQuery("SELECT b.email,a.Mail_Type FROM leavemanagement.user b INNER JOIN csdb.mail_notifications a on b.emp_id=a.empid where a.branch_no='"+bno+"'");
	while(rs1.next()){
		gamail=rs1.getString(1);
		type=rs1.getString(2);
		if(type.equals("To")){
		to=gamail.concat(",");
		to1=to+to1;
		}else{
			cc=gamail.concat(",");
			cc1=cc1+cc;
		}
			
		}

		/*
		 * to1="neinsoft.support@nipponexpress.com"; cc1="";
		 */
	new NormalMail().sendMail("C2IT Report",to1,cc1,body, "NEIN-C2IT : APPLICATION FORMS REPORT: "+rname+"");
}else {
	
	conn=dbConn.getConnection2();
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}
	/*for (int k=0; k<b.length; k++) {*/
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')");
	while(rs11.next()){
	Com=rs11.getString(1);
	/*lgc=Integer.parseInt("Com");
	lgc1=lgc1+lgc;*/
	}
	

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
	body=body+
	"<tr>"+
	"<td align=\"left\">"+name+"</td>"+
	"<td align=\"center\">"+osd+"</td>"+
	"<td align=\"center\">"+domain+"</td>"+
	"<td align=\"center\">"+Email+"</td>"+
	"<td align=\"center\">"+Access+"</td>"+
	"<td align=\"center\">"+Shared+"</td>"+
	"<td align=\"center\">"+Gsnet+"</td>"+
	"<td align=\"center\">"+nexas+"</td>"+
	"<td align=\"center\">"+USB+"</td>"+
	"<td align=\"center\">"+VPN+"</td>"+
	"<td align=\"center\">"+nein+"</td>"+
	"<td align=\"center\">"+Com+"</td>"+
	"<td align=\"center\">"+newins+"</td>"+
	"<td align=\"center\">"+incident+"</td>"+
	"</tr>";
	body=body+"</table><br>";


	String dateString2[]=cdate.split("/");
	if(dateString2[1].equals("Jan")){
		dateString2[0]="31";
		dateString2[1]="12";
		dateString2[2]=year1;
	}
	if(dateString2[1].equals("Feb")){
		dateString2[0]="31";
		dateString2[1]="01";
		
	}
	if (dateString2[1].equals("Mar"))
	{
		  dateString2[0]="30";
		dateString2[1]="02";
	}

	if(dateString2[1].equals("Apr")){
		dateString2[0]="31";
		dateString2[1]="03";
	}
	if(dateString2[1].equals("May")){
		dateString2[0]="30";
		dateString2[1]="04";
	}
	if(dateString2[1].equals("Jun"))		
	{
		dateString2[0]="31";
		dateString2[1]="05";
	}
	if(dateString2[1].equals("Jul")){
		dateString2[0]="30";
		dateString2[1]="06";
	}
	if(dateString2[1].equals("Aug")){
		dateString2[0]="31";
		dateString2[1]="07";
	}
	if(dateString2[1].equals("Sep")){
		dateString2[0]="31";
		dateString2[1]="08";
	}
	if(dateString2[1].equals("Oct")){
		dateString2[0]="30";
		dateString2[1]="09";
		
	}
	if(dateString2[1].equals("Nov")){
		dateString2[0]="31";
		dateString2[1]="10";
	}
	if(dateString2[1].equals("Dec")){
		dateString2[0]="30";
		dateString2[1]="11";
	}
	start=dateString2[2]+"-"+"01"+"-"+"01";
	end=dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
	String rname1="YTD"+"--"+Mon[1]+" "+Mon[2];
	body=body+"<table width=\"60%\" border=\"1\"  align=\"left\" bgcolor=\"white\" bordercolor=\"grey\" border-collapse=\"Collapse\">"+
	"<tr>"+
	"<td colspan=\"14\" align=\"center\"><b><font color=\"black\" size=\"4\">CUMULATIVE REPORT</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<td colspan=\"14\" align=\"right\"><b><font color=\"black\" size=\"4\">"+rname1+"</font></b></td>"+
	"</tr>"+
	"<tr>"+
	"<th>BRANCH</th>"+
	"<th>OSD</th>"+
	"<th>DOMAIN</th>"+
	"<th>EMAIL</th>"+
	"<th>ACCESS CARD</th>"+
	"<th>SHARED FOLDER</th>"+
	"<th>GSNET</th>"+
	"<th>NEXAS</th>"+
	"<th>USB</th>"+
	"<th>VPN</th>"+
	"<th>NEIN INTERNAL S/W</th>"+
	"<th>LOG COMPLAINTS</th>"+
	"<th>NEWINS</th>"+
	"<th>INCIDENT REPORT</th></tr>";
	con=dbConn.getConnection2();
	 conn=dbConn.getConnection2(); 			
	st6=conn.createStatement();
	rs6=st6.executeQuery("SELECT Count(*)Total From form1_it_clearance_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form1_it_clearance_item group by form1_no) AND SubString(form1_no,12,2) in ('54','44')");
	while(rs6.next()){
		osd=rs6.getString("Total");
	}



	st5=conn.createStatement();
	rs5=st5.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Domain%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form2_domain_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form2_domain_item group by form2_no) AND SubString(form2_no,16,2) in ('54','44')))AS combinedResults");
	while(rs5.next()){
	domain=rs5.getString(1);
	}



	st4=conn.createStatement();
	rs4=st4.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Email%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form3_lotus_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form3_lotus_item group by form3_no) AND SubString(form3_no,15,2) in ('54','44')))AS combinedResults");
	while(rs4.next()){
	Email=rs4.getString(1);
	}

	st3=conn.createStatement();
	rs3=st3.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Biometric%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form4_accesscard_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form4_accesscard_item group by form4_no) AND SubString(form4_no,15,2) in ('54','44')))AS combinedResults");
	while(rs3.next()){
	Access=rs3.getString(1);
	}

	st2=conn.createStatement();
	rs2=st2.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Shared%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form5_folder_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form5_folder_item group by form5_no) AND SubString(form5_no,17,2) in ('54','44')))AS combinedResults");
	while(rs2.next()){
	Shared=rs2.getString(1);
	}

	st7=conn.createStatement();    
	rs7=st7.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%GS-NET%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form15_gsnet_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form15_gsnet_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
	while(rs7.next()){
	Gsnet=rs7.getString(1);
	}

	st9=conn.createStatement();
	rs9=st9.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEx-GLOW%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form12_nexas_item WHERE form_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form12_nexas_item group by form_no) AND SubString(form_no,12,2) in ('54','44')))AS combinedResults");
	while(rs9.next()){
	nexas=rs9.getString(1);
	}

	st10=conn.createStatement();
	rs10=st10.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%USB%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form17_usb_access_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form17_usb_access_item group by form10_no) AND SubString(form10_no,10,2) in ('54','44')))AS combinedResults");
	while(rs10.next()){
	USB=rs10.getString(1);
	}
	
	st16=conn.createStatement();
	rs16=st16.executeQuery("SELECT COUNT(applicationNo) FROM `neinapplicationform` where requestFor LIKE '%VPN%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44')");
	while(rs16.next()){
	VPN=rs16.getString(1);
	}

	st15=conn.createStatement();
	rs15=st15.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%Internal%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form10_registration_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form10_registration_item group by form10_no) AND SubString(form10_no,22,2) in ('54','44')))AS combinedResults");
	while(rs15.next()){
	nein=rs15.getString(1);
	}

/*for (int i=0; i<b.length; i++) {*/
	st11=conn.createStatement();
	rs11=st11.executeQuery("SELECT Count(*)as Total From complain_master_item a INNER JOIN branch_master b on a.cm_location=b.b_name WHERE a.cm_date between '"+start+"' AND '"+end+"' And a.cm_status='Resolved' And b.b_no in('54','44')");
	while(rs11.next()){
	Com=rs11.getString(1);
	/*
	 * lc=Integer.parseInt("Com"); lc1=lc1+lc; }
	 */
}

	st13=conn.createStatement();
	rs13=st13.executeQuery("SELECT SUM(totalCount) AS combinedTotal FROM ((SELECT COUNT(applicationNo)AS totalCount FROM `neinapplicationform` where requestFor LIKE '%NEWINS%' And applicationDate BETWEEN '"+start+"' And '"+end+"' And Approval_sttatuss='Closed' And requested_branch in ('54','44'))"+
	"UNION ALL(SELECT Count(*)AS totalCount From form7_newins_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status='Approved' AND id in(SELECT max(id) FROM form7_newins_item group by form7_no) AND SubString(form7_no,16,2) in ('54','44')))AS combinedResults");
	while(rs13.next()){
	newins=rs13.getString(1);
	}

	st12=conn.createStatement();
	rs12=st12.executeQuery("SELECT Count(*)Total From form9_incident_log_item WHERE f_date BETWEEN '"+start+"' AND '"+end+"' AND status in ('No Incident reported','Incident reported') AND id in(SELECT max(id) FROM form9_incident_log_item group by form9_no) And SubString(form9_no,12,2) in ('54','44')");
	while(rs12.next()){
	incident=rs12.getString(1);
	}
		body=body+
		"<tr>"+
		"<td align=\"left\">"+name+"</td>"+
		"<td align=\"center\">"+osd+"</td>"+
		"<td align=\"center\">"+domain+"</td>"+
		"<td align=\"center\">"+Email+"</td>"+
		"<td align=\"center\">"+Access+"</td>"+
		"<td align=\"center\">"+Shared+"</td>"+
		"<td align=\"center\">"+Gsnet+"</td>"+
		"<td align=\"center\">"+nexas+"</td>"+
		"<td align=\"center\">"+USB+"</td>"+
		"<td align=\"center\">"+VPN+"</td>"+
		"<td align=\"center\">"+nein+"</td>"+
		"<td align=\"center\">"+Com+"</td>"+
		"<td align=\"center\">"+newins+"</td>"+
		"<td align=\"center\">"+incident+"</td>"+
		"</tr>"+
		"</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>" +
		"<h3><b>Note : This is a system generated Email.</b></h3>";
	String c2iturl="https://neinsoft.nittsu.co.in:8185/NEIN-C2IT";
	String nurl="https://neinsoft.nittsu.co.in:8185/NEIN";
	body=body+"<h3>"+ c2iturl+ " <br>"+ nurl+" </h3>";
	body=body+ "</body>"+
		"</html>"; 
	st1=conn.createStatement();
	rs1=st1.executeQuery("SELECT b.email,a.Mail_Type FROM leavemanagement.user b INNER JOIN csdb.mail_notifications a on b.emp_id=a.empid where a.branch_no='"+bno+"'");
	while(rs1.next()){
		gamail=rs1.getString(1);
		type=rs1.getString(2);
		if(type.equals("To")){
		to=gamail.concat(",");
		to1=to+to1;
		}else{
			cc=gamail.concat(",");
			cc1=cc1+cc;
		}
			
		}

		/*
		 * to1="neinsoft.support@nipponexpress.com"; cc1="";
		 */
	new NormalMail().sendMail("C2IT Report",to1,cc1,body, "NEIN-C2IT : APPLICATION FORMS REPORT: "+rname+"");
}
	 to1="";
	   cc1="";
	   body="";
}
		   
		   
}


}