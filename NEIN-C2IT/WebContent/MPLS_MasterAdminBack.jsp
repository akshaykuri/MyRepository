<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>MPLS MASTER PAGE</title>

<script type="text/javascript">
function btnClick() { 
         close(); 
}
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">


<br>
<br>




<center><font size=4 ><b>


<%
Connection cn = null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null; 
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();
String msg = null;
//<!--isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip  -->
String isp_name=request.getParameter("isp_name");
String mpls_branch=request.getParameter("mpls_branch");
String crt_id=request.getParameter("crt_id");
String brndwdt=request.getParameter("brndwdt");
String lan_ip=request.getParameter("lan_ip");
String wan_ip=request.getParameter("wan_ip");
String network_ip=request.getParameter("network_ip");
String bkLocation=request.getParameter("bkLocation");

PreparedStatement psmt1=null;
rs = st2.executeQuery("select isp_name from mpls_master where isp_name='"+isp_name+"'");
if(rs.next()){
	
	//out.println(".........'"+isp_name+"' IS ALREADY EXIST.......");
	 msg = "...'"+isp_name+"'__IS__ALREADY EXIST.......";
}

else{

//int i=st.executeUpdate("insert into mpls_master(isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip,bkLocation) 
//values('"+isp_name+"','"+mpls_branch+"','"+crt_id+"','"+brndwdt+"','"+lan_ip+"','"+wan_ip+"','"+network_ip+"','"+bkLocation+"')");
psmt1 = cn.prepareStatement("insert into mpls_master(isp_name,mpls_branch,crt_id,brndwdt,lan_ip,wan_ip,network_ip,bkLocation) values(?,?,?,?,?,?,?,?)");
psmt1.setString(1,isp_name);
psmt1.setString(2,mpls_branch);
psmt1.setString(3,crt_id);
psmt1.setString(4,brndwdt);
psmt1.setString(5,lan_ip);
psmt1.setString(6,wan_ip);
psmt1.setString(7,network_ip);
psmt1.setString(8,bkLocation);

int i = psmt1.executeUpdate();
//out.println("................................\n '"+isp_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");
msg = "'"+isp_name+"'__SAVED__SUCCESSFULLY";
}
response.sendRedirect("MPLS_Master.jsp?msg=" +msg);

%>
<%
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,null);

			}
%>

<br>
<br />
<br />



 <button onclick="window.location.href='MPLS_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


