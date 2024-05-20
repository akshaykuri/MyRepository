package CON2;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import CON2.Connection2;
import CON2.DbUtil;

public class formSupportingFileQueries {

	
	public void FileUploadLotus(List<FileItem> multiparts,String  UPLOAD_DIRECTORY,String  Form_no ,String uploadedEmpId){
		System.out.println("FORM NO ****************** STRING : "+Form_no);
		String[] parts = Form_no.split("Lotus/");//NEIN/MR/90-
		String part1 = parts[0]; // 004
		String MrIdDir = parts[1]; // 034556
		
		
		System.out.println("FORM NO ****************** STRING : "+MrIdDir);
		
	//String	MrIdDir = "-"+MrId;  
			
		File directory = new File(UPLOAD_DIRECTORY+"/"+MrIdDir);
		if(!directory.exists())
		{
			directory.mkdir();
			UPLOAD_DIRECTORY =  UPLOAD_DIRECTORY+ "/" + directory.getName();
		}else{
			UPLOAD_DIRECTORY =  UPLOAD_DIRECTORY+ "/" + MrIdDir;
		}
		
		System.out.println("CALLING FILE UPLOAD " + Form_no +" UPLOAD_DIRECTORY  "+ UPLOAD_DIRECTORY + " MrIdDir " + MrIdDir + " directory  " + directory);
		for(FileItem item : multiparts)
		{
			if(!item.isFormField()){
				
				String name = item.getName();
				
		
				try {
					File f = new File(UPLOAD_DIRECTORY + "/" + name);
					item.write(f);
					
					
					double fSize = f.length();
					double fSizeInKiloBytes = (fSize / 1024);
					
					insertFileAttachmentDetails(Form_no, name ,UPLOAD_DIRECTORY + "/" + name ,fSizeInKiloBytes , uploadedEmpId );
				
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
				
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public void insertFileAttachmentDetails(String Form_no,String Filename,String filePath ,Double fSizeInKiloBytes , String uploadedEmpId ){
		
		
		Connection con = new Connection2().getConnection2();
		PreparedStatement statement = null;
		ResultSet rs=null;

		

		
		String saveFileDetails = "INSERT INTO `file_supporting_upload` " +
				" ( `form_no`, `file_name`, `file_path`, `file_size`, `uploaded_by`) " +
				"  VALUES ( ? , ? , ? , ? , ? )";
		
		System.out.println("SAVING FILE TO DB Form_no----------------------"+  Form_no);
		System.out.println("SAVING FILE TO DB Filename----------------------"+  Filename);
		try {
			
		
			DecimalFormat df = new DecimalFormat("#.##");
			String dx=df.format(fSizeInKiloBytes);
			fSizeInKiloBytes = Double.valueOf(dx);
			
			
			statement = con.prepareStatement(saveFileDetails);
			statement.setString(1, Form_no);
			statement.setString(2, Filename);
			statement.setString(3, filePath);
			statement.setDouble(4, fSizeInKiloBytes);
			statement.setString(5, uploadedEmpId);
			
			statement.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}		
		finally{
			DbUtil.closeDBResources(rs, statement, con);
		}
	 }
}
