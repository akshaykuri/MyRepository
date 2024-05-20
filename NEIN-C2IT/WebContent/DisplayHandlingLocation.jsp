<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.ResourceBundle"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script language="javascript">


function deleteRecord(id)
{  
	//alert("ID IS : "+id);
	if(confirm('You are above to delete a General Manager Handling Location'))
	{
var f=document.form;    
f.method="post";    
f.action='HandlingLocationDelete.jsp?id='+id;    
f.submit();

	}
	else
		{
		
		//alert("yaaaahuuuu");
		}
}
function btnClick()
{close(); 
	}
	
	
function  get_val5( tot_val,ids)
{
 
      var y = 'iditemName'+ids.toString();
      var z = 'idHead'+ids.toString();
    
     document.getElementById(y).value = tot_val; 
     document.getElementById(z).value = head_val; 
     
}
</script>

<form name="form" method="post" action="HandlingLocationUpdate.jsp">
<br />
<br />
<!-- <center>
<label>ASSIGNED LOCATION FOR SYSTEM ADMIN </label>
</center>
<br />
<br /> -->
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
<td width="100%" bgcolor="lightgrey" colspan="10" align="center"><font size=2 >HANDLING LOCATION FOR ADMIN <font color=red>*</font></font></td>
</tr>
	<tr>
		
		<td height="20" bgcolor="white" width="100" align=center><font color="black" size="2"><b>E-NAME</b></font></td>
		<td bgcolor="white" width="100" align=center><font color="black" size="2"><b>LOCATION</b></font></td>
		
		
		</tr>
<%
String no=request.getParameter("Nname");
// System.out.println("wat is the getting value  :"+no); 
 String req = request.getParameter(no);
 System.out.println("wat is the getting value 2 :"+req); 
  int sumcount=0;
  Connection conn=null;
  Statement st=null,st2=null,st02=null;
  ResultSet rs=null,rs2=null,rs02=null;
  ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
  String query = "select * from handling_master where Locname='"+req+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  
  //String query2= "select b_name from assigned_master,branch_master where assignedLocation=b_name AND Locname='"+req+"'";
  String query2="SELECT b_name FROM branch_master WHERE b_name NOT IN ( SELECT assignedLocation FROM handling_master  Where Locname='"+req+"') ORDER BY b_name ASC";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query2);
  
  String query3= "select b_name from branch_master ORDER BY b_name Asc";
   st02 = conn.createStatement();
   rs02 = st02.executeQuery(query3);
  while(rs.next()){
  String namee= rs.getString("Locname");
  String id = rs.getString(1);
  
  //System.out.println("ID  ********************************************************************    :: "+id);
  %>
  <tr>
     
      <td bgcolor="#F0F0F0"><input  name=Locname style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Locname")%>" readonly="readonly"></td>
     
      <td bgcolor="#F0F0F0"><font color="black"> <input name="assignedLocation" style="background-color:#F0F0F0;width:80;color:black;" value="<%=rs.getString("assignedLocation")%>" readonly="readonly"></font> 
   <%-- 
		<select name="assignedLocation">
			<option value="<%=rs.getString("assignedLocation")%>"><%=rs.getString("assignedLocation")%></option>
			<%while(rs02.next()){ %>
			<option><%=rs02.getString("b_name")%></option>
			
			<%} %>
		</select> --%>
		<%-- <select name="abc5" id="idabc5">
			<option value="">Select Item</option>
			<%while(rs02.next()){ %>
			
			<option onclick="get_val5('<%= rs02.getString("item_name") %>',this.value,this.id);"><%=rs02.getString("item_name")%>
			</option>
			<%} %>
		</select> --%>
   
      </td>
 <%-- <td style = "display:none"><input type="hidden" name="LocPWD" value="<%=rs.getString("LocPWD")%>"></td> --%>
      <td style = "display:none"><input type="hidden" name="id" value="<%=rs.getString("id")%>">
      <input  name=Locpost style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("Locpost")%>" readonly="readonly">
      <input  name=mailId style="background-color:#F0F0F0;width:100;color:black;" value="<%=rs.getString("mailid")%>" readonly="readonly">
      </td>

     
      
	  <td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td></tr>
      
      <%}%>
      </table>
      <table width="100%" border="1" align="center" >
	
	<tr>
<td width="100%" bgcolor="lightgrey" colspan="10" align="center"><font size=2 >ASSIGN NEW LOCATION <font color=red>*</font></font></td>
</tr>
<%
int count=0;
ArrayList<String> branch = new ArrayList<String>();

while(rs2.next()){ 
					branch.add(rs2.getString("b_name"));
					} 
//System.out.println(branch.size());
int column = 0;
 
 for(int row=0;row<branch.size();row+=10)
 {
 %>
   <tr>
  
  <% for(column=0;column<10;column++){
  
  if(row+column<branch.size())
  {
	// System.out.print(" -- "+branch.get(row+column));
	 
	 String temp = branch.get(row+column);
  %>
  
   <td >
  		<INPUT  size="30" width="30" TYPE=CHECKBOX  NAME="assignedLocationNew" onclick="return makeitup();" value="<%=branch.get(row+column)%>" /><%=branch.get(row+column) %></td>
  <%
  }
  }

  //System.out.println();
  %>
  </tr>
  <%} %>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,conn);
			DbUtil.closeDBResources(rs2,st2,null);
			DbUtil.closeDBResources(rs02,st02,null);
			} %>
<tr>
<td style="visibility: hidden;" colspan="4"></td>
 <td align="center" style="border: white;"><input type="submit" name="Submit" value="Update" style="background-color:grey;font-weight:bold;color:black;"></td>
 <td align="center" style="border: white;"><input id="hiderow" type="button" style="background-color:grey;font-weight:bold;color:black;" value='Cancel' onclick='btnClick();'></td>
 <td style="visibility: hidden;" colspan="4" ></td>
 </tr>
	</table>

      </form>