<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%String no=request.getParameter("count");  
String buffer="<select name='Subcity' onchange=\"Mail(this.value)\" style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";  
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
try{ Class.forName("com.mysql.jdbc.Driver").newInstance();  
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
 stmt = con.createStatement();  
 rs = stmt.executeQuery("select id,b_name from branch_master WHERE b_no='"+no+"' ORDER BY b_name Asc");
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
}catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,stmt,con);
	
} %>