<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.apache.poi.hssf.record.formula.functions.Replace"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
 <%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%response.setHeader("Content-Disposition", "attachment; filename=ReportAllAssetTransfer.xls");%>
<%@ page import="java.sql.*" %>

<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<title>Display All asset</title>
   


</head>
<body>
<br><br>
<form name="form" >
<center>
 <br />
                
	<table border="1"  align="center" >
		<tr>
		<td height="20" bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Inventory_No</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>AssetType</b></font></td>
        <td height="20" bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Asset_No</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>Configuration</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>FromBranch</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>FromUser</b></font></td>
		
         <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>ToBranch</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>ToUser</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>PerpusOfTransfer</b></font></td>
         <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>DateOfTransfer</b></font></td>
          <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>TransferBy</b></font></td>
           <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>ApprovedBy</b></font></td>
      
       <!--  <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>ID</b></font></td>
        <td bgcolor="white" width="120" align=center style="background-color:grey"><font size="2" color="black"><b>CurrentAssetNo</b></font></td>
	 -->
		</tr>
	
<%Connection con = null;

String url = "jdbc:mysql://localhost:3306/";
String db = "csdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="";
int sumcount=0;
Statement st=null;
ResultSet rs=null; 
int k=0;
try
{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
String query = "select 	Inventory_No,old_asset_no,AssetType,New_Asset_No,Branch,fromUser,NewBranch,toUser,purpus,id,curAID,ConfigField,dateOfTrans,transBy,approvedby,srno,filepath from asset_trans ORDER BY New_Asset_No , srno asc; ";
st = con.createStatement();
 rs = st.executeQuery(query);
String s1="";
%>
<%
String FPath="E:\\neinSoft\\files\\C2IT\\UploadAssetTransfer\\" ;
String FileFullPath="" ;
while(rs.next()){ int q=rs.getInt(11); int srno=rs.getInt("srno"); 
String fname=rs.getString("filepath");
FileFullPath = FPath+Integer.toString(srno)+"\\"+fname;
//System.out.println("File path :"+FileFullPath);
//System.out.println("File name :"+fname);
%>
<tr>
 

<%if(q==1){%>
            <td bgcolor="PaleGreen" width="100"> <font size="2" color="black"><%=rs.getString(1)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
            <td bgcolor="PaleGreen" width="100"> <font size="2" color="black"><%=rs.getString(4)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(12)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(6)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
            <%if(rs.getString(8)==null) s1="Not Assigned"; else s1=rs.getString(8);%>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=s1%></font></td>
         <%--    <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(8)%></font></td>
          --%>  
           <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(9)%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString("dateOfTrans")%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString("transBy")%></font></td>
            <td bgcolor="PaleGreen" width="100"><font size="2" color="black"><%=rs.getString(15)%></font></td>
           
       <%}else{%>
            <td bgcolor="white" width="100"> <font size="2" color="black"><%=rs.getString(1)%></font></td>
             <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(3)%></font></td>
            <td bgcolor="white" width="100"> <font size="2" color="black"><%=rs.getString(4)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(12)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(5)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(6)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(7)%></font></td>
            <%if(rs.getString(8)==null) s1="Not Assigned"; else s1=rs.getString(8);%>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=s1%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(9)%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString("dateOfTrans")%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString("transBy")%></font></td>
            <td bgcolor="white" width="100"><font size="2" color="black"><%=rs.getString(15)%></font></td>
         
           <%}%>

        
</tr>
<%}%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	
finally{
			}%>
	</table>
<br>

</center>
</form>
</body>
</html>