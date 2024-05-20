<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String Nname=request.getParameter("Nname");
String Nno=request.getParameter("Nno");
String UID=request.getParameter("UID");
String UPWD=request.getParameter("UPWD");
String post=request.getParameter("post");
String DESG_NO=request.getParameter("DESG_NO");
String city=request.getParameter("city");
String Nmail=request.getParameter("Nmail");
String DEPT_NAME=request.getParameter("DEPT_NAME");
String subDept=request.getParameter("subDept");
String right=request.getParameter("rights");
String newinsUser = request.getParameter("newinsUser");
String msg=null;
Connection conn = null;
Statement st=null,st2=null,st3=null,st4=null,st5=null,st6=null;

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try
{
	
	
	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 
	
	st=conn.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
	st4=conn.createStatement();
	st5=conn.createStatement();
	st6=conn.createStatement();
	//login,nentryho,formUser_master,emp,handling_master
	st.executeUpdate("update login set Nname='"+Nname+"',Nno='"+Nno+"',UID='"+UID+"',UPWD='"+UPWD+"',post='"+post+"',DESG_NO='"+DESG_NO+"',city='"+city+"',Nmail='"+Nmail+"',rights='"+right+"',newinsUser='"+newinsUser+"',DEPT_NAME='"+DEPT_NAME+"',subDept='"+subDept+"' where id='"+num+"'");
	//System.out.println("THIS IS WORKING st ");
	st2.executeUpdate("UPDATE nentryho SET idd='"+UID+"',Nname='"+Nname+"',Npwd='"+UPWD+"',Npost='"+post+"',NpostingCo='"+city+"',Nmail='"+Nmail+"',DESG_NO='"+DESG_NO+"',EMP_NO='"+Nno+"' where Nmail='"+Nmail+"'");
	//System.out.println("THIS IS WORKING st2 ");
	st3.executeUpdate("UPDATE formUser_master SET idd='"+UID+"',Nname='"+Nname+"',Npwd='"+UPWD+"',Npost='"+post+"',NpostingCo='"+city+"',Nmail='"+Nmail+"',DESG_NO='"+DESG_NO+"',deptName='"+DEPT_NAME+"',subDept='"+subDept+"',EMP_NO='"+Nno+"' where Nmail='"+Nmail+"'");
	//System.out.println("THIS IS WORKING st3 ");
	st4.executeUpdate("UPDATE emp SET EMP_NAME='"+Nname+"',EMP_NO='"+Nno+"',DESIGNATION='"+post+"',DESG_NO='"+DESG_NO+"',MAIL_ID='"+Nmail+"',e_city='"+city+"' where MAIL_ID='"+Nmail+"'");
	//System.out.println("THIS IS WORKING st4 ");
	st5.executeUpdate("UPDATE handling_master SET Locname='"+Nname+"',locpost='"+post+"',LocID='"+UID+"',LocPWD='"+UPWD+"',delet='"+city+"',mailid='"+Nmail+"',EMP_NO='"+Nno+"' where Locname='"+Nname+"' AND locpost='"+post+"'");
	//System.out.println("THIS IS WORKING st5 ");
	//need to delete st5 full row once its updated 
	st6.executeUpdate("UPDATE handling_master SET Locname='"+Nname+"',locpost='"+post+"',LocID='"+UID+"',LocPWD='"+UPWD+"',delet='"+city+"',mailid='"+Nmail+"',EMP_NO='"+Nno+"' where mailid='"+Nmail+"'");
	//System.out.println("THIS IS WORKING st6 ");
	if((!post.equals("NULL")) && (post.equals("GENERAL MANAGER") || post.equals("ASST. GENERAL MANAGER") || post.equals("JOINT GENERAL MANAGER") ) )
	{ //7 GENERAL MANAGER 7 
		//System.out.println("FIRST IS WORKING ");
	int k=st.executeUpdate("insert into handling_master(Locname,locpost,assignedLocation,LocID,LocPWD,delet,mailid) values('"+Nname+"','"+post+"','"+city+"','"+UID+"','"+UPWD+"','"+city+"','"+Nmail+"')");
	System.out.println("THIS IS WORKING 1 ");
	}
	
	msg="Name__'"+Nname+"'__with__Designation__'"+post+"'__is__Updated__Successfully";
	response.sendRedirect("displayadmin.jsp?msg="+msg);
	//response.sendRedirect("createadmin.jsp?msg="+msg);
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(null,st,conn);
	DbUtil.closeDBResources(null,st2,null);
	DbUtil.closeDBResources(null,st3,null);
	DbUtil.closeDBResources(null,st4,null);
	DbUtil.closeDBResources(null,st5,null);

	}	%>

