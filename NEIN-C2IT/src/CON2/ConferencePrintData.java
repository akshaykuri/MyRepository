package CON2;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import CON2.Connection2;


//@SuppressWarnings("deprecation")
public class ConferencePrintData {

	
public static List<ConferenceRoomDTO> viewAllBooking(String branch,String fromdate,String todate) throws SQLException {
		
	System.out.println("in confrence printodata page");
	
		 List<ConferenceRoomDTO> conferenceRoomDTO1 = new ArrayList<ConferenceRoomDTO>();
		
		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
	     String query =null;
	     
	     if(branch.equals("all"))
	     {
	    	 query="SELECT a.*,b.branch_name,d.department_name FROM csdb.conference_room_booking a inner join leavemanagement.branchmaster b on b.branch_type_code=a.booking_for_branch inner join leavemanagement.department d on d.department_id=a.booking_for_dept WHERE a.`from_date`>= ? and a.`to_date`<= ? and a.status='Active'";
 
	     }
	     else
	     {
	    query="SELECT a.*,b.branch_name,d.department_name FROM csdb.conference_room_booking a inner join leavemanagement.branchmaster b on b.branch_type_code=a.booking_for_branch inner join leavemanagement.department d on d.department_id=a.booking_for_dept WHERE a.`booking_for_branch`= ? and a.`from_date`>= ? and a.`to_date`<= ? and a.status='Active'";

	     }
		try{
				 preparedStatement = con.prepareStatement(query);
				 if(branch.equals("all"))
				 {
					 preparedStatement.setString(1, fromdate);
					 preparedStatement.setString(2, todate);
					 
				 }
				 else
				 {
				 preparedStatement.setString(1, branch);
				 preparedStatement.setString(2, fromdate);
				 preparedStatement.setString(3, todate);
				
				 }
		     resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()){
				
				ConferenceRoomDTO conferenceRoomDTO = new ConferenceRoomDTO();
				conferenceRoomDTO.setBookingNo(resultSet.getString("Booking_no"));
				conferenceRoomDTO.setUserName(resultSet.getString("user_name"));
				conferenceRoomDTO.setBookingForPerson(resultSet.getString("booking_for_person"));
				conferenceRoomDTO.setBookingForBranch(resultSet.getString("branch_name"));
				conferenceRoomDTO.setBookingForDept(resultSet.getString("department_name"));
				conferenceRoomDTO.setPurpose(resultSet.getString("purpose"));
				conferenceRoomDTO.setBookingRoomType(resultSet.getString("booking_room_type"));
				conferenceRoomDTO.setMeetingType(resultSet.getString("meeting_type"));
				conferenceRoomDTO.setFromdate(resultSet.getString("from_date"));
				conferenceRoomDTO.setTodate(resultSet.getString("to_date"));
				conferenceRoomDTO.setFromtime(resultSet.getString("from_time"));
				conferenceRoomDTO.setTotime(resultSet.getString("to_time"));
				conferenceRoomDTO.setNoAttendies(resultSet.getString("no_of_attendies"));
				conferenceRoomDTO.setRemarks(resultSet.getString("remarks"));
               
				conferenceRoomDTO1.add(conferenceRoomDTO);
                
			}
	   }catch (Exception e) {
			e.printStackTrace();

	 }
	 finally {
		 con.close();
		}
	return conferenceRoomDTO1;
	}

public static List<ConferenceRoomDTO> viewAllAmenities(String branch) throws SQLException {
	
	System.out.println("in amenities printodata page");
	
		 List<ConferenceRoomDTO> conferenceRoomDTO1 = new ArrayList<ConferenceRoomDTO>();
		
		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
	     String query =null;
	     if(branch.equals("all"))
	     {
	    	 query="SELECT a.*,c.`from_date`,c.`to_date`,c.`from_time`,c.`to_time` FROM `amenities_add` a inner join conference_room_booking c on c.Booking_no=a.Booking_no WHERE c.status='Active' ";
	 	     
	     }
	     else
	     { 	 
	    query="SELECT a.*,c.`from_date`,c.`to_date`,c.`from_time`,c.`to_time` FROM `amenities_add` a inner join conference_room_booking c on c.Booking_no=a.Booking_no WHERE c.booking_for_branch= ? and c.status='Active' ";
	     }
	     
		try{
			if(branch.equals("all"))
		     {
				preparedStatement = con.prepareStatement(query);
		     }
			else
			{
				 preparedStatement = con.prepareStatement(query);
				 preparedStatement.setString(1, branch);
			}
			    resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()){
				
				ConferenceRoomDTO conferenceRoomDTO = new ConferenceRoomDTO();
				conferenceRoomDTO.setBookingNo(resultSet.getString("Booking_no"));
				conferenceRoomDTO.setFromdate(resultSet.getString("from_date"));
				conferenceRoomDTO.setTodate(resultSet.getString("to_date"));
				conferenceRoomDTO.setFromtime(resultSet.getString("from_time"));
				conferenceRoomDTO.setTotime(resultSet.getString("to_time"));
				conferenceRoomDTO.setItem(resultSet.getString("items"));
				conferenceRoomDTO.setQuantity(resultSet.getString("quantity"));
				conferenceRoomDTO.setAremarks(resultSet.getString("remarks"));
				
				conferenceRoomDTO1.add(conferenceRoomDTO);
                
			}
	   }catch (Exception e) {
			e.printStackTrace();

	 }
	 finally {
		 con.close();
		}
	return conferenceRoomDTO1;
	}

public static List<ConferenceRoomDTO> viewAllcancelbooking(String branch) throws SQLException {
	
	System.out.println("in cancel booking printodata page");
	
		 List<ConferenceRoomDTO> conferenceRoomDTO1 = new ArrayList<ConferenceRoomDTO>();
		
		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
	     String query =null;
	     if(branch.equals("all"))
	     {
	    	 query="SELECT * FROM `conference_room_booking` WHERE status='Inactive' ";
	 	     
	     }
	     else
	     {
	    query="SELECT * FROM `conference_room_booking` WHERE booking_for_branch= ?  and status='Inactive' ";
	     }
		try{
			if(branch.equals("all"))
		     {
			    preparedStatement = con.prepareStatement(query);
		     }
			else
			{
				 preparedStatement = con.prepareStatement(query);
				 preparedStatement.setString(1, branch);
			}	
		     resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()){
				
				ConferenceRoomDTO conferenceRoomDTO = new ConferenceRoomDTO();
				conferenceRoomDTO.setBookingNo(resultSet.getString("Booking_no"));
				conferenceRoomDTO.setUserName(resultSet.getString("user_name"));
				conferenceRoomDTO.setFromdate(resultSet.getString("from_date"));
				conferenceRoomDTO.setTodate(resultSet.getString("to_date"));
				conferenceRoomDTO.setFromtime(resultSet.getString("from_time"));
				conferenceRoomDTO.setTotime(resultSet.getString("to_time"));
				conferenceRoomDTO.setCancelRemarks(resultSet.getString("Cancel_remarks"));
				
				conferenceRoomDTO1.add(conferenceRoomDTO);
                
			}
	   }catch (Exception e) {
			e.printStackTrace();

	 }
	 finally {
		 con.close();
		}
	return conferenceRoomDTO1;
	}

public static List<ConferenceRoomDTO> viewAllWebex(String branch) throws SQLException {
	
	System.out.println("in webex printodata page");
	
		 List<ConferenceRoomDTO> conferenceRoomDTO1 = new ArrayList<ConferenceRoomDTO>();
		
		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
	     String query =null;
	     if(branch.equals("all"))
	     {
	    	 query="SELECT a.*,c.`from_date`,c.`to_date`,c.`from_time`,c.`to_time` FROM `webex_meeting` a inner join conference_room_booking c on c.Booking_no=a.Booking_no WHERE c.status='Active' ";
	 	     
	     }
	     else
	     { 	 
	    query="SELECT a.*,c.`from_date`,c.`to_date`,c.`from_time`,c.`to_time` FROM `webex_meeting` a inner join conference_room_booking c on c.Booking_no=a.Booking_no WHERE c.booking_for_branch= ? and c.status='Active' ";
	     }
	     
		try{
			if(branch.equals("all"))
		     {
				preparedStatement = con.prepareStatement(query);
		     }
			else
			{
				 preparedStatement = con.prepareStatement(query);
				 preparedStatement.setString(1, branch);
			}
			    resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()){
				
				ConferenceRoomDTO conferenceRoomDTO = new ConferenceRoomDTO();
				conferenceRoomDTO.setBookingNo(resultSet.getString("Booking_no"));
				conferenceRoomDTO.setFromdate(resultSet.getString("from_date"));
				conferenceRoomDTO.setTodate(resultSet.getString("to_date"));
				conferenceRoomDTO.setFromtime(resultSet.getString("from_time"));
				conferenceRoomDTO.setTotime(resultSet.getString("to_time"));
				conferenceRoomDTO.setName(resultSet.getString("name"));
				conferenceRoomDTO.setEmail(resultSet.getString("email"));
				conferenceRoomDTO.setType(resultSet.getString("type"));
				
				conferenceRoomDTO1.add(conferenceRoomDTO);
                
			}
	   }catch (Exception e) {
			e.printStackTrace();

	 }
	 finally {
		 con.close();
		}
	return conferenceRoomDTO1;
	}
				 	
}
	

