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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/gatePassRep")
public class gatePassRep extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet{
    static final long serialVersionUID = 1L;
    Connection conn = null;
	 byte[] bytes = null;  
   
    public gatePassRep() {
        super();
        }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		File fileReport=null;
		String req = request.getParameter("passFormNo");
		String req1 = request.getParameter("RETURNABLE_NON");
		System.out.println("reqq1      ..."+req1);

		Map map = new HashMap();
		map.put("formno", req);
		
        ServletOutputStream servletOutputStream = response.getOutputStream();
	    if(req1.equals("RETURNABLE"))
		      fileReport = new File(getServletConfig().getServletContext().getRealPath("jrxml/gatepassMainPageReport.jasper"));
           else
		      fileReport = new File(getServletConfig().getServletContext().getRealPath("jrxml/gatepassMainPageReport1.jasper"));
		 try{
			 
			
			 		Connection2 dbConn = new Connection2();
			 		conn = dbConn.getConnection2();
			 		System.out.println("Create conn running jasper...");
			 		bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
				    System.out.println("run jasper");
			 		response.setContentType("application/pdf");

	                response.setContentLength(bytes.length);
	                servletOutputStream.write(bytes, 0, bytes.length);
    	 }
		 catch (Exception e) {
			// TODO: handle exception
			 
			 e.printStackTrace();
		}
		 
		 finally{
			 
			    servletOutputStream.flush();

			   // out.close();
	            servletOutputStream.close();
		 }
		 
		 
	}   	  	    

}
