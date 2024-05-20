<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@ include file="../../banner.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@page language="java"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CON2.Connection2"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<!DOCTYPE body PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function btnClick() { 
         close(); 
}
</script>
<script type="text/javascript">
/* function link(complain) 
{
var f=document.form;  
alert("yuppi  "+complain);
	f.method="post";   
	
	f.action='DisplaywatchResend.jsp?complain='+complain;
	
	f.submit();
	} */
/* function resendMail(complain,cm_mail,mailcm_name,cm_location,cm_type,cm_problem,cm_date,cm_status,emp)
	 {
		 alert("before ");
		 if (typeof XMLHttpRequest != "undefined"){    
		xmlHttp= new XMLHttpRequest();    
  		}      else if (window.ActiveXObject){
		  alert("Creating html http object");    
   		 xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
        }      if (xmlHttp==null){    
           alert("Browser does not support XMLHTTP Request");    
             return;     
              }       
        alert("reading value "+complain+"mail name "+cm_location+cm_mail);
                   var url="DisplaywatchResend?complain="+complain+","+cm_mail+","+mail+","+cm_name+","+cm_location+","+cm_type+","+cm_problem+","+cm_date+","+cm_status+","+emp; 
                   //var url="MailMessage?complain="+complain;  
                 // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                  //url +="?mail="+mailId;   
                     xmlHttp.onreadystatechange = mailStateChange;  
                   alert("before sending mail");
                         xmlHttp.open("POST", url, true); 
                         
                         alert("MAIL SENT");
                            xmlHttp.send(null);
                            
                            alert("MAIL RESENT");
                              }  */
function resendMail(mail,complain,cm_name,cm_mail)
	 {
       // alert("Ajax working ?");                    	  
		if (typeof XMLHttpRequest != "undefined"){    
		xmlHttp= new XMLHttpRequest();    
  		}      else if (window.ActiveXObject){
//   alet("Creating html http object");    
    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
        }      if (xmlHttp==null){    
           alert("Browser does not support XMLHTTP Request");    
             return;     
              }       var url="DisplaywatchResend?mail="+mail+","+complain+","+cm_name+","+cm_mail+"";  
                 // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                  //url +="?mail="+mailId;   
                     xmlHttp.onreadystatechange = mailStateChange;  
                   // alert("before sending mail");
                         xmlHttp.open("POST", url, true); 
                         
                        // alert("MAIL SENT");
                            xmlHttp.send(null);
                            
                            alert("MAIL RESENT");
                              }                                  
function mailStateChange()
{ 
 //alert("mail state change");    
   if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
   {   
      // document.getElementById("idmailStatus").innerHTML=xmlHttp.responseText
    //  alert("xmlHttp.responseText      :"+xmlHttp.responseText);
      document.getElementById("idmailStatus").value=xmlHttp.responseText;
    } 
                                                     
   } 
</script>
<body background="images/u.jpg">
<form >

<br />
<br /><center><label style="font: bold; size: 3">SALES STATUS</label></center> <br />
<table border="1" width="80%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>SALES NUMBER</b></font></td>
		<td height="20" bgcolor="lightgrey" align=center><font color="black" size="2"><b>INITIATED DATE</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>CUSTOMER</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>CONTACT PERSON</b></font></td>
		<td height="20" bgcolor="lightgrey" align=center><font color="black" size="2"><b>CUST ADDRESS</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>CUST CONTACT</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>CUST MAIL</b></font></td>
		<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>CUST WEB</b></font></td>
		<td height="20" bgcolor="lightgrey" align=center><font color="black" size="2"><b>INDUSTRY</b></font></td>
		
		</tr>
<%
 String no=request.getParameter("s_no");
 System.out.println("wat is the getting value  :"+no); 
 String req = request.getParameter(no);
 System.out.println("wat is the getting value 2 :"+req); 
 
 
 
 
 String cs_date;
 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 //get current date time with Date()
 Date date = new Date();
	
	cs_date = dateFormat.format(date);
	String empp=null,status=null,notstatus=null;
 
	int flag=0;
 
 
 
 
	Connection cn1 = null;
    Statement st1 = null; 
    ResultSet rs1 = null;
	Connection conn = null;
    Statement st = null; 
    ResultSet rs = null;
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
//s_no,s_date,customer,s_person,s_add,s_contact,s_mail,s_web,s_sExecutive,s_industry,
  //String query = "SELECT complain_id,cm_name,emp,cm_type,cm_problem,cm_location,cm_status  FROM complain_master_item WHERE emp='"+req+"' AND cm_date='"+cs_date+"'";
  String query = "SELECT s_no,s_date,customer,s_person,s_add,s_contact,s_mail,s_web,s_sExecutive,s_industry,s_compet,s_weight,s_abbre,s_lead_source,s_value,s_valueCurrency,s_lead_allocated,s_stage,s_expectedDate,s_profit,s_profitCurrency,remarks  FROM sales_master WHERE s_no='"+req+"' ORDER BY s_no DESC";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  int k=0;
  while(rs.next()){
	  flag=1;
	  k++;
 // String namee= rs.getString("Locname");
  String id = rs.getString(1);
  String cmsta=null;
  String s_no = rs.getString("s_no");
  String s_date = rs.getString("s_date");
  String customer = rs.getString("customer");
  String s_person = rs.getString("s_person");
  String s_add=rs.getString("s_add");


  String s_contact = rs.getString("s_contact");
  String s_web = rs.getString("s_web");
  String s_sExecutive = rs.getString("s_sExecutive");
  String s_industry = rs.getString("s_industry");
  String s_mail = rs.getString("s_mail");

  String m = "";
  System.out.println("Diaply Watch ");

  if(rs.getString("s_mail")!=null)
  {
   m =  rs.getString("s_mail").trim();
  }

  System.out.println(" mail sending  "+m);
  
  

  //System.out.println("cm_mail "+cm_mail);
  
  //System.out.println("id:"+id+"    complain :"+complain+"   cm_name "+cm_name+"   emp :"+emp+ "  cm_staus  :"+cm_status);
  //System.out.println("cm_status      :: "+cm_status);
//s_no,s_date,customer,s_person,s_add,s_contact,s_mail,s_web,s_sExecutive,s_industry,
  %>
  <tr>
<%-- <td style="display: none;">
<input type="hidden" name="cm_mail" value="<%=rs.getString("cm_mail")%>"/>
<input type="hidden" name="mail" value="<%=rs.getString("mail")%>"/>
<input type="hidden" name="complain" value="<%=rs.getString("complain_id")%>"/>
</td> --%>
      <td bgcolor="white" align=center><font color="black" size="2"><%=rs.getString("s_no")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_date")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("customer")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_person")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_add")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_contact")%></font></td>
       <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_mail")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_web")%></font></td>
      <td bgcolor="white"><font color="black" size="2"><%=rs.getString("s_industry")%></font></td>

         <%-- <td><font color="white" size="2" ><input type="btext" onclick="resendMail('<%=m%>','mathankumar@infologsolutions.com','<%=mail%>','<%=cm_name%>','<%=cm_location%>','<%=cm_type%>','<%=cm_problem%>','<%=cm_date%>','<%=cm_status%>','<%=emp%>');"  title="click for more details"></font></td> --%>
         <%-- <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=m%>','<%=complain%>','<%=cm_name%>','<%=cm_mail%>')" /></td> --%> 
        <%--   <td><font color="white" size="2" ><a  href="#" onclick="resendMail('<%=k%>','<%=emp%>');"  title="click for more details"><%=complain%></a></font></td> --%>
     
     
     <%}%>
      </table>

<%}catch(Exception e){}


%>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table border="1" width="60%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
<td width="100%" bgcolor="lightgrey" colspan="10" align="center"><font size=2 >SALES MEETING </font></td>
</tr>

	<tr>
		
		<td height="20" bgcolor="white"  align=center><font color="black" size="2"><b>DATE</b></font></td>
		<td bgcolor="white"  align=center><font color="black" size="2"><b>TYPE</b></font></td>
	<!-- 	<td bgcolor="white"  align=center><font color="black" size="2"><b>REMARKS</b></font></td> -->
		<td bgcolor="white" align=center><font color="black" size="2"><b>ATTENDED BY</b></font></td>
		<td bgcolor="white"  align=center><font color="black" size="2"><b>ACTION</b></font></td>
		<td bgcolor="white"  align=center><font color="black" size="2"><b>ARRANGED BY</b></font></td>
				<td bgcolor="white"  align=center><font color="black" size="2"><b>REMARKS</b></font></td>
		
		</tr>
		<% 
	try{
	      cn1 = con.getConnection2();
	      st1=cn1.createStatement();
	      rs1 = st1.executeQuery("select * from sales_meeting where s_no='"+req+"'");
	     
		  while(rs1.next()){
		  String m_m_date= rs1.getString("m_m_date");
		  System.out.println("CUSTOMER NAME IN DISPLAY PRODUCT :"+m_m_date);
		  String m_m_lead_source = rs1.getString("m_m_lead_source");
		  String m_m_remarks = rs1.getString("m_m_remarks");
		  String m_m_lead_alloted = rs1.getString("m_m_lead_alloted");
		  String m_m_stage = rs1.getString("m_m_stage");
		  String m_m_name = rs1.getString("m_m_name");

		%> 
		  <tr>
     
      <td bgcolor="#F0F0F0"><font color="black" size="2"><%=rs1.getString("m_m_date")%></font></td>
      <td bgcolor="#F0F0F0"><font color="black" size="2"><%=rs1.getString("m_m_lead_source")%></font></td>
      <%-- <td bgcolor="#F0F0F0"><font color="black" size="2"><%=rs1.getString("m_m_remarks")%></font></td> --%>
      <td bgcolor="#F0F0F0"><font color="black" size="2"><%=rs1.getString("m_m_lead_alloted")%></font></td>
      <td bgcolor="#F0F0F0"><font color="black" size="2"><%=rs1.getString("m_m_stage")%></font></td>
      <td bgcolor="#F0F0F0"><font color="black" size="2"><%=rs1.getString("m_m_name")%></font></td>
      
<td bgcolor="#F0F0F0" width="50%"><font color="black" size="2"> <textarea rows="1" cols="45" onclick="this.style.height='200px';" onblur="this.style.height='';"><%=rs1.getString("m_m_remarks")%></textarea>
     </font></td>
		</tr>
		<%}%>
</table>
<center>
 <font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! Data Not Exist ");
				            }
				 %></font>
</center>
<br><br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<!-- <td width="1118" align="right"> 
    <center><p style="font-size:16px;color:black"> 
        <a href="javascript:location.replace('ViewSales.jsp?msg=1')"><b>Back</b></a>
<input align="middle" value="Close" onclick="return btnClick()"/>
     
        
        </p></center>
</td> -->
 <td align="center"><a href="javascript:top.window.close(),close1()"><img src="../../images/close1.jpg" height="40" width="40" ></a> 
</tr> 
</table>
 
 <%}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(rs1,st1,cn1);
	
}
%>

 
 <br>

      </form>
      </body></html>