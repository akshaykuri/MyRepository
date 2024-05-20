<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
Connection cn = null,cn2=null,cn3=null; 
Statement st = null,st2=null,st3=null; 
ResultSet rs = null,rs2=null,rs3=null;
int i=0;
  try{
        cn = con.getConnection2();
        st=cn.createStatement();
        String msg = null;
        st2=cn.createStatement();
        st3=cn.createStatement();
        String empno = request.getParameter("Nno");
        String name=request.getParameter("Nname");
        String desg = request.getParameter("desg");
        String dept = request.getParameter("dept");
        String branch = request.getParameter("branch");
        String sbranch=request.getParameter("sbranch");
        String conno = request.getParameter("cono");
        String systype = request.getParameter("systype");
        String sysno = request.getParameter("sysno");
        
        String bcode = request.getParameter("bcode"); // creating system user branch code
        String b_no = (String) session.getAttribute("b_no");//login user branch code.
        System.out.println("Branch code :"+bcode);
        rs2 = st2.executeQuery("select empno from systemuserbackup where empno='"+empno+"'");
        if(rs2.next()){
	                   msg = "'"+empno+"'__IS__ALREADY EXIST.......";
                      }
                  else
                      {
                	  if(b_no.equals("90") && bcode.equals("90"))
                	      { 
                           st.executeUpdate("insert into systemUserBackup(empno,empname,desg,dept,branch,subbranch,contactno,lapdesk,sysno,branchno) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+conno+"','"+systype+"','"+sysno+"','"+b_no+"')");
                           msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
                	      }
                	  else if(b_no.equals("30") && (bcode.equals("30") || bcode.equals("31") || bcode.equals("53") ))
            	          { 
                           st.executeUpdate("insert into systemUserBackup(empno,empname,desg,dept,branch,subbranch,contactno,lapdesk,sysno,branchno) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+conno+"','"+systype+"','"+sysno+"','"+b_no+"')");
                           msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
            	          }
                	  else if(b_no.equals("40") && (bcode.equals("40") || bcode.equals("41") || bcode.equals("52") ))
        	              { 
                          st.executeUpdate("insert into systemUserBackup(empno,empname,desg,dept,branch,subbranch,contactno,lapdesk,sysno,branchno) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+conno+"','"+systype+"','"+sysno+"','"+b_no+"')");
                          msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
        	              }
                	  else if(b_no.equals("20") && (bcode.equals("20") || bcode.equals("21") || bcode.equals("88") || bcode.equals("51") || bcode.equals("89")))
    	                  { 
                          st.executeUpdate("insert into systemUserBackup(empno,empname,desg,dept,branch,subbranch,contactno,lapdesk,sysno,branchno) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+conno+"','"+systype+"','"+sysno+"','"+b_no+"')");
                           msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
    	                   }
                	  else if(b_no.equals("10") && (bcode.equals("10") || bcode.equals("54") ))
    	                   { 
                           st.executeUpdate("insert into systemUserBackup(empno,empname,desg,dept,branch,subbranch,contactno,lapdesk,sysno,branchno) values('"+empno+"','"+name+"','"+desg+"','"+dept+"','"+branch+"','"+sbranch+"','"+conno+"','"+systype+"','"+sysno+"','"+b_no+"')");
                           msg = "'"+name+"'__DETAIL__SAVED_SUCCESSFULLY";
    	                   }
                	  else
                	       {
                		    msg = "'"+name+"'__dose_not_exist_in_your_resign......";
                	       }
                    }
       response.sendRedirect("systemuser.jsp?msg=" +msg);
    }catch (Exception e) {
	// TODO: handle exception
                          }
       finally{
	          DbUtil.closeDBResources(rs,st,cn);
	          DbUtil.closeDBResources(rs2,st2,cn2);
	          DbUtil.closeDBResources(rs3,st3,cn3);
              }

%>