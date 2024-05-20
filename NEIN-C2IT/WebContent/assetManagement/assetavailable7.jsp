<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
	System.out.println("-------------  Asset Available 7 -----------------");
	String AssetNo=request.getParameter("AssetNo");  
	String city=(String)session.getAttribute("city");
	String[] city1=city.split(" -");
	String buffer="";
	String name=null;
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root"; 
	String password = "";
	    try{ 
	    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
	        conn = DriverManager.getConnection(url+dbName,userName,password);  
	        Statement stmt = conn.createStatement();  
	        ResultSet rs = stmt.executeQuery("select * from asset_item where (Asset_No='" + AssetNo + "'  && assignStatus=0 && Scrap=0 && Maintanance=0); ");
	        while(rs.next()){  
	        		buffer = buffer + "<input type='text' id='mobileSerial' value='"+rs.getString("serial_no")+"'>";
	        		buffer = buffer + "<input type='text' id='mobileano' value='"+ AssetNo +"'>";
	        		buffer = buffer + "<input type='text' id='mobileatype' value='"+rs.getString("AssetType") +"'>";
	        		buffer = buffer + "<input type='text' id='mobileModel' value='"+rs.getString("model_no")+"'>";
	        	}   
	        System.out.println("Buffer ::"+buffer);
	        	response.getWriter().println(buffer);
	        	
	   		 } catch(Exception e)
	           {   
		          System.out.println(e);
		       } 
	           finally
		        {
		         conn.close();
			    }
	%>