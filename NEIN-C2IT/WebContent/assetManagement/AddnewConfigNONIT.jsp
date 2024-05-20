<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="banner.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddNewConfig</title>
</head>

<script language = "Javascript">
function validate()
     {
	 //alert("hello");
     //var nn=document.form.assetType;
     //var i=document.getElementById('idit').value;
 	 //var j=document.getElementById('idnonit').value;
 	 //var itsel = document.getElementsByName('it');
     
 	//alert(i);
     var va1=document.getElementById("idAtype").value;
     var va2=document.getElementById("idconfigField").value;
     if (va1=="Select")
                {
                alert("Please Select Asset Name!");
                return false;
                }
     if (va2=="")
          {
          alert("Please Enter config field!");
          return false;
          }
    }
function btnClick() { 
    close(); 
}
</script>

<script  type="text/javascript">

<% 
	System.out.println("-------------  Add NON - IT Asset New Config -----------------");
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>




<body>
<form name="form" method="post"  onsubmit="return validate()" action="AddnewConfigBackNONIT.jsp">
<BR><BR>
 <!-- <div class="modal-content">
<div class="modal-header"> -->
      <center> <h2>Add New Config Form</h2></center>
   <!--  </div>     <div class="modal-body"> -->
    <center>
    <table border=1>
           
           
           <tr>
              <td><font color="red" size="4">*</font>Asset Type:</td>
              <td><%Connection con1 = null;
              String url1 = "jdbc:mysql://localhost:3306/";
              String db1 = "csdb";
              String driver1 = "com.mysql.jdbc.Driver";
              String userName1 ="root";
              String password1="";
              // int sumcount=0;
              Statement st1=null;
              ResultSet rs1=null; 
              try
                 {
	             Class.forName(driver1).newInstance();
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 String query1 = "select * from asset_type where it_nonit='NON IT'";
                 st1 = con1.createStatement();
                 rs1 = st1.executeQuery(query1);
              %>
                       <select name="aType" id="idAtype">
		               <option selected="selected">Select</option>
	                   <%while(rs1.next()){%>
			           <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
    	                      <%}%>
	                   </select>
             <%} catch (SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        con1.close();		             
			           }%>
	</td>          </tr>
           
           <tr>
                <td>Config Field:</td>
                <td><input type="text" name="configField" maxlength="20" id="idconfigField" value="" size=20 /></td>
           </tr>
           <tr>
                <td>Config Discription:</td>
                <td><input type="text" name="configDis" maxlength="50" id="idconfigDis" value="" size=20 /></td>
           </tr>
      </table>
           
      <table>
            <tr>
                <td align=center><input type=submit name="button" value="ADD" id="addbutton" ></td>
                <td><input type="button" name="cancleBtn" value="CANCEL" onclick='btnClick();'/></td>
                
   
            </tr>
      </table>
      <br>
</center>
</form>
<!-- </div>
</div> -->
</body>
</html>