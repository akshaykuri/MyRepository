<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%

////////////////////////////////////////  using for assign asset to office //////////////////////////////////
System.out.println("------------- Sub Branch Fetch  -----------------");
String uid=request.getParameter("bno");  
String city=(String)session.getAttribute("city");
//System.out.println("UID  :"+uid);
String[] city1=city.split(" -");
//System.out.println("City name :"+city1[0]);
String buffer="<select name='subbranch' id='idsubbranch' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \">";
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
        if(uid.equals("90"))
              rs1 = stmt1.executeQuery("select * from branch_master where b_no='90'");
        else if(uid.equals("10"))
            rs1 = stmt1.executeQuery("select * from branch_master where b_no in(10,54)");
        else if(uid.equals("20"))
            rs1 = stmt1.executeQuery("select * from branch_master where b_no in (20,21,51)");
        else if(uid.equals("30"))
            rs1 = stmt1.executeQuery("select * from branch_master where b_no in (30,31,53)");
        else if(uid.equals("40"))
            rs1 = stmt1.executeQuery("select * from branch_master where b_no in(40,41,52)");
        else 
            rs1 = stmt1.executeQuery("select * from branch_master ");
        
        buffer=buffer+"<option value='Select'>Select</option>";
        while(rs1.next())
                 {
        		 buffer=buffer+"<option value='"+rs1.getString(2)+"'>"+rs1.getString(2)+"</option>";
                 }
        buffer=buffer+"</select>";   
        response.getWriter().println(buffer);
        //System.out.println("buffer :"+buffer);
    } catch(Exception e)
                {   
	            System.out.println(e);
	            } 
                   finally
	                 {
	            	  conn.close();
			         }
	%>