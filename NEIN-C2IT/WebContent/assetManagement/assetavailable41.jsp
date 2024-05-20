<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%

	////////////////////////////////////////// using for asset transfer //////////////////////////////////
	System.out.println("-------------  Asset Available41 -----------------");
	String uid=request.getParameter("AssetType");  
	String Branch=request.getParameter("Branch");
	String city=(String)session.getAttribute("city");
	System.out.println("AssetType  :"+uid+ " Branch "+Branch);
	String[] city1=city.split(" -");
	System.out.println("City name :"+city1[0]);
	String buffer="<select name='assetno1' id='idano1' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \">";

	String name=null;
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root"; 
	String password = "";
	String atype=null;
	    try{ 
	    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
	        conn = DriverManager.getConnection(url+dbName,userName,password);  
	        Statement stmt = conn.createStatement(); 
	        Statement stmt1 = conn.createStatement(); 
	        ResultSet rs=null,rs1=null;
	        //ResultSet rs = stmt.executeQuery("select * from asset_item where (AssetType='" + uid + "' && BranchName='"+city1[0]+"' && assignStatus=0 && Scrap=0 && Maintanance=0); ");
	        rs1 = stmt1.executeQuery("select * from asset_item where (AssetType='" + uid + "'and Branch='"+Branch+"' and Scrap=0 and Maintanance=0 and assignStatus=0); ");
	        buffer=buffer+"<option value='Select'>Select</option>";
	        while(rs1.next())
	                 {
	        		 buffer=buffer+"<option value='"+rs1.getString(3)+"'>"+rs1.getString(3)+"</option>";
	                 }
	        buffer=buffer+"</select>";   
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