<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Model Master Details</title>
<style>
.tabletd{ height:50; bgcolor:white; width:150; align:center; background-color:#A9A9A9;color:black;}
.tabletd1{ background-color:white; width:30; text-color:blue;}
</style>
<script language="javascript">
function editRecord(id)
    {  
	//alert(id);
    var f=document.form;    
    f.method="post";    
    f.action='EditModelMaster.jsp?id='+id;    
    f.submit();
    }
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('confirm to Delete'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='DeleteModelMaster.jsp?id='+id;    
           f.submit();
          }
	else{}
   }
   
function closewindow() { 
    close(); 
}
</script>
</head>
<body>
<br><br>
<form method="post" name="form">
<center>
 <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="90%">
		<tr>
		<td class="tabletd"><b>Location</b></td>	
		<td class="tabletd"><b>Brand</b></td>	    
		<td class="tabletd"><b>ModelNo</b></td>	
		<td class="tabletd"><b>SerialNo</b></td>	    
		<td class="tabletd"><b>AgreementNo</b></td>	
		<td class="tabletd"><b>Vendor Type</b></td>
		<td class="tabletd"><b>Machine Type</b></td>	
		<td class="tabletd"><b>Rent Amount</b></td>	    
		<!-- <td class="tabletd"><b>Tax Amount</b></td>	 -->
	    <td class="tabletd"><b>EDIT</b></td>
	    <td class="tabletd"><b>DELETE</b></td>
		</tr>
		<%
				Connection con = null;
				Connection2 dbConn = new Connection2();
				con = dbConn.getConnection2();
				
				int sumcount=0;
				Statement st=null;
				ResultSet rs=null; 
				
				String bNo=(String)session.getAttribute("b_no");
                String query=null;
                
				try
				{
				
				/* String query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, `machinetype`, "+
				                  " `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+
			                       " INNER JOIN branch_master b ON p.branch_id = b.id ";
				*/
				
				if(bNo.equals("90")){
                    query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
		                    " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
		    			    " INNER JOIN branch_master b ON p.branch_id = b.id ";
                  }
                if(bNo.equals("40")){
            	   
            	     query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
		                     " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
		    			     " INNER JOIN branch_master b ON p.branch_id = b.id  where b_no in(40,41,52,43,42)";
                 }
                if(bNo.equals("20")){ 
            	   
            	   query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
                           " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
   			               " INNER JOIN branch_master b ON p.branch_id = b.id  where b_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                 }
                if(bNo.equals("30")){ 
            	   
            	    query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
                            " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
    			            " INNER JOIN branch_master b ON p.branch_id = b.id  where b_no in(30,31,53,32,11)";
            	    
                }
                if(bNo.equals("10")){ 
            	   
            	    query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
                            " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
    			            " INNER JOIN branch_master b ON p.branch_id = b.id  where b_no in(10)";
                }
                if(bNo.equals("54")){ 
             	   
            	    query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
                            " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
    			            " INNER JOIN branch_master b ON p.branch_id = b.id  where b_no in(54,44)";
                }

              if(!(bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("54") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query = " SELECT p.`id`, p.`branch_id`, `brand`, `modelno`, `serialno`, `agreementno`, "+
                            " `machinetype`, `vendortype`, `rentamt`,b.b_name FROM `photocopier_model_master` p"+ 
    			            " INNER JOIN branch_master b ON p.branch_id = b.id  where b_no ='"+bNo+"'";
                 }
				
				st = con.createStatement();
				rs = st.executeQuery(query);
		%>
		<%      while(rs.next()){%>
		<tr>
		<td bgcolor="white" width="150"><%=rs.getString("b_name")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("brand")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("modelno")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("serialno")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("agreementno")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("vendortype")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("machinetype")%></td>
		<td bgcolor="white" width="150"><%=rs.getString("rentamt")%></td>
		<%-- <td bgcolor="white" width="150"><%=rs.getString("taxamt")%></td> --%>
		
		<td><font size="2" color="blue">
		<a  onclick="return editRecord(<%=rs.getString("id")%>)">EDIT</a></font></td>
		<td bgcolor="white" width="30">
		<font size="2" color="blue">
		<%-- <a onclick="return deleteRecord(<%=rs.getString("id")%>)">DELETE</a></font> --%></td>
		
		</tr>
		<%}%>
		<%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	
		finally{
					}%>
		
			</table>
		<br>
		<input id="hiderow" type='submit' style="background-color:white;font-weight:bold;color:black;" value='Close Window' onclick='closewindow();'>
		</center>
		</form>
		</body>
		</html>