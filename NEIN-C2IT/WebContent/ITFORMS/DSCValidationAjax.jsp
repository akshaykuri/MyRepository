<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %> 
<%@page import="java.util.ResourceBundle"%>
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
String emp_code = request.getParameter("emp_code").toString();
System.out.println("DSC VALIDATION : emp_code : "+emp_code);
String data ="",pathdata="";
Connection con=null;
Statement st=null;
ResultSet rs=null;
try{
	Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+dbName,userName,password); 
 st=con.createStatement();
String path=null,form_no=null;
 //rs=st.executeQuery("select mr_id from mr_master where mr_id = '"+name+"'");
 rs = st.executeQuery("SELECT f.file_path,f.form_no FROM dsc_owner_master d INNER JOIN file_supporting_upload f ON(d.emp_code=f.emp_code) WHERE f.emp_code='"+emp_code+"'");
int count=0;
while(rs.next())
{
count++;
path = rs.getString(1);
form_no = rs.getString(2);

}

if(count>0)
{
data="DSC Dongle Received----"+path+"----"+form_no;
//pathdata=path;
}
else
{
data="Not received";
}
out.println(data);
//out.println(pathdata);
System.out.println(data);
//System.out.println(pathdata);
}
catch (Exception e) {
System.out.println(e);
}finally{
	DbUtil.closeDBResources(rs,st,con);
  
}

%>