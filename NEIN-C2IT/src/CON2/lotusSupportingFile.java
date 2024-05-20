package CON2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class lotusSupportingFile
 */
//@WebServlet("/lotusSupportingFile")
public class lotusSupportingFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lotusSupportingFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Form_no = null,sessionUser =null;
		System.out.println("before lotusDAO ----------------------------------------------- ");
		lotusDAO LD = new lotusDAO();
        ServletContext contxt = request.getServletContext();
		System.out.println("UPLOADed contxt ----------------------------------------------- "+contxt);
		String UPLOAD_SUPPORTING_FILES = contxt.getInitParameter("UPLOAD_SUPPORTING_FILES_LOTUS");
		
		
		System.out.println("UPLOADed file ----------------------------------------------- "+UPLOAD_SUPPORTING_FILES);
		List<String> ListOfFileName = new ArrayList<String>();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			
			//Create a factory for disk based file items
			FileItemFactory factory = new DiskFileItemFactory();
			
			//Create the new file  upload handler
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			try {
				List<FileItem> multiparts = upload.parseRequest(request);
				for(FileItem item : multiparts)
				{
					if(!item.isFormField()){
						
					ListOfFileName.add(item.getName());
					
					System.out.println("FILE NAME    "+item.getName());
						
						
					}
					// Other than Files Additional form data are 
					else{
					
						if(item.getFieldName().equals("form_no")){
							Form_no = item.getString();
							LD.setFile_name(Form_no);
							
							System.out.println("form_no Lotus{}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}--------------------------------------------------------------------------------------------  "+item.getString());
						  }
						
						if(item.getFieldName().equals("SessionName")){
							sessionUser = item.getString();
							
							System.out.println("Session name=================================" + item.getString());
							
						  }
					
						
					}	
				}
				
				
				new formSupportingFileQueries().FileUploadLotus(multiparts , UPLOAD_SUPPORTING_FILES , Form_no ,sessionUser);
				String msg="Uploaded__Lotus__Supporting__file__Successfully";
				//request.getRequestDispatcher("NIPPON/Quotation/MRSupportingFile.jsp?msg="+msg).forward(request, response);
				response.sendRedirect("LOTUS/FormApproval/PopupLink/SupportingFile.jsp?msg=" +msg);
			}catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}*/

}
