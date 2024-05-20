<%@page import="CON2.DbUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import = "java.text.SimpleDateFormat" %>
<html>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../../js/FormsHelp.js"></script>
    
<script language="javascript"   type="text/javascript">
function Validation()
{

	 var d1=document.form.ReplyRemarks;
	 if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
					{
	  				 alert("Enter Your Remarks!");
	   			         d1.focus();
	  				 return false;
					}
	  
	else
	return true;
	   }
	

</script>
<%!String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,SessionMailId=null; %>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
SessionMailId = (String) session.getAttribute("Nmail");
%>
<%=SessionMailId %>
<form method="post" action="feedbackReplyMailBack.jsp" name="form">
<br />
<br /><br />
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<table border="1" width="60%"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
	
		<td height="20" bgcolor="grey" width="" align=center colspan="2"><font color="black"><b>FEEDBACK REPLY MASTER</b></font></td>
	</tr>
<%
String no=request.getParameter("id");
  
Connection conn=null;
Statement st=null,st2=null;
ResultSet rs=null,rs2=null;

 
  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");

  String query2 = "select *  from branch_master ORDER BY b_name Asc";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2);
  
//id,name,feedback,date,user_mail_id,gm_mail_id,Branch,About,systemAdmin
  String query = "SELECT id,name,feedback,date,user_mail_id,gm_mail_id,Branch,About,systemAdmin FROM feedback where id='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  String systemAdmin=null;
  while(rs.next()){
	  systemAdmin = rs.getString("systemAdmin");
  System.out.println("SYSTEM ADMIN : "+systemAdmin);
  %>

  <tr><td height="20" bgcolor="white" width="25%" ><font color="black" size="2">USER NAME</font></td>
      <td bgcolor="" width="25%" ><%=rs.getString(2)%></td></tr>

        <tr><td bgcolor="white" width="25%" ><font color="black" size="2">DATE</font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><%=rs.getString(4)%></font></td></tr>
        <tr><td bgcolor="white" width="25%" ><font color="black" size="2">DETAILS</font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><textarea rows="2" cols="70" style="background-color:lightgrey;font-weight:bold;color:black;" readonly="readonly" onclick="this.style.height='80px';" onblur="this.style.height='';"><%=rs.getString(3)%></textarea></font></td></tr>
        <tr><td bgcolor="white" width="25" ><font color="black" size="2">BRANCH</font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><%=rs.getString("Branch")%></font></td></tr>
        <tr><td bgcolor="white" width="25" ><font color="black" size="2">REGARDING</font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><%=rs.getString("About")%></font></td></tr>
        <tr><td bgcolor="white" width="25" ><font color="black" size="2">SENDER MAIL ID </font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><%=rs.getString("user_mail_id")%></font></td></tr>
   <% if(systemAdmin!=null) 
       {%>
        <tr><td bgcolor="white" width="25%"  ><font color="black" size="2">SYSTEM ADMIN</font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><%=systemAdmin%></font></td></tr>
     <%}%> 
      <tr><td bgcolor="white" width="25%"  ><font color="black" size="2">G.M MAIL ID </font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><%=rs.getString("gm_mail_id")%></font></td></tr>
      <tr><td bgcolor="white" width="25%"  ><font color="black" size="2">REMARKS</font></td>
      <td bgcolor="" width="25%" ><font color="black" size="2"><textarea rows="4" cols="70"  name="ReplyRemarks" maxlength="200" placeholder="Enter Your Remarks" ></textarea> </font></td></tr>
  <tr><td></td>
  <td bgcolor="lightgrey" align="center">
  <input type="submit" align="middle" size="2" style="background-color:#2f4377;font-weight:bold;color:white;" value='SEND MAIL' onclick="return Validation();">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" align="middle" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" id="btnShowSimple" value="HELP" />

</td></tr>
<input type="hidden" name="id" value="<%=rs.getString(1)%>" />
<input type="hidden" name="SenderMail" value="<%=SessionMailId%>" />
<input type="hidden" name="SenderName" value="<%=SessionName%>"/>
<input type="hidden" name="RepliedDate" value="<%= po_date.format(new java.util.Date()) %>"> 

      <%}}catch (Exception e) { System.out.println(e); }
      finally{
    		DbUtil.closeDBResources(rs,st,conn);
    		DbUtil.closeDBResources(rs2,st2,null);
    		
    	  }%>
      </table>

      <div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="1">
      <tr>
         <td class="web_dialog_title" width="80%"><font size="2"> <center>Help Page</center></font></td>
         <td class="web_dialog_title align_right" ><font size="2"> 
            <a href="#" id="btnClose" style="color:maroon;">X - Close</a></font>
         </td>
      </tr>
      <tr>
      <td colspan="2"><p><font size="2">1 - Displays Feedback/complaints/remarks from all branches</font></p></td>
      </tr>
       <tr>
      <td colspan="2"><p><font size="2">2 - On click of reply button you will be navigated to next page , which displays details of present feedback.</font></p></td>
      </tr>
       <tr>
      <td colspan="2"><p><font size="2">3 - Reply will be sent from your mail id , highlighting your remarks with other details related to complaint. </font></p></td>
      </tr>
      <tr>
      <td colspan="2"><p><font size="2">4 - Wait till you get pop up alert saying. Mail sent to respective  mail id's.</font></p></td>
      </tr>
          <tr>
      <td colspan="2"><p><font size="2">5 - Once replied to particular mail , row will be hidden in dash board.if required admin can check in feedback day to day report. </font></p></td>
      </tr>
       <tr>
      <td colspan="2"><p><font size="2">6 - Fields can not be edited, except remarks (limit is 200 characters).</font></p></td>
      </tr>
      <tr>
      <td colspan="2"><p><font size="2">7 - SYSTEM ADMIN if not present,it will display select i.e no SYSTEM ADMIN for present feedback/complaints/remarks.</font></p></td>
      </tr>
       <tr>
      <td colspan="2"><p><font size="2">8 - Onclick of send mail button , mail will be sent from your mail id to respective mail id's present in the form.</font></p></td>
      </tr>
       <tr>
      <td colspan="2"><p><font size="2">9 - These reports are visible only to Super Admin</font></p></td>
      </tr>
       <tr>
      <td colspan="2"><p><font size="2">10 - Main Keys are User Name , Mail Id's and date.</font></p></td>
      </tr>
     <tr>
      <td colspan="2"><p><font size="2">11 - Cancel button navigates you to back page.</font></p></td>
      </tr>
    
 
      </table>

</div>
      </form>
      </html>