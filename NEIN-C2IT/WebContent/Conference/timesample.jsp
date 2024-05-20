<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script Language="javascript">
function TableToExcel()
{
var strCopy = document.getElementById("MyTable").innerHTML;
window.clipboardData.setData("Text", strCopy);
var objExcel = new ActiveXObject ("Excel.Application");
objExcel.visible = true;
 
var objWorkbook = objExcel.Workbooks.Add;
var objWorksheet = objWorkbook.Worksheets(1);
objWorksheet.Paste;
}
</script>
 
<body>
hello
  <div id="MyTable">
    <table>
           <tr><th>Code</th><th>Name</th></tr>
           <tr><td>a</td><th>abc</td></tr>
    </table>
   <!-- just replace the above part with the dynamic table creation code-->
  </div>
  <input type=button value="Export Table" onClick="TableToExcel()">
</body>
</html>