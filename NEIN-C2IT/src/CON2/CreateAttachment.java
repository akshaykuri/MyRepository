package CON2;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperRunManager;

/**
 * Servlet implementation class CreateAttachment
 */
//@WebServlet("/CreateAttachment")
public class CreateAttachment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAttachment() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    public byte[] getPDFattachment(String csId)
	{
		//File fileReport = new File("");
		
		Connection conn = null;
	    
		String cs_id;
		System.out.println("CS IDD from mail check send pdf : "+csId);
		Map map = new HashMap();
		map.put("cs_id",csId);
		byte[] bytes=null;
      // ServletOutputStream servletOutputStream = response.getOutputStream();
		
		File fileReport = new File(getServletConfig().getServletContext().getRealPath("/JRXML/CheckSh1.jasper"));
	//	File reportFilejrxml = new File(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/MultiplePo.jrxml"));
        
		 
		 try{
			 
			
			 		Connection2 dbConn = new Connection2();
			 		
			 		conn = dbConn.getConnection2();
			 		System.out.println("Create conn running jasper");
			 		
			 		 bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
			 		 
		 	}
	
	catch(Exception e)
	{
		
		e.printStackTrace();
	}
	finally{
		DbUtil.closeDBResources(null,null,conn);
		
	}
	
	 return bytes;
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		

	}

}
