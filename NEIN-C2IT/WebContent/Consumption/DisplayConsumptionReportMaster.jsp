<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Consumption Report Details</title>
<script language="javascript">
function editRecord(id)
    {  
	//alert(id);
    var f=document.form;    
    f.method="post";    
    f.action='EditConsumptionReportMaster.jsp?id='+id;    
    f.submit();
    }
function deleteRecord(id)
    {   
	//alert(id); 
	if(confirm('confirm to Delete'))
	      {
           var f=document.form;    
           f.method="post";    
           f.action='DeleteConsumptionReportMaster.jsp?id='+id;    
           f.submit();
          }
	else{}
   }
   
function closewindow() { 
    close(); 
}
</script>
<style>
.aa{ height:20;
     bgcolor:white;
     width:150;
     align:center;
     background-color:grey;
     }

</style>
</head>
<body>
<br><br>
<form method="post" name="form">
<center>
 <br />
                
	<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="80%">
		<tr>
		    <td class="a"><font size="2" color="black"><b>Type</b></font></td>
			<td class="a"><font size="2" color="black"><b>ISP Network</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Consumption Type</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Emp Number</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Emp Name</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Location</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Branch</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Number</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Relationship Number</b></font></td>
		    <td class="a"><font size="2" color="black"><b>Status</b></font></td>    
		    <td class="a"><font size="2" color="black"><b>EDIT</b></font></td>
		    <td class="a"><font size="2" color="black"><b>DELETE</b></font></td>
		</tr>
	
		<%
			
				Connection con = null;
				Connection2 dbConn = new Connection2();
				con = dbConn.getConnection2();
				String bNo=(String)session.getAttribute("b_no");
				int sumcount=0;
				Statement st=null;
				ResultSet rs=null; 
				String query2 = null;
                    try
                       {
                        
                        if(bNo.equals("90")){
                     	  query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
					               "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
					               "INNER JOIN branch_master b ON b.id=m.branchId "+
					               "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo order by branchNo";
                          }
                        if(bNo.equals("40")){
                    	   
                     	  query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
					               "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
					               "INNER JOIN branch_master b ON b.id=m.branchId "+
					               "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo where branchNo in(40,41,52,43,42)";
                         }
                        if(bNo.equals("20")){ 
                    	   
                     	  query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
					               "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
					               "INNER JOIN branch_master b ON b.id=m.branchId "+
					               "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo where branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                         }
                        if(bNo.equals("30")){ 
                    	   
                     	  query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
					               "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
					               "INNER JOIN branch_master b ON b.id=m.branchId "+
					               "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo where branchNo in(30,31,53,32,11)";
		                    	    
                        }
                        if(bNo.equals("10")){ 
                    	   
                     	  query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
					               "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
					               "INNER JOIN branch_master b ON b.id=m.branchId "+
					               "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo where branchNo in(10)";
                        }
                        if(bNo.equals("54")){ 
                     	   
                       	  query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
  					               "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
  					               "INNER JOIN branch_master b ON b.id=m.branchId "+
  					               "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo where branchNo in(54,44)";
                          }
                        if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("54") || bNo.equals("40") || bNo.equals("90"))){
                        	query2 = "select m.`id` as id1, `isptype`,`type`, `typename`, `empno`, `empname`, `branchId`, `branchNo`, "+
					                 "`number`, `relationnumber`, `status`,b.b_name,mb.m_b_name from consumptionreportmaster m "+
					                 "INNER JOIN branch_master b ON b.id=m.branchId "+
					                 "INNER JOIN branch_master_main mb ON mb.m_b_no=m.branchNo where branchNo ='"+bNo+"'";
                        }
				
				st = con.createStatement();
				rs = st.executeQuery(query2);
		%>
		<%      while(rs.next()){%>
		<tr>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("type")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("isptype")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("typename")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("empno")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("empname")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("b_name")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("m_b_name")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("number")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("relationnumber")%></font></td>
		<td bgcolor="white" width="150"><font size="2" color="black"><%=rs.getString("status")%></font></td>
		<td bgcolor="white" width="30">
		<font size="2" color="blue"><a  onclick="return editRecord(<%=rs.getString("id1")%>)">EDIT</a></font></td>
		<td bgcolor="white" width="30">
		<%--<font size="2" color="blue"> <a onclick="return deleteRecord(<%=rs.getString("id1")%>)">DELETE</a></font> --%></td>
		
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