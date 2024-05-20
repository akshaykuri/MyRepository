<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String no=request.getParameter("count"); 
System.out.println("Count number ---SEL DEPARTMENT -----**********--------------:"+no);

String bufferG="<select name='emp' onchange=\"Mail2(this.value)\" ><option value='-1'>Select</option>";   
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
try
  {
  Class.forName(driver).newInstance();
  con = DriverManager.getConnection(url+dbName,userName,password); 
  stmt = con.createStatement();  
  rs = stmt.executeQuery("Select DISTINCT p_type from  prob_master WHERE department='"+no+"' ORDER BY p_type ASC");
  while(rs.next())
      {  
	  bufferG=bufferG+"<option value='"+rs.getString("p_type")+"'>"+rs.getString("p_type")+"</option>"; 
	  }   
  bufferG=bufferG+"</select>";   
  response.getWriter().println(bufferG); 
  } catch (SQLException ex) {
    ex.printStackTrace();
  }	
finally{
	   DbUtil.closeDBResources(rs,stmt,con);
       } %>