<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.MailMessage"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>


<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "timeDiff" class="CON2.TimeDifferenceForm" />
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                  Connection conn = null, conn1 = null,cn5=null;
	              Statement st= null, st1=null,st2=null,st3=null,st5=null;
	              //ResultSet rs;
	                  ResultSet rs5 = null; 
	              String []id;
	              String []mr_asset;
	              String []mr_itemName=null;
	              String []mr_itemQuantity=null;
	              String []mr_abbreviation;
	              String []mr_itemRate;
	              String []mr_itemAmount=null;
	              String []mr_DateByRegd;
	              String []transId=null;
	              String msg = null;
	              Connection2 dbConn = new Connection2();
	              MailMessage mailMessage = new MailMessage();
	              String message = null,message2=null;
	              %>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">
<form name=form>


<center><font size=4 ><b>



<%

conn = dbConn.getConnection2();
st = conn.createStatement();

cn5 = con.getConnection2();
st5 = cn5.createStatement();

//complain_id,cm_status,cm_date2,admin_remarks
String cm_status=request.getParameter("cm_status");
String city_no = request.getParameter("city_no");
String complain_id=request.getParameter("complain_id");
//System.out.println("complain id ********** :"+complain_id);
String cm_date2=request.getParameter("cm_date2");
String cm_time=request.getParameter("cm_time");
String cm_time2=request.getParameter("cm_time2");

String cm_name = request.getParameter("cm_name");
String cm_mail = request.getParameter("cm_mail");
String emp = request.getParameter("emp");
String mail = request.getParameter("mail");


System.out.println("cm_name **********************************:"+cm_name);
System.out.println("cm_mail :"+cm_mail);
System.out.println("emp :"+emp);
System.out.println("mail :"+mail);

//System.out.println("cm date2 ********** :"+cm_date2);
String admin_remarks=request.getParameter("admin_remarks");
//System.out.println("admin remarks  id ********** :"+admin_remarks);

st2 = conn.createStatement();
st3 = conn.createStatement();
String newTr = "pqr"+String.valueOf(Math.random());
Date result=null;// = formater.parse(mr_date);
//Date formatDate = null;

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	result = new Date(sdf.parse(cm_date2).getTime());
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}

// calculation for two time ,,, cm_time and cm_time2, cm_time_diff


/* 
  rs5 = st5.executeQuery("select complain_id from complain_master where complain_id='"+complain_id+"' AND cm_status='Resolved'");
if(rs5.next()){
	
	//out.println(".....'"+mr_id+"' IS ALREADY EXIST.....");
	 msg = "...'"+complain_id+"' IS ALREADY Resolved.......";
}

else{ */


//st2.executeUpdate("delete from po where transid = '"+transId+"'");
//st2.executeUpdate("update complain_master set status='append' where complain_id='"+complain_id+"'");
//st2.executeUpdate("update complain_master set status='append' where complain_id='"+complain_id+"'");
//st3.executeUpdate("delete from potable where transid = '"+transId+"'");



//int i=st.executeUpdate("insert into complain_master(cm_date2,admin_remarks,status) values('"+result+"','"+admin_remarks+"','normal') WHERE complain_id='"+complain_id+"'");
//int i=st.executeUpdate("update po set pordernon='"+pordernon+"',po_date='"+po_date+"',VendorText='"+VendorText+"',textarea1='"+textarea1+"',textarea2='"+textarea2+"',textarea3='"+textarea3+"',textarea4='"+textarea4+"',textarea5='"+textarea5+"',textarea6='"+textarea6+"',itemhead='"+itemhead+"',taxes='"+taxes+"',desg='"+desg+"',emp='"+emp+"',theName='"+theName+"',delivery='"+delivery+"',paytrm='"+paytrm+"',warranty='"+warranty+"',t1='"+t1+"',t11='"+t11+"',txt1='"+txt1+"',orderval='"+orderval+"',abco='"+abco+"',vat1='"+vat1+"',vat2='"+vat2+"',totalcon='"+totalcon+"',vattext='"+vattext+"',abcvat1='"+abcvat1+"',vat3='"+vat3+"',nmrupees='"+nmrupees+"',abc1='"+abc1+"',abc2='"+abc2+"',abc3='"+abc3+"',abc4='"+abc4+"',abc5='"+abc5+"',rupes='"+rupes+"',termscond='"+termscond+"',tex2='"+tex2+"',tarea2='"+tarea2+"',tarea22='"+tarea22+"',tarea3='"+tarea3+"',tarea33='"+tarea33+"',tarea4='"+tarea4+"',tarea44='"+tarea44+"' where transid = '"+transId+"'") ;
int i=st.executeUpdate("update complain_master_item set cm_time2=CURRENT_TIMESTAMP(),cm_status='"+cm_status+"',cm_date2='"+result+"',admin_remarks='"+admin_remarks+"',status='append',e_Location='"+city_no+"' where complain_id='"+complain_id+"'");
System.out.println("MAIL :"+mail.trim());
String mm = mail.trim();
System.out.println("emp :"+emp);
System.out.println("complaid id :"+complain_id);
System.out.println("cm status :"+cm_status);

message2 = mailMessage.getMailMessage(complain_id.trim());
postMail.postMail(mm,emp,"pass1234",mm,"NEIN-C2IT Complaint No. :  " +complain_id+ " ",  "<font color=red> STATUS OF COMPLAINT :</font> <b>" +cm_status+  " "+  "</b><br>For the Complaint ID:<font color=blue>" +complain_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message2);
message2=null;
          //out.println(" DETAIL   IS   INSERTED   SUCCESSFULLY");
           msg = "DETAIL__ \b SAVED__ \b\b SUCCESSFULLY";
          // response.sendRedirect("complainPageStatusBranch.jsp?msg=" +msg);
         
        		  response.sendRedirect("complainDateWise.jsp?msg=" +msg);
//}
        		  conn.close();
                  st.close();
                  
%>

  






</b>
</font>
</center>
<center>
<table>
<tr>

<%--<td><input type="button" value="pdf" onclick="link();"/></td> --%>

<td><input type="button" value="OK" onclick="window.location.href='complainPageStatusBranch.jsp?msg=1'"/></td>
</tr>

</table>
</center>
</form>

</div>




</body>
</html>
