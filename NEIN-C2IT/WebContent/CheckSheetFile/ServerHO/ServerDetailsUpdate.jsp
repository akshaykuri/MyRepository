<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
//int num=Integer.parseInt(ide);
String server_name=request.getParameter("server_name");
String drive=request.getParameter("drive");//c/d,e,f
String hdd_space=request.getParameter("hdd_space");//space
String si_drive_type = request.getParameter("si_drive_type");//gb/tb
System.out.println("si_drive_type :"+si_drive_type);
System.out.println("hdd_space :"+hdd_space);
int gbconvert=0;
if(si_drive_type.equals("TB"))
    {System.out.println("Gb Type:");
	gbconvert=1024*Integer.parseInt(hdd_space);
	System.out.println("Gb Type 1:"+gbconvert);
    }
else
    {
	gbconvert=Integer.parseInt(hdd_space);
	System.out.println("Gb Type 2:"+gbconvert);
    }

Connection conn = null;
Statement st=null;
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 

	st=conn.createStatement();
	st.executeUpdate("update  server_details_master set server_name='"+server_name+"',drive='"+drive+"',hdd_space='"+hdd_space+"',si_drive_type='"+si_drive_type+"',drive_detail='"+gbconvert+"' where id='"+num+"'");
	response.sendRedirect("DisplayServerDetails.jsp");
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(null,st,conn);

	}	%>

