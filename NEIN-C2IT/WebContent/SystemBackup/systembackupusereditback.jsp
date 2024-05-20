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
  try{
        cn = con.getConnection2();
        st=cn.createStatement();
        String msg = null;
        st2=cn.createStatement();
        st3=cn.createStatement();
        String empno = request.getParameter("empno");
        String name=request.getParameter("empname");
        String desg = request.getParameter("desg");
        String dept = request.getParameter("dept");
        String branch = request.getParameter("branch");
        String sbranch=request.getParameter("subbranch");
        String conno = request.getParameter("cono");
        String systype = request.getParameter("systype");
        String sysno = request.getParameter("sysno");
        rs2 = st2.executeQuery("select empno from systemuserbackup where empno='"+empno+"'");
        int i=st.executeUpdate("update systemUserBackup set empno='"+empno+"',empname='"+name+"',desg='"+desg+"',dept='"+dept+"',branch='"+branch+"',subbranch='"+sbranch+"',contactno='"+conno+"',lapdesk='"+systype+"',sysno='"+sysno+"' where empno='"+empno+"'  ");
        msg = "'"+name+"'__DETAIL__UPDATED_SUCCESSFULLY"; 
       response.sendRedirect("viewuser.jsp?msg=" +msg);
    }catch (Exception e) {
	// TODO: handle exception
                          }
       finally{
	          DbUtil.closeDBResources(rs,st,cn);
	          DbUtil.closeDBResources(rs2,st2,cn2);
	          DbUtil.closeDBResources(rs3,st3,cn3);
              }

%>