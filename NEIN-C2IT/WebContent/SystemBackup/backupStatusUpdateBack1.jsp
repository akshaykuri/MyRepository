<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<%@ page import = "javax.servlet.*,java.text.*" %>
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null; 
Statement st1= null,st2=null,st3=null,st4=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null; 
int l=0,k=1,flag=0,bno=0,count=0;;
String d=null;
long millis=System.currentTimeMillis();  
java.util.Date date=new java.util.Date(millis);  
//System.out.println(date);  
String day=(date.toString()).substring(0,3);
String dt=(date.toString()).substring(8,10);
String yr=(date.toString()).substring(24,28);
String mo=(date.toString()).substring(4,7);
//System.out.println("Day  :"+day);
//System.out.println("Month :"+mo);
// System.out.println("Year :"+yr);
int dt1=Integer.parseInt(dt);
String mo1=null;
if(mo.equalsIgnoreCase("JAN"))
    mo1="01";
else if(mo.equalsIgnoreCase("FEB"))
    mo1="02";
else if(mo.equalsIgnoreCase("MAR"))
    mo1="03";
else if(day.equalsIgnoreCase("APR"))
    mo1="04";
else if(mo.equalsIgnoreCase("MAY"))
    mo1="05";
else if(mo.equalsIgnoreCase("JUN"))
    mo1="06";
else if(mo.equalsIgnoreCase("JUL"))
    mo1="07";
else if(mo.equalsIgnoreCase("AUG"))
    mo1="08";
else if(mo.equalsIgnoreCase("SEP"))
    mo1="09";
else if(mo.equalsIgnoreCase("OCT"))
    mo1="10";
else if(mo.equalsIgnoreCase("NOV"))
    mo1="11";
else if(mo.equalsIgnoreCase("DEC"))
    mo1="12";
  try{
	     cn4 = con.getConnection2();
		st4=cn4.createStatement();
        String msg = "";
        String b_no = (String) session.getAttribute("b_no");
        //System.out.println("City no :"+b_no);
        String empid = request.getParameter("Nno");
        String name=request.getParameter("Nname");
        String desg = request.getParameter("desg");
        String dept = request.getParameter("dept");
        String branch = request.getParameter("branch");
        String sbranch=request.getParameter("sbranch");
        //String systype = request.getParameter("systype");
       // String sysno = request.getParameter("sysno");//empno,name,desg,dept,branch,sbranch,systype,sysno,filebackupfor,yesno,date1,remarks
        String schdate1=null;
        String schdateid=null;
        String schdate=null;
        cn1 = con.getConnection2();
        st1=cn1.createStatement();
        rs1 = st1.executeQuery("select * from systembackupschdaytime where empno='"+empid+"'");
       
       while(rs1.next())
            {
            //String id=rs1.getString(1);
            String scheduleFor="schedfor"+rs1.getString(1);
            String schday="schday"+rs1.getString(1);
            String schtime="schtime"+rs1.getString(1);
            //System.out.println("for :"+scheduleFor);
            //System.out.println("day :"+schday);
            //System.out.println("time :"+schtime);
            String scheduleForDB=request.getParameter(scheduleFor);
		    String schdayDB=request.getParameter(schday);
		    String schtimeDB=request.getParameter(schtime);
		    System.out.println("Schedule for :"+scheduleForDB);;
		    System.out.println("Schedule day :"+schdayDB);
  		    System.out.println("Schedule time :"+schtimeDB);
            String s=null;
            String schday1=rs1.getString(4);
            int p=1;
            while(p<=dt1)
                {
          	    String dy=Integer.toString(p);
            	String inputDateStr = String.format("%s/%s/%s", dy, mo1, yr);
                java.util.Date inputDate = new SimpleDateFormat("dd/MM/yyyy").parse(inputDateStr);
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(inputDate);
                String dayOfWeek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.US).toUpperCase();
                s=dayOfWeek.substring(0,3);
                //System.out.println("Day of week  :"+s); 
           	    // System.out.println("cur day :"+day.toUpperCase());
          	    //System.out.println("schee day :"+rs5.getString(4));
          	    if(schday1.equalsIgnoreCase(s))
          	          {
          		      schdate=p+"/"+mo1+"/"+yr;
          		      schdateid=rs1.getString(1)+p;
          		      schdate1="schdate"+schdateid;
          		      
          		      String yes="yes"+schdateid;
         	          String no="no"+schdateid;
         	          String rem="remarks"+schdateid;
          		      
         	          String schDateDB=request.getParameter(schdate1);
      		          String schyesDB=request.getParameter(yes);
      		          String schnoDB=request.getParameter(no);
      		          String schremDB=request.getParameter(rem);
      		          //System.out.println("Sch yes-------- :"+yes); 
      		          // System.out.println("Sch no-------- :"+no);
      		          //System.out.println("Sch rem-------- :"+rem);
          		      //System.out.println("Sch date :"+schDateDB);
          		      //System.out.println("Sch yes :"+schyesDB);
          		      // System.out.println("Sch no :"+schnoDB);
          		      // System.out.println("Sch rem :"+schremDB);
          		      // System.out.println("----------------------------------------");
          		   if(schyesDB==null)
          		      {
          			  schyesDB="y";
          		      }
          		  if(schnoDB==null)
     		          {
     			      schnoDB="n";
     		          }
          		  if(schyesDB.equals("yes") )
          			      {
                	      //System.out.println("empid........."+empid); 
                	     // System.out.println("file........."+scheduleFor); 
                	      //System.out.println("date........."+schDateDB); 
          				  st4.executeUpdate("update systembackupstatus set yes='yes',Status='Completed' where empno='"+empid+"' and file='"+scheduleForDB+"'  and schdate='"+schDateDB+"'");
          				 // System.out.println("here..yes updadated      .............");
          			      }
          		 else if( schnoDB.equals("no"))
          			      {
          				  //System.out.println("here.......no update........");
           			      st4.executeUpdate("update systembackupstatus set no='no',res='"+schremDB+"' where empno='"+empid+"' and file='"+scheduleForDB+"' and schdate='"+schDateDB+"'");
           	  		      }
          			  else
          			      {
          		          //System.out.println("here..else updadated      .............");
          		          }
          	      }
          	 
          	    p++;
                } 
           }
       msg="SCHEDULE_UPDATED_SUCCESSFULLY";
       response.sendRedirect("backupStatusUpdateBack.jsp?Nno="+empid+"&message="+msg);
    }catch (Exception e) {
	// TODO: handle exception
                          }
       finally{
	          DbUtil.closeDBResources(rs1,st1,cn1);
	          }
%>
