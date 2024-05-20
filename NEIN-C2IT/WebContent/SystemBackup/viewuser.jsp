<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINISTRATOR MASTER</title>
<link rel='stylesheet' type='text/css' href='css/style.css' />
	<link rel='stylesheet' type='text/css' href='css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='css/show.css' media="show" />
	<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='js/example.js'></script>
    <link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script language="javascript">
function editRecord(id)
        {    
        var f=document.form;    
        f.method="post";    
        f.action='systembackupuseredit.jsp?id='+id;    
        f.submit();
        }
function deleteRecord(id)
    {  
	if(confirm('You are above to delete a Administrator \n \n  Admin can not access admin page,user page and form page'))
	     {
         var f=document.form;    
         f.method="post";    
         f.action='systembackupuserdelete.jsp?id='+id;    
         f.submit();
  	     }
	else
		{}
    }
</script>

<SCRIPT Language="Javascript">
/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/
function printit(){  
      if (window.print) {
      window.print() ;  
      } else {
              var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
              document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
              WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
             }
          }
function btnClick() { 
         close(); 
            }
</script>
<script  type="text/javascript">
    <% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";
    if(msg!="1")
		{
        alert(msg);
		}
</script>
</head>
<body>
<br><br>
<form method="post" name="form">
<center>
     <br />
  	 <table border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
		<tr>
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>EMPNO</b></font></td>
		<td height="20" bgcolor="white" width="100" align=center><font size="2" color="black"><b>EMP-NAME</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>DEPATMENT</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>BRANCH</b></font></td>
		<td bgcolor="white" width="100" align=center><font size="2" color="black"><b>SUB_BRANCH</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>CONTACT NO</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>SYSTEM_TYPE</b></font></td>
		<td bgcolor="white" width="120" align=center><font size="2" color="black"><b>SYSTEM_NO</b></font></td>
		<td bgcolor="white" width="120" align=center colspan="2"><font size="2" color="black"><b>EDIT/DELETE</b></font></td>
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
          String query=null;
          String b_no1 = (String) session.getAttribute("b_no");
          try
               {
	           Class.forName(driver).newInstance();
               con = DriverManager.getConnection(url+db,userName,password);
               if(b_no1.equals("10"))
                   query = "select * from systemuserbackup where branchno='"+b_no1+"' ORDER BY branchno ASC, empname ASC";
               else if(b_no1.equals("20"))
                   query = "select * from systemuserbackup where branchno='"+b_no1+"' ORDER BY branchno ASC, empname ASC";
               else if(b_no1.equals("30"))
                    query = "select * from systemuserbackup where branchno='"+b_no1+"' ORDER BY branchno ASC, empname ASC";
               else if(b_no1.equals("40"))
                    query = "select * from systemuserbackup where branchno='"+b_no1+"' ORDER BY branchno ASC, empname ASC";
               else 
                    query = "select * from systemuserbackup ORDER BY branchno ASC, empname ASC";
                  
               st = con.createStatement();
               rs = st.executeQuery(query);
               int k=0;
               %>
               <%while(rs.next()){k++;
                     String bno = rs.getString(10);
              if(bno.equals("10")) {%>
		<tr>
		  <td bgcolor="gray" width="100"><font size="2" color="black"><%=rs.getString("empno")%></font></td>
          <td bgcolor="gray" width="100"><font size="2" color="black"><%=rs.getString("empname")%></font></td>
          <td bgcolor="gray" width="100"><font size="2" color="black"><%=rs.getString("desg")%></font></td>
          <td bgcolor="gray" width="100"><font size="2" color="black"><%=rs.getString("dept")%></font></td>
          <td bgcolor="gray" width="120"><font size="2" color="black"><%=rs.getString("branch")%></font></td>
          <td bgcolor="gray" width="120"><font size="2" color="black"><%=rs.getString("subbranch")%></font></td>
          <td bgcolor="gray" width="60"><font size="2" color="black"><%=rs.getString("contactno")%></font></td>
          <td bgcolor="gray" width="60"><font size="2" color="black"><%=rs.getString("lapdesk")%></font></td>
          <td bgcolor="gray" width="60"><font size="2" color="black"><%=rs.getString("sysno")%></font></td>
          <td id="hiderow"><input id="hiderow" type="button" name="edit" size="2" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
          <td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
        </tr>
		<%}else if(bno.equals("20")){%>
			<tr>
		  <td bgcolor="SALMON" width="100"><font size="2" color="black"><%=rs.getString("empno")%></font></td>
          <td bgcolor="SALMON" width="100"><font size="2" color="black"><%=rs.getString("empname")%></font></td>
          <td bgcolor="SALMON" width="100"><font size="2" color="black"><%=rs.getString("desg")%></font></td>
          <td bgcolor="SALMON" width="100"><font size="2" color="black"><%=rs.getString("dept")%></font></td>
          <td bgcolor="SALMON" width="120"><font size="2" color="black"><%=rs.getString("branch")%></font></td>
          <td bgcolor="SALMON" width="120"><font size="2" color="black"><%=rs.getString("subbranch")%></font></td>
          <td bgcolor="SALMON" width="60"><font size="2" color="black"><%=rs.getString("contactno")%></font></td>
          <td bgcolor="SALMON" width="60"><font size="2" color="black"><%=rs.getString("lapdesk")%></font></td>
          <td bgcolor="SALMON" width="60"><font size="2" color="black"><%=rs.getString("sysno")%></font></td>
          <td id="hiderow"><input id="hiderow" type="button" name="edit" size="2" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
          <td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
        </tr>
           <%}else if(bno.equals("30")){%>
			<tr>
		  <td bgcolor="green" width="100"><font size="2" color="black"><%=rs.getString("empno")%></font></td>
          <td bgcolor="green" width="100"><font size="2" color="black"><%=rs.getString("empname")%></font></td>
          <td bgcolor="green" width="100"><font size="2" color="black"><%=rs.getString("desg")%></font></td>
          <td bgcolor="green" width="100"><font size="2" color="black"><%=rs.getString("dept")%></font></td>
          <td bgcolor="green" width="120"><font size="2" color="black"><%=rs.getString("branch")%></font></td>
          <td bgcolor="green" width="120"><font size="2" color="black"><%=rs.getString("subbranch")%></font></td>
          <td bgcolor="green" width="60"><font size="2" color="black"><%=rs.getString("contactno")%></font></td>
          <td bgcolor="green" width="60"><font size="2" color="black"><%=rs.getString("lapdesk")%></font></td>
          <td bgcolor="green" width="60"><font size="2" color="black"><%=rs.getString("sysno")%></font></td>
          <td id="hiderow"><input id="hiderow" type="button" name="edit" size="2" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
          <td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
        </tr>    
            <%}else if(bno.equals("40")){%>
			<tr>
		  <td bgcolor="pink" width="100"><font size="2" color="black"><%=rs.getString("empno")%></font></td>
          <td bgcolor="pink" width="100"><font size="2" color="black"><%=rs.getString("empname")%></font></td>
          <td bgcolor="pink" width="100"><font size="2" color="black"><%=rs.getString("desg")%></font></td>
          <td bgcolor="pink" width="100"><font size="2" color="black"><%=rs.getString("dept")%></font></td>
          <td bgcolor="pink" width="120"><font size="2" color="black"><%=rs.getString("branch")%></font></td>
          <td bgcolor="pink" width="120"><font size="2" color="black"><%=rs.getString("subbranch")%></font></td>
          <td bgcolor="pink" width="60"><font size="2" color="black"><%=rs.getString("contactno")%></font></td>
          <td bgcolor="pink" width="60"><font size="2" color="black"><%=rs.getString("lapdesk")%></font></td>
          <td bgcolor="pink" width="60"><font size="2" color="black"><%=rs.getString("sysno")%></font></td>
          <td id="hiderow"><input id="hiderow" type="button" name="edit" size="2" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
          <td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
        </tr>
        <%}else if(bno.equals("90")){%>
			<tr>
		  <td bgcolor="cyan" width="100"><font size="2" color="black"><%=rs.getString("empno")%></font></td>
          <td bgcolor="cyan" width="100"><font size="2" color="black"><%=rs.getString("empname")%></font></td>
          <td bgcolor="cyan" width="100"><font size="2" color="black"><%=rs.getString("desg")%></font></td>
          <td bgcolor="cyan" width="100"><font size="2" color="black"><%=rs.getString("dept")%></font></td>
          <td bgcolor="cyan" width="120"><font size="2" color="black"><%=rs.getString("branch")%></font></td>
          <td bgcolor="cyan" width="120"><font size="2" color="black"><%=rs.getString("subbranch")%></font></td>
          <td bgcolor="cyan" width="60"><font size="2" color="black"><%=rs.getString("contactno")%></font></td>
          <td bgcolor="cyan" width="60"><font size="2" color="black"><%=rs.getString("lapdesk")%></font></td>
          <td bgcolor="cyan" width="60"><font size="2" color="black"><%=rs.getString("sysno")%></font></td>
          <td id="hiderow"><input id="hiderow" type="button" name="edit" size="2" value="Edit" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
          <td id="hiderow"><input id="hiderow" type="button" name="delete" size="2" value="Delete" style="background-color:white;font-weight:bold;color:black;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
        </tr>   
               
               
             <% } }%>
<%} catch (SQLException ex) {
        ex.printStackTrace();
        }	
     finally{
			DbUtil.closeDBResources(rs,st,con);
			}%>
	</table>
<br>
<table width="165" align ="center" id="hiderow">
      <tr>
          <td align="left" id="hiderow"><input id="hiderow" type='submit' size="2" style="background-color:white;font-weight:bold;color:black;" value='CANCEL' onclick='btnClick();'></td>
          <td align="right" id="hiderow">
          <SCRIPT Language="Javascript">  
               var NS = (navigator.appName == "Eclipse");
               var VERSION = parseInt(navigator.appVersion);
               if (VERSION > 3) 
                        {
                        document.write('<form><input type="button" id="hiderow" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
                        } 
          </script>
</td>
</tr>
</table>
</center>
</form>
</body>



</html>