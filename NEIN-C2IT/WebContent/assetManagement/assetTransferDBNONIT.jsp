<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
 
<%@page import="org.apache.commons.csv.CSVFormat" %>
<%@page import="org.apache.commons.csv.CSVParser" %>
<%@page import="org.apache.commons.csv.CSVPrinter" %>
<%@page import="org.apache.commons.csv.CSVRecord" %>
		
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>



<script type="text/javascript">


if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>
<body>
<%
String transby=(String)session.getAttribute("Nname");
Date date = new Date();
// display formatted date

SimpleDateFormat ft = new SimpleDateFormat ("dd-MMM-YYYY");
//System.out.printf("%s %td-%<tb-%<tY", "date:", date);

String str = ft.format(date);
// System.out.printf("date:", str);


String id=request.getParameter("str");
System.out.println("new id :"+id);
String[] temp;
temp = id.split(",");
String inv=temp[0];
String asno=temp[1];
String at=temp[2];
String bran=temp[4];
String war=temp[5];
//String user=temp[8];
String useoff=temp[12];
String empnm=temp[10];
String emploc=temp[11];
String nbran=temp[13];
String per=temp[14];
String approved=temp[15];

//String sub=asno.substring(0,8);

//System.out.println("inv :"+inv);
//System.out.println("Asset no :"+asno);
//System.out.println("Asset type :"+at);
//System.out.println("From branch :"+bran);
//System.out.println("Waranty :"+war);
//System.out.println("To Branch :"+nbran);
//System.out.println("Purpus :"+per);
//System.out.println("Approved by :"+approved);

int i=0,j=0,j1=0,j11=0,i1=0;  

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = null;
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");
PreparedStatement prs1=null,prs3=null,prs4=null,prs2=null,prs21=null,prs5=null,prs51=null,prs55=null,prs31=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs31=null,rs4=null,rs41=null,rs45=null;
Statement st=null,st1=null,st11=null,st111=null,st1111=null;
Integer id1,incre1=0,incre5=0;
String rde2=null,rde3=null,serialnum=null;
Integer rde1=null;




///////////////////////////////

 

        try
        {
        	 prs1 = conn.prepareStatement("select m_b_no from branch_master_main where m_b_name='"+nbran+"'");
        	  rs = prs1.executeQuery();
        	  if (rs.next())
        	      {
        		  rde2 = rs.getString("m_b_no");
        	      //System.out.println("new branch code :" + rde2);
        	      }
        	prs5 = conn.prepareStatement("select ConfigField , serial_no from asset_item where Asset_No='"+asno+"' and AssetType='"+at+"'");
        	rs4 = prs5.executeQuery();
        	
        	if (rs4.next())
        	    {
        		rde3 = rs4.getString("ConfigField");
        		serialnum=rs4.getString("serial_no");
        	    //System.out.println("config :" + rde3);
        	    }
        prs51 = conn.prepareStatement("select * from asset_trans where New_Asset_No='"+asno+"' and  AssetType='"+at+"' && curAID='1'");
        rs41 = prs51.executeQuery();
        if (rs41.next())
        	    {
        	    st111=conn.createStatement();
	            j11=st111.executeUpdate("update asset_trans set curAID='0' where New_Asset_No='"+asno+"' && curAID='1' && AssetType='"+at+"'");
  	      	    }
        prs3 = conn.prepareStatement("insert into asset_trans(Inventory_No,AssetType,New_Asset_No,Branch,fromUser,NewBranch,WarExpDate,ConfigField,dateOfTrans,transBy,approvedby,purpus,curAID,serial_no) values(?,?,?,?,?,?,?,?,?,?,?,?,'1',?)");
        prs3.setString(1, inv);
        prs3.setString(2, at);
        prs3.setString(3, asno);
        prs3.setString(4, bran);
        prs3.setString(5, empnm);
        prs3.setString(6, nbran);
        prs3.setString(7, war);
        prs3.setString(8, rde3);
        prs3.setString(9, str);
        prs3.setString(10, transby);
        prs3.setString(11, approved);
        prs3.setString(12, per);
        prs3.setString(13, serialnum);
        
        
       
        i=prs3.executeUpdate();
        //idextend,Inventory_No,Asset_No,AssetType,Branch,Waranty,WarExpDate,EmpId,assignStatus,Scrap,Maintanance,Assignedfor,assignedbraemp,Remarks
        st1=conn.createStatement();
   	    j=st1.executeUpdate("update asset_item set Branch='"+rde2+"',BranchName='"+nbran+"',EmpId='NULL',assignStatus='0',Assignedfor='NULL',assignedbraemp='NULL' where Asset_No='"+asno+"' and AssetType='"+at+"'");
     
   	    if(useoff.equals("USER"))
   	         {
   	         st11=conn.createStatement();
	         j1=st11.executeUpdate("update assignotherassetemp set atype='', ano='', asdoi='', aconf='', asremarks='', statusIT='0' where ano='"+asno+"'"); 
   	         }
   	    else
   	         {
	         st11=conn.createStatement();
 	         j1=st11.executeUpdate("update assignassetoffice set assignStatus='0' where AssetNo='"+asno+"'");
   	         }
      
   	    
    ////////////////////////////////////// FILE UPLOADE //////////////////////////////////////
   	    int maxsr=0;
		prs55 = conn.prepareStatement("select max(srno) as    no from asset_trans ");
    	rs45 = prs55.executeQuery();
    	if (rs45.next())
    	    {
    		 maxsr = rs45.getInt("no");
    	   // System.out.println("MaxSr No :" + maxsr);
    	    }
    
    	String fileName = "";
   	    File file = null;
		//String msg=" Data_inserted_Sucessfully ... ";
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		ServletContext context = pageContext.getServletContext();
		String filePath = "E:\\neinSoft\\files\\C2IT\\UploadAssetTransfer\\";
		File attachment = new File(filePath + File.separator + maxsr);
		attachment.mkdirs();
		String filePath1 = "E:\\neinSoft\\files\\C2IT\\UploadAssetTransfer\\"+"\\"+maxsr+"\\";
		//System.out.println("File path1 :"+filePath1);
	    String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("c:\\temp"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxFileSize);
			try {
				// Parse the request to get file items.
				List fileItems = upload.parseRequest(request);
   		        // Process the uploaded file items
				Iterator i12 = fileItems.iterator();
    		    while (i12.hasNext()) {
					FileItem fi = (FileItem) i12.next();
					if (!fi.isFormField()) {
						// Get the uploaded file parameters
						String fieldName = fi.getFieldName();
						fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
		                if (fileName.lastIndexOf("\\") >= 0) {
							file = new File(filePath1
									+ fileName.substring(fileName
											.lastIndexOf("\\")));
						} else {
							file = new File(filePath1
									+ fileName.substring(fileName
											.lastIndexOf("\\") + 1));
						}
						fi.write(file);
						//System.out.println(file + ":" + file);
					}
				}
			} catch (Exception ex) {
				System.out.println(ex);
			}
	      }
	  else 
	      {
		  System.out.println("Else...........");
	      }
	 
	
		 st1111=conn.createStatement();
         i1=st1111.executeUpdate("update asset_trans set filepath='"+fileName+"' where 	srno='"+maxsr+"'");
	   
       //////////////////////////////////////  FILE UPLOADE  //////////////////////////////////////
	   
	  	    
    }catch(Exception e)
   {
   	System.out.println(e);
   }

 
       String msg="Asset -\b Transfer- \b Successfully";
	   response.sendRedirect("assetTransfer.jsp?msg=" +msg);
	
	   %>
</body>