<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Map" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CON2.NormalMailConference"%>
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
	//System.out.println("here.....");
	Connection conn = null,conn1 = null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	Statement st=null,st1=null;
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
    String msg=null;
	PreparedStatement prs2 = null, psmt2 = null,psmt1=null, psmt3 = null,prs3=null, psmt4=null,prs4=null,prbran = null;
	
	int j = 0, i = 0,p=0,k=0,s=0,t=0;
	
	try 
	    {
		Class.forName(driver).newInstance();
		conn= DriverManager.getConnection(url+dbName,userName,password);
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		//String b_no=request.getParameter("bno");
		String status=request.getParameter("status");
		//System.out.println("bnoooooooooooooooo---- :"+b_no);
		System.out.println("bookingggggggggg----------- :");
		String booking_no=request.getParameter("booking_no");
		System.out.println("bookingggggggggg------updateee----- :"+booking_no);
		
		String id=request.getParameter("id");
		
		//String empid=request.getParameter("emp_id");
		//String username=request.getParameter("uname");
       // String usermail=request.getParameter("uemail");
        String branch=request.getParameter("bpcity");
        String department=request.getParameter("bdept");
        String bookingperson=request.getParameter("bname");
        String bookingbranch=request.getParameter("branchid");System.out.println("bookingbranch------updateee----- :"+bookingbranch);
        String bookingdept=request.getParameter("bdept");
        String bookingroom=request.getParameter("room"); System.out.println("bookingroom------updateee----- :"+bookingroom);
        String meeting=request.getParameter("select");
       // String vcbranch=request.getParameter("vcbranch"); 
        String fromdate=request.getParameter("date1");
        String todate=request.getParameter("date2");
        String fromtime=request.getParameter("inpf");
        String totime=request.getParameter("inptf");
        String purpose=request.getParameter("purpose");
        String no_of_attendies=request.getParameter("npart");
        String remarks=request.getParameter("remarks");
      //  String amenities=request.getParameter("amentt");
        String cc=request.getParameter("cc");

        String vcbranch[]=request.getParameterValues("vcbranch");
        p = vcbranch.length;
        
        String name[]=request.getParameterValues("rr1");
        s=name.length;
        
        String email[]=request.getParameterValues("rr");
        String type[]=request.getParameterValues("type");
        
       System.out.println("booking for branch :"+bookingbranch);
       int alreadyexit=0;
       
       prs3 = conn.prepareStatement("select * from conference_room_booking where (from_date='"+fromdate+"' and to_date='"+todate+"' and status='Active')");
		 rs1 = prs3.executeQuery();
	   		
			while(rs1.next())
		    {   
				System.out.println("in while loop");		 
				 
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
	 
	           // System.out.println("outsideeeee iffffffffffff"+timeValue1);
	            //System.out.println("outsideeeee iffffffffffff"+timeValue2);
	            //System.out.println("outsideeeee iffffffffffff"+timeValue3);
	            //System.out.println("outsideeeee iffffffffffff"+timeValue4);
	         
	            //if(((timeValue1.equals(timeValue2))||(timeValue1.after(timeValue2))) && ((timeValue3.equals(timeValue4))||(timeValue3.before(timeValue4)) ||(timeValue3.after(timeValue4))))
	           if(((timeValue1.equals(timeValue2))&&(timeValue3.equals(timeValue4))) ||
	        	  ((timeValue1.after(timeValue2)) && (timeValue3.equals(timeValue4)))||
	        	  ((timeValue1.before(timeValue4)) && (timeValue3.after(timeValue4))) || 
	        	  ((timeValue1.before(timeValue2)) && (timeValue3.equals(timeValue4))) ||
	        	  ((timeValue1.before(timeValue2)) && (timeValue3.after(timeValue2))) || 
	        	  ((timeValue1.before(timeValue2))&&(timeValue3.after(timeValue4))) ||
	        	  ((timeValue1.after(timeValue2))&&(timeValue3.before(timeValue4))))
	            {
	            	System.out.println("inside iffffffffffff"+rs1.getString("booking_room_type"));
	            	 if(bookingroom.equals(rs1.getString("booking_room_type")))
	            	 {
	            		 System.out.println("inside room type"+rs1.getString("booking_for_branch"));
	            		  if(bookingbranch.equals(rs1.getString("booking_for_branch")))
	            		 { 	  
	            		System.out.println("Already exit ........From :"+fromdate+" TO: "+todate); 
	            	    alreadyexit++;
	            	    %>   
	            	            <script language="javascript"> //Java Script alert message 
	            	            alert("BOOKING ALREADY DONE IN THIS DATE AND TIME....YOU CANNOT EDIT");
	            	          window.history.go(-2);
	            	            </script>
	            		<%
	                    }
	            	 } 
	             } 
	             
	            /* } */
	            
		    }	
       
       if(status.equals("no"))
       
       {
    	   		            
		   
    	   
        String query1=null;
        if((meeting.equals("General Meeting")) || (meeting.equals("Others")))
        {
        	System.out.println("here....in general.");
        	 
        	 j=stmt.executeUpdate("DELETE FROM `vcbranch_add` WHERE `Booking_no`='"+booking_no+"'");
        	 
        	k=stmt.executeUpdate("DELETE FROM `webex_meeting` WHERE `Booking_no`='"+booking_no+"'");
        	
           /*  i=st1.executeUpdate("update conference_room_booking set booking_for_person='"+bookingperson+"' "+
            		",booking_for_branch='"+bookingbranch+"',booking_for_dept='"+bookingdept+"',"+
            		"purpose='"+purpose+"',booking_room_type='"+bookingroom+"',"+
            		"meeting_type='"+meeting+"',from_date='"+fromdate+"',from_time='"+fromtime+"',"+
            		"to_date='"+todate+"',to_time='"+totime+"',no_of_attendies='"+no_of_attendies+"',"+
            		"remarks='"+remarks+"',cc='"+cc+"' where Booking_no='"+booking_no+"'"); 
           */
           i=stmt.executeUpdate("UPDATE `conference_room_booking` SET `booking_for_person`='"+bookingperson+"',"+
        		   "`booking_for_branch`='"+bookingbranch+"',`booking_for_dept`='"+bookingdept+"',"+
        		   "`purpose`='"+purpose+"',`booking_room_type`='"+bookingroom+"',"+
        		   "`meeting_type`='"+meeting+"',`from_date`='"+fromdate+"',`from_time`='"+fromtime+"',"+
        		   "`to_date`='"+todate+"',`to_time`='"+totime+"',`no_of_attendies`='"+no_of_attendies+"',"+
        		   "`remarks`='"+remarks+"',`cc`='"+cc+"' WHERE id='"+id+"'");
           
           
           
            
            System.out.println("here....in general update after.");
        }
        else if(meeting.equals("Web-Ex Meeting"))
        {
        	System.out.println("outside for loop vcbchhhhhhhhhhhhhhh web ex meeting");
        	String query3=null;
			for( t=0; t< s; t++)
			{
				query3="insert into webex_meeting(Booking_no,name,email,type)value(?,?,?,?)";
				psmt1=conn.prepareStatement(query3);
				psmt1.setString(1,booking_no);
				psmt1.setString(2,name[t]);
				psmt1.setString(3,email[t]);
				psmt1.setString(4,type[t]);
				psmt1.executeUpdate();
				
			}
			 
			 System.out.println("here....in update webex");
			 i=stmt.executeUpdate("UPDATE `conference_room_booking` SET `booking_for_person`='"+bookingperson+"',"+
	        		   "`booking_for_branch`='"+bookingbranch+"',`booking_for_dept`='"+bookingdept+"',"+
	        		   "`purpose`='"+purpose+"',`booking_room_type`='"+bookingroom+"',"+
	        		   "`meeting_type`='"+meeting+"',`from_date`='"+fromdate+"',`from_time`='"+fromtime+"',"+
	        		   "`to_date`='"+todate+"',`to_time`='"+totime+"',`no_of_attendies`='"+no_of_attendies+"',"+
	        		   "`remarks`='"+remarks+"',`cc`='"+cc+"' WHERE id='"+id+"'");
	           
	            
        }
        else
        {
        
			
			System.out.println("outside for loop vcbchhhhhhhhhhhhhhh vc brnch");
			 for(int m=1; m < p; m++)
			{
				System.out.println("in for loop vcbchhhhhhhhhhhhhhh");
				//System.out.println("in for looopppppp vcbhhhhhhhhhh----: "+aList[m]);
				
				query1="insert into vcbranch_add(Booking_no,vcbranch)values(?,?)";
				
				psmt4 = conn.prepareStatement(query1);
			 	psmt4.setString(1,booking_no);
				psmt4.setString(2,vcbranch[m]);
				psmt4.executeUpdate();
			}
			 
			 System.out.println("here....in update.");
			 i=stmt.executeUpdate("UPDATE `conference_room_booking` SET `booking_for_person`='"+bookingperson+"',"+
	        		   "`booking_for_branch`='"+bookingbranch+"',`booking_for_dept`='"+bookingdept+"',"+
	        		   "`purpose`='"+purpose+"',`booking_room_type`='"+bookingroom+"',"+
	        		   "`meeting_type`='"+meeting+"',`from_date`='"+fromdate+"',`from_time`='"+fromtime+"',"+
	        		   "`to_date`='"+todate+"',`to_time`='"+totime+"',`no_of_attendies`='"+no_of_attendies+"',"+
	        		   "`remarks`='"+remarks+"',`cc`='"+cc+"' WHERE id='"+id+"'");
	           
	            
        }
          
       // response.sendRedirect("EditBookingPage.jsp?id="+booking_no);
	    }////////////mail sending/////
	else
	{
		
		System.out.println("here....in general. in elseeee   yesssssss");
		String query1=null;
        if((meeting.equals("General Meeting")) || (meeting.equals("Others")))
        {
        	System.out.println("here....in general.");
        	 
        	 j=stmt.executeUpdate("DELETE FROM `vcbranch_add` WHERE `Booking_no`='"+booking_no+"'");
        	 
        	k=stmt.executeUpdate("DELETE FROM `webex_meeting` WHERE `Booking_no`='"+booking_no+"'");
        	
           /*  i=st1.executeUpdate("update conference_room_booking set booking_for_person='"+bookingperson+"' "+
            		",booking_for_branch='"+bookingbranch+"',booking_for_dept='"+bookingdept+"',"+
            		"purpose='"+purpose+"',booking_room_type='"+bookingroom+"',"+
            		"meeting_type='"+meeting+"',from_date='"+fromdate+"',from_time='"+fromtime+"',"+
            		"to_date='"+todate+"',to_time='"+totime+"',no_of_attendies='"+no_of_attendies+"',"+
            		"remarks='"+remarks+"',cc='"+cc+"' where Booking_no='"+booking_no+"'"); 
           */
           i=stmt.executeUpdate("UPDATE `conference_room_booking` SET `booking_for_person`='"+bookingperson+"',"+
        		   "`booking_for_branch`='"+bookingbranch+"',`booking_for_dept`='"+bookingdept+"',"+
        		   "`purpose`='"+purpose+"',`booking_room_type`='"+bookingroom+"',"+
        		   "`meeting_type`='"+meeting+"',`from_date`='"+fromdate+"',`from_time`='"+fromtime+"',"+
        		   "`to_date`='"+todate+"',`to_time`='"+totime+"',`no_of_attendies`='"+no_of_attendies+"',"+
        		   "`remarks`='"+remarks+"',`cc`='"+cc+"' WHERE id='"+id+"'");
           
           String query="SELECT Booking_no,user_email,user_name,booking_room_type,cc FROM conference_room_booking WHERE id ='"+id+"' AND status ='Active'";
      	  prs3 = conn.prepareStatement(query);
      	 rs = prs3.executeQuery();
      	 if (rs.next())
      	    {
      			String Bookingid=rs.getString("Booking_no");
      			String user_name=rs.getString("user_name");System.out.println("user_name----"+user_name);
      			String cc1=rs.getString("cc");
      			System.out.println("cc----"+cc);
      			String booking_room_type=rs.getString("booking_room_type");
      			String usermail=rs.getString("user_email");
      			String body ="<html><body>" +
		        "<p>Hi" +
				"<p> The "+bookingroom+" is Updated by "+user_name+" "+
				
				"as follows </p>"+	
				"<br><br><table border='1' bgcolor=\"#74c1b9\" width='100%'>"+
				"<tr><th><fontcolor='blue'><b>Booking Number</b></front></th>"+
				"<th><b>Booked By</b></th>"+
				"<th><b>Booked For</b></th>"+
				"<th><b>Booking Room Type</b></th>"+
				"<th><b>Meeting Type</b></th>"+
				"<th><b>Number of Attendies</b></th>"+
				"<th><b>From</b></th>"+
				"<th><b>To</b></th><th>REMARKS</th></tr>"+
				"<tr><td>"+Bookingid+"</td>"+
				"<td>"+user_name+"</td>"+
				"<td>"+bookingperson+"</td>"+
				"<td>"+bookingroom+"</td>"+
				"<td>"+meeting+"</td>"+
				"<td>"+no_of_attendies+"</td>"+
				"<td>"+fromdate+"&nbsp "+fromtime+"</td>"+
				"<td>"+todate+"&nbsp "+totime+"</td>"+
				"<td>"+remarks+"</td></tr></table><br><br><br>"+
				/*  "<br><br><table border='1'>"+
				"<tr><td>Name</td><td>Email</td><td>Type</td></tr><tr><td>"+name[m]+"</td><td>"+email[m]+"</td><td>"+type[m]+"</td></tr></table><br><br><br>"+ */
			     "<h3 style='color:red;'>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
			    "<h3 style='color:red;'>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
				"<br></body></html>";
      	
      				String ToAdd=cc1;
      				String CCList ="";
      				String from=usermail;
      				// msg = "Conference_Room_Cancelled_Successfully";
      				new NormalMailConference().sendMail(from,ToAdd,CCList,body ,""+booking_room_type+" With Booking ID "+Bookingid+ " IS UPDATED");
      				
      			
      		}
           
            
            System.out.println("here....in general update after.");
        }
        else if(meeting.equals("Web-Ex Meeting"))
        {
        	System.out.println("outside for loop vcbchhhhhhhhhhhhhhh web ex meeting");
        	String query3=null;
			for( t=0; t< s; t++)
			{
				query3="insert into webex_meeting(Booking_no,name,email,type)value(?,?,?,?)";
				psmt1=conn.prepareStatement(query3);
				psmt1.setString(1,booking_no);
				psmt1.setString(2,name[t]);
				psmt1.setString(3,email[t]);
				psmt1.setString(4,type[t]);
				psmt1.executeUpdate();
				
			}
			 
			 System.out.println("here....in update webex");
			 i=stmt.executeUpdate("UPDATE `conference_room_booking` SET `booking_for_person`='"+bookingperson+"',"+
	        		   "`booking_for_branch`='"+bookingbranch+"',`booking_for_dept`='"+bookingdept+"',"+
	        		   "`purpose`='"+purpose+"',`booking_room_type`='"+bookingroom+"',"+
	        		   "`meeting_type`='"+meeting+"',`from_date`='"+fromdate+"',`from_time`='"+fromtime+"',"+
	        		   "`to_date`='"+todate+"',`to_time`='"+totime+"',`no_of_attendies`='"+no_of_attendies+"',"+
	        		   "`remarks`='"+remarks+"',`cc`='"+cc+"' WHERE id='"+id+"'");
	           
			 String query="SELECT Booking_no,user_email,user_name,booking_room_type,cc FROM conference_room_booking WHERE id ='"+id+"' AND status ='Active'";
	      	  prs3 = conn.prepareStatement(query);
	      	 rs = prs3.executeQuery();
	      	 if (rs.next())
	      	    {
	      			String Bookingid=rs.getString("Booking_no");
	      			String user_name=rs.getString("user_name");System.out.println("user_name----"+user_name);
	      			String cc1=rs.getString("cc");
	      			System.out.println("cc----"+cc);
	      			String booking_room_type=rs.getString("booking_room_type");
	      			String usermail=rs.getString("user_email");
	      			String body ="<html><body>" +
			        "<p>Hi" +
					"<p> The "+bookingroom+" is Updated by "+user_name+" "+
				
					"as follows</p>"+	
					"<br><br><table border='1' bgcolor=\"#74c1b9\" width='100%'>"+
					"<tr><th><fontcolor='blue'><b>Booking Number</b></front></th>"+
					"<th><b>Booked By</b></th>"+
					"<th><b>Booked For</b></th>"+
					"<th><b>Booking Room Type</b></th>"+
					"<th><b>Meeting Type</b></th>"+
					"<th><b>Number of Attendies</b></th>"+
					"<th><b>From</b></th>"+
					"<th><b>To</b></th><th>REMARKS</th></tr>"+
					"<tr><td>"+Bookingid+"</td>"+
					"<td>"+user_name+"</td>"+
					"<td>"+bookingperson+"</td>"+
					"<td>"+bookingroom+"</td>"+
					"<td>"+meeting+"</td>"+
					"<td>"+no_of_attendies+"</td>"+
					"<td>"+fromdate+"&nbsp "+fromtime+"</td>"+
					"<td>"+todate+"&nbsp "+totime+"</td>"+
					"<td>"+remarks+"</td></tr></table><br><br><br>"+
					/*  "<br><br><table border='1'>"+
					"<tr><td>Name</td><td>Email</td><td>Type</td></tr><tr><td>"+name[m]+"</td><td>"+email[m]+"</td><td>"+type[m]+"</td></tr></table><br><br><br>"+ */
				     "<h3 style='color:red;'>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
				    "<h3 style='color:red;'>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
					"<br></body></html>";
	      	
	      				String ToAdd=cc1;
	      				String CCList ="";
	      				String from=usermail;
	      				// msg = "Conference_Room_Cancelled_Successfully";
	      				new NormalMailConference().sendMail(from,ToAdd,CCList,body ,""+booking_room_type+" With Booking ID "+Bookingid+ " IS UPDATED");
	      				
	      	    }		    
        }
        else
        {
        
			
			System.out.println("outside for loop vcbchhhhhhhhhhhhhhh vc brnch");
			 for(int m=1; m < p; m++)
			{
				System.out.println("in for loop vcbchhhhhhhhhhhhhhh");
				//System.out.println("in for looopppppp vcbhhhhhhhhhh----: "+aList[m]);
				
				query1="insert into vcbranch_add(Booking_no,vcbranch)values(?,?)";
				
				psmt4 = conn.prepareStatement(query1);
			 	psmt4.setString(1,booking_no);
				psmt4.setString(2,vcbranch[m]);
				psmt4.executeUpdate();
			}
			 
			 System.out.println("here....in update.");
			 i=stmt.executeUpdate("UPDATE `conference_room_booking` SET `booking_for_person`='"+bookingperson+"',"+
	        		   "`booking_for_branch`='"+bookingbranch+"',`booking_for_dept`='"+bookingdept+"',"+
	        		   "`purpose`='"+purpose+"',`booking_room_type`='"+bookingroom+"',"+
	        		   "`meeting_type`='"+meeting+"',`from_date`='"+fromdate+"',`from_time`='"+fromtime+"',"+
	        		   "`to_date`='"+todate+"',`to_time`='"+totime+"',`no_of_attendies`='"+no_of_attendies+"',"+
	        		   "`remarks`='"+remarks+"',`cc`='"+cc+"' WHERE id='"+id+"'");
	         
			 String query="SELECT Booking_no,user_email,user_name,booking_room_type,cc FROM conference_room_booking WHERE id ='"+id+"' AND status ='Active'";
	      	  prs3 = conn.prepareStatement(query);
	      	 rs = prs3.executeQuery();
	      	 if (rs.next())
	      	    {
	      			String Bookingid=rs.getString("Booking_no");
	      			String user_name=rs.getString("user_name");System.out.println("user_name----"+user_name);
	      			String cc1=rs.getString("cc");
	      			System.out.println("cc----"+cc);
	      			String booking_room_type=rs.getString("booking_room_type");
	      			String usermail=rs.getString("user_email");
	      			String body ="<html><body>" +
			        "<p>Hi" +
					"<p> The "+bookingroom+" is Updated by "+user_name+" as Follows"+
					"</p>"+	
					"<br><br><table border='1' bgcolor=\"#74c1b9\" width='100%'>"+
					"<tr><th><fontcolor='blue'><b>Booking Number</b></front></th>"+
					"<th><b>Booked By</b></th>"+
					"<th><b>Booked For</b></th>"+
					"<th><b>Booking Room Type</b></th>"+
					"<th><b>Meeting Type</b></th>"+
					"<th><b>Number of Attendies</b></th>"+
					"<th><b>From</b></th>"+
					"<th><b>To</b></th><th>REMARKS</th></tr>"+
					"<tr><td>"+Bookingid+"</td>"+
					"<td>"+user_name+"</td>"+
					"<td>"+bookingperson+"</td>"+
					"<td>"+bookingroom+"</td>"+
					"<td>"+meeting+"</td>"+
					"<td>"+no_of_attendies+"</td>"+
					"<td>"+fromdate+"&nbsp "+fromtime+"</td>"+
					"<td>"+todate+"&nbsp "+totime+"</td>"+
					"<td>"+remarks+"</td></tr></table><br><br><br>"+
					/*  "<br><br><table border='1'>"+
					"<tr><td>Name</td><td>Email</td><td>Type</td></tr><tr><td>"+name[m]+"</td><td>"+email[m]+"</td><td>"+type[m]+"</td></tr></table><br><br><br>"+ */
				     "<h3 style='color:red;'>http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
				    "<h3 style='color:red;'>http://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
					"<br></body></html>";
	      	
	      				String ToAdd=cc1;
	      				String CCList ="";
	      				String from=usermail;
	      				// msg = "Conference_Room_Cancelled_Successfully";
	      				new NormalMailConference().sendMail(from,ToAdd,CCList,body ,""+booking_room_type+" With Booking ID "+Bookingid+ " IS UPDATED");
	      				
	      			
	            
        }
        	}
	      	 
        }
       msg = "Updation_Done_Successfully ";
       response.sendRedirect("viewindividualbooking.jsp?msg=" +msg);
			
       }	
		catch (Exception e)
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