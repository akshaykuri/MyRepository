<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

//ISP-NAME,MPLS-BRANCH,CIRCUIT ID,BRAND WIDTH,LAN IP,WAN IP,NETWORK IP
//isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip 	
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String isp_name=request.getParameter("isp_name");
String mpls_branch=request.getParameter("mpls_branch");
String crt_id=request.getParameter("crt_id");
String brndwdt=request.getParameter("brndwdt");
String lan_ip=request.getParameter("lan_ip");
String wan_ip=request.getParameter("wan_ip");

String network_ip=request.getParameter("network_ip");
String bkLocation=request.getParameter("bkLocation");
Connection conn=null;
Statement st=null;
try
{
	
	
	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 
  
	st=conn.createStatement();
	st.executeUpdate("update mpls_master set isp_name='"+isp_name+"',mpls_branch='"+mpls_branch+"',crt_id='"+crt_id+"',brndwdt='"+brndwdt+"',lan_ip='"+lan_ip+"',wan_ip='"+wan_ip+"',network_ip='"+network_ip+"',bkLocation='"+bkLocation+"'  where id='"+num+"'");
	response.sendRedirect("Display_MPLS.jsp");
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);
			
			}%>

