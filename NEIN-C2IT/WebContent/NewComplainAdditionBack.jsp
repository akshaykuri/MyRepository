<%@page import="CON2.DbUtil"%>
<%@page import="com.sun.corba.se.impl.orb.NormalDataCollector"%>
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
                  Connection conn = null, conn1 = null,cn2=null,cn3=null,cn4=null; 
	              Statement st= null, st1=null,st11=null,st2=null,st3=null,st4=null;
	              ResultSet rs = null,rs3=null,rs4=null;
	         	 PreparedStatement psmt=null;
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
cn3 = con.getConnection2();
st3 = cn3.createStatement();
cn4 = con.getConnection2();
st4 = cn4.createStatement();
//cm_date,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid,mail;


//String complain_id=request.getParameter("complain_id");
//System.out.println("complain_id.............."+complain_id);
String cm_date=request.getParameter("cm_date");
String cm_time=request.getParameter("cm_time");

//CM TIME LLLLLL..............27-11-2013 17:58:31
String cm_time2=request.getParameter("cm_time2");
System.out.println("cm _time2 **********************  "+cm_time2);


String e_LocationNo = request.getParameter("e_LocationNo");

String desg=request.getParameter("desg");
//System.out.println("desg.............."+desg);
String emp=request.getParameter("emp");
//System.out.println("emp.................."+emp);

String cm_status=request.getParameter("cm_status");
String cm_name = request.getParameter("cm_name");
System.out.println("cm_name Name ******************** "+cm_name);
String transId=request.getParameter("transid");
String cm_location=request.getParameter("cm_location");
//System.out.println("transid...................."+transId);
String cm_type=request.getParameter("cm_type");
String cm_problem=request.getParameter("cm_problem");
//System.out.println("mr_remarks..........."+mr_remarks);
String mail=request.getParameter("mail");
//System.out.println("MAIL NAME/............."+mail);

String department = request.getParameter("department");
//int idextend= Integer.parseInt(request.getParameter("idextend"));
//System.out.println("idextend ..............  "+idextend);

java.util.Date date= new java.util.Date();
System.out.println("new entry of time stamp : "+new Timestamp(date.getTime()));
Timestamp ss = new Timestamp(date.getTime());

Timestamp result2=null,result3=null;
Date result=null;// = formater.parse(po_date);
//Date formatDate = null;
System.out.println("cm_time ************************11111  "+cm_time);
System.out.println("cm_time 2************************11111  "+cm_time2);
System.out.println("cm_time 2************************11111  ");




 result2 = dateFormat.getFormatedDateforCalender(cm_time);
 System.out.println("CM TIME LLLLLL. RESULT.............1111"+result2);
 String newidvalue=null;
 if(cm_time2 == null)
 {
	 cm_time2 = "00-00-0000 00:00:00";
 }
 System.out.println("cm_time 2************************11111 after "+cm_time2);
 //CM TIME LLLLLL. RESULT.............2013-11-27
 result3 = dateFormat.getFormatedDateforCalender(cm_time2);
 //SELECT DATEDIFF('2014-02-27 17:42:30', '2014-02-23 17:42:26') AS MINUTES;
 System.out.println("result3"+result3);
//SELECT TIMESTAMPDIFF(MINUTE,'2014-02-23 17:42:30', '2014-02-27 17:42:26') as timess
//SELECT TIMESTAMPDIFF(MINUTE,'"+cm_time2+"','"+cm_time+"') as times
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
int i = 0;
System.out.println("sdf "+sdf);
//message = mailMessage.getMailMessage(mr_id.trim());

try{
	result = new Date(sdf.parse(cm_date).getTime());
//	result2 = new Date(sdf.parse(cm_time).getTime());
//	result3 = new Date(sdf.parse(cm_time2).getTime());
	
	//txtDate1 = new Date(sdf.parse(txtDate).getTime());
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
System.out.println("result "+result);
rs4 = st4.executeQuery("select max(idextend) as idd from complain_master_item");
int idextendExtra=0;
while(rs4.next()){	 
	 int rde = rs4.getInt("idd");
     int incre = 0;
     int id=0;

           System.out.println("idextend value "+rde);
           try
                	{
                		id=rs4.getInt(1);
                		System.out.println("id of complain id "+id);
                            incre =id+1;
                            idextendExtra = rde+1;
                            System.out.println("EXTENDof complain id "+id);
                			newidvalue = "NEIN/CM-" +incre;
                	}
                	catch(SQLException ex)
                	{
                		  System.out.println(ex.toString());
                		 incre = 1;
                	    }	 
	 
	 
}

/* System.out.println("AFTER WHILE  ");
System.out.println("cm_time 2************************11111 complain : "+newidvalue);
System.out.println("cm_time 2************************11111 cm_name : "+cm_name);
System.out.println("cm_time 2************************11111 cm_location : "+cm_location);
System.out.println("cm_time 2************************11111  cm_type : "+cm_type);
System.out.println("cm_time 2************************11111  cm_problem : "+cm_problem);
System.out.println("cm_time 2************************11111  cm_status : "+cm_status);
System.out.println("cm_time 2************************11111  cm_time result : "+result);
System.out.println("cm_time 2************************11111  cm_time result 2: "+result2);
System.out.println("cm_time 2************************11111  cm_time result3 : "+result3); */





rs = st2.executeQuery("select complain_id from complain_master_item where complain_id='"+newidvalue+"'");
if(rs.next()){
	
	          //out.println("......'"+mr_id+"' IS ALREADY EXIST.......");
	          
	          msg = "...'"+newidvalue+"'__IS__ALREADY EXIST.......";
	          System.out.println("AFTER WHILE with if ");
	         // msg = output.replaceAll("_","  ").trim();
             }

else{        
			//System.out.println("first stat");
			
			 //i=st.executeUpdate("insert into mr_master(idextend,mr_id,mr_date,e_name,e_designation,desg,emp,theName,totalcon,transid,mr_remarks,mail,mdradio,city,status) values('"+idextend+"','"+mr_id+"','"+result+"','"+e_name+"','"+e_designation+"','"+desg+"','"+emp+"','"+theName+"',"+totalcon+",'"+transId+"','"+mr_remarks+"','"+mail+"','Status From Higher Authority','"+city+"','normal')");
             //rs3 = st3.executeQuery("SELECT TIMESTAMPDIFF(MINUTE,'2014-02-23 17:42:30', '2014-02-27 17:42:26') as timess");
             
             
             System.out.println("AFTER WHILE with else ");
             
             
             
          /*    rs3 = st3.executeQuery("SELECT TIMESTAMPDIFF(MINUTE,'2014-02-23 17:42:30','2014-02-27 17:42:26') as timess");
             
			// rs3 = st3.executeQuery("SELECT TIMESTAMPDIFF(MINUTE,'"+cm_time2+"','"+cm_time+"') as times");
			 while(rs3.next())
			 {
				 String r = rs3.getString("timess");
				 System.out.println("r result "+r);
			 }  */
			 
		
			 psmt = cn2.prepareStatement("INSERT INTO complain_master_item(idextend,complain_id,cm_name,cm_location,cm_date,desg,emp,transid,cm_type,cm_problem,cm_status,cm_time,cm_time2,status,e_Location,admin_remarks,mail,cm_mail,reportTo) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			 //i=st.executeUpdate("insert into complain_master_item(idextend,complain_id,cm_name,cm_location,cm_date,desg,emp,transid,cm_type,cm_problem,cm_status,cm_time,cm_time2,status,e_Location,admin_remarks,mail,cm_mail) values
					 //('"+idextend+"','"+newidvalue+"','"+cm_name+"','"+cm_location+"','"+result+"','"+desg+"',
							 //'"+emp+"','"+transId+"','"+cm_type+"','"+cm_problem+"','"+cm_status+"','"+result2+"',
							 //'"+ss+"','normal','"+e_LocationNo+"','N/A','"+mail+"','"+mail+"')");
			 psmt.setInt(1,idextendExtra);
			 psmt.setString(2,newidvalue);
			 psmt.setString(3,cm_name);
			 psmt.setString(4,cm_location);
			 psmt.setDate(5,result);
			 psmt.setString(6,desg);
			 psmt.setString(7,emp);
			 psmt.setString(8,transId);
			 psmt.setString(9,cm_type);
			 psmt.setString(10,cm_problem);
			 psmt.setString(11,cm_status);
			 psmt.setTimestamp(12,result2);
			 psmt.setTimestamp(13,ss);
			 psmt.setString(14,"normal");
			 psmt.setString(15,e_LocationNo);
			 psmt.setString(16,"N/A");
			 psmt.setString(17,mail);
			 psmt.setString(18,mail);
			 psmt.setString(19,department);
			 int l = psmt.executeUpdate();
			

                //out.println(" DETAIL   IS   INSERTED   SUCCESSFULLY");
			msg = "DETAIL__IS__INSERTED__SUCCESSFULLY";
			//msg = output.replaceAll("_","  ").trim();
			//yourString.replace("", " ").trim(); 
}System.out.println("AFTER WHILE with end ennnnnnnnnnnnndddddddddddddd ");
		     //response.sendRedirect("NewComplainAddition.jsp?msg=" +msg);
		     response.sendRedirect("ims_Branch_Back.jsp?msg=" +msg);
%>
  

<%

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally {
	//DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs3,st1,conn );
	DbUtil.closeDBResources(rs4,st2,conn1 );
	DbUtil.closeDBResources(rs,st3,cn2 );
	DbUtil.closeDBResources(null,st4,cn3 );
	DbUtil.closeDBResources(null,st11,cn4 );
	DbUtil.closeDBResources(null,psmt,null );
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
