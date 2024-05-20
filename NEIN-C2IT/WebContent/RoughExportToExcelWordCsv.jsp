<%-- 
    Document   : user
    Created on : Jan 7, 2009, 8:23:48 AM
    Author     : eswar@vaannila.com
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
 
   <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<title>User Details</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" />
  
  </head>
    
<body>
    
    <display:table id="data" name="sessionScope.UserForm.actorList" requestURI="Reports/BranchWise/cs_BranchYearWiseBackExcel.jsp" pagesize="10" export="true">
      
      <display:column property="tvShow" title="TV Show" sortable="true" media="html" group="1" />
        
    <display:column property="userName" title="User Name" sortable="true" />
        
    <display:column property="emailId" title="Email Id" sortable="true" />
        
    <display:setProperty name="export.excel.filename" value="ActorDetails.xls"/>
      
      <display:setProperty name="export.pdf.filename" value="ActorDetails.pdf"/>
       
     <display:setProperty name="export.pdf" value="true" />
      
  </display:table>
   
 </body>

</html>

