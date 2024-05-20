<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@ include file="banner.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.nio.file.Files"%>
<%@ include file="banner.jsp" %>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE body PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<link rel='stylesheet' type='text/css' href='css/homePage.css' />
	<script type="text/javascript">

function link(complaint_no) 
{
	//alert("alert"+complaint_no);
var f=document.form;  


	f.method="post";   
	
	f.action='complaint_escalation.jsp?complaint_no='+complaint_no;
	window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    f.target='formpopup';
	f.submit();
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
function resendMail(mail,complain,cm_name,cm_mail,req,cm_location,IP,reportTo,reportingOffMail)
	 {
      // alert("Ajax working ?");  
     //  alert("Mail id "+mail);
     //  alert("complain id "+complain);
    //   alert("cm_name "+cm_name);
    //   alert("cm_mail id "+cm_mail);
    //   alert("req "+req);
		if (typeof XMLHttpRequest != "undefined"){    
		xmlHttp= new XMLHttpRequest();    
  		}      else if (window.ActiveXObject){
//   alet("Creating html http object");    
    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
        }      if (xmlHttp==null){    
           alert("Browser does not support XMLHTTP Request");    
             return;     
              }       var url="DisplaywatchResend?mail="+mail+","+complain+","+cm_name+","+cm_mail+","+req+","+cm_location+","+IP+","+reportTo+","+reportingOffMail+"";  
                 // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                  //url +="?mail="+mailId;   
                     xmlHttp.onreadystatechange = mailStateChange;  
                   // alert("before sending mail");
                         xmlHttp.open("POST", url, true); 
                         
                        // alert("MAIL SENT");
                            xmlHttp.send(null);
                            
                            alert("MAIL RESENT TO : "+req);
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
<form name="form">

<br />
<br /><center><label style="font: bold; size: 3">COMPLAINT STATUS</label></center> <br />
<table border="1" width="90%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>COMPLAINT ID</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>SENDER</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>CONTACT_NO</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>LOCATION</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>PROBLEM TYPE</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>PROBLEM DESCRIPTION</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>RAISED ON</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>PROBLEM STATUS</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>COMPLAINT TO </b></td>
		<td  bgcolor="lightgrey"  align=center class="fonter"><b>RE-SENT COUNT</b></td>
		<td  bgcolor="lightgrey"  align=center class="fonter"><b>SCREENSHOT</b></td>
		<td  bgcolor="lightgrey"  align=center class="fonter"><b>VIEW</b></td>
		<td  bgcolor="lightgrey"  align=center class="fonter"><b>RE-SEND MAIL</b></td>
		<td  bgcolor="lightgrey"  align=center class="fonter"><b>ESCALATE</b></td>
		
		</tr>
<%
 String no=request.getParameter("empp");
 System.out.println("wat is the getting value  :"+no); 
 String req = request.getParameter(no);
 System.out.println("wat is the getting value 2 :"+req); 
 String cm_name=null;
 String IP=null;
 
 
 String cs_date;
 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 //get current date time with Date()
 Date date = new Date();
	
	cs_date = dateFormat.format(date);
	String empp=null,status=null,notstatus=null;
 String counting=null;
	int flag=0;
 
 
	 Connection conn=null,cn2=null;
	Statement st=null,st2=null;
	ResultSet rs=null,rs2=null; 
 
 
  int sumcount=0;
  
  
  ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
  //String query = "SELECT complain_id,cm_name,emp,cm_type,cm_problem,cm_location,cm_status  FROM complain_master_item WHERE emp='"+req+"' AND cm_date='"+cs_date+"'";
 // String query = "SELECT complain_id,DATE_FORMAT(cm_time,'%e/%m/%Y,%h:%i') as datu,cm_name,emp,cm_type,cm_problem,cm_location,cm_status,cm_date,cm_mail,mail,counting,cm_time,reportTo FROM complain_master_item WHERE emp LIKE '%"+req+"%' AND cm_status='Pending' ORDER BY cm_date DESC";
 String query = "SELECT DISTINCT c.complain_id,DATE_FORMAT(c.cm_time,'%e/%m/%Y,%h:%i') as datu,c.cm_name,c.emp,c.cm_type,c.cm_problem,c.cm_location,c.cm_status,c.cm_date,c.cm_mail,c.mail,c.counting,c.cm_time,c.reportTo,c.mail,c.phoneNo,scrrenshotpath,filename FROM complain_master_item c INNER JOIN nentryho e ON(c.emp=e.Nname) WHERE c.emp LIKE '%"+req+"%' AND c.cm_status='Pending' ORDER BY c.cm_date DESC";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  int k=0;
  while(rs.next()){
	  flag=1;
	  k++;
 // String namee= rs.getString("Locname");
  String id = rs.getString(1);
  String cm_time = rs.getString(2);
  String cmsta=null;
  String complain = rs.getString(1);//complain_id
   cm_name = rs.getString(3);//cm_name
  String cm_location = rs.getString(7);//cm_location
  String cm_type = rs.getString(5);//cm_type
  String cm_problem=rs.getString(6);//cm_problem


  String emp = rs.getString(4);//emp
  String cm_date = rs.getString(9);//cm_date
  String cm_status = rs.getString(8);//cm_status
  String cm_mail = rs.getString(10);//cm_mail
  String mail = rs.getString(11);//mail
  String reportTo = rs.getString(14);//reportTo
  String reportingOffMail = rs.getString(15);//Nmail
  String phoneno = rs.getString(16);//phoneno chintu
  
  String name2 = rs.getString(18);
  String path2 = rs.getString(17);
  
  
  String m = "";
  System.out.println("Diaply Watch ");

  if(rs.getString("mail")!=null)
  {
   m =  rs.getString("mail").trim();
  }

  System.out.println(" mail sending  "+m);
  
  counting = rs.getString(12);//counting
  System.out.println("complain : "+complain);
  System.out.println("cm_name : "+cm_name);
  System.out.println("phoneno : "+phoneno);
  System.out.println("cm_mail "+cm_mail);
  
  System.out.println("cm_location ******************************* "+cm_location);
  System.out.println("reportingOffMail ******************************* "+reportingOffMail);
  System.out.println("Report To : Department ******************************* "+reportTo);
  
  //System.out.println("id:"+id+"    complain :"+complain+"   cm_name "+cm_name+"   emp :"+emp+ "  cm_staus  :"+cm_status);
  //System.out.println("cm_status      :: "+cm_status);
try {
  InetAddress addr = InetAddress.getLocalHost();
   IP = addr.getHostAddress();         
 // System.out.println("IP ADDRESS OF PRESENT USER SYSTEM: P2P-SOFT : "+addr.getHostAddress());
  System.out.println("IP ADDRESS OF PRESENT USER SYSTEM: P2P-SOFT bla : "+IP);
  
} catch (Exception e) {
}
  %>
  <tr>
<td style="display: none;">
<input type="hidden" name="cm_mail" value="<%=cm_mail%>"/>
<input type="hidden" name="mail" value="<%=mail%>"/>
<input type="hidden" name="complain" value="<%=complain%>"/>
<input type="hidden" name="cm_location" value="<%=cm_location%>"/><!-- need to cange -->
</td>
      <td style="display: none;"><input type="hidden"  name="aa" value="<%=complain%>"></td>
      <td style="display: none;"><input type="hidden"  name="bb" value="<%=cm_name%>"></td>
      
      <td style="display: none;"><input type="hidden"  name="ee" value="<%=phoneno%>"></td>    <!-- chintu -->
      
      <td style="display: none;"><input type="hidden"  name="cc" value="<%=cm_location%>"></td>
      <td style="display: none;"><input type="hidden"  name="dd"  value="<%=cm_type%>">
      <input type="hidden" name="ee" value="<%=rs.getString("cm_problem")%>">
      </td>
      
      <td class="fonter" align=center><%=complain%></td>
      <td class="fonter" align=center><%=cm_name%></td>
      
      <td class="fonter" align=center><%=phoneno%></td>   <!-- chintu -->
      
      
      <td class="fonter" align=center><%=cm_location%></td>
      <td class="fonter" align=center><%=cm_type%></td>
      <td class="fonter" onmouseover="this.style.height='80px';this.style.width='300px';" onmouseout="this.style.height='';this.style.width='';" >
     <%--  <textarea style="width:auto; min-width:1px; height:5px; resize:both;" name="ee" rows="1" cols="18" title="Click Here for problem description" readonly="readonly" onclick="this.style.height='60px';this.style.width='300px';" onblur="this.style.height='';this.style.width='';"><%=rs.getString("cm_problem")%></textarea>
       --%><%=cm_problem%>
      </td>
       <td style="display: none;"><input type="hidden"  name="ee"  value="<%=cm_date%>"></td>
      <td style="display: none;"><input type="hidden"  name="ee"  value="<%=cm_status%>"></td>
      <td style="display: none;"><input type="hidden"  name="ff"  value="<%=emp%>"></td>
      <td style="display: none;"><input type="hidden"  name="department"  value="<%=reportTo%>"></td>
      
             <td class="fonter" align=center><%=cm_time%></td>
      <td class="fonter" align=center><%=cm_status%></td>
      <td class="fonter" align=center><%=emp%></td>
 <td class="fonter" align=center><%=counting%></td>
 
 
 <%--  <td class="fonter" align=center><%=counting%></td> --%>
 
  <%--   <%
    int flag3=0;
 	File f11 = new File("E:/neinSoft/files/C2IT/UploadlogComplaint/"+req);
	File[] files11 = f11.listFiles();
    if((!f11.exists())||files11==null)
          {
          }
       else
          { 
          for(int r=0;r<files11.length;r++)
                 {
 	             flag3=1;
                 String name2=files11[r].getName();
                 String path2=files11[r].getPath();
          %> --%>
          
        <%//System.out.println("Name 2 %%%%%%%%%%%%%%%%%%%%%%%%%% :"+name2);
         if(name2==null)
          {%>
          <td style="background-color: white;" width="400" > <center style="color: blue">NO File</center></td>
          <td align="center" width="90" >NO View</td>
          <%}
         else if(name2.equals(""))
           {%>
           <td style="background-color: white;" width="400" > <center style="color: blue">NO File</center></td>
           <td align="center" width="90" >NO View</td>
         <%}else
         {%>
          <td style="background-color: white;" width="400" > <center style="color: blue"><%=name2%></center></td>
          <td align="center" width="90" ><a href="download6.jsp?f=<%=path2%>">View</a></td>
        <%} %>
  
 
 
 
 
 
 
 
 
 
 
 
 
 
         <%-- <td><font color="white" size="2" ><input type="btext" onclick="resendMail('<%=m%>','mathankumar@infologsolutions.com','<%=mail%>','<%=cm_name%>','<%=cm_location%>','<%=cm_type%>','<%=cm_problem%>','<%=cm_date%>','<%=cm_status%>','<%=emp%>');"  title="click for more details"></font></td> --%>
         <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=m%>','<%=complain%>','<%=cm_name%>','<%=phoneno%>','<%=cm_mail%>','<%=req%>','<%=cm_location%>','<%=IP%>','<%=reportTo%>','<%=reportingOffMail%>')" /></td> 
        <%--   <td><font color="white" size="2" ><a  href="#" onclick="resendMail('<%=k%>','<%=emp%>');"  title="click for more details"><%=complain%></a></font></td> --%>
     
<%--      <td class="fonter" align=center><%=rs.getString("complain_id")%></td> --%>
     <input type="hidden" name="<%=k%>" value="<%=complain%>" />
	     <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for Escalation"><font size="2"><%=complain%></font></a></font> </td> 
     <%}%></tr>
      </table>
      <center>
 <font color="red" size="4">
				 <%
				            if(flag==0){
				            	out.println("Sorry...! No Pending request as of now ");
				            }
				 %></font>
</center>
      <%
      String Nameee=null,Availiable=null,date1=null,date2=null;
      String query2 = "SELECT a.about,a.name,a.date1,a.date2 FROM availability a INNER JOIN nentryho n ON (a.name=n.Nname) WHERE n.DESG_NO='2' AND a.name LIKE '%"+req+"%' AND  DATE(NOW()) between a.date1 and a.date2";
      st2 = conn.createStatement();
      rs2= st2.executeQuery(query2);
      while(rs2.next())
      {
    	  
    	   Availiable = rs2.getString(1);
    	   Nameee = rs2.getString(2);
    	   date1 = rs2.getString(3);
    	   date2 = rs2.getString(4);
      }
      if(Nameee!=null){
      %>
      <br/><br/><br/><br/><br/><br/>
      <table border="1" width="50%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td  bgcolor="lightgrey" align=center class="fonter"><b>SYSTEM ADMIN</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>LEAVE TYPE</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>FROM DATE</b></td>
		<td  bgcolor="lightgrey" align=center class="fonter"><b>TO DATE</b></td>
		
		</tr>
		<tr>
		<td class="fonter" align=center><%=Nameee%></td>
      	<td class="fonter" align=center><%=Availiable%></td>
      	<td class="fonter" align=center><%=date1%></td>
      	<td class="fonter" align=center><%=date2%></td>
		</tr>
		</table>
<%} %>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,conn);

			}%>

<br><br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="right"> 
    <center><p style="font-size:16px;color:black"> 
        <!-- <a href="javascript:location.replace('HOME.jsp')"><b>Back To Home Page</b></a> -->
        <a href="#" onclick="history.go(-1)"><b>Back To Home Page</b></a>
        
        </p></center>
</td> 
</tr> 
</table>




 
 <br>

      </form>
      </body></html>