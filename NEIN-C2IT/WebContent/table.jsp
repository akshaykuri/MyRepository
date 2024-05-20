<HTML>
<HEAD>
<TITLE>Sample Page that Writes Out an HTML Addition Table</TITLE>
</HEAD>
<BODY>
<SCRIPT Language="JavaScript">
<!-- 
rows = 3
columns = 10
str = ""
str += '<table border="1" cellspacing="1" cellpadding="5">'

for(i = 0; i < rows; i++){
   str += '<tr>'
   for (j = 0; j < columns; j++){
      str += '<td>' +  (i + j) + '</td>'
   }
   str += '</tr>'
}

str += '</table>'
document.write(str)

//-->
</SCRIPT>
</BODY>
</HTML>

