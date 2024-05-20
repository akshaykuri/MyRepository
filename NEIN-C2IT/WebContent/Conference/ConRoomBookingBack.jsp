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
	//System.out.println("here.....");
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
		
		
		//Class.forName("com.mysql.jdbc.Driver").newInstance();
		Class.forName(driver).newInstance();
		conn= DriverManager.getConnection(url+dbName,userName,password);
		
		String b_no=request.getParameter("bno");
	//	System.out.println("bnoooooooooooooooo---- :"+b_no);
		
		String booking_no=request.getParameter("booking_no");
	//	System.out.println("bookingggggggggg----------- :"+booking_no);
		
		String empid=request.getParameter("emp_id");
		//System.out.println("empid :"+empid);
		String username=request.getParameter("uname");
  		//System.out.println("user name :"+username);
        String usermail=request.getParameter("uemail");
       // System.out.println("mail :"+usermail);
        String branch=request.getParameter("ubranch");
        //System.out.println("branch :"+branch);
        String department=request.getParameter("udept");
       // System.out.println("dept :"+department);
        String bookingperson=request.getParameter("bname");
      //  System.out.println("BOOKING For :"+bookingperson);
        String bookingbranch=request.getParameter("branchid");
      //  System.out.println("BOOKING For branch :"+bookingbranch);
        String bookingdept=request.getParameter("bdept");
      //  System.out.println("BOOKING For dept :"+bookingdept);
        String bookingroom=request.getParameter("room"); 
      //  System.out.println("BOOKING For room :"+bookingroom);
        String meeting=request.getParameter("select");
      //  System.out.println("BOOKING For meeting type :"+meeting);
        String bookingdate=request.getParameter("current");
        
        System.out.println("-------------- Con Booking Back -here------------------ 1");
		
        // String vcbranch=request.getParameter("vcbranch"); 
        //String fromdate=request.getParameter("date1");
       // String todate=request.getParameter("date2");
        
       
      
        String purpose=request.getParameter("purpose");
     //   System.out.println("-------------- Con Booking Back -here------------------ 4");
        String no_of_attendies=request.getParameter("npart");
      //  System.out.println("-------------- Con Booking Back -here------------------ 5");
        String remarks=request.getParameter("remarks");
      //  System.out.println("-------------- Con Booking Back -here------------------6");
      //  String amenities=request.getParameter("amentt");
        String cc=request.getParameter("cc");
      //  System.out.println("-------------- Con Booking Back -here------------------ 7");
        String HR=request.getParameter("BranchHr");
      //  System.out.println("-------------- Con Booking Back -here------------------8 ");
        String IT=request.getParameter("BranchIt");
    //    System.out.println("-------------- Con Booking Back -here------------------9 ");
        String vcbranch[]=request.getParameterValues("vcbranch");
        p = vcbranch.length;
   //     System.out.println("-------------- Con Booking Back -here------------------ 10");
        String amenities[]=request.getParameterValues("ament");
        l = amenities.length;
    //    System.out.println("-------------- Con Booking Back -here------------------11 ");
        String fromdate[]=request.getParameterValues("date1");
        a = fromdate.length;
       // System.out.println("-------------- aaaaaaaaaaaaaaaaaa------------------ "+a); 
        String todate[]=request.getParameterValues("date1");
     	String fromtime[]=request.getParameterValues("timef");
        String totime[]=request.getParameterValues("timeto");
      
        String quantity[]=request.getParameterValues("quant");
   //     System.out.println("-------------- Con Booking Back -here------------------ ");
        String aremarks[]=request.getParameterValues("aremarks");
        
        //////////////webex/////////////////
        
        String name[]=request.getParameterValues("rr1");
        s=name.length;
        
        String email[]=request.getParameterValues("rr");
        String type[]=request.getParameterValues("type");
       // System.out.println("vclist :"+vcbranch);
        
       System.out.println("Meeting TYPE :"+meeting);
       
      // p=vcbranch.length;
        
        
        
       
       
       
        
        System.out.println("BOOKING Room TYPE:"+bookingroom);
        System.out.println("Meeting TYPE :"+meeting);
      //  System.out.println("from date :"+fromdate);
      //  System.out.println("to date :"+todate);
       // System.out.println("From time :"+fromtime);
      //  System.out.println("To time :"+totime);
        System.out.println("Purpose :"+purpose);
        System.out.println("Attendies :"+no_of_attendies);
        System.out.println("Remarks :"+remarks);
       // System.out.println("amenities :"+amenities);
        System.out.println("cc :"+cc);
        System.out.println("HR :"+HR);
        System.out.println("IT :"+IT); 
        
        String datef=null;
        String dateto=null;
        String timef=null;
        String timet=null;
        int n=10;
        int alreadyexit=0;
        
        for (int y =1 ; y <  a; y++)
		   {  
        	 datef=fromdate[y];
			 dateto=todate[y];
			 timef=fromtime[y];
		     timet=totime[y];
			 System.out.println("For checking the date wise :::::: from date ::"+datef+" To date::"+dateto);		 
			 System.out.println("For checking the time wise :::::: from time ::"+timef+" To time::"+timet);
			 
			 prs3 = conn.prepareStatement("select * from conference_room_booking where (from_date>='"+datef+"' and to_date<='"+dateto+"' and  booking_for_branch='"+bookingbranch+"' and status='Active')");
			 rs1 = prs3.executeQuery();
		   		
				while(rs1.next())
			    {   
					System.out.println("in while loop----"+datef+" To date::"+dateto);		 
					 
			         String string1 = timef;
			         System.out.println("in while loop---string1 date::"+string1);		 
					 
					 DateFormat formatter = new SimpleDateFormat("HH:mm");
		             java.sql.Time timeValue1 = new java.sql.Time(formatter.parse(string1).getTime());

		             System.out.println("aaaaaa ::"+y+":: ::: "+rs1.getString("from_time"));
		            String string2 =rs1.getString("from_time");
		            java.sql.Time timeValue2 = new java.sql.Time(formatter.parse(string2).getTime());

		            String string3 = timet;
		            System.out.println("in while loop---string3 date::"+string3);	
		            java.sql.Time timeValue3 = new java.sql.Time(formatter.parse(string3).getTime());
		            System.out.println("to_time ::"+y+":: ::: "+rs1.getString("to_time"));
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
		            	 if(bookingroom.equals(rs1.getString("booking_room_type")))
		            	 {
		            		 System.out.println("inside room type");
		            		  if(bookingbranch.equals(rs1.getString("booking_for_branch")))
		            		 { 	  
		            		System.out.println("Already exit ........From :"+datef+" TO: "+dateto); 
		            	    alreadyexit++;
		            	    msg = "Already_Booked on "+fromdate[y]+" with timing "+timef+" to "+timet+"";
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
        
        if(alreadyexit == 0){
        
        	System.out.println("For Inserting the date wise ::");
        	
           /*  for (int z =1 ; z <=  a-1; z++)
		     { 
			 */	// datef=fromdate[z];
				// dateto=todate[z];
				 
				 System.out.println("From date ::"+datef+" To date::"+dateto);	  
					
					/////changesssssssssssssssssssssss//
				prs2 = conn.prepareStatement("SELECT max(idextend) FROM conference_room_booking  WHERE Booking_no IN(SELECT Booking_no FROM conference_room_booking  LEFT JOIN branch_master b ON(substr(Booking_no,16,2)=b.b_no) WHERE b.b_no=? GROUP BY Booking_no)");
				prs2.setString(1,b_no);
				rs = prs2.executeQuery();
				
				
				if (rs.next())
				    {
					
					/* id=rs.getInt(1);
				       if(id==0)
					       id=id+1;
				      */  
				      
					try
					{
						id=rs.getInt(1);
						if(id==0)
				 			id=0;
						     if(id2==null)
				 			 id2="NEIN/CS/BOOKNo/"+b_no+"-";
				             id++;   
				             new_id = id2+String.valueOf(id);
					}
					catch(SQLException ex)
					    {
						  System.out.println("WXCEPTION : "+ex.toString());
						 new_id = "NEIN/CS/BOOKNo/"+b_no+"-1";
					    }

					int idextend = id;
					/*  for (int x = 1; x < a; x++)
					   {  */  
						 System.out.println("......hereeeeeee....... ::"+y);	 
					String query="insert into conference_room_booking(idextend,Booking_no,booked_date,user_empid,user_email,user_name,user_branch,user_dept,booking_for_person,booking_for_branch,booking_for_dept,purpose,booking_room_type,meeting_type,from_date,from_time,to_date,to_time,no_of_attendies,remarks,cc,status,Cancel_remarks,cancelled_by) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'Active','null','null')";
					psmt2 = conn.prepareStatement(query);
					//psmt2.setInt(1, id);
					psmt2.setInt(1, idextend);
					psmt2.setString(2, new_id);
					psmt2.setString(3,bookingdate);
					psmt2.setString(4, empid);
					psmt2.setString(5, usermail);
					psmt2.setString(6, username);
					psmt2.setString(7, branch);
					psmt2.setString(8, department);
					psmt2.setString(9, bookingperson);
					psmt2.setString(10, bookingbranch);
					psmt2.setString(11, bookingdept);
					psmt2.setString(12,purpose);
					psmt2.setString(13, bookingroom);
					psmt2.setString(14, meeting);
					psmt2.setString(15, fromdate[y]);
					psmt2.setString(16, fromtime[y]);
					psmt2.setString(17, todate[y]);
					psmt2.setString(18, totime[y]);
					psmt2.setString(19, no_of_attendies);
					psmt2.setString(20, remarks);
					psmt2.setString(21, cc);
					
				//	psmt2.setString(19, vcbranch);
					i=psmt2.executeUpdate();
					  /*  } */
					//System.out.println("beforeeeeeeeeee vbchhhhhhhhhhhh--"+vcbranch[0]);
					
					
					String query3=null;
					for( t=0; t< s; t++)
					{
						query3="insert into webex_meeting(Booking_no,name,email,type)value(?,?,?,?)";
						psmt1=conn.prepareStatement(query3);
						psmt1.setString(1,new_id);
						psmt1.setString(2,name[t]);
						psmt1.setString(3,email[t]);
						psmt1.setString(4,type[t]);
						psmt1.executeUpdate();
						
					}
					
					String query2=null;
					System.out.println("outside for loop vcbchhhhhhhhhhhhhhh");
					 for(m=0; m < p; m++)
					{
						System.out.println("in for loop vcbchhhhhhhhhhhhhhh");
						//System.out.println("in for looopppppp vcbhhhhhhhhhh----: "+aList[m]);
						
						query2="insert into vcbranch_add(Booking_no,vcbranch)values(?,?)";
						
						psmt4 = conn.prepareStatement(query2);
					 	psmt4.setString(1,new_id);
						psmt4.setString(2,vcbranch[m]);
						psmt4.executeUpdate();
					}
					  
				 	
					String query1=null;
					
					 for (int k = 1; k < l; k++)
					   {
						 query1="insert into amenities_add(Booking_no,items,quantity,remarks)values(?,?,?,?)";
							System.out.println("Id::;"+id+"Record :: "+k+" ::: "+amenities[k]);
						 	psmt3 = conn.prepareStatement(query1);
						 	psmt3.setString(1,new_id);
							psmt3.setString(2,amenities[k]);
							psmt3.setString(3,quantity[k]);
							psmt3.setString(4,aremarks[k]); 
							j=psmt3.executeUpdate();
						
					
						} 
					 
					 String fromdate1=null;
					 String todate1=null;
					 String fromtime1=null;
					 String totime1=null;
					 for (b=0 ; b < a; b++)
					 {
						 fromdate1=fromdate[b];
						 todate1=todate[b];
						 fromtime1=fromtime[b];
						 totime1=totime[b];
					 }
					 
					 int q=0; 
					 String branchname=null;
						String[] bname=null;
						String buffer1="";
						String query5=null; 
					 for(q=0 ;q < p; q++)
					 {
						 
						 System.out.println("in vcbranch for loop");
						query5="SELECT `branch_name` FROM `vc_branchmaster` WHERE `branch_id`='"+vcbranch[q]+"' ";
						prs3 = conn.prepareStatement(query5);
						
						 rs1 = prs3.executeQuery();
						 if (rs1.next())
						    {
								buffer1=buffer1+"<tr><td>"+rs1.getString("branch_name")+"</td></tr>";
								
							}
							
					 }
					// System.out.println("buffer111"+buffer1);
					 int h=0;
					 String name1=null;
					 String email1=null;
					 String type1=null;
					 String buffer="";
					 for(h=0; h< s; h++)
					 {
						name1=name[h];
						email1=email[h];
						type1=type[h];
						buffer=buffer+"<tr><td>"+name1+"</td><td>"+email1+"</td><td>"+type1+"</td></tr>";
						//System.out.println("aaaaaaaa"+name1);
						//System.out.println("bbbbbbbb"+email1);
						//System.out.println("ccccccccc"+name1);
					 }
					
				//	 System.out.println("bufferrrr"+buffer);
					  if(meeting.equals("Web-Ex Meeting"))
					 {
						 System.out.println("in webex meeting");
						 
					  String body ="<html><body>" +
				        "<p>Hi" +
						"<p>The "+bookingroom+" is Booked by "+username+" "+
						" for "+bookingperson+" from "+fromtime1+" to "+
						""+totime1+" between the dates "+fromdate1+" and "+
						""+todate1+"</p>"+	
						"<br><br><table border='1' bgcolor=\"#74c1b9\" width='100%'>"+
						"<tr><th>Booking Number</front></th>"+
					    "<th><b>Booked By</</th>"+
						"<th>Booked For</th>"+
						"<th>Booking Room Type</th>"+
						"<th>Meeting Type</th>"+
						"<th>Number of Attendies</th>"+
						"<th>From</th>"+
						"<th>To</td><th>REMARKS</th></th>"+
						"<tr><td>"+new_id+"</td>"+
						"<td>"+username+"</td>"+
						"<td>"+bookingperson+"</td>"+
						"<td>"+bookingroom+"</td>"+
						"<td>"+meeting+"</td>"+
						"<td>"+no_of_attendies+"</td>"+
						"<td>"+fromdate1+"&nbsp "+fromtime1+"</td>"+
						"<td>"+todate1+"&nbsp "+totime1+"</td>"+
						"<tr><td>"+remarks+"</td></tr></table><br>"+
						
						 "<br><br><table border='1' width='50%'>"+
						"<tr><th>Name</th><th>Email</th><th>Type</th></tr>"+buffer+"</table><br><br><br>"+
					     "<h3 style='color:red;'>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
					    "<h3 style='color:red;'>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
						"<br></body></html>";
						
						String from=usermail;
						String ToAdd=HR+","+IT;
						String CCList =cc;
						
						new NormalMailConference().sendMail(from,ToAdd,CCList,body , ""+bookingroom+" Is Booked ");
						
					   msg = "Conference_Room_Booked_Successfully";
					
				     //  response.sendRedirect("ConRoomHome.jsp?msg=" +msg); 
				
				   }
					  
					  else  if((meeting.equals("Video Conference")) || (meeting.equals("Audio Conference")))
						 {
							 System.out.println("in vc branchhhh");
							 
						  String body ="<html><body>" +
					        "<p>Hi" +
							"<p>The "+bookingroom+" is Booked by "+username+" "+
							" for "+bookingperson+" from "+fromtime1+" to "+
							""+totime1+" between the dates "+fromdate1+" and "+
							""+todate1+"</p>"+	
							"<br><br><table border='1' bgcolor=\"#74c1b9\" width='100%'>"+
							"<tr><th><fontcolor='blue'>Booking Number</front></th>"+
						    "<th><b>Booked By</</th>"+
							"<th>Booked For</th>"+
							"<th>Booking Room Type</th>"+
							"<th>Meeting Type</th>"+
							"<th>Number of Attendies</th>"+
							"<th>From</th>"+
							"<th>To</th><th>REMARKS</th></tr>"+
							"<tr><td>"+new_id+"</td>"+
							"<td>"+username+"</td>"+
							"<td>"+bookingperson+"</td>"+
							"<td>"+bookingroom+"</td>"+
							"<td>"+meeting+"</td>"+
							"<td>"+no_of_attendies+"</td>"+
							"<td>"+fromdate1+"&nbsp "+fromtime1+"</td>"+
							"<td>"+todate1+"&nbsp "+totime1+"</td>"+
							"<td>"+remarks+"</td></tr></table><br>"+
							
							 "<br><br><table border='1'width='25%'>"+
							"<tr><th>VC/AC Branch Name</th></tr>"+buffer1+"</table><br><br><br>"+
						     "<h3 style='color:red;'>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
						    "<h3 style='color:red;'>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
							"<br></body></html>";
							String from=usermail;
							String ToAdd=HR+","+IT;
							String CCList =cc;
							
							new NormalMailConference().sendMail(from,ToAdd,CCList,body ,""+bookingroom+" Is Booked ");
							
						   msg = "Conference_Room_Booked_Successfully";
						
					      // response.sendRedirect("ConRoomHome.jsp?msg=" +msg); 
					
					   }
					  
					 else
					 {
					 	 System.out.println("in else ");
						 
					 	 String body ="<html><body>" +
					        "<p>Hi" +
							"<p> The "+bookingroom+" is Booked by "+username+" "+
							" for "+bookingperson+" from "+fromtime1+" to "+
							""+totime1+" between the dates "+fromdate1+" and "+
							""+todate1+"</p>"+	
							"<br><br><table border='1' bgcolor=\"#74c1b9\" width='100%'>"+
							"<tr><th><fontcolor='blue'><b>Booking Number</b></front></th>"+
							"<th><b>Booked By</b></th>"+
							"<th><b>Booked For</b></th>"+
							"<th><b>Booking Room Type</b></th>"+
							"<th><b>Meeting Type</b></th>"+
							"<th><b>Number of Attendies</b></th>"+
							"<th><b>From</b></th>"+
							"<th><b>To</b></th><th>REMARKS</th></tr>"+
							"<tr><td>"+new_id+"</td>"+
							"<td>"+username+"</td>"+
							"<td>"+bookingperson+"</td>"+
							"<td>"+bookingroom+"</td>"+
							"<td>"+meeting+"</td>"+
							"<td>"+no_of_attendies+"</td>"+
							"<td>"+fromdate1+"&nbsp "+fromtime1+"</td>"+
							"<td>"+todate1+"&nbsp "+totime1+"</td>"+
							"<td>"+remarks+"</td></tr></table><br><br><br>"+
							/*  "<br><br><table border='1'>"+
							"<tr><td>Name</td><td>Email</td><td>Type</td></tr><tr><td>"+name[m]+"</td><td>"+email[m]+"</td><td>"+type[m]+"</td></tr></table><br><br><br>"+ */
						     "<h3 style='color:red;'>https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp </h3><br>" +
						    "<h3 style='color:red;'>https://neinsoft1.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp</h3>" +
							"<br></body></html>";
							String from=usermail;
							String ToAdd=HR+","+IT;
							String CCList =cc;
							
							new NormalMailConference().sendMail(from,ToAdd,CCList,body ,""+bookingroom+" Is Booked");
							
						   msg = "Conference_Room_Booked_Successfully";
						
					     //  response.sendRedirect("ConRoomHome.jsp?msg=" +msg);  
					  }  
				}	
		     /* } */
        }
        else{
        	
        	  System.out.println("already exit the :: ");
        	  msg = "Already_Booked on "+fromdate[y]+"";
        	  %>   
	            <script language="javascript"> //Java Script alert message 
	            alert(""+fromdate[y]+" BOOKING ALREADY BOOKED...PLEASE CHECK CALENDAR FOR FREE DATES");
	             
	            </script>
		<%
          }
        
	    }
        response.sendRedirect("ConRoomHome.jsp?msg=" +msg); 
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