
<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="assetTypeUpdate.jsp">
<br/>
<br/>
<br/>
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
	<tr>
	    <td></td>
		<td bgcolor="lightgrey" width="120" align=center><font color="black">Asset Name</font></td>
	    <td bgcolor="lightgrey" width="120" align=center><font color="black">AssetDisc</font></td>
        <td bgcolor="lightgrey" width="120" align=center><font color="black">IT/NONIT</font></td>
        <!-- <td style="visibility: hidden;" ></td> -->
        <td bgcolor="lightgrey" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
		<%
			System.out.println("--------------   Asset Type Edit --------------- ");
			String no=request.getParameter("id");
			String[] temp;
			temp = no.split(",");
			String aid=temp[0];
			String an=temp[1];
			String co=temp[2];
			String cod=temp[3];
			//System.out.println(an);
			//System.out.println(co);
			Connection conn=null;
			Statement st=null,st2=null,st02=null;
			ResultSet rs=null,rs2=null,rs02=null;
			int sumcount=0;
		 	try 
		  	{
		   	Class.forName("com.mysql.jdbc.Driver");
		  	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");
		   	String query1 = "select item_name from asset_type";
		   	st2 = conn.createStatement();
		  	rs2 = st2.executeQuery(query1);  %>
		    <tr>
		       <td style="visibility: hidden;"><input type="hidden" name="aid" value="<%=aid%>"></td>
		        <%--  <td bgcolor=""><font color="white">
			     <select name="assetname">
			     <option value="<%=an%>"><%=an%></option>
			     <% while(rs2.next()){ %>
			         <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
			      <%}%> 
			     </select>
			      </font></td> --%>
			       <td bgcolor=""><input name="assetname" style="background-color:white;width:100;color:black;" value="<%=an%>" readonly></td>
			     <td bgcolor=""><input name="config" style="background-color:white;width:100;color:black;" value="<%=co%>"></td>
			     <td bgcolor="">
			            <select name="configdig">
			                 <option value="<%=cod%>"><%=cod%></option>
			                 <option value="IT">IT</option>
			                  <option value="NONIT">NONIT</option>
			     
			     </select>
			       </td>
		       
		       <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
		       <td bgcolor="lightgrey"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
			      <% }catch (SQLException ex) 
		             {
		              ex.printStackTrace();
		             }     	
		 	%>
      </table>
      </form>