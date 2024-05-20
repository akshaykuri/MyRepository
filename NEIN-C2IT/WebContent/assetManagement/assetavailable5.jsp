<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
	
	////////////////////////////////////////// using for asset transfer //////////////////////////////////
	System.out.println("-------------  Asset Available5 -----------------");
	String uid=request.getParameter("AssetBranch");
	String city=(String)session.getAttribute("city");
	System.out.println("Branch :"+uid);
	String[] city1=city.split(" -");
	System.out.println("City name :"+city1[0]);
	
	//String buffer="<select name='assetno' id='idano' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \">";
	String buffer="<select name='assetName' id='idaType' onchange='assetnofetch(this.value,"+uid+")'>";
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
        rs1 = stmt1.executeQuery("select * from asset_type where it_nonit='IT' order by `item_name` ");
        buffer=buffer+"<option value='Select'>Select</option>";
        while(rs1.next())
                 {
        		 buffer=buffer+"<option value='"+rs1.getString(3)+"'>"+rs1.getString(3)+"</option>";
                 }
        buffer=buffer+"</select>";   
        response.getWriter().println(buffer);
       // System.out.println("buffer :"+buffer);
	    } catch(Exception e)
                {   
		            System.out.println(e);
	            } 
                finally
	             {
	           	  conn.close();
		         }
	%>