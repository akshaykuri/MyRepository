<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
Object city=null;
city = session.getAttribute("NpostingCo"); 

ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
%>
<%String no=request.getParameter("count");
String[] parts = no.split("--");
String department_id = parts[0]; // 004
String branch_id = parts[1];

String city2=request.getParameter("city");
System.out.println("no11111111  :  "+no);
System.out.println("department_id :  "+department_id);
System.out.println("branch_id  :  "+branch_id);
System.out.println("CITYY111111  :  "+city);
String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>"; 
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try{ Class.forName(driverl).newInstance();
con = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select * from user where department_id='"+department_id+"' AND branch_id='"+branch_id+"' AND employee_status='yes' ORDER BY full_name ");   
//ResultSet rs = stmt.executeQuery("Select DISTINCT e.EMP_NAME from emp where l.post=e.DESIGNATION AND e.DESIGNATION='"+no+"' AND l.city ='"+city2+"' ORDER BY e.EMP_NAME ASC");
//ResultSet rs = stmt.executeQuery("Select DISTINCT EMP_NAME from emp where DESIGNATION='"+no+"' AND e_city ='"+city2+"' ORDER BY EMP_NAME ASC");

while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("full_name")+"'>"+rs.getString("full_name")+"</option>"; 
	System.out.println("EMP NAME we are getting ::: "+rs.getString("full_name"));
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 


} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			} %>