<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String no=request.getParameter("count"); 

String[] parts = no.split("-----");
String city = parts[0]; // 004
String reportTo = parts[1]; // 034556


String service = request.getParameter("service");
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");


String bufferG="<select name='emp' onchange=\"Mail2(this.value)\" ><option value='-1'>Select</option>";   

Connection con=null;
Statement stmt=null;
ResultSet rs =null;
String l=null;
try{ Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+dbName,userName,password);   
 stmt = con.createStatement();  
//ResultSet rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ");  
 //rs = stmt.executeQuery("SELECT DISTINCT EMP_NAME FROM emp INNER JOIN assigned_master a ON(emp.EMP_NAME=a.Locname) WHERE Locpost='"+no+"' ORDER BY EMP_NAME");
 //rs = stmt.executeQuery("SELECT DISTINCT Nname FROM nentryho WHERE Npost='"+no+"' ORDER BY Nname ASC");
// rs = stmt.executeQuery("SELECT DISTINCT Locname FROM assigned_master WHERE assignedLocation='"+no+"' ORDER BY Locname ASC");
// shows all system admins accept the persons are in leave of any type.
 rs = stmt.executeQuery("SELECT DISTINCT NEHo.Locname,SubQ.Locname FROM assigned_master NEHo LEFT JOIN"+
		 "(SELECT a.Locname,av.name FROM assigned_master a LEFT JOIN availability av ON(a.Locname=av.name) WHERE DATE(NOW()) between av.date1 AND av.date2) as subQ ON (NEHo.Locname=subQ.Locname) WHERE  NEHo.assignedLocation='"+city+"' AND NEHo.depart='"+reportTo+"' AND SubQ.locname is null ORDER BY NEHo.Locname ASC");
while(rs.next()){  
	l=rs.getString("Locname");
	if(!l.equals("PRASANNA KUMAR"))
	bufferG=bufferG+"<option value='"+rs.getString("Locname")+"'>"+rs.getString("Locname")+"</option>"; 
	}   
bufferG=bufferG+"</select>";   
response.getWriter().println(bufferG); 
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			} %>