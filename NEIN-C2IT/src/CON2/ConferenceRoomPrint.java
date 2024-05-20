package CON2;



import java.io.IOException;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConferenceRoomPrint extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ConferenceRoomPrint() {
    	
        super();
      
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		
		String action=request.getParameter("view");
		System.out.println("view type 111 :::"+action);
		
	 if(action.equals("allbooking")){	
		 
		 System.out.println("in all booking");
		
			  String branch=request.getParameter("branch");
			   String fromdate=request.getParameter("fromdate");
	          String todate=request.getParameter("todate");
	          
	          System.out.println("branch---"+branch);
	          System.out.println("from---"+fromdate);
	          System.out.println("to----"+todate);
          
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=ConferenceAllBooking.xls");
			
			
			List<ConferenceRoomDTO> conferenceRoomDTO = null;
			try {
				conferenceRoomDTO = ConferencePrintData.viewAllBooking(branch,fromdate,todate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("conferencedetails",conferenceRoomDTO);
			 System.out.println("nothing match here....");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Conference/printAllBooking.jsp");
				requestDispatcher.forward(request, response);
	   }
	 
	 else if(action.equals("allamenities")){	
		 
		 System.out.println("in ameities");
		
			  String branch=request.getParameter("branch");
			   
	          System.out.println("branch---"+branch);
	        
	          response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=Amenities.xls");
			
			
			List<ConferenceRoomDTO> conferenceRoomDTO = null;
			try {
				conferenceRoomDTO = ConferencePrintData.viewAllAmenities(branch);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("amenitiesdetails",conferenceRoomDTO);
			 System.out.println("nothing match here 111111111....");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Conference/printAllAmenities.jsp");
				requestDispatcher.forward(request, response);
	   }
	 
      else if(action.equals("cancel")){	
		 
		 System.out.println("in cancel booking");
		
			  String branch=request.getParameter("branch");
			   
	          System.out.println("branch---"+branch);
	        
	          response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=Amenities.xls");
			
			
			List<ConferenceRoomDTO> conferenceRoomDTO = null;
			try {
				conferenceRoomDTO = ConferencePrintData.viewAllcancelbooking(branch);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("canceldetails",conferenceRoomDTO);
			 System.out.println("nothing match here 111111111....");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Conference/printCancelbooking.jsp");
				requestDispatcher.forward(request, response);
	   }
	 
      else if(action.equals("allwebex")){	
 		 
 		 System.out.println("in webex");
 		
 			  String branch=request.getParameter("branch");
 			   
 	          System.out.println("branch---"+branch);
 	        
 	          response.setContentType("application/vnd.ms-excel");
 			response.setHeader("Content-Disposition", "attachment; filename=Webex.xls");
 			
 			
 			List<ConferenceRoomDTO> conferenceRoomDTO = null;
 			try {
 				conferenceRoomDTO = ConferencePrintData.viewAllWebex(branch);
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 			request.setAttribute("webexdetails",conferenceRoomDTO);
 			 System.out.println("nothing match here 111111111....");
 				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Conference/printAllWebex.jsp");
 				requestDispatcher.forward(request, response);
 	   }
	     else{
               System.out.println("nothing match here....");
            }
	
	   }
}
