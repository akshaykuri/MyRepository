<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
Object city=null;
city = session.getAttribute("NpostingCo"); 
%>
<%String no=request.getParameter("count");

String full_name = no; // 004
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");


String city2=request.getParameter("city");
System.out.println("no11111111  :  "+no);
System.out.println("department_id :  "+full_name);

System.out.println("CITYY111111  :  "+city);
/* String buffer="<select name='emp' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>";  */
String buffer=null;
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
//emp_id,type_of_employee,emp_grade
String emp_id=null,type_of_employee=null,emp_grade=null,branch_name=null,department_name=null;
try{ Class.forName(driverl).newInstance();
con = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
 stmt = con.createStatement();  
 //rs = stmt.executeQuery("Select emp_id,type_of_employee,emp_grade from user where full_name='"+full_name+"' ORDER BY full_name "); 
 rs = stmt.executeQuery("SELECT  u.emp_id,u.type_of_employee,u.emp_grade,b.branch_name,d.department_name FROM user u INNER JOIN branchmaster b ON(u.branch_id=b.branch_id) INNER JOIN department d ON(u.department_id=d.department_id) WHERE full_name='"+full_name+"' AND employee_status='yes' ORDER BY full_name");
 
//ResultSet rs = stmt.executeQuery("Select DISTINCT e.EMP_NAME from emp where l.post=e.DESIGNATION AND e.DESIGNATION='"+no+"' AND l.city ='"+city2+"' ORDER BY e.EMP_NAME ASC");
//ResultSet rs = stmt.executeQuery("Select DISTINCT EMP_NAME from emp where DESIGNATION='"+no+"' AND e_city ='"+city2+"' ORDER BY EMP_NAME ASC");

while(rs.next()){  
/* 	buffer=buffer+"<option value='"+rs.getString("full_name")+"'>"+rs.getString("full_name")+"</option>"; 
	System.out.println("EMP NAME we are getting ::: "+rs.getString("full_name")); */
	
	 emp_id = rs.getString("emp_id");
	 type_of_employee = rs.getString("type_of_employee");
	 emp_grade = rs.getString("emp_grade");
	 branch_name = rs.getString("branch_name");
	 department_name = rs.getString("department_name");
	
	}  
//buffer= emp_id+"<input value='"+emp_id+"' name='ecode'/>";
buffer = emp_id+"--"+type_of_employee+"--"+emp_grade+"--"+branch_name+"--"+department_name;
System.out.println("buffer value "+buffer);
//buffer=buffer+"</select>";   
response.getWriter().println(buffer); 


} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			} %>