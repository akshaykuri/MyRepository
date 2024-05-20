<%-- <%@page import="CON2.DbUtil"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>

<%@ page import="java.sql.*" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="http://api.jqueryui.com/datepicker/#option-beforeShowDay"></script> 
<link href="stylelog.css" rel="stylesheet" type="text/css" />
    <!-- <script>
        $(function () {
            // An array of dates
                var dates = $("#NonBusinessDays").val();    
           
                var dateSplit = dates.split(",");
                
                var disabledDays=[];
                for (var i = 0; i < dateSplit.length; i++) {              
                    var temp = dateSplit[i].split('-');
                    var newDateTimeFormat = temp[0] + "-" + temp[1] + "-" + temp[2];
                    alert(newDateTimeFormat);
                    disabledDays.push(newDateTimeFormat);
                }   
            var date = new Date();

                $("#datepicker").datepicker({
                        dateFormat: 'yy-mm-dd',
                        beforeShowDay: function (date) {
                            var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
                            for (i = 0; i < disabledDays.length; i++) {
                                if ($.inArray(y + '-' + (m + 1) + '-' + d, disabledDays) != -1) {
                                    //return [false];
                                    return [true, "event", 'ROOm Booked--details given below'];
                                }
                            }
                            return [true, '', ''];

                        }
                    });
               
        });
    </script>
    <style type="text/css">
        .event a {
            background-color:  red !important;
            background-image: none !important;
            color: #ffffff !important;
        }
    </style> -->

<style type="text/css">
.ui-datepicker {
    background: #5F9EA0;
    border: 1px solid #555;
    color: #EEE;
    width: 400px;
    height:280px;
}
#highlight, .highlight {
    /*background-color: #000000;*/
}
.highlight > a.ui-state-default {
    
    border: 1px solid blue;
    color: white;
    background-color: #5ba399;
}
div#id
 {
  width:100px;
  height:100px;
 }
 
 </style>
<script>
function getinfo(aa)
        {
		alert("selected date:: "+aa);
	    }
</script>

<script language="javascript" type="text/javascript">

$(function() {

	var fromdays = [];
	var aaa=[];
	var todays = [];
	var bbb=[];
	
	var x = document.getElementById("fromdays").value;
	var aa = x.split(','); 
	for(q = 0; q < aa.length; q++)
	  {
		    aaa = aa[q].split('-');
		    fromdays[q]=new Date(aaa[0], aaa[1]- +1, aaa[2]);	
	  } 
	
	var y = document.getElementById("todays").value;
	var bb = y.split(',');  
	for(s = 0; s < bb.length; s++)
	  {     
		    bbb = bb[s].split('-');
		    todays[s]=new Date(bbb[0], bbb[1]- +1, bbb[2]);	
	  } 
	
    $('#datepicker').datepicker({
    	dateFormat: 'yy-mm-dd',
        numberOfMonths: [1, 1],
        beforeShowDay: highlightDays
    }).click(function() {
        $('.ui-datepicker-today a', $(this).next()).removeClass('ui-state-highlight ui-state-hover');
        //$('.highlight a', $(this).next()).addClass('ui-state-highlight');
    });


    $('#datepicker').click(function() {
        // put your selected date into the data object
        var data = $('#datepicker').val();
     /*
        $.get('getdata.php?date=' + data, function(data) {
            $('#events').html(data).show('slow');
        });*/
    });

    function highlightDays(date) { 
        for (var xa = 0;xa < fromdays.length; xa++){
        	
        	if(fromdays[xa].getTime()  == date.getTime()) { 
	                    return [true, 'highlight'];
	              } 
	        	
        }
        	
     return [true, ''];    
    }
    
});
</script>

<script>
function getbookingdetails(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>

 <form id="form1" runat="server">
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        
    </tr>
 
 
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">VIEW BOOKING DETAILS</font></strong></td>
</tr>
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("fullname")%> </font>&nbsp;&nbsp; 
               <%--  <font size ="2">DESG :<%=session.getAttribute("desg")%> </font> --%>
     <input type="hidden" name="demo1" maxlength="99" id="demo" value="" size=20 readonly/>           
       <input type="hidden" name="empid" value="<%=session.getAttribute("empid")%>" >        
                </td>
 </tr>
</table>
<br>
<br>
<br>
<br>

   <div id="datepicker" align="center" onchange="getbookingdetails('Displaybookinginfo.jsp?msg='+this.value)" > </div>
    <br>
    <br>
    <br>    
        <center>
<%

String swid = request.getParameter("id");
//System.out.println("idddddd----edit page"+swid);
Connection conn=null;

ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

Statement st=null,st2=null,st3=null;
ResultSet rs=null,rs2=null,rs3=null;
 try 
  {
	 Class.forName(driver).newInstance();
	 conn= DriverManager.getConnection(url+dbName,userName,password);
   int i1=0;
   String dateco="";
   String dateco1="";
   String todaysDate="2018-04-20";
   String query1 = "SELECT `from_date`,`to_date` FROM `conference_room_booking` where `status`='Active' ";
   st2 = conn.createStatement();
   rs2 = st2.executeQuery(query1);  %>
    
   <%while(rs2.next()){ 
	   if(i1==0)
	      {
	      dateco=rs2.getString("from_date");
	      dateco1=rs2.getString("to_date");
	      i1++;
	      }
	   else
	   {
		   dateco+=","+rs2.getString("from_date"); 
		   dateco1+=","+rs2.getString("to_date"); 
	   }
   
	  }%>
            <input type="hidden" id="fromdays" size="100" value="<%=dateco%>" />
            <input type="hidden" id="todays" size="100" value="<%=dateco1%>" />
           

          <% }catch (SQLException ex) 
             {
              ex.printStackTrace();
             }     	
     finally{
			} %>
			
    </form>
    
    <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="ConRoomHome.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                        
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 

</body>
</html>