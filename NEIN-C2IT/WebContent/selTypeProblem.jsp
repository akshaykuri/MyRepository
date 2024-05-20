<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String no=request.getParameter("count"); 
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
System.out.println("Count number SHOW TYPE : "+no);
String buffer="<select name='typo' onchange=\"showDesc(this.value)\" ><option value='-1'>Select</option>";   

Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try
   { 
   Class.forName(driver).newInstance();
   con = DriverManager.getConnection(url+dbName,userName,password); 
   stmt = con.createStatement();  
   rs = stmt.executeQuery("SELECT DISTINCT pt_descriptions FROM prob_type_master_sub WHERE name='"+no+"' ORDER BY pt_descriptions ASC");
   while(rs.next())
        {  
	    buffer=buffer+"<option value='"+rs.getString("pt_descriptions")+"'>"+rs.getString("pt_descriptions")+"</option>"; 
	    }   
   buffer=buffer+"</select>";   
   response.getWriter().println(buffer); 
   } catch (SQLException ex) {
    ex.printStackTrace();
   }	
   finally{
			DbUtil.closeDBResources(rs,stmt,con);
		} %>