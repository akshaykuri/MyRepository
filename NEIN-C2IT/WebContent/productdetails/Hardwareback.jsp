<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="java.util.*"%>
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
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%> 
<%@ page import = "java.util.ResourceBundle" %>

<%-- <%@ include file="getcon.jsp"%> --%>

 <%
 Statement st=null,st1=null,st2=null;
 Connection cn=null,cn1=null;
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
	// int k=0;
	 int count1 = 0;
	 String emp_no=(String)session.getAttribute("emp_no");
	System.out.println("empiddd========"+emp_no);
	 
	 String AssetNum="";
	 String AssetNo="";
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
     
     String AmcPoNum="";
     String AmcPoDate="";
     String AmcVender="";
     String AmcCperson="";
     String AmcCnum="";
     
     List<String> assetnoList1=null;
     
     String []fileName=null;
     
     ArrayList<String> assetnoList;
     assetnoList = new ArrayList<String>();
         
     ArrayList<String> assettypeList;
     assettypeList = new ArrayList<String>();
     
     ArrayList<String> serialList;
     serialList = new ArrayList<String>();
     
     ArrayList<String> brandList;
     brandList = new ArrayList<String>();
     
     ArrayList<String> modelList;
     modelList = new ArrayList<String>();
     
     ArrayList<String> configList;
     configList = new ArrayList<String>();
     
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
 
 /* if(name.equals("assetnum"))
 {
	 AssetNum=value;
	 count1 = 1;
	// System.out.println("hardware  name 1===="+AssetNum);
 } */

 ///////////////////////
 if(name.equals("assettype"))
 {
 //user=value;
 assettypeList.add(value);
 count1 = 1;
 //System.out.println("get of zero"+hardwarepartList.get(0));
 System.out.println("hppppparts in try 7===="+assettypeList);
 }
  if(name.equals("sno"))
 {
	 serialList.add(value);
	 count1 = 1;
   System.out.println("sno name==== 3"+serialList);
 }
 if(name.equals("brand"))
 {
	 brandList.add(value);
	 count1 = 1;
System.out.println("brand name 4===="+brandList);
 }
 if(name.equals("model"))
 {
	 modelList.add(value);
	 count1 = 1;
	 System.out.println("model name 5===="+modelList);
 }
 
 if(name.equals("config"))
 {
	 configList.add(value);
	 count1 = 1;
	System.out.println("config name 6===="+configList);
 }
 ////////////
  if(name.equals("ponum"))
 {
	 PoNum=value;
	 count1 = 1;
	 System.out.println("po number 13===="+PoNum);
 }
 if(name.equals("pdate"))
 {
	 PoDate=value;
	 count1 = 1;
	 System.out.println("ipo date 14===="+PoDate);
 }
 if(name.equals("vname"))
 {
	 Vname=value;
	 count1 = 1;
 System.out.println("vender name 15===="+Vname);
 }
 
 /* if(name.equals("ip"))
 {
	 IP=value;
	 count1 = 1;
	 //System.out.println("ip 16===="+IP);
 } */
 if(name.equals("cperson"))
 {
	 Cperson=value;
	 count1 = 1;
	System.out.println("contact person 17===="+Cperson);
 }
 if(name.equals("vnum"))
 {
	 Cnum=value;
	 count1 = 1;
	 System.out.println("contact number 18===="+Cnum);
 }
 
 if(name.equals("aponum"))
 {
	 AmcPoNum=value;
	 System.out.println("po number==3=="+AmcPoNum);
 }
 if(name.equals("apdate"))
 {
	 AmcPoDate=value;
	 System.out.println("po date try===4="+AmcPoDate);
 }
 if(name.equals("avname")) 
 {
	 AmcVender=value;
	 System.out.println("vender name try====5"+AmcVender);
 }

 
 if(name.equals("acperson"))
 {
	 AmcCperson=value;
	System.out.println("contact person try==7=="+AmcCperson);
 }
 if(name.equals("avnum"))
 {
	 AmcCnum=value;
	System.out.println("contact number try===8="+AmcCnum);
 }

 if(name.equals("city"))
 {
	 Branch=value;
	 System.out.println("branch name try====9"+Branch);
 }
 if(name.equals("Subcity"))
 {
	 SubBranch=value;
	System.out.println("lsub branch name try==10=="+SubBranch);
 }
 if(name.equals("amc1"))
 {
	 Afrom=value;
	 count1 = 1;
	System.out.println("afrom name 21===="+Afrom);
 }
 if(name.equals("amc2"))
 {
	 Ato=value;
	 count1 = 1;
	System.out.println("ato name 22===="+Ato);
 }
 if(name.equals("amc3"))
 {
	 Aexp=value;
	 count1 = 1;
	 System.out.println("expiry name 23===="+Aexp);
 }
 if(name.equals("amcamt"))
 {
	 Aamt=value;
	 count1 = 1;
	 System.out.println("iamc amt 24===="+Aamt);
 }
 
 if(name.equals("invoice"))
 {
	 filenameList.add(value);
 count1 = 1;
 }
 
 /* if(name.equals("Assetno"))
 {
	 assetnoList.add(value);
     count1 = 1;
     
     System.out.println("iamc amt 25===="+assetnoList);
     List<String> assetnoList1 = Arrays.asList(assetnoList.split("\\s*,\\s*"));
 } */
 
 if(name.equals("assetnum"))
 {
	 AssetNo=value;
	 count1 = 1;
	// System.out.println("iamc amt 24===="+Aamt);
 }
 
 if(name.equals("Assetno"))
 {
	 AssetNum=value;
	 String Assetnew=AssetNo+","+AssetNum;
	 System.out.println("Assetnew===="+Assetnew);
	 count1 = 1;
	 assetnoList1 = Arrays.asList(Assetnew.split("\\s*,\\s*"));
 }
 }
 else
 {
	 
 try
 {
	 //List<String> items = Arrays.asList(str.split("\\s*,\\s*"));
	 
	 
	 System.out.println("in trrrrrrrrrrrrryyyyyyyyyyyyssss");
	 for(int s=0;s<assetnoList1.size();s++)
	  { 
		 System.out.println("in trrrrrrrrrrrrryyyyyyyyyyyyttttassetnoList1.get(s)----"+assetnoList1.get(s));
 itemName = item.getName();//D:/neinSoft/files/C2IT/ProductDetails/Software/AMCInvoice/
 filenameList.add(itemName);   ///D:\neinSoft\files\C2IT\ProductDetails\Hardware
 File savedFile = new File("D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+assetnoList1.get(s));
 
 if(!savedFile.exists()) 
 {
 savedFile.mkdirs();//The constructor File(File) is undefined
  savedFile.setWritable(true);
 // System.out.println("set Writable");
	 }
File  insertFile = new File("D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+assetnoList1.get(s)+"/"+itemName);
item.write(insertFile);
	  }
 }
 catch (Exception e)
 {
 out.println("Error"+e.getMessage());
 }
 }
 }
 try
 {
	System.out.println("in trrrrrrrrrrrrryyyyyyyyyyyy");
	  for(int t=0;t<assetnoList1.size();t++)
	  { 
	 String query1 = "select max(hw_id) from hardware_details";
	 rs = st.executeQuery(query1);
	 int id=0;
	 if(rs.next())
	 {
	 System.out.println("in trrrrrrrrrrrrryyyyyyyyyyyy1111111");
 	   id=rs.getInt(1);  
 	   id=id+1;
     }
     String query2=null;
     String query3=null;
     System.out.println("in trrrrrrrrrrrrryyyyyyyyyyyy2222222assetnoList1.size()----"+assetnoList1.get(t)); 
     query2="insert into hardware_details(initiator_empid,Asset_no,po_no,po_date,vender_name,contact_person,contact_number,amc_po,amc_podate,amc_vender,amc_contactperson,amc_contactnum,branch,sub_branch,amc_from_date,amc_to_date,amc_exp_date,amc_amount,status) values('"+emp_no+"','"+assetnoList1.get(t)+"','"+PoNum+"','"+PoDate+"','"+Vname+"','"+Cperson+"','"+Cnum+"','"+AmcPoNum+"','"+AmcPoDate+"','"+AmcVender+"','"+AmcCperson+"','"+AmcCnum+"','"+Branch+"','"+SubBranch+"','"+Afrom+"','"+Ato+"','"+Aexp+"','"+Aamt+"','Active')";
     st.executeUpdate(query2);
     System.out.println("in trrrrrrrrrrrrryyyyyyyyyyyy333333333333"); 
     for(int j=0;j<assettypeList.size();j++)
	  {
		  System.out.println("multipleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+assettypeList.get(j));
	 	  query3="insert into hardware_details_multiple(Asset_no,Asset_type,serial_no,brand,model,configuration,hw_id,status) values('"+assetnoList1.get(t)+"','"+assettypeList.get(j)+"','"+serialList.get(j)+"','"+brandList.get(j)+"','"+modelList.get(j)+"','"+configList.get(j)+"','"+id+"','Active')";
	       st1.executeUpdate(query3);
	  }
    System.out.println("after multipleeeeeeeee");
     if(fileName != null)
     {
    	String []itemss;
   		for(int p=0;p<fileName.length;p++)
   			{
   			    System.out.println("FILE NAME "+fileName[p]);
   				InputStream ins = getServletContext().getResourceAsStream(fileName[p]);
   				if(ins != null)
   				{
   				System.out.println("ins value "+ins);
   				}
   	    	}
     }
     String query4=null;
     System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvoooooooooo1111111111111"+assetnoList1.get(t));
     
     for(int m=0;m<filenameList.size();m++)
     {
   	 System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvoooooooooo"+assetnoList1.get(t));
   	  query4="insert into hardware_amc_invoice(Asset_no,amc_po,hw_invoice,hw_id,status) values('"+assetnoList1.get(t)+"','"+AmcPoNum+"','D:/neinSoft/files/C2IT/ProductDetails/Hardware/AMCInvoice/"+assetnoList1.get(t)+"/"+filenameList.get(m)+"','"+id+"','Active')";
   	  st2.executeUpdate(query4);
   	System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvv11111111111111111oooooooooo");
     }
 } 
 }
 catch(Exception el)
 {
 out.println("Inserting error=="+el.getMessage());
 }
 }
  //  msg = "Hardware__details__added__Successfully";
 //response.sendRedirect("HardwareCreation.jsp?msg=" +msg);  
  
 } 
 
 catch (Exception e){
 out.println(e.getMessage());
 }


	%>

