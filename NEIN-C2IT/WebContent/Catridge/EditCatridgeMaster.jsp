<%-- <%@page import="CON2.DbUtil"%>  --%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 	
		 var pname = document.forms["form1"]["printername"].value; 
		 var Catridge = document.forms["form1"]["Catridge"].value; 
		 var cost = document.forms["form1"]["Cost"].value; 
		 
		 if(pname == ''){		
             alert("Enter printer name");
             return false;
         }
		if(Catridge == ''){		
		              alert("Enter Cartridge Model");
		              return false;
		    }  
		
		if(cost == ''){		
            alert("Enter cost value");
            return false;
         }  

		return true;
	}
	
</script>	
<script language="Javascript">
       function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){
        	 alert("Enter numbers");
             return false;
          }
       else{
          return true;
       }
       }
       
    </script>
</head>
<body>
<form method="post" name="form1" action="UpdateCatridgeMaster.jsp">
<br />
<br /><br />
<table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey" width="30%">	
		<%
		String id=request.getParameter("id"); 
		
		Connection con = null;
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		Statement st=null;
		ResultSet rs=null; 
		 try 
		  { 
		     
		   String query1 = "select * from catridge_master where catridge_id="+id;
		   st = con.createStatement();
		   rs = st.executeQuery(query1);  %>
		   
              
	      <% while(rs.next()){ %>
	      
	    <tr>  <td bgcolor="lightgrey" width="120" align="center" ><font color="black">Printer Name</font></td>
	          <td><input name="printername"  id="printername" size="60"  style="background-color:white;color:black;" value="<%=rs.getString(2)%>"></td>
	    </tr>
	    <tr>  <td bgcolor="lightgrey" width="120" align="center" ><font color="black">Cartridge Model</font></td>	
		      <td><input name="Catridge" id="Catridge" size="60"  style="background-color:white;color:black;" value="<%=rs.getString(3)%>"></td>
	    </tr>
	    <tr>  <td bgcolor="lightgrey" width="120" align="center" ><font color="black">Cost</font></td>	  
		      <td><input name="Cost" id="Cost" size="60"  onkeypress="return isNumberKey(event)" style="background-color:white;color:black;" value="<%=rs.getString(4)%>"> </td>  
		</tr>
		<input name="cid" style="background-color:white;width:100;color:black;visibility: hidden;" value="<%=rs.getString(1)%>">
	      <%}%>
	    <tr>  
        <td  colspan="2">
          <input type="submit" value="Submit" name="save1" id="save"  onclick="return (Validation());">&nbsp &nbsp
          <input type="button" size="2" style="background-color:white;font-weight:bold;color:black;" value='close' onclick='history.go(-1)'></td>
        </tr>
	     
	  
          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
      </table>
      </form>
      </body>
      </html>