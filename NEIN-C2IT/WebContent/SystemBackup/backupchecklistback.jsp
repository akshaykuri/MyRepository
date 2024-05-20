<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
Connection cn = null,cn2=null,cn3=null; 
Statement st = null,st1=null,st2=null,st3=null,st4=null; 
ResultSet rs = null,rs1 = null,rs2=null,rs3=null,rs4=null; 
int l=0,k=1,flag=0,bno=0,count=0;;
String d=null,h=null,m=null,p=null;
  try{
        cn = con.getConnection2();
        st=cn.createStatement();
        st1=cn.createStatement();
        String msg = "";
        String b_no = (String) session.getAttribute("b_no");
        //System.out.println("City no :"+b_no);
        String empno = request.getParameter("Nno");
        String name=request.getParameter("Nname");
        String desg = request.getParameter("desg");
        String dept = request.getParameter("dept");
        String branch = request.getParameter("branch");
        String sbranch=request.getParameter("sbranch");
        String systype = request.getParameter("systype");
        String sysno = request.getParameter("sysno");//idday,idhr,idmm,idfileEO,idsname
        String filebackupfor = request.getParameter("fileEO");
        String sname = request.getParameter("sname");
        String day[] = request.getParameterValues("day");
		l = day.length;
		String hr[] = request.getParameterValues("hr");
	    String mm[] = request.getParameterValues("mm");
	    // System.out.println("length :"+l);
	    st3=cn.createStatement();
        rs3 = st3.executeQuery("select branchno from systemuserbackup where empno='"+empno+"'");
        while(rs3.next())
        	 bno=rs3.getInt(1);
        //System.out.println("branch no :"+bno);
        String str = Integer.toString(bno);
        int  k1=0,l1 = day.length;
	    if(b_no.equals(str))
	          {
	    	  
	    	  //System.out.println("L1  :"+l1);
	          for(k1=1;k1<l1;k1++)
	            {
	        	System.out.println("empno :"+empno);
	        	System.out.println("backup for :"+filebackupfor);
	        	System.out.println("Day :"+day[k1]);
	       	    st2=cn.createStatement();
	       	    rs2 = st2.executeQuery("select empno from systembackupschdaytime  where (empno='"+empno+"' and schedulefor='"+filebackupfor+"' and schday='"+day[k1]+"')");
                if(rs2.next())
                   {
        	       flag=1;
        	       }
                if(flag==0)
                       {
            	       st4=cn.createStatement();
            	       rs4 = st4.executeQuery("select empno from systembackupchecklist where empno='"+empno+"'");
                       if(rs4.next())
                             {
                	         System.out.println("Here.....");
                	         }
                         else
                             {
                	         st.executeUpdate("insert into systembackupchecklist(empno,empname,desg,dept,branch,subbranch,lapdesk,sysno,bno) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+systype+"','"+sysno+"','"+b_no+"')");
                             }
                        d=day[k1];
    	                h=hr[k1];
    	                m=mm[k1];
    	                p=h+":"+m;
    	                st1.executeUpdate("insert into systembackupschDayTime(empno,schedulefor,schday,schtime,softwareused) values('"+empno+"','"+filebackupfor+"','"+d+"','"+p+"','"+sname+"')");
                        p=null;
                        msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
                        count++;
                       }
                   else
                       {
    	               msg = "ALL_READY_SCHEDULED_FOR_'"+filebackupfor+"'_ON_GIVEN_SCHEDULED_DAY";   
    	               st2=null;
    	               rs2=null;
    	               flag=0;
                      }
	           }
	         }
	      else
	         {
	    	 msg = "YOU_CANT_SCHEDULED_FOR_OTHER_RESIGN_USERS";	
	         }
	       if(count>0 && l1>2)
	    	   msg="'"+count+"'_SCHEDULED_INSERTED";
	       response.sendRedirect("backupScheduleBack.jsp?Nno="+empno+"&message="+msg);
    }catch (Exception e) {
	// TODO: handle exception
                          }
       finally{
	          DbUtil.closeDBResources(rs,st,cn);
	          }
%>
