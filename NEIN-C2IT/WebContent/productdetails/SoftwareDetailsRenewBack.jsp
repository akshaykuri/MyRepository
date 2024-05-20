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
<%@ page import = "java.util.ResourceBundle" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%-- <%@ include file="getcon.jsp"%> --%>

 <%
 Statement st=null,st1=null,st2=null;
 Connection cn=null;
 ResultSet rs=null;

 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
 String userName = dbProperties.getString("csdb.username");
 String password = dbProperties.getString("csdb.password");
 String url = dbProperties.getString("csdb.url");
 String driver = dbProperties.getString("csdb.driverName");
 String dbName = dbProperties.getString("csdb.dbName");

 Class.forName(driver).newInstance();
 cn= DriverManager.getConnection(url+dbName,userName,password);

 st=cn.createStatement();
 st1=cn.createStatement();
 st2=cn.createStatement();
 
 try
 {
	 int k=0;
	 String emp_no="";
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
     String Nusers="";
     String AmcPoNum="";
     String AmcPoDate="";
     String AmcVender="";
     String AmcCperson="";
     String AmcCnum="";
     
     String []fileName=null;
      
     ArrayList<String> filenameList;
     filenameList = new ArrayList<String>();
     
 //String ImageFile="";
 String itemName ="";
 String msg=null;
 
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart)
 {
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
 
 if(name.equals("initiator"))
 {
	 emp_no=value;
	 System.out.println("initiator name===="+emp_no);
 }
 
 if(name.equals("software"))
 {
	 Sname=value;
	 System.out.println("software name1===="+Sname);
 }
 if(name.equals("sno"))
 {
	 Licenseno=value;
	 System.out.println("lincenseee in try=2==="+Licenseno);
 }
 
 if(name.equals("ip"))
 {
	 IP=value;
	 //System.out.println("ip  try===6="+IP);
 }
 
 if(name.equals("ponum"))
 {
	 PoNum=value;
	 //System.out.println("po number==3=="+PoNum);
 }
 if(name.equals("pdate"))
 {
	 PoDate=value;
	 //System.out.println("po date try===4="+PoDate);
 }
 if(name.equals("vname")) 
 {
	 Vname=value;
	// System.out.println("vender name try====5"+Vname);
 }

 
 if(name.equals("cperson"))
 {
	 Cperson=value;
	// System.out.println("contact person try==7=="+Cperson);
 }
 if(name.equals("vnum"))
 {
	 Cnum=value;
	// System.out.println("contact number try===8="+Cnum);
 }
 
 if(name.equals("aponum"))
 {
	 AmcPoNum=value;
	// System.out.println("po number==3=="+AmcPoNum);
 }
 if(name.equals("apdate"))
 {
	 AmcPoDate=value;
	// System.out.println("po date try===4="+AmcPoDate);
 }
 if(name.equals("avname")) 
 {
	 AmcVender=value;
	 //System.out.println("vender name try====5"+AmcVender);
 }

 
 if(name.equals("acperson"))
 {
	 AmcCperson=value;
	//System.out.println("contact person try==7=="+AmcCperson);
 }
 if(name.equals("avnum"))
 {
	 AmcCnum=value;
	//System.out.println("contact number try===8="+AmcCnum);
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
 if(name.equals("amc1"))
 {
	 Afrom=value;
	// System.out.println("amc from try===11="+Afrom);
 }
 if(name.equals("amc2"))
 {
	 Ato=value;
	// System.out.println("amc to try==12=="+Ato);
 }
 if(name.equals("amc3"))
 {
	 Aexp=value;
	// System.out.println("amc expiry try==13=="+Aexp);
 }
 if(name.equals("amcamt"))
 {
	 Aamt=value;
	 //System.out.println("amc amount try===14="+Aamt);
 }
 if(name.equals("licensetype"))
 {
	 Ltype=value;
	// System.out.println("license type try==15=="+Ltype);
 }
 
 if(name.equals("nouser"))
 {
	 Nusers=value;
	// System.out.println("license type try==15=="+Nusers);
 }
 
 if(name.equals("invoice"))
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
 File savedFile = new File("D:/neinSoft/files/C2IT/ProductDetails/Software/AMCInvoice/"+Licenseno);
 
 if(!savedFile.exists()) 
 {
 savedFile.mkdirs();//The constructor File(File) is undefined
  savedFile.setWritable(true);
 // System.out.println("set Writable");
	 }
File  insertFile = new File("D:/neinSoft/files/C2IT/ProductDetails/Software/AMCInvoice/"+Licenseno+"/"+itemName);
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
	 
	 System.out.println("vender name --------"+Vname);
	 //System.out.println("vender name o--------"+Vnameo);
	 
  String query1 = "select max(sw_id) from software_details";
	 
		rs = st.executeQuery(query1);
		int id=0;
  if(rs.next()){
	   id=rs.getInt(1);  
	   id=id+1;
    }
  String query2=null;
  String query3=null;
    
		  
  query2="insert into software_details(sw_index,initiator_empid,software_name,license_no,IP_address,po_number,purchase_date,vender,contact_person,contact_no,amc_po,amc_podate,amc_vender,amc_contactperson,amc_contactnum,branch,sub_branch,AMC_from_date,AMC_to_date,AMC_expiry,AMC_amount,license_type,No_of_users,status) values('"+id+"','"+emp_no+"','"+Sname+"','"+Licenseno+"','"+IP+"','"+PoNum+"','"+PoDate+"','"+Vname+"','"+Cperson+"','"+Cnum+"','"+AmcPoNum+"','"+AmcPoDate+"','"+AmcVender+"','"+AmcCperson+"','"+AmcCnum+"','"+Branch+"','"+SubBranch+"','"+Afrom+"','"+Ato+"','"+Aexp+"','"+Aamt+"','"+Ltype+"','"+Nusers+"','Active')";
  st.executeUpdate(query2);

  if(fileName != null)
  {
 
		String []itemss;
		
		for(int p=0;p<fileName.length;p++)
			{
			    System.out.println("FILE NAME "+fileName[p]);
			
					InputStream ins = getServletContext().getResourceAsStream(fileName[k]);
					if(ins != null)
					{
						System.out.println("ins value "+ins);
					}
				
				
			}
  }
  String query4=null;
 // System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvoooooooooo1111111111111");
  
  for(int m=0;m<filenameList.size();m++)
  {
  System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvoooooooooo");
	  query4="insert into software_amc_invoice(license_no,amc_invoice,sw_index) values('"+Licenseno+"','D:/neinSoft/files/C2IT/ProductDetails/Software/AMCInvoice/"+Licenseno+"/"+filenameList.get(m)+"','"+id+"')";
	  st2.executeUpdate(query4);
  }
 }
 catch(Exception el)
 {
 out.println("Inserting error"+el.getMessage());
 }
 }
 msg = "Software__details__renewed__Successfully";
 response.sendRedirect("SoftwareRenewFirst.jsp?msg="+msg);
 
  
 }
 
 catch (Exception e){
 out.println(e.getMessage());
 }


	%>

