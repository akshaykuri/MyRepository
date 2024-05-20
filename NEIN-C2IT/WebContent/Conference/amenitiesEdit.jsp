<%-- <%@page import="CON2.DbUtil"%> --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  ;
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %> 
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<%@ page import = "java.util.ResourceBundle" %>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> 
  <link href="Css/Body.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Css/Body.css" /> 

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

 <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar1.js"></script>
<script language="javascript"   type="text/javascript" src="../js/Calendar11.js"></script>


      
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>

<style>
.black_overlay {
  display: none;
  position: absolute;
  top: 0%;
  left: 0%;
  width: 100%;
  height: 100%;
  background-color: black;
  z-index: 1001;
  -moz-opacity: 0.8;
  opacity: .80;
  filter: alpha(opacity=80);
}
.white_content {
  display: none;
  position: absolute;
  top: 25%;
  left: 25%;
  width: 50%;
  height: 50%;
  padding: 16px;
  border: 16px solid orange;
  background-color: white;
  z-index: 1002;
  overflow: auto;
}
</style>
<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 100px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
</style>

<script>
		var id =0;
		$(document).ready(function() {
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID :"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(value);
				prot.find(".amenc").attr("id","ament"+id);
				
				prot.find(".quanc").attr("id","quant"+id); 
				prot.find(".remarksc").attr("id","aremarks"+id);
				
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("#tr1").remove();
				//alert(id);
				id--;
			});
		});
	</script>

<form method="post" action="amenitiesUpdate.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="#74c1b9">
	<tr>
	    <td></td>
		<td bgcolor="#74c1b9" width="120" align=center><font color="black">Items</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Quantity</font></td>
	    <td bgcolor="#74c1b9" width="120" align=center><font color="black">Edit</font></td>
        <td bgcolor="#74c1b9" width="120" align=center colspan="3"><font color="black">Update/Cancel</font></td>
		</tr>
<%
System.out.println("edit page---inner amenties");
String no=request.getParameter("id");
System.out.println("edit page---"+no);

Connection conn = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null;
ResultSet rs=null;

 try 
  {
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(url+dbName,userName,password);
   
  //String query = "select assettype,configname from assetconfgfield where assettype='"+an+"' and configname ='"+co+"'";
   //st = conn.createStatement();
   //rs = st.executeQuery(query);
   
    String query1 = "select * from amenities_add where aid='"+no+"'";
   st = conn.createStatement();
   rs = st.executeQuery(query1);  %>
  <%while(rs.next()){%>
    <tr>
          <td style="visibility: hidden;"><input type="hidden" name="aid" value="<%=no%>">
          <input type="hidden" name="formno" value="<%=rs.getString("Booking_no")%>"></td>
   	     <td bgcolor="#d2f7f3"><%-- <input name="item" style="background-color:white;width:100;color:black;" value="<%=rs.getString("items")%>"> --%>
   	     <% 
		                Connection con5 = null;
                       /*  String url5 = "jdbc:mysql://localhost:3306/";
                        String db5 = "csdb";
                        
                        String driver5 = "com.mysql.jdbc.Driver";
                        String userName5 ="root";
                        String password5=""; */
                        // int sumcount=0;
                        Statement st5=null;
                        ResultSet rs5=null; 
                    try
                       {
                    	// id="idBranch"
						Class.forName(driver).newInstance();
						con5= DriverManager.getConnection(url+dbName,userName,password);
						String query2 = "select Amenities_name from amenities_master";
						st5 = con5.createStatement();
 						rs5 = st5.executeQuery(query2);
						%>
					    <select name="ament" class="amenc" id="ament">
        					<option selected="selected"><%=rs.getString("items")%></option>
							<%while(rs5.next()){%>
								
										<option  value="<%=rs5.getString(1)%>"><%=rs5.getString(1)%></option>
    						<%}%>
							</select>	<%} catch (SQLException ex1) {
    											ex1.printStackTrace();
												}	
						finally{
							/* DbUtil.closeDBResources(rs,st,con); */
							con5.close();
					   }%>	
				
   	     
   	     </td>
	     <td bgcolor="#d2f7f3"><input name="quantity" style="background-color:white;width:100;color:black;" value="<%=rs.getString("quantity")%>"></td>
	    <td bgcolor="#d2f7f3"><input name="remarks" style="background-color:white;width:100;color:black;" value="<%=rs.getString("remarks")%>"></td>
	    
       
       <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;"></td>
       <td bgcolor="#d2f7f3"><input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='history.go(-1)'></td></tr>
	  
      </table>
      <br>
      <br>
      <center>
      <a href="amenitieseditadd.jsp?id=<%=rs.getString("Booking_no")%>" >Amenities Add</a>
    </center>
     
      
       <%}%>   
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </form>