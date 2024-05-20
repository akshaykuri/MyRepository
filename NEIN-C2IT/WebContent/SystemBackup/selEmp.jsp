<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%

String no=request.getParameter("count");  
//System.out.println("No : " + no);
//session.setAttribute("cityname", city);
//session.setAttribute("MRDepart", mr_department);
//session.setAttribute("CEorNCE", mrasset);
/* String desgA= (String) session.getAttribute("desg");//There Desig
String Dept_NameA = (String) session.getAttribute("Dept_Name");
String city_noA = (String) session.getAttribute("b_no");//There city
String city = (String) session.getAttribute("cityname");
String mrdepartment = (String) session.getAttribute("MRDepart");
String mrasset = (String) session.getAttribute("CEorNCE");
System.out.println("MRCITY NAME : " + city);
System.out.println("MR DEPARTMENT : " + mrdepartment);
System.out.println("CEorNCE : " + mrasset);
System.out.println("city no : " + city_noA);
System.out.println("city : " + city);
System.out.println("desig A : " + desgA); */

String buffer="<select name='emp' id='idemp'><option value='-1'>Select</option>";  
Connection con=null;
Statement st=null;
ResultSet rs=null;
Statement stmt=null;
try{ Class.forName("com.mysql.jdbc.Driver").newInstance();  
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
 stmt = con.createStatement();  
 rs = stmt.executeQuery("Select DISTINCT e.EMP_NAME from emp e  where e.DESIGNATION='"+no+"'    ORDER BY e.EMP_NAME ASC");
 while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("EMP_NAME")+"'>"+rs.getString("EMP_NAME")+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
} catch(Exception e){   
	System.out.println(e); }finally{
		DbUtil.closeDBResources(rs,st,con);
	    DbUtil.closeDBResources(rs,st,con);
	    DbUtil.closeDBResources(null,stmt,null);
		} %>