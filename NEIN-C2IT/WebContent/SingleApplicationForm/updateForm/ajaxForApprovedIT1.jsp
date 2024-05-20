<%@ page import="java.sql.*"%> 
<%@page import="java.util.ResourceBundle"%> 

<%
String name=null,ro=null,ro1=null,desg=null;

Connection cn5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password);
Statement stcsdb = cn5.createStatement();
Statement st5 = cn5.createStatement();
Statement stcsout = cn5.createStatement();
	
boolean flag = false;
String levelno=request.getParameter("lvl");  
String reqFor=request.getParameter("reqF");
String i_b_no1=request.getParameter("i_b_no1");
String nextlevel1=request.getParameter("nextlevel");
int nextlevel=0;
nextlevel = Integer.parseInt(nextlevel1);

String nexType="",newReq="",internetType="",reqForChange="";
String buffer="<div id='resultFromAjaxApp' style='display:inline;'>";

try
{
	
if(!(reqFor.contains("NEWINS")) && !(reqFor.contains("GS-NET")) && !(reqFor.contains("NEx-GLOW")) && !(reqFor.contains("NExAS")) && Integer.parseInt(levelno)==3 && !i_b_no1.equals("90")){
	nextlevel++;
	nextlevel++;
//System.out.println("here"+nextlevel);
}else if(!(reqFor.contains("NEWINS")) && !(reqFor.contains("GS-NET")) && !(reqFor.contains("NEx-GLOW")) && !(reqFor.contains("NExAS")) && Integer.parseInt(levelno)==1 && i_b_no1.equals("90")){
	nextlevel++;
	nextlevel++;
}

System.out.println("nextlevelhere====>"+nextlevel);

String nuname="",ndesg="",nmailid="",napproval="",napproval1="";

ResultSet rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='APPLICATION' ORDER BY levelno ASC");
if(rs5.next())
{
Connection connhrms = null;
ResourceBundle dbPropertiesl1 = ResourceBundle.getBundle("leavemanagement");
String userName1l = dbPropertiesl1.getString("leavemanagement.username");
String password1l = dbPropertiesl1.getString("leavemanagement.password");
String urll1 = dbPropertiesl1.getString("leavemanagement.url");
String driver1l = dbPropertiesl1.getString("leavemanagement.driverName");
String dbNamel1 = dbPropertiesl1.getString("leavemanagement.dbName");

connhrms = DriverManager.getConnection(urll1+dbNamel1,userName1l,password1l);  
Statement nstmt = connhrms.createStatement();  

nstmt = connhrms.createStatement(); 
ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString(5) + "' ) AND u.employee_status = 'yes' ");
if(nrs.next())
{ 
nuname=nrs.getString(1);
ndesg=nrs.getString(2);
nmailid=nrs.getString(6);
buffer = buffer + "<input type='text' id='a1' value='"+reqFor+"'>";
buffer = buffer + "<input type='text' id='a2' value='"+i_b_no1+"'>";
buffer = buffer + "<input type='text' id='a3' value='"+levelno+"'>";
buffer = buffer + "<input type='text' id='a4' value='"+nextlevel+"'>";
buffer = buffer + "<input type='text' id='a5' value='"+nuname+"'>";
buffer = buffer + "<input type='text' id='a6' value='"+ndesg+"'>";
buffer = buffer + "<input type='text' id='a7' value='"+nmailid+"'>";
}

napproval=rs5.getString(5)+","+nuname+","+ndesg+","+nmailid+","+nextlevel;
napproval1=nuname+" ("+nmailid+")";
System.out.println("Next approval :"+napproval);
buffer = buffer + "<input type='text' id='a8' value='"+napproval+"'>";
buffer = buffer + "<input type='text' id='a9' value='"+napproval1+"'>";

}
buffer=buffer+"</div>";

response.getWriter().print(buffer);
}catch(Exception e)
{   
System.out.println(e);
} 
finally
{
cn5.close();
}
%>  