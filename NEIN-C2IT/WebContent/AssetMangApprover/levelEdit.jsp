<%-- <%@page import="CON1.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }
 function checkNumber(string)
     {
     var numericExpression = /^[0-9]+$/;
     if(string.match(numericExpression)) {
      return true;
     } else {
     return false;
        }
     }
   function validate()
   {
       
	   var d1=document.form.name;
	   var d2=document.form.no;
	   if ((d1.value==null)||(d1.value=="NULL"))
		{
			 alert("Enter Tax Name!");
		         d1.focus();
			 return false;
			 }
if (checkAddress(d1.value)==false)
		{
			d1.value="";
	       alert("Invalid Name");
			d1.focus();
			 return false;
			 }
if ((d2.value==null)||(d2.value=="NULL"))
{
	 alert("Enter Tax Number!");
        d2.focus();
	 return false;
	 }
if (checkNumber(d2.value)==false)
{
	d2.value="";
    alert("Invalid Number \n Should be number");
	d2.focus();
	 return false;
	 }
      
  	 
else
return true;
   }
</script>
<form method="post" name="form" action="levelEditBack.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
		
		<td height="20" bgcolor="white" width="120" align=center><font color="black">LEVEL NAME</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">IT/NONIT</font></td>
		<td bgcolor="white" width="120" align=center><font color="black">BRANCH NAME</font></td>
			</tr>
<%
  String no=request.getParameter("id");
  System.out.println("NUMBER VALUE :"+no);
  String[] words=no.split(",");
  Connection conn=null;
  Statement st=null;
  ResultSet rs=null;

 
  int sumcount=0;
  try 
  
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
  String query = "SELECT * FROM mrlevelmaster WHERE (levelno="+words[0]+" and itnonit="+words[1]+" and branch="+words[2]+")";
   st = conn.createStatement();
   rs = st.executeQuery(query);
  while(rs.next()){%>
  <tr>
     
      <td bgcolor=""><input name="name" style="background-color:white;width:100;color:black;" value="<%=rs.getString(3)%>"></td>
      <td>                 <select name="itnonit" id="iditnonit" >
							<option value="<%=rs.getString(4)%>"><%=rs.getString(4)%></option>
							<option value="IT">IT</option>
							<option value="NONIT">NONIT</option>
							</select>
	  </td>
	  <td><%Connection conb = null;
                        String urlb = "jdbc:mysql://localhost:3306/";
                        String dbb = "csdb";
                        String driverb = "com.mysql.jdbc.Driver";
                        String userNameb ="root";
                        String passwordb="";
                        int i=1;
                        Statement stb=null;
                        ResultSet rsb=null; 
                     try
                       {
                    	// id="idBranch"
						Class.forName(driverb).newInstance();
						conb = DriverManager.getConnection(urlb+dbb,userNameb,passwordb);
						String queryb = "select b_name,b_no from branch_master ORDER BY b_name Asc";
						stb = conb.createStatement();
 						rsb = stb.executeQuery(queryb);
						%>
							<select name="branch" id="idbranch" >
							<option value="<%=rs.getString(5)%>"><%=rs.getString(5)%></option>
							<%while(rsb.next()){%>
								<option value="<%=rsb.getString(2)%>"><%=rsb.getString(2)%></option>
							<%}%>
							</select>
					<%} catch (SQLException ex) {
    											ex.printStackTrace();
												}	
						finally{
							//	DbUtil.closeDBResources(rs,st,con);
							conb.close();
					   }%>
                   </td>
      <td><input type="hidden" name="id" value="<%=rs.getString(2)%>"></td>
      <td><input type="submit" name="Submit" value="Update" onclick="return validate();" style="background-color:white;font-weight:bold;color:black;"></td>
      <td align="left" id="hiderow"><input id="hiderow" type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td>
      </tr>
      <%}}catch(Exception e){}finally{
			/* DbUtil.closeDBResources(rs,st,conn); */

			}%>
      </table>
      </form>