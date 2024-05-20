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

public class AMCCallForPrint extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public AMCCallForPrint() {
    	
        super();
      
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		
		String action=request.getParameter("view");
		System.out.println("view type:::"+action);
		
	 if(action.equals("AmcNonIt")){	
		 
		 System.out.println("in call print page");
		
			  String assetno=request.getParameter("assetno");
			  String ponum=request.getParameter("pono");
	          String fromdate1=request.getParameter("fromdate");
	          String todate1=request.getParameter("todate");
	          
	          System.out.println("asset num---"+assetno);
	          System.out.println("po num----"+ponum);
	          System.out.println("from---"+fromdate1);
	          System.out.println("to----"+todate1);
          
		      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		      Date startDate = null;
		     
			try {
				startDate = dateFormat.parse(fromdate1);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			Date endDate =  null;
			
			try {
				endDate = dateFormat.parse(todate1);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}

			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=AmcReport.xls");
			
			
			List<AmcDto> amcdto = null;
			try {
				amcdto = AMCPrintData.viewAmcDetails(assetno, ponum, startDate, endDate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("amcDetails", amcdto);
			 System.out.println("nothing match here....");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("AmcNonIt/printAMC.jsp");
				requestDispatcher.forward(request, response);
	   }
	
	     else{
               System.out.println("nothing match here....");
            }
	
	   }
}
