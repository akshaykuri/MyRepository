package CON2;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperRunManager;
import CON2.Connection2;

public class CheckSheetHO extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	   static final long serialVersionUID = 1L;
	   
	   
	   Connection conn = null;
		 byte[] bytes = null;
	   
	    /* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#HttpServlet()
		 */
		public CheckSheetHO() {
			super();
		}   	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		}  	
		
		/* (non-Java-doc)
		 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			
			
			String req = request.getParameter("aabbcc");
			
			//Map param = new Map();
			Map map = new HashMap();
			map.put("cs_id", req);
			
	        ServletOutputStream servletOutputStream = response.getOutputStream();
			
			File fileReport = new File(getServletConfig().getServletContext().getRealPath("/JRXML/CheckSh1.jasper"));
			//File reportFilejrxml = new File(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/MultiplePo.jrxml"));

			
			 try{
				 
				
				 Connection2 dbConn = new Connection2();
				 		
				 		conn = dbConn.getConnection2();
				 		System.out.println("Create conn running jasper");
				 		
				 		 bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
				 		 
				 		 
				 		/* System.out.println("run jasper");
				 		response.setContentType("application/pdf");

		                response.setContentLength(bytes.length);
		    

	                          System.out.println("Before servlet output");

		                servletOutputStream.write(bytes, 0, bytes.length);*/
				 		 
				 		 
				 PostMail postMail =  new PostMail();
				 
				 
			//	 postMail.postMailAttachedFile(m_from, m_pass, m_to, m_subject, m_body, bytes);
			//	 postMail.postMailAttachedFile("CSSOFT@nittsu.co.in","pass1234","farooqsha27@gmail.com","Check sheet Mail","BOdy",bytes);              


				 		 
				 		 
				 		 
				 		 
				 						 		
				 		
				 		
				 
			 }
			 catch (Exception e) {
				// TODO: handle exception
				 
				 e.printStackTrace();
			}
			 
			 finally{
					DbUtil.closeDBResources(null,null,conn);
				    servletOutputStream.flush();

				   // out.close();
		            servletOutputStream.close();
			 }
			 
			 
		}   	  	    
	}
