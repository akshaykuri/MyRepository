<%@page import="CON2.MailMessage"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 

    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 



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
                  MailMessage mailMessage = new MailMessage();
                  Connection conn = null, conn1 = null,cn2=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st11=null;
	              ResultSet rs = null;
	              String []id;
	              //String []headline;
	              String []ps_raw=null;
	              String []ps_upsworking=null;
	              String []ps_upsbackup;
	              String []ps_upspreventive;
	              String []si_working;
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
String cs_id=request.getParameter("cs_id");
String cs_date=request.getParameter("cs_date");
String city = request.getParameter("city");

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

//ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,
String transId=request.getParameter("transid");
//System.out.println("transid...................."+transId);
String si_working = request.getParameter("si_working");
String isp_router = request.getParameter("isp_router");
String udb = request.getParameter("udb");
String cr_working = request.getParameter("cr_working");
String wg_firewall = request.getParameter("wg_firewall");
String fdb = request.getParameter("fdb");
String ln_server = request.getParameter("ln_server");
String NEWINS = request.getParameter("NEWINS");
String sr_ac = request.getParameter("sr_ac");
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



rs = st2.executeQuery("select cs_id from cs_master where cs_id='"+cs_id+"'");
if(rs.next()){
	
	          //out.println("......'"+mr_id+"' IS ALREADY EXIST.......");
	          
	          msg = "...'"+cs_id+"'__IS__ALREADY EXIST.......";
	          
	         // msg = output.replaceAll("_","  ").trim();
             }

else{        
			//System.out.println("first stat");
			
			 //i=st.executeUpdate("insert into mr_master(idextend,mr_id,mr_date,e_name,e_designation,desg,emp,theName,totalcon,transid,mr_remarks,mail,mdradio,city,status) values('"+idextend+"','"+mr_id+"','"+result+"','"+e_name+"','"+e_designation+"','"+desg+"','"+emp+"','"+theName+"',"+totalcon+",'"+transId+"','"+mr_remarks+"','"+mail+"','Status From Higher Authority','"+city+"','normal')");
              // i=st.executeUpdate("insert into cs_master(idextend,cs_id,cs_date,e_name,e_designation,desg,emp,theName,transid,main_remarks,mail,status) values('"+idextend+"','"+mr_id+"','"+result+"','"+e_name+"','"+e_designation+"','"+desg+"','"+emp+"','"+theName+"',"+totalconD+",'"+transId+"','"+mr_remarks+"','"+mail+"','Status From Higher Authority','"+city+"','"+Initiator+"','normal')");
               
               i=st.executeUpdate("insert into cs_master(cs_id,cs_date,city,cs_time,e_name,e_designation,desg,emp,theName,transId,si_working,isp_router,udb,cr_working,wg_firewall,fdb,ln_server,NEWINS,sr_ac,tele,cctv,cctv_backup,access_con,fire_a,fire_l,ids_w,ids_l,ithardware_r,ithardware_n,preventive_e,quarter_r,main_remarks,idextend,mail,status) values('"+cs_id+"','"+result+"','"+city+"','"+cs_time+"','"+e_name+"','"+e_designation+"','"+desg+"','"+emp+"','"+theName+"','"+transId+"','"+si_working+"','"+isp_router+"','"+udb+"','"+cr_working+"','"+wg_firewall+"','"+fdb+"','"+ln_server+"','"+NEWINS+"','"+sr_ac+"','"+tele+"','"+cctv+"','"+cctv_backup+"','"+access_con+"','"+fire_a+"','"+fire_l+"','"+ids_w+"','"+ids_l+"','"+ithardware_r+"','"+ithardware_n+"','"+preventive_e+"','"+quarter_r+"','"+main_remarks+"','"+idextend+"','"+mail+"','normal')");

                //out.println(" DETAIL   IS   INSERTED   SUCCESSFULLY");
			msg = "MAIL__SENT__SUCCESSFULLY";
			//msg = output.replaceAll("_","  ").trim();
			//yourString.replace("", " ").trim(); 
}

  // conn.commit();
%>

<% 
   
if(i>0){
	   
   if(request.getParameter("mpls_name") != null){
		
		String []item;
	        String ps_raw[] = request.getParameterValues("ps_raw");
		  	String ps_upsworking[] = request.getParameterValues("ps_upsworking");
			String ps_upsbackup[] = request.getParameterValues("ps_upsbackup");
			String ps_upspreventive[] = request.getParameterValues("ps_upspreventive");
			String si_drive[] = request.getParameterValues("si_drive");
			String si_harddisk[]= request.getParameterValues("si_harddisk");
			String si_usedspace[]= request.getParameterValues("si_usedspace");
			String si_freespace[]= request.getParameterValues("si_freespace");
			String mpls_name[]= request.getParameterValues("si_usedspace");
			String mpls[]= request.getParameterValues("si_usedspace");
			String mpls_remarks[]= request.getParameterValues("si_usedspace");
			String int_name[]= request.getParameterValues("si_usedspace");
		    String internet[]= request.getParameterValues("internet");
			String bkup_name[]= request.getParameterValues("bkup_name");
			String bkup[]= request.getParameterValues("bkup");
			
			String phto_name[]= request.getParameterValues("phto_name");
			String phto[]= request.getParameterValues("phto");
			
			String prt_name[]= request.getParameterValues("prt_name");
			String prt[]= request.getParameterValues("prt");
			
			String fx_name[]= request.getParameterValues("fx_name");
			String fx[]= request.getParameterValues("fx");
			String br_name[]= request.getParameterValues("br_name");
			String br[]= request.getParameterValues("br");
		  
	     
		  try{
				conn = dbConn.getConnection2();
				st1 = conn.createStatement();
				st2 = conn.createStatement();
				st3 = conn.createStatement();
				st4 = conn.createStatement();
				st5 = conn.createStatement();
				st6 = conn.createStatement();
				st7 = conn.createStatement();
				st8 = conn.createStatement();
				
				for(int k=1;k<mpls_name.length;k++){
					
					System.out.println("second stat");
					//st1.executeUpdate("insert into mpls_item(cs_id,,transId) values('"+mr_id+"','"+mr_asset[k]+"','"+mr_itemName[k]+"',"+itemQuantityD+",'"+mr_abbreviation[k]+"',"+itemRateD+","+itemAmountD+",'"+mr_DateByRegd[k]+"','"+transId+"')");
					st1.executeUpdate("insert into server_item(cs_id,si_drive,si_harddisk,si_usedspace,si_freespace,transId) values('"+cs_id+"','"+si_drive+"','"+si_harddisk+"','"+si_usedspace+"','"+si_freespace+"','"+transId+"')");
					st2.executeUpdate("insert into mpls_item(cs_id,mpls_name,mpls,transId) values('"+cs_id+"','"+mpls_name+"','"+mpls+"','"+transId+"')");
					st3.executeUpdate("insert into internet_item(cs_id,int_name,internet,transId) values('"+cs_id+"','"+int_name+"','"+internet+"','"+transId+"')");
					st4.executeUpdate("insert into backup_item(cs_id,bkup_name,bkup,transId) values('"+cs_id+"','"+bkup_name+"','"+bkup+"','"+transId+"')");
					st5.executeUpdate("insert into photocopier_item(cs_id,phto_name,phto,transId) values('"+cs_id+"','"+phto_name+"','"+phto+"','"+transId+"')");
					st6.executeUpdate("insert into printer_item(cs_id,prt_name,prt,transId) values('"+cs_id+"','"+prt_name+"','"+prt+"','"+transId+"')");
					st7.executeUpdate("insert into fax_item(cs_id,fx_name,fx,transId) values('"+cs_id+"','"+fx_name+"','"+fx+"','"+transId+"')");
					st8.executeUpdate("insert into barcode_item(cs_id,br_name,br,transId) values('"+cs_id+"','"+br_name+"','"+br+"','"+transId+"')");
					
					//st1.executeUpdate("insert into potable(id,headline,itemName,itemQuantity,abbreviation,itemRate,itemAmount,transId) values('"+id+"','"+headline[k]+"','"+itemName[k]+"','"+itemQuantity[k]+"','"+abbreviation[l]+"','"+itemRate[k]+"','"+itemAmount[m]+"','"+transId+"')");
					//out.println("   Items '"+itemName[i]+"'are inserted Successfully ");
				}
				 
				
			      
				
				//postMail.postMail("POSOFT@NITTSU.CO.IN","pass1234",mail,mr_id+ " Report",e_name+  " "+  "Request your approval for the following Material Requisition '\n' open URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN) '\n' http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain)");
				//postMail.postMail("frksh27@gmail.com","farooq!@12",mail,mr_id+ " Report",e_name+  " "+  "request your approval for the following Material Requisition. <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office)");
				//postMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office) <br><br><br><br>"+message);
				
			}
			catch(Exception e){
				
				
				     e.printStackTrace();
			}
		
		
	} 
   
   //spostMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br> Open the following URL http://10.206.10.18:8185/nepl1/HOME.jsp (local LAN - within office) <br> http://203.124.152.5:8185/nepl1/HOME.jsp (Public Domain - outside office) <br><br><br><br>"+message);

}


//--------------message = mailMessage.getMailMessage(mr_id.trim());
//--------------postMail.postMail("P2PSOFT@NITTSU.CO.IN","pass1234",mail," Material Requisition Request :  " +mr_id+ " ",e_name+  " "+  "request your approval for the following Material Requisition. " +mr_id+ " <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/nepl1/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/nepl1/HOME.jsp  <br><br><br><br>"+message);              


//---------message = null;

		    //System.out.println("we are getting this msggetting ? " +message);

		     //--------response.sendRedirect("MRHO.jsp?msg=" +msg);
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
