<%@page import="CON2.DbUtil"%>
<%@page import="sun.org.mozilla.javascript.internal.regexp.SubString"%>
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

function btnClick() { 
         close(); 
}
</script>
<%! 
MailMessage mailMessage = new MailMessage();
Connection conn = null, conn1 = null,cn2=null; 
Statement st= null, st1=null,st11=null,st2=null;
ResultSet rs = null;
String []id;
//String []headline;
String []mr_itemName=null;
String []mr_itemQuantity=null;
String []mr_abbreviation;
String []mr_itemRate;
String []mr_asset;
String []mr_itemAmount=null;
String []mr_DateByRegd=null;
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
try{
conn = dbConn.getConnection2();
st = conn.createStatement();
st11 = conn.createStatement();
cn2 = con.getConnection2();
st2 = cn2.createStatement();


//cm_date,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid,mail;


String complain_id=request.getParameter("complain_id");
System.out.println("complain_id.............."+complain_id);
int score = Integer.parseInt(complain_id.substring(8,10));

//String score = String.(complain_id.substring(8,10));
System.out.println("complain_id ONLY AREA  "+score);
String cm_date=request.getParameter("cm_date");
String cm_time=request.getParameter("cm_time");
System.out.println("cm _time "+cm_time);
String desg=request.getParameter("desg");
//System.out.println("desg.............."+desg);
String emp=request.getParameter("emp");
//System.out.println("emp.................."+emp);

String cm_name = request.getParameter("cm_name");
System.out.println("cm_name Name ******************** "+cm_name);
String cm_mail = request.getParameter("cm_mail");
String transId=request.getParameter("transid");
String cm_location=request.getParameter("cm_location");
//System.out.println("transid...................."+transId);
String cm_type=request.getParameter("cm_type");
String cm_problem=request.getParameter("cm_problem");
//System.out.println("mr_remarks..........."+mr_remarks);
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
	result = new Date(sdf.parse(cm_date).getTime());
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}

rs = st2.executeQuery("select complain_id from complain_master_item where complain_id='"+complain_id+"'");
if(rs.next()){
	
	          //out.println("......'"+mr_id+"' IS ALREADY EXIST.......");
	          
	          msg = "...'"+complain_id+"'__IS__ALREADY EXIST.......";
	          
	         // msg = output.replaceAll("_","  ").trim();
             }

else{        
			//System.out.println("first stat");
			
			 //i=st.executeUpdate("insert into mr_master(idextend,mr_id,mr_date,e_name,e_designation,desg,emp,theName,totalcon,transid,mr_remarks,mail,mdradio,city,status) values('"+idextend+"','"+mr_id+"','"+result+"','"+e_name+"','"+e_designation+"','"+desg+"','"+emp+"','"+theName+"',"+totalcon+",'"+transId+"','"+mr_remarks+"','"+mail+"','Status From Higher Authority','"+city+"','normal')");
               i=st.executeUpdate("insert into complain_master_item(idextend,complain_id,cm_name,cm_location,cm_date,desg,emp,transid,cm_type,cm_problem,mail,cm_mail,status) values('"+idextend+"','"+complain_id+"','"+cm_name+"','"+cm_location+"','"+result+"','"+desg+"','"+emp+"','"+transId+"','"+cm_type+"','"+cm_problem+"','"+mail+"','"+cm_mail+"','normal')");

                //out.println(" DETAIL   IS   INSERTED   SUCCESSFULLY");
			msg = "MAIL__SENT__SUCCESSFULLY__TO__'"+emp+"'";
			//msg = output.replaceAll("_","  ").trim();
			//yourString.replace("", " ").trim(); 
			
		 
}

  // conn.commit();
%>

<% 

message = mailMessage.getMailMessage(complain_id.trim());
postMail.postMail(cm_mail,cm_name,"pass1234",mail," Complaint ID :  " +complain_id+ " ",  "<b> " +cm_name+  " "+  "</b>request you to Resolve <font color=blue>" +complain_id+ "</font> <br><br><b><u> Open the following URL</u> </b><br> Local LAN (Within Office) -  http://10.206.10.18:8185/CheckSheet/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.5:8185/CheckSheet/HOME.jsp  <br><br><br><br>"+message);              


message = null;

		    //System.out.println("we are getting this msggetting ? " +message);

		    // response.sendRedirect("complainPage.jsp?msg=" +msg);
		   /*  if(score==90)
				{
					response.sendRedirect("complainPage.jsp?msg="+msg);
				}
				else  if(score==10)
				{ 	
				    response.sendRedirect("complainPageBLR.jsp?msg="+msg);
				}	
				else  
				{
					response.sendRedirect("adminbom.jsp?msg="+msg);
				 }  */
				 
				 switch(score)
				 {
				 case 90: response.sendRedirect("complaintPage.jsp?msg="+msg);
				 break;
				 case 10: response.sendRedirect("complainPageBLR.jsp?msg="+msg);
				 break;
				 
				 default: response.sendRedirect("complaintPage.jsp?msg="+msg);
                 break;
				 }
				 
				 
%>
  	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st1,conn );
	DbUtil.closeDBResources(null,st,null);
	DbUtil.closeDBResources(null,st11,cn2);
	DbUtil.closeDBResources(null,st2,null);
  }
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
