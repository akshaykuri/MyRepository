<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
Object city=null;
city = session.getAttribute("NpostingCo"); 
%>
<%String branch=request.getParameter("count");


String city2=request.getParameter("city");
System.out.println("branch  :  "+branch);
String branch_type_code=null;
System.out.println("CITYY111111  :  "+city);
String buffer="<select name='sub_branch' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>"; 
Connection con=null;
Statement stmt=null,stmt2=null;
ResultSet rs =null,rs2=null;
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
try{ Class.forName(driverl).newInstance();
con = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
 stmt = con.createStatement();  
 stmt2 = con.createStatement();  
 rs2 = stmt2.executeQuery("Select branch_type_code FROM branchmaster WHERE branch_id='"+branch+"' "); 
 while(rs2.next()){  
       branch_type_code = rs2.getString("branch_type_code");
		} 
 System.out.println("branch_type_code :"+branch_type_code);

 
rs = stmt.executeQuery("Select b_name FROM branch_master WHERE b_no='"+branch_type_code+"' ORDER BY b_name ASC ");   
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("b_name")+"'>"+rs.getString("b_name")+"</option>"; 
	System.out.println("BRANCH NAME we are getting ::: "+rs.getString("b_name"));
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 


} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(rs,stmt,con);
	DbUtil.closeDBResources(rs2,stmt2,con);

			} %>