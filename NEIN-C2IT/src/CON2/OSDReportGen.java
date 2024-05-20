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
import javax.servlet.annotation.WebServlet;


//@WebServlet("/OSDReportGen")
public class OSDReportGen extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet{
    static final long serialVersionUID = 1L;
    Connection conn = null;
	 byte[] bytes = null;  
    public OSDReportGen() {
        super();
    }
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
        {
		String req = request.getParameter("formNo");
		Map map = new HashMap();
		map.put("formNo", req);
	    ServletOutputStream servletOutputStream = response.getOutputStream();
		File fileReport = new File(getServletConfig().getServletContext().getRealPath("/JRXML/OutstandingReport.jasper"));
	    try{
	    	        Connection2 dbConn = new Connection2();
			 		conn = dbConn.getConnection2();
			 		System.out.println("Create conn running jasper...");
			 		System.out.println("POParameterNormal.jasper");
			 		System.out.println("file location :"+fileReport);
			 		bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
				    System.out.println("222");
			 	    System.out.println("run jasper");
			 		response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
	                System.out.println("Before servlet output");
                    servletOutputStream.write(bytes, 0, bytes.length);
         }
		 catch (Exception e) {
	 		 e.printStackTrace();
	    	}
		 finally{
		    servletOutputStream.flush();
            servletOutputStream.close();
		    }
  	}   	  	    
}
