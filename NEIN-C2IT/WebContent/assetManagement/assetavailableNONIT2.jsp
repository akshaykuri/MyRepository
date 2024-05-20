<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
System.out.println("-------------  Asset Available2 -----------------");
String uid=request.getParameter("AssetType");  
String city=(String)session.getAttribute("city");
//System.out.println("City name :"+city);
String[] city1=city.split(" -");
//System.out.println("City name :"+city1[0]);
String buffer="";
//String buffer="";
//System.out.println();
String name=null;
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "";
//select * from branch_master ORDER BY b_name
//ArrayList array=new ArrayList();
    try{ 
    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
        conn = DriverManager.getConnection(url+dbName,userName,password);  
        Statement stmt = conn.createStatement();  
        //ResultSet rs = stmt.executeQuery("select * from asset_item where (AssetType='" + uid + "' && BranchName='"+city1[0]+"' && assignStatus=0 && Scrap=0 && Maintanance=0); ");
        ResultSet rs = stmt.executeQuery("select * from asset_item where (AssetType='" + uid + "'  && assignStatus=0 && Scrap=0 && Maintanance=0); ");
        // String buffer = "";
        while(rs.next()){  
        		buffer = buffer + "<input type='text' id='configuration' value='"+rs.getString("ConfigField")+"'>";
        	}   
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