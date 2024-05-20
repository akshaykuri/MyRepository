<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
System.out.println("-------------  NONIT AssetAvailabel 1 -----------------");
String uid=request.getParameter("AssetNo");  
String city=(String)session.getAttribute("city");
//System.out.println("City name :"+city);
String[] city1=city.split(" -");
System.out.println("City name :"+city1[0]);
String buffer="<select name='assetno' id='idano' onchange='assetConfigFetch(this.value)' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \">";
//String buffer="";
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
        rs = stmt.executeQuery("select * from asset_item where (Asset_No='" + uid + "'  && assignStatus=0 && Scrap=0 && Maintanance=0); ");
        if(rs.next()){ 
        	atype=rs.getString(4);
        	rs1 = stmt1.executeQuery("select * from asset_item where (AssetType='" + atype + "' && Asset_No!='" + uid + "' && assignStatus=0 && Scrap=0 && Maintanance=0); ");
        	buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";
        	while(rs1.next())
                 {
        		 buffer=buffer+"<option value='"+rs1.getString(3)+"'>"+rs1.getString(3)+"</option>";
                 }
        	buffer = buffer + "<input type='hidden' id='configuration' value='"+rs.getString("ConfigField")+"'>";
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