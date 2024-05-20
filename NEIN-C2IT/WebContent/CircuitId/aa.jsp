<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@page import="java.sql.*"%> 
<%@page import="java.util.*"%>
<%@ page import="java.io.*" %> 
<%@page language="java"%> 

 <%
             
    Connection conn = null;  
	PreparedStatement psmt=null; 
	
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "vrfdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	
	/* String email=request.getParameter("email"); 
	String psw=request.getParameter("psw"); 
	 */
	try{
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url + dbName, userName,password);
	
	String query="SELECT * FROM `user_right`";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(query); 
	   
		while(rs.next()){
		  	
			System.out.println("Emp Id ::"+rs.getString("emp_id")+"Emp Id ::"+rs.getString("rights"));
		}
	/* String query="INSERT INTO `add_details`(`email`, `password`) VALUES (?,?)";			
	
		psmt = conn.prepareStatement(query);
		psmt.setString(1, email);
	    psmt.setString(2, psw);   
	    
	    psmt.executeUpdate();
	
	    response.sendRedirect("AddDetails.jsp"); */
	    
	}
	catch (Exception e){
		System.out.println("ERROR: Unable to Connect to Database.");	
		e.printStackTrace();
	}
 
 

	%>

