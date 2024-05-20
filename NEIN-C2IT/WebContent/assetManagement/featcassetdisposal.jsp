<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
System.out.println("-------------  asset  available for Disposal-----------------");
String uid=request.getParameter("AssetType");  
String bname=request.getParameter("bname"); 
System.out.println("City name 1234 :"+bname);
String city=(String)session.getAttribute("city");
//System.out.println("City name :"+city);
String[] city1=city.split(" -");
//System.out.println("City name :"+city1[0]);
String buffer="<select name='assetNoDisposal' id='assetNoDisposal' onchange='assetConfigFetch(this.value)' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";
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
        ResultSet rs = stmt.executeQuery("select * from asset_item where ( BranchName='"+bname+"'  && assignStatus=0 && Scrap=0 && Maintanance=0); ");
        // String buffer = "";

        
        while(rs.next()){ 
        	
        	System.out.println(" ::: "+rs.getString(3));
        	//buffer=buffer+"<option value='"+rs.getString("EMP_NAME")+"'>"+rs.getString("EMP_NAME")+"</option>";
        	buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";
        	}   
      // buffer=buffer+"</select>";   
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