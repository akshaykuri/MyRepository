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

public class CallForPrint extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public CallForPrint() {
    	
        super();
      
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		
		String action=request.getParameter("view");
		System.out.println("view type:::"+action);
		
	if(action.equals("catridge")){	
			 String branch=request.getParameter("branch");
			 int branchId=Integer.parseInt(branch);
	         String fromdate1=request.getParameter("fromdate");
	         String todate1=request.getParameter("todate");
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
			    response.setHeader("Content-Disposition", "attachment; filename=CartridgeReport.xls");
			
				List<Catridge> catridgeDTOs = null;
				try {
					catridgeDTOs = PrintData.viewModelWiseCatridge(branchId, startDate, endDate);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("ModelWiseDetails", catridgeDTOs);
				
				List<Catridge> catridgeDTOMonthWise = null;
				try {
					catridgeDTOMonthWise = PrintData.viewMonthWiseCatridge(branchId, startDate, endDate);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("MonthWiseDetails", catridgeDTOMonthWise);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Catridge/printCat.jsp");
				requestDispatcher.forward(request, response);
				
	}
	
	else if(action.equals("catridge1")){	
		
				 String branch=request.getParameter("branch");
				 int branchId=Integer.parseInt(branch);
		         String fromdate1=request.getParameter("fromdate");
		         String todate1=request.getParameter("todate");
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
				response.setHeader("Content-Disposition", "attachment; filename=CartridgeReport.xls");
			
				List<Catridge> catridgeDTOMonthWise = null;
				try {
					catridgeDTOMonthWise = PrintData.viewmonthwise(branchId, startDate, endDate);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("MonthWiseDetails", catridgeDTOMonthWise);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Catridge/PrintCatridge1.jsp");
				requestDispatcher.forward(request, response);
	}
	else if(action.equals("Lotus_used")){	
		
		 String branch=request.getParameter("branch");
		 int branchId=Integer.parseInt(branch);
        String fromdate1=request.getParameter("fromdate");
        String todate1=request.getParameter("todate");
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
		response.setHeader("Content-Disposition", "attachment; filename=LotusUsedReport.xls");
	
		List<LotusNewins> lotusMonthWiseUsed = null;
		try {
			lotusMonthWiseUsed = PrintData.viewmonthwiseLotusUsed(branchId, startDate, endDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("MonthWiseLotusUsed", lotusMonthWiseUsed);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("LotusAndNewins/PrintLotusUsed.jsp");
		requestDispatcher.forward(request, response);
 }
	
	else if(action.equals("Newins_used")){	
		
		 String branch=request.getParameter("branch");
		 int branchId=Integer.parseInt(branch);
         String fromdate1=request.getParameter("fromdate");
         String todate1=request.getParameter("todate");
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
		response.setHeader("Content-Disposition", "attachment; filename=NewinsUsedReport.xls");
	
		List<LotusNewins> newinsMonthWiseUsed = null;
		try {
			newinsMonthWiseUsed = PrintData.viewmonthwiseNewinsUsed(branchId, startDate, endDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("newinsMonthWiseUsed", newinsMonthWiseUsed);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("LotusAndNewins/PrintNewinsUsed.jsp");
		requestDispatcher.forward(request, response);
  }
	else if(action.equals("sap_used")){	
		
		 String branch=request.getParameter("branch");
		 int branchId=Integer.parseInt(branch);
        String fromdate1=request.getParameter("fromdate");
        String todate1=request.getParameter("todate");
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
		response.setHeader("Content-Disposition", "attachment; filename=SapUsedReport.xls");
	
		List<LotusNewins> newinsMonthWiseUsed = null;
		try {
			newinsMonthWiseUsed = PrintData.viewmonthwiseSapUsed(branchId, startDate, endDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("SapMonthWiseUsed", newinsMonthWiseUsed);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("LotusAndNewins/PrintSapUsed.jsp");
		requestDispatcher.forward(request, response);
 }
	
	else if(action.equals("payment1")){	
		
		  String branch=request.getParameter("branch");
		  int branchId=Integer.parseInt(branch);
		  
          String fromdate1=request.getParameter("fromdate");
          String todate1=request.getParameter("todate");
	      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	      
	      String total1=request.getParameter("amount");
		  float total=Float.parseFloat(total1);
		  request.setAttribute("totalAmount", total);
		  
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
			response.setHeader("Content-Disposition", "attachment; filename=CartridgeReport.xls");
		
			List<Payment> paymetReport = null;
			try {
				paymetReport = PrintData.paymetReport(branchId, startDate, endDate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("paymetReportMonthWise", paymetReport);
			
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProcurementPayment/PrintPaymentReport.jsp");
			requestDispatcher.forward(request, response);
  }
	else if(action.equals("catridge2")){	
		
				 String branch=request.getParameter("branch");
				 int branchId=Integer.parseInt(branch);
		         String fromdate1=request.getParameter("fromdate");
		         String todate1=request.getParameter("todate");
		         String toadd=request.getParameter("toadd");
		         String fromEmail=request.getParameter("fromemail");
		         
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
				
				int result = 0;
				try {
					result = PrintData.ViewBranchWise(branchId, startDate, endDate ,toadd,fromEmail);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String  msg="Mail not successfully sent";
				 if(result != 0){
				     msg="Mail successfully sent to: "+toadd;
				 }
				
			    response.sendRedirect("Catridge/ViewCateridge.jsp?branch="+branchId+"&fromdate="+fromdate1+"&todate="+todate1+"&msg="+msg);			
    }	
	else if(action.equals("ispoutage")){	
		
			  String circuitid=request.getParameter("circuitid");
	          String fromdate1=request.getParameter("fromdate");
	          String todate1=request.getParameter("todate");
          
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
			response.setHeader("Content-Disposition", "attachment; filename=IspOutageReport.xls");
			
			
			List<IspOutage> ispOutageDTOs = null;
			try {
				ispOutageDTOs = PrintData.viewIspOutage(circuitid, startDate, endDate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("ispOutageDetails", ispOutageDTOs);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("CircuitId/printIO.jsp");
				requestDispatcher.forward(request, response);
	   }
	else if(action.equals("ispoutage1")){	
		
			   String circuitid=request.getParameter("circuitid");
	           String fromdate1=request.getParameter("fromdate");
	           String todate1=request.getParameter("todate");
	           String toadd=request.getParameter("toadd");
	           String fromEmail=request.getParameter("fromemail");
        
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
			
			int result = 0;
			try {
				result = PrintData.viewIspOutage1(circuitid, startDate, endDate ,toadd,fromEmail);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String  msg="Mail not successfully sent";
			 if(result != 0){
			     msg="Mail successfully sent to: "+toadd;
			 }
			   response.sendRedirect("CircuitId/ViewIspOutage.jsp?circuitid="+circuitid+"&fromdate="+fromdate1+"&todate="+todate1+"&msg="+msg);
				
	   }
	
	else if(action.equals("photoCopier")){	
		
		  String Edit=request.getParameter("Edit");
		  int edit=Integer.parseInt(Edit);
		   
		   
		  String branch=request.getParameter("branch");
		  int branchno=Integer.parseInt(branch);
          
          String fromdate1=request.getParameter("fromdate");
          String todate1=request.getParameter("todate");
                    
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
			
			
			    List<PhotoCopier> photocopier1 = null;
			    List<PhotoCopier>	photocopier2 = null;
			    List<PhotoCopier>	photocopier3 = null;
				try {
					photocopier1 = PrintData.viewphotoCopier1(branchno,startDate,endDate);
					photocopier2 = PrintData.viewphotoCopier2();
					photocopier3 = PrintData.viewsum(branchno,startDate,endDate);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					
					e.printStackTrace();
				}
				request.setAttribute("photocopier1", photocopier1);
				request.setAttribute("photocopier2", photocopier2);
				request.setAttribute("photocopier3", photocopier3);
				
				if(edit == 1){
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("PhotoCopier/ViewMonthWise.jsp");
					requestDispatcher.forward(request, response);
				}
				else{
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("PhotoCopier/ViewMonthWise1.jsp");
					requestDispatcher.forward(request, response);
				}
				
	   }
	else if(action.equals("PhotoCopierExcel")){	
		
			  String branch=request.getParameter("branch");
			  int branchno=Integer.parseInt(branch);
	          String fromdate1=request.getParameter("fromdate");
	          String todate1=request.getParameter("todate");
	          
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
			response.setHeader("Content-Disposition", "attachment; filename=PhotoCopierReport.xls");
			
			    List<PhotoCopier> photocopier1 = null;
			    List<PhotoCopier>	photocopier2 = null;
			    List<PhotoCopier>	photocopier3 = null;
				try {
					photocopier1 = PrintData.viewphotoCopier1(branchno,startDate,endDate);
					photocopier2 = PrintData.viewphotoCopier2();
					photocopier3 = PrintData.viewsum(branchno,startDate,endDate);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("photocopier1", photocopier1);
				request.setAttribute("photocopier2", photocopier2);
				request.setAttribute("photocopier3", photocopier3);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("PhotoCopier/ViewMonthWisereport.jsp");
				requestDispatcher.forward(request, response);
	   }
	if(action.equals("consumption")){	
			   String branch=request.getParameter("branch");
			   int branchId=Integer.parseInt(branch);
	           String fromdate1=request.getParameter("fromdate");
	           String todate1=request.getParameter("todate");
	           String type=request.getParameter("type");
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
			response.setHeader("Content-Disposition", "attachment; filename=ConsumptionReport.xls");
			
			
				List<Consumption> consumption = null;
				List<Consumption> consumption1 = null;
				try {
					consumption = PrintData.viewBranchWiseConsumptionReport(branchId, startDate, endDate,type);
					consumption1 = PrintData.viewBranchWiseConsumptionReport1(branchId, startDate, endDate,type);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("consumption", consumption);
				request.setAttribute("consumption1", consumption1);
			
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Consumption/PrintConsumptionReport.jsp");
				requestDispatcher.forward(request, response);
	}
	if(action.equals("consumption1")){	
		
		     String branch=request.getParameter("branch");
		     int branchId=Integer.parseInt(branch);
             String fromdate1=request.getParameter("fromdate");
             String todate1=request.getParameter("todate");
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
			response.setHeader("Content-Disposition", "attachment; filename=ConsumptionReport.xls");
			
			
				List<Consumption> consumption1 = null;
				
				try {
					consumption1 = PrintData.viewBranchWiseConsumptionReport2(branchId, startDate, endDate);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("consumption1", consumption1);
			
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Consumption/PrintConsumptionReport1.jsp");
				requestDispatcher.forward(request, response);
	}
	if(action.equals("consumption2")){
		
			   String branch=request.getParameter("branch");
			   int branchId=Integer.parseInt(branch);
	           String fromdate1=request.getParameter("fromdate");
	           String todate1=request.getParameter("todate");
	           String toadd=request.getParameter("toadd");
	           String type=request.getParameter("type");
	           String fromEmail=request.getParameter("fromemail");
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
			
			int result = 0;
			try {
				result = PrintData.viewBranchWiseConReport(branchId, startDate, endDate ,toadd,fromEmail,type);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 String  msg="Mail not successfully sent";
			 if(result != 0){
			     msg="Mail successfully sent to: "+toadd;
			 }
		     response.sendRedirect("Consumption/ViewConsumption.jsp?branch="+branchId+"&fromdate="+fromdate1+"&todate="+todate1+"&type="+type+"&msg="+msg);
				
	   }
	else if(action.equals("PhotoCopierExcelSendEmail")){	
		
		     String branch=request.getParameter("branch");
		     int branchno=Integer.parseInt(branch);
             String fromdate1=request.getParameter("fromdate");
             String todate1=request.getParameter("todate");
             String toadd=request.getParameter("toadd");
             String fromEmail=request.getParameter("fromemail");
      
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
			
			    int result = 2;
				try {
					result = PrintData.viewphotoCopierForEmail(branchno,startDate,endDate,toadd,fromEmail);
				  } catch (SQLException e) {
					   // TODO Auto-generated catch block
					   e.printStackTrace();
				    }
				     String  msg="Mail not successfully sent";
					 if(result != 0){
					     msg="Mail successfully sent to: "+toadd;
					 }
				  response.sendRedirect("callForReport?Edit=0&view=photoCopier&branch="+branchno+"&fromdate="+fromdate1+"&todate="+todate1+"&msg="+msg);				
	        }
	else if(action.equals("mplsreport")){	
		
			     String circuitid="Select";
				 String branch=request.getParameter("branch");
				 int branchNo=Integer.parseInt(branch);
		         String fromdate1=request.getParameter("fromdate");
		         String todate1=request.getParameter("todate");
			     SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			     Date startDate = null;
	    
				try {
					startDate = dateFormat.parse(fromdate1);
				} 
				catch (ParseException e) {
					
					e.printStackTrace();
				}
				Date endDate =  null;
				
				try {
					endDate = dateFormat.parse(todate1);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				
			    response.setContentType("application/vnd.ms-excel");
			    response.setHeader("Content-Disposition", "attachment; filename=MplsReport.xls");
			
				List<Mpls> mplsDto = null;
				try {
					mplsDto = PrintData.MplsReport(branchNo, startDate, endDate,circuitid);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				List<Mpls> branchTotal = null;
				try {
					branchTotal = PrintData.branchTotal(branchNo, startDate, endDate,circuitid);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("mpls", mplsDto);
				request.setAttribute("branchTotal", branchTotal);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Mpls/PrintMpls.jsp");
				requestDispatcher.forward(request, response);
			
     }	     
	else if(action.equals("mplsreport1")){	
		
		           String circuitid=request.getParameter("circuitid");
				   String branch=request.getParameter("branchNo");
				   int branchNo=Integer.parseInt(branch);
				 
		           String fromdate1=request.getParameter("fromdate");
		           String todate1=request.getParameter("todate");
		         
		           HttpSession httpSession = request.getSession();
			       httpSession.setAttribute("branchNo", branchNo);
				   httpSession.setAttribute("fromdate", fromdate1);
				   httpSession.setAttribute("todate", todate1);
				   httpSession.setAttribute("circuitid", circuitid);
		         
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
					 
					List<Mpls> mplsDto = null;
					try {
						mplsDto = PrintData.MplsReport(branchNo, startDate, endDate,circuitid);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					List<Mpls> branchTotal = null;
					try {
						branchTotal = PrintData.branchTotal(branchNo, startDate, endDate,circuitid);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					request.setAttribute("mpls", mplsDto);
					request.setAttribute("branchTotal", branchTotal);
					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("Mpls/ViewMpls.jsp");
					requestDispatcher.forward(request, response);
					
	       }
	     else{
               System.out.println("nothing match here....");
            }
	
	   }
}
