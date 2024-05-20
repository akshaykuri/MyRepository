<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%@page import="java.util.ResourceBundle"%>
<%
System.out.println("------------- Gate Pass  Fetch  -----------------");
////////////////////////////////////////  using for gate pass no fatch //////////////////////////////////
String city=(String)session.getAttribute("city");
String cityNo=(String) session.getAttribute("b_no");
String s=request.getParameter("passType");  

//System.out.println("passtype  :"+s);
String[] city1=city.split(" -");
System.out.println("City name :"+city1[0]);
String buffer="<select name='passFormNo' id='idpassFormNo' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \">";
//String buffer="";
String name=null;
Connection conn = null;
/* String url = "jdbc:mysql://localhost:3306/";
String dbName = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = ""; */
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
String atype=null;
    try{ 
    	Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url+dbName,userName,password); 

        Statement stmt = conn.createStatement(); 
        Statement stmt1 = conn.createStatement(); 
        ResultSet rs=null,rs1=null;
     //   if(s.equals("90"))
              rs1 = stmt1.executeQuery("SELECT DISTINCT formno from GatePassForm where passType='" + s + "' and cityNo='" + cityNo + "' and (approvalStatus!='Pending' and approvalStatus!='NotApproved')");
        /* if(s.equals("10"))
            rs1 = stmt1.executeQuery("SELECT DISTINCT formno from GatePassForm where passType='" + s + "' ");
        if(s.equals("20"))
            rs1 = stmt1.executeQuery("SELECT DISTINCT formno from GatePassForm where passType='" + s + "' ");
        if(s.equals("30"))
            rs1 = stmt1.executeQuery("SELECT DISTINCT formno from GatePassForm where passType='" + s + "' ");
        if(s.equals("40"))
            rs1 = stmt1.executeQuery("SELECT DISTINCT formno from GatePassForm where passType='" + s + "' "); */
        buffer=buffer+"<option value='Select'>Select</option>";
        while(rs1.next())
                 {
        		 buffer=buffer+"<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>";
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



















