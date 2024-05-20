<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.ResourceBundle"%>
<%String cityA=null,city_noA=null;

        cityA = (String) session.getAttribute("city");//There city
  		city_noA = (String) session.getAttribute("b_no");//There city
  		System.out.println("City : "+cityA);
  		System.out.println("City no A : "+city_noA);
  		%>
<%

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

String name = request.getParameter("app").toString();
System.out.println(name);
String data ="";
Connection con=null;
Statement st=null;
ResultSet rs=null;
String nameSoft=null;
try{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
 st=con.createStatement();

 //rs=st.executeQuery("select mr_id from mr_master where mr_id = '"+name+"'");
// rs = st.executeQuery("Select Distinct Locname FROM assigned_master WHERE software='"+name+"'");
 rs = st.executeQuery("Select Distinct SEname FROM prob_master WHERE department='SOFTWARE DEVELOPMENT' AND p_type='"+name+"'");
int count=0;
while(rs.next())
{
	 nameSoft = rs.getString("SEname");
count++;
}

if(count>0)
{
data="Select - "+nameSoft;
}
/* else
{
data="Not Assigned!!!!";
} */
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}finally{
	DbUtil.closeDBResources(rs,st,con);
  
}

%>