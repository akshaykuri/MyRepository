<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Map" %>
<%@page import="CON2.NormalMailConference"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.util.ResourceBundle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>


</head>
<body>
<%
    System.out.println("here.....in ajax page");
	Connection conn = null,conn1 = null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
PreparedStatement prs2 = null, psmt2 = null,psmt1=null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
	String newidvalue = null,newidvalue1 = null;
	String[] item;
	String rde11=null,msg=null;
	int l = 0;
	int p=0;
	String new_id = null;
	int j = 0, i = 0,a = 0,s=0,m=0,b=0,t=0;
	int incre = 0,incre1 = 0;
	int id = 0,id1 = 0;
	String id2=null;
	try 
	    {
	//	System.out.println("-------------- Con Booking Back ------------------- ");
		
		
	//	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Class.forName(driver).newInstance();
		conn= DriverManager.getConnection(url+dbName,userName,password);
		
		String date=request.getParameter("date");
	 System.out.println("date---- :"+date);
		
		String fromtime=request.getParameter("fromtime");
	    System.out.println("fromtime----------- :"+fromtime);
		
		String totime=request.getParameter("totime");
		System.out.println("totime :"+totime);
		
		String branch=request.getParameter("branch");
		System.out.println("branch :"+branch);
		
		String room=request.getParameter("room");
		System.out.println("room :"+room);
		///int alreadyexit=0;
		 String buffer="<div id='resultFromAjax1' style='display:none;'>";
			 prs3 = conn.prepareStatement("select * from conference_room_booking where (from_date>='"+date+"' and to_date<='"+date+"' and  booking_for_branch='"+branch+"' and status='Active')");
			 rs1 = prs3.executeQuery();
		   		
				while(rs1.next())
			    {   
					System.out.println("in while loop----"+date);		 
					 
			         String string1 = fromtime;
					 DateFormat formatter = new SimpleDateFormat("HH:mm");
		             java.sql.Time timeValue1 = new java.sql.Time(formatter.parse(string1).getTime());

		            // System.out.println("aaaaaa ::"+y+":: ::: "+rs1.getString("from_time"));
		            String string2 =rs1.getString("from_time");
		            java.sql.Time timeValue2 = new java.sql.Time(formatter.parse(string2).getTime());

		            String string3 = totime;
		            java.sql.Time timeValue3 = new java.sql.Time(formatter.parse(string3).getTime());
		 
		            String string4 =rs1.getString("to_time");
		            java.sql.Time timeValue4 = new java.sql.Time(formatter.parse(string4).getTime());
		 
		            System.out.println("outsideeeee iffffffffffff"+timeValue1);
		           System.out.println("outsideeeee iffffffffffff"+timeValue2);
		           System.out.println("outsideeeee iffffffffffff"+timeValue3);
		           System.out.println("outsideeeee iffffffffffff"+timeValue4);
		         
		            //if(((timeValue1.equals(timeValue2))||(timeValue1.after(timeValue2))) && ((timeValue3.equals(timeValue4))||(timeValue3.before(timeValue4)) ||(timeValue3.after(timeValue4))))
		           if(((timeValue1.equals(timeValue2))&&(timeValue3.equals(timeValue4))) ||
		        	  ((timeValue1.after(timeValue2)) && (timeValue3.equals(timeValue4)))||
		        	  ((timeValue1.before(timeValue4)) && (timeValue3.after(timeValue4))) || 
		        	  ((timeValue1.before(timeValue2)) && (timeValue3.equals(timeValue4))) ||
		        	  ((timeValue1.before(timeValue2)) && (timeValue3.after(timeValue2))) || 
		        	  ((timeValue1.before(timeValue2))&&(timeValue3.after(timeValue4))) ||
		        	  ((timeValue1.after(timeValue2))&&(timeValue3.before(timeValue4))))
		            {
		            	System.out.println("inside iffffffffffff");
		            	 if(room.equals(rs1.getString("booking_room_type")))
		            	 {
		            		 System.out.println("inside room type");
		            		  if(branch.equals(rs1.getString("booking_for_branch")))
		            		 { 	  
		            		System.out.println("Already exit ........From :"+date+" TO: "+date); 
		            	  //  alreadyexit++;
		            	    msg = "Already_Booked on "+fromtime+" with timing "+fromtime+" to "+totime+"";
		            	    buffer=buffer+"<input type='hidden' id='msg1' name='msg' value='"+msg+"'>";
		            	    %>   
		            	            <script language="javascript"> //Java Script alert message 
		            	            alert("BOOKING ALREADY DONE IN THIS DATE AND TIME....PLEASE CHECK THE CALENDAR FOR FREE DATES");
		            	            window.history.back();
		            	            </script>
		            		<%
		                    }
		            	 } 
		             } 
		          		            
		   }
				 buffer=buffer+"</div>";
				System.out.println("already exit the :: "+buffer);
	        	  msg = "Already_Booked on "+date+" With Time "+fromtime+" to "+totime+"";
	        	     
	        	  response.getWriter().println(buffer); 
     //response.sendRedirect("ConRoomHome.jsp?msg=" +msg); 
		 }catch (Exception e)
		        {
		    	e.printStackTrace();
		    	}
		 finally 
		        {
		    	conn.close();
		    	}
%>
</body>
</html>