<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%
String id=request.getParameter("id");

String sid=request.getParameter("sid");
String user=request.getParameter("user");
String ip=request.getParameter("ip");
String nusr=request.getParameter("nuser");
String Ltype=request.getParameter("select");
String nuser=request.getParameter("Text1");
int l = 0;
String userlist[] = request.getParameterValues("rr1");
l = userlist.length;
String iplist[] = request.getParameterValues("rr");

//System.out.println("ïd----up---"+id);
//System.out.println("ïd----up---"+Ltype);
//System.out.println("ïd----up---"+nuser);
int i=0;
int j=0;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try
{
	Connection conn = null;
	Class.forName(driver).newInstance();
	conn= DriverManager.getConnection(url+dbName,userName,password);
	Statement st=null,st1=null;
	ResultSet rs=null;
	
     st1=conn.createStatement();
     st=conn.createStatement();
     if(nuser.equals(""))
     {
    	 //System.out.println("nuserrrr emptyyyy");
	 i=st1.executeUpdate("update software_details_multiple set user='"+user+"',ip_addr='"+ip+"' where id='"+id+"'");
	 
	 j=st.executeUpdate("update software_details set license_type='"+Ltype+"',No_of_users='"+nusr+"' where license_no='"+sid+"'");
     }
     else
     {
    	// System.out.println("nuserrrr nottttttt emptyyyy");
    	 for(int k=0; k<l; k++)
   	  {
    		// System.out.println("nuserrrr nottttttt emptyyyy"+userlist[k]);
    		 
    		// System.out.println("nuserrrr nottttttt emptyyyy"+iplist[k]);
    		 
    		 i=st1.executeUpdate("insert into software_details_multiple(license_no,user,ip_addr) values('"+sid+"','"+userlist[k]+"','"+iplist[k]+"')");
    		 	 
   	  }
    	 int ncount=Integer.parseInt(nuser);
    	int nouser=ncount+1;
    	
    //	System.out.println("Number of user------"+nouser);
    	 
    	 j=st.executeUpdate("update software_details set license_type='"+Ltype+"',No_of_users='"+nouser+"' where license_no='"+sid+"'"); 
     }
	 
	 response.sendRedirect("Displayuser.jsp?id="+sid);
}
catch(Exception e)
{
	System.out.println(e);
}%>

