<%-- <%@page import="CON1.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String[] words=id.split(",");
 //System.out.println("Level no :"+words[0]);
 //System.out.println("itnono no :"+words[1]);
 //System.out.println("branch no :"+words[2]);
 Connection con=null;
 Statement st=null;
 ResultSet rs=null;
 String msg="";
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from mrlevelmaster where (levelno="+words[0]+" and itnonit='"+words[1]+"' and branch="+words[2]+" and useroffice='"+words[3]+"')");
	 int j=st.executeUpdate("delete from mrapprover where (levelno="+words[0]+" and itnonit='"+words[1]+"' and branch="+words[2]+" and useroffice='"+words[3]+"')");
	 msg="Level__Deleted__Sucessfully...";
	 response.sendRedirect("levelDisp.jsp?itnonit="+words[1]+"&branch="+words[2]+"&useroffice="+words[3]+"&msg="+msg);}catch (Exception e){System.out.println(e);
 }
	 finally{
			//DbUtil.closeDBResources(rs,st,con);

			}
 %>