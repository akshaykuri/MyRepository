<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%-- <%@ include file="getcon.jsp"%> --%>

 <%
 //System.out.println(" in updateeeeeeeeeee pageeeeeeee");
 
 int i2=0;
 Statement st=null,st1=null,st2=null;
 Connection cn=null;
 ResultSet rs=null;
 String url = "jdbc:mysql://localhost:3306/";
 String dbName = "csdb";
 String driver = "com.mysql.jdbc.Driver";
 String userName = "root";
 String password = "";
 
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 cn=DriverManager.getConnection(url+dbName,userName,password);

 st=cn.createStatement();
 st1=cn.createStatement();
 st2=cn.createStatement();
 PreparedStatement prds3=null;
 try
 {
	 int k=0;
	 String emp_no=(String)session.getAttribute("emp_no");
	// System.out.println("empiddd========"+emp_no);
	 String id="";
	 String Sname="";
     String Licenseno="";
     String PoNum="";
     String PoDate="";
     String Vname="";
     String IP="";
     String Cperson="";
     String Cnum="";
     String Branch="";
     String SubBranch="";
     String Afrom="";
     String Ato="";
     String Aexp="";
     String Aamt="";
     String Ltype="";
     String Vnameo="";
     String user="";
     String Ip1="";
     String path="";
     String Nusers="";
     
     String AssetNum="";
     
     String []fileName=null;
     
    /*  ArrayList<String> userList;
     userList = new ArrayList<String>();
     
     ArrayList<String> ipList;
     ipL ist = new ArrayList<String>();*/
     ArrayList<String> file = new ArrayList<String>();
     ArrayList<String> filenameList;
     filenameList = new ArrayList<String>();
     
 //String ImageFile="";
 String itemName ="";
 String msg=null;
 
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart)
 {	 //System.out.println("empiddd========ifffffffffffffffffff");

 }
 else
 {
 FileItemFactory factory = new DiskFileItemFactory();
 ServletFileUpload upload = new ServletFileUpload(factory);
 List items = null;
 try
 {
 items = upload.parseRequest(request);
 }
 catch (FileUploadException e)
 {
 e.getMessage();
 }
  
 Iterator itr = items.iterator();
 while (itr.hasNext())
 {
 FileItem item = (FileItem) itr.next();
 if (item.isFormField())
 {
 String name = item.getFieldName();
 String value = item.getString();
 
 if(name.equals("sid"))
 {
	 id=value;
	 //System.out.println("software name1===="+Sname);
 }
 if(name.equals("assetno"))
 {
	 AssetNum=value;
	 //System.out.println("software name1===="+Sname);
 }
 if(name.equals("pono"))
 {
	 PoNum=value;
	 //System.out.println("software name1===="+Sname);
 }

 
 if(name.equals("vender")) 
 {
	 Vname=value;
	 //System.out.println("vender name try====5"+Vname);
 }

 if(name.equals("city"))
 {
	 Branch=value;
	 //System.out.println("branch name try====9"+Branch);
 }
 if(name.equals("Subcity"))
 {
	 SubBranch=value;
	// System.out.println("lsub branch name try==10=="+SubBranch);
 }
 if(name.equals("afm"))
 {
	 Afrom=value;
	//System.out.println("amc from try===11="+Afrom);
 }
 if(name.equals("ato"))
 {
	 Ato=value;
	// System.out.println("amc to try==12=="+Ato);
 }
 if(name.equals("aexp"))
 {
	 Aexp=value;
	// System.out.println("amc expiry try==13=="+Aexp);
 }
 if(name.equals("aamt"))
 {
	 Aamt=value;
	 //System.out.println("amc amount try===14="+Aamt);
 }

 
  
 if(name.equals("invoice1"))
 {
	 filenameList.add(value);
 //System.out.println("file  try==16=="+filenameList);
 }
 

  
 }
 else
 {
 try
 {
 itemName = item.getName();
 filenameList.add(itemName);
 File savedFile = new File("D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+AssetNum);
 path="D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+AssetNum;
 System.out.println("itemName   :::"+itemName);
 if(!savedFile.exists()) 
 {
 savedFile.mkdirs();//The constructor File(File) is undefined
  savedFile.setWritable(true);
 // System.out.println("set Writable");
	 }
File  insertFile = new File("D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+AssetNum+"/"+itemName);
item.write(insertFile);

 }
 catch (Exception e)
 {
 out.println("Error"+e.getMessage());
 }
 }
 }
 try
 {
	 //System.out.println("aaaaaaa :::"+AssetNum);
	if(itemName=="")
	{	 
		//System.out.println("iffffffffff");
	  st1=cn.createStatement();
	int	 i=st1.executeUpdate("update hardware_amc_nonit set branch='"+Branch+"',sub_branch='"+SubBranch+"',amc_from_date='"+Afrom+"',amc_to_date='"+Ato+"',amc_exp_date='"+Aexp+"',amc_amount='"+Aamt+"' where hw_id_Nit='"+id+"'");
		
	}
	else{
		//System.out.println("elseeeeeeeee");
		st1=cn.createStatement();
		int	 i=st1.executeUpdate("update hardware_amc_nonit set branch='"+Branch+"',sub_branch='"+SubBranch+"',amc_from_date='"+Afrom+"',amc_to_date='"+Ato+"',amc_exp_date='"+Aexp+"',amc_amount='"+Aamt+"' where hw_id_Nit='"+id+"'");
			
	 /* 
	  
	  if(fileName != null)
	  {
	 
			String []itemss;
			
			for(int p=0;p<fileName.length;p++)
				{
				   // System.out.println("FILE NAME "+fileName[p]);
				
						InputStream ins = getServletContext().getResourceAsStream(fileName[k]);
						if(ins != null)
						{
							System.out.println("ins value "+ins);
						}
					
					
				}
	  } */
	  String query4=null;
	//  System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvoooooooooo1111111111111");
	  
	  for(int m=0;m<filenameList.size();m++)
	  {
		// System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvoooooooooo");
		  query4="insert into hardware_nonit_invoice(Asset_no,amc_po,hnit_invoice) values('"+AssetNum+"','"+PoNum+"','D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+AssetNum+"/"+filenameList.get(m)+"')";
		  st2.executeUpdate(query4);
	  }
	
	}
 }
 catch(Exception el)
 {
 out.println("Inserting error"+el.getMessage());
 }
 }
 msg = "Hardware__details__added__Successfully";
 response.sendRedirect("ViewPage.jsp?assetno="+AssetNum+"&fromdate="+Afrom+"&todate="+Ato+"&pono="+PoNum);
   /* if(k!=0){
    msg = "software__details__added__Successfully";
 response.sendRedirect("Software.jsp?msg=" +msg);
 }
 else
 {
	  msg = "software__details__not__inserted...";
	  response.sendRedirect("Software.jsp?msg=" +msg); 
 }   */
 }
 
 catch (Exception e){
 out.println(e.getMessage());
 }


	%>

