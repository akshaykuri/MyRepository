 <%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />

<html>
 <head>
  <script type="text/javascript">

   function changeFunc() {
    var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var selectedValue2 = selectBox.options[selectBox.selectedIndex].text;
    document.getElementById('iddesg').value = selectedValue;
    document.getElementById('iddesgg').value = selectedValue2;
    alert(selectedValue);
   }
   
  </script>
 </head>

 <body> <form action="checkback.jsp" method="post">
 <%Connection cn01 = null;
 Statement st01 = null; 
 ResultSet rs01 = null;
 cn01 = con.getConnection2();
 st01=cn01.createStatement();
 rs01 = st01.executeQuery("select DESIGNATION,DESG_NO from desg ORDER BY DESIGNATION Asc");
 %>
 <!--  <select id="selectBox" onchange="changeFunc();">
   <option value="1">Option #1</option>
   <option value="2">Option #2</option>
  </select> -->
<select name="" id="selectBox" onchange="changeFunc(this.id);">
			<option value="0">Select</option>
			<%while(rs01.next()){ %>
		
			<option value="<%=rs01.getString("DESG_NO")%>"><%=rs01.getString("DESIGNATION")%></option>
			<%} %>
		</select><a href="NewDesignation.jsp"  onclick="return popitup('NewDesignation.jsp')">New</a>
		<input style="display: none;" type="text" id="iddesgg" name="Npost" value="" readonly="readonly">
<input type="text" id="iddesg" name="DESG_NO" value="" readonly="readonly">

<input type="submit" value="SUBMIT"/>
</form>
 </body>
 
</html>