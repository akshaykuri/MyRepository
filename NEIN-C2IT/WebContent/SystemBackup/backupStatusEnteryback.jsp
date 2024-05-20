<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null; 
Statement st1= null,st2=null,st3=null,st4=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null; 
int l=0,k=1,flag=0,bno=0,count=0;;
String d=null,h=null,m=null,p=null;
  try{
        cn1 = con.getConnection2();
        st1=cn1.createStatement();
        String msg = null;
        String b_no = (String) session.getAttribute("b_no");
        System.out.println("City no :"+b_no);
        String empno = request.getParameter("Nno");
        String name=request.getParameter("Nname");
        String desg = request.getParameter("desg");
        String dept = request.getParameter("dept");
        String branch = request.getParameter("branch");
        String sbranch=request.getParameter("sbranch");
        String systype = request.getParameter("systype");
        String sysno = request.getParameter("sysno");//empno,name,desg,dept,branch,sbranch,systype,sysno,filebackupfor,yesno,date1,remarks
        String filebackupfor = request.getParameter("fileEO");
        String yesno = request.getParameter("yesno");
        String date1 = request.getParameter("date1");
        String remarks = request.getParameter("remarks");
        String schdate = request.getParameter("date2");
        String day = schdate.substring(11,14).toUpperCase();  
        System.out.println("Schedule day  :"+day);  
        System.out.println("Schedule for  :"+filebackupfor);  
        
        cn3 = con.getConnection2();
        st3=cn3.createStatement();
        rs3 = st3.executeQuery("select branchno from systemuserbackup where empno='"+empno+"'");
        while(rs3.next())
        	 bno=rs3.getInt(1);
        //System.out.println("branch no :"+bno);
        String str = Integer.toString(bno);
        
	    if(b_no.equals(str))
	          {
	          String query = "select * from systembackupschdaytime where empno='"+empno+"' and schedulefor='"+filebackupfor+"' and schday='"+day+"'";
              cn2 = con.getConnection2();
              st2 = cn2.createStatement();
              rs2 = st2.executeQuery(query);
              if(rs2.next())
                   {	
                    st1.executeUpdate("insert into SystemBackupStatus(empno,empname,desg,dept,branch,subbranch,lapdesk,sysno,yes,date1,res,bno,schdate,file) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+systype+"','"+sysno+"','"+yesno+"','"+date1+"','"+remarks+"','"+b_no+"','"+schdate+"','"+filebackupfor+"')");
                    msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
                   }
               else
                   {
                     msg = "'"+name+"'__NOT__SCHEDULED_ON_SELECTED_DATE/DAY";
                   }
	          }
	    else
	          {
	    	   msg = "YOU_CANT_UPDATE_FOR_OTHER_RESIGN_USERS";	
	          }
         
         response.sendRedirect("backupStatusEntery.jsp?msg=" +msg);
    }catch (Exception e) {
	// TODO: handle exception
                          }
       finally{
	          DbUtil.closeDBResources(rs1,st1,cn1);
	          }
%>
