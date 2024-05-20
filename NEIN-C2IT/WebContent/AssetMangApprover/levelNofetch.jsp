<%-- <%@page import="CON1.DbUtil"%> --%>
<%@page import="java.sql.*"%>
<%
String[] temp;
String no=request.getParameter("count"); 
String rmaster1=request.getParameter("type"); 
//System.out.println("Count :"+no);
//System.out.println("type :"+rmaster1);
temp = no.split(",");   
String branch = temp[2];   
String itnon = temp[1];
String useroffice = temp[0];
//System.out.println("branch No :"+branch);
//System.out.println("it nonit :"+itnon);
String buffer="<select name='lno' id='idlno' class='lno' onclick='checkit_nonit();'  style='font-size: 11px;width: 200px;overflow: auto;'><option value='-1'>Select Item</option>";  
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
try
  {
  Class.forName("com.mysql.jdbc.Driver").newInstance();  
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
  stmt = con.createStatement();  
  String levno=null;
  System.out.println("");
  rs=stmt.executeQuery("select * from mrlevelmaster WHERE rmaster='"+rmaster1+"' and branch='"+branch+"' and itnonit='"+itnon+"' and useroffice='"+useroffice+"' ORDER BY levelno Asc");
  while(rs.next())
      {  
	  levno=rs.getString(2)+"--"+rs.getString(3);
	  System.out.println("levelno + name :"+levno);
	  buffer=buffer+"<option class='lno' value="+levno+">"+levno+"</option>";
	  }   
buffer=buffer+"</select>";   
//System.out.println(buffer);
response.getWriter().println(buffer); 
}catch (Exception e) { System.out.println(e); }
finally{
	/* DbUtil.closeDBResources(rs,stmt,con); */
	
} %>