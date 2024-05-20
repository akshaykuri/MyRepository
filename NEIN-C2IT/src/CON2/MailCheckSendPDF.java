package CON2;

import java.io.File;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

//import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;

import net.sf.jasperreports.engine.JasperRunManager;

public class MailCheckSendPDF {

	
	public byte[] getPDFattachment(String csId)
	{
		//File fileReport = new File("");
		
		Connection conn = null;
	    byte[] bytes=null;
		String cs_id;
		System.out.println("CS IDD from mail check send pdf : "+csId);
		Map map = new HashMap();
		map.put("cs_id",csId);
		
      // ServletOutputStream servletOutputStream = response.getOutputStream();
		
		File fileReport = new File("C:/workspace/CheckSheet/JRXML/CheckSh1.jasper");
		//File reportFilejrxml = new File(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/MultiplePo.jrxml"));
        
		 
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
}
	
