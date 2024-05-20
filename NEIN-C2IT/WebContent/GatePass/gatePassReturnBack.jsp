<%@page import="CON2.MailMessageNExAS"%>
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 


<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
MailMessageNExAS mailMessage = new MailMessageNExAS();

Connection cn = null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null,rs_id=null; 
PreparedStatement psmt1001=null,psmt3=null;
try
   {
   cn = con.getConnection2();
   st=cn.createStatement();
   st2=cn.createStatement();
   //idRETURNABLE_NON,idtakeby,iddesg,iddate_time,idtrnsfrom,idtrnsto,idITPName,idScPName,idexpDateReturn,idvname,idpurpos
   String passType=request.getParameter("RETURNABLE_NON");
   String itnonit=request.getParameter("itnonit");
   String takenBy=request.getParameter("takeby");
   String desg=request.getParameter("desg");
   String dateTime=request.getParameter("date_time");
   String transFrom=request.getParameter("trnsfrom");
   String transTo=request.getParameter("transto");
   String ITPName=request.getParameter("ITPName");
   String itpdesg=request.getParameter("ITPDesg");
   String scName=request.getParameter("ScPName");
   String expDateReturn=request.getParameter("expDateReturn");
   String vname=request.getParameter("vname");
   String purpose=request.getParameter("purpos");
   String purpose1=request.getParameter("purposNON");
   //hour,minutes,ampm
   String hr=request.getParameter("hour");
   String mm=request.getParameter("minutes");
   String ampm=request.getParameter("ampm");
   
   String time=hr+":"+mm+" "+ampm;
   
   String asdesc[] = request.getParameterValues("descOfItem");
   String asno[] = request.getParameterValues("assetNo");
   String qty[] = request.getParameterValues("qty");
   String remarks[] = request.getParameterValues("remarks");
   
   String city=request.getParameter("city");
   String cityno=request.getParameter("cityno");
   
   String branch=request.getParameter("branch");
   String cont=request.getParameter("brContact");
   String createdby=(String)session.getAttribute("Nname");
   String createdbydesg=(String)session.getAttribute("desg");
   String Nmail=(String)session.getAttribute("Nmail"); 
   SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
   Date date = new Date();  
   String curedate=formatter.format(date);
   //System.out.println("curedate   :"+curedate); 
String gaempid="",ganame="",gadesg="",gamail="";
   if(cityno.equals("90"))
       {
       gaempid=request.getParameter("gaempid1");
       ganame=request.getParameter("ganame1");
       gadesg=request.getParameter("gadesg1");
       gamail=request.getParameter("gamail1");
       }
   else
       {
	   gaempid=request.getParameter("gaempid");
	   ganame=request.getParameter("ganame");
	   gadesg=request.getParameter("gadesg");
	   gamail=request.getParameter("gamail");   
      }
   String approvalremarks=request.getParameter("remarksAp");
   //createdbydesg,ganame,gadesg,gamail,approvalremarks
   int l = asno.length;
   String msg = null,formno="";
   int id=0;
   
   if(passType.equals("RETURNABLE"))
         {
	     purpose1="";
         }
   else
         {
	     expDateReturn="";
	     purpose="";
         }
   
     
   psmt1001 = cn.prepareStatement("SELECT max(extid) FROM gatepassform where cityNo='"+cityno+"'");
   rs_id = psmt1001.executeQuery();
   if(rs_id.next())
         {
       try
   	      {
   		  id=rs_id.getInt(1);
   		  if(id==0)
    		  id=1;
   		  else
   			  id++;
   		formno = "NEIN/GATEPASS/"+cityno+"-"+String.valueOf(id);
   	}
   	catch(SQLException ex)
   	    {
   		  System.out.println("WXCEPTION : "+ex.toString());
   		//formno = "NEIN/GATEPASS/"+id+"";
   	    }

   }
   
   int i=st.executeUpdate("insert into gatepassform (extid,formno,passType,takenByName,desg,dateTme,transFrom,transTo,ITPName,ScName,expRetDate,Vname,purpose,reasonForNoReturn,time,cityName,cityNo,braddress,brcontact,ITPDesg,createdBy,createdDate,        createdbydesg,ganame,gadesg,gamail,approvalremarks,approvalStatus,gaempid,createrEmailid,itnonit) values('"+id+"','"+formno+"','"+passType+"','"+takenBy+"','"+desg+"','"+dateTime+"','"+transFrom+"','"+transTo+"','"+ITPName+"','"+scName+"','"+expDateReturn+"','"+vname+"','"+purpose+"','"+purpose1+"','"+time+"','"+city+"','"+cityno+"','"+branch+"','"+cont+"','"+itpdesg+"','"+createdby+"','"+curedate+"','"+createdbydesg+"','"+ganame+"','"+gadesg+"','"+gamail+"','"+approvalremarks+"','Pending','"+gaempid+"','"+Nmail+"','"+itnonit+"')");
   for (int k = 1; k < l; k++)
       {
	   psmt3 = cn.prepareStatement("insert into gatepassitem(formno,descItems,assetNo,qty,remarks,srno) values(?,?,?,?,?,?);");
	   psmt3.setString(1, formno);
	   psmt3.setString(2, asdesc[k]);  
       psmt3.setString(3, asno[k]);
       psmt3.setString(4, qty[k]); 
       psmt3.setString(5, remarks[k]);
       psmt3.setInt(6, k);
       int j = psmt3.executeUpdate();
       //msg="Approver__inserted__successfully............";
       }
   
   
   
  // message = "";
   postMail.postMail(Nmail,createdby,"pass1234",gamail,"NEIN-C2IT GatePass FORM :  " +formno+ " ","Dear Sir,<br><br><br>" +createdby+  " "+  "request you to approve - GatePass : FORM. " +formno+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");              
 msg = "SAVED__AND__SENT__SUCCESSFULLY.....";
   response.sendRedirect("../adminHR.jsp?msg=" +msg);
%>
<%

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally {
	//DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs2,st,cn );
	DbUtil.closeDBResources(rs,st2,null);
	
}
%>


