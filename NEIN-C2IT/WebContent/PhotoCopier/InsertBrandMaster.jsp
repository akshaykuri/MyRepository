<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import="CON2.Connection2"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Model Master</title>
</head>
<body>
                   <% 
                       response.setContentType("text/html;charset=UTF-8");
                       PrintWriter out1 = response.getWriter();
                      
                       String b_id=request.getParameter("location");
                       int branchid=Integer.parseInt(b_id);
        
                       String brand=request.getParameter("brand");
                       String modelno=request.getParameter("modelno");
                       String sno=request.getParameter("sno");
                       String agreementno=request.getParameter("agreementno");
                       String vendortype=request.getParameter("vendortype");
                       String machinetype=request.getParameter("machinetype");
                       String vendorname=request.getParameter("vendorname");
                       //String installeddate=request.getParameter("installed");
                       
                       String fcblack1=request.getParameter("fcblack");
                       int fcblack=Integer.parseInt(fcblack1);
                       String fca31=request.getParameter("fca3");
                       int fca3=Integer.parseInt(fca31);
                       String fccolor1=request.getParameter("fccolor");
                       int fccolor=Integer.parseInt(fccolor1);
                       String fccolorprint1=request.getParameter("fccolorprint");
                       int fccolorprint=Integer.parseInt(fccolorprint1);
                       
                       String chargefcblack1=request.getParameter("chargefcblack");
                       float chargefcblack=Float.parseFloat(chargefcblack1);
                       String chargea31=request.getParameter("chargea3");
                       float chargea3=Float.parseFloat(chargea31);
                       String chargefccolor1=request.getParameter("chargefccolor");
                       float chargefccolor=Float.parseFloat(chargefccolor1);
                       String chargefccolorprint1=request.getParameter("chargefccolorprint");
                       float chargefccolorprint=Float.parseFloat(chargefccolorprint1);
                       
                       String rentamt1=request.getParameter("rentamt");
                       float rentamt=Float.parseFloat(rentamt1);
                       /* String txtamt1=request.getParameter("txtamt");
                       float txtamt=Float.parseFloat(txtamt1); */
                       
                       String agreementdate1=request.getParameter("agreementdate");
                       Date utilDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(agreementdate1);
	                   java.sql.Date agreementdate = new java.sql.Date(utilDate1.getTime()); 
	                	
	                   String agreementsdate1=request.getParameter("agreementsdate");
                       Date utilDate2 = new SimpleDateFormat("yyyy-MM-dd").parse(agreementsdate1);
	                   java.sql.Date agreementsdate = new java.sql.Date(utilDate2.getTime()); 
	                   
	                   String agreementedate1=request.getParameter("agreementedate");
                       Date utilDate3 = new SimpleDateFormat("yyyy-MM-dd").parse(agreementedate1);
	                   java.sql.Date agreementedate = new java.sql.Date(utilDate3.getTime()); 
	                   
	                   String installed=request.getParameter("installed");
                       Date utilDate4 = new SimpleDateFormat("yyyy-MM-dd").parse(installed);
	                   java.sql.Date installeddate = new java.sql.Date(utilDate4.getTime()); 


	                   System.out.println("agreementedate ::"+agreementedate);
	                   
	                   int i=0;
	                    Connection con = null;
						Connection2 dbConn = new Connection2();
						con = dbConn.getConnection2();
                
                        Statement st=null,st1=null;
                        String msg=null;
                        ResultSet rs=null,rs1=null;
                        PreparedStatement prds=null;
                        
                       // String query1 = "SELECT * FROM `photocopier_model_master` WHERE  branch_id='"+branchid+"' AND serialno='"+sno+"' AND modelno='"+modelno+"'";
                        String query1 = "SELECT * FROM `photocopier_model_master` WHERE  serialno='"+sno+"' ";
						st1 = con.createStatement();
 						rs1 = st1.executeQuery(query1);
 						
 						if(!rs1.next()){		
 						String query="INSERT INTO `photocopier_model_master`(`branch_id`, `brand`, `modelno`, `serialno`, "+
 								     "`agreementno`, `agreementdate`, `agreementsdate`, `agreementedate`, `vendortype`, "+
 								     "`machinetype`,`freecopyblack`,`freecopycolor`,`freecopycolorprint`,`chargeblackcopy`,"+
 								     "`chargecolorcopy`,`chargecolorprint`,`rentamt`,`vendorname`,`freea3`,`chargea3`,`installed_date`)"+
 								     "VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";   
 				        
 						prds = con.prepareStatement(query);
 						
 						prds.setInt(1,branchid);
 				        prds.setString(2,brand);
 				        prds.setString(3,modelno);
 				        prds.setString(4,sno);
 				        prds.setString(5,agreementno);
 				        prds.setDate(6,agreementdate);
 				        prds.setDate(7,agreementsdate);
 				        prds.setDate(8,agreementedate);
 				        prds.setString(9,vendortype);
 				        prds.setString(10,machinetype);
 				        prds.setInt(11,fcblack);
				        prds.setInt(12,fccolor);
				        prds.setInt(13,fccolorprint);
				        prds.setFloat(14,chargefcblack);
				        prds.setFloat(15,chargefccolor);
				        prds.setFloat(16,chargefccolorprint);
				        prds.setFloat(17,rentamt);
				       // prds.setFloat(18,txtamt);
				        prds.setString(18,vendorname);
				        prds.setInt(19,fca3);
				        prds.setFloat(20,chargea3);
				        prds.setDate(21,installeddate);
				        
 				        i= prds.executeUpdate();
 				        
 				        msg = "Model__data__INSERTED__SUCCESSFULLY";
 				        response.sendRedirect("ModelMaster.jsp?msg=" +msg);
 						}
 						else{
 							msg = "Model__Data__IS__ALLREADY__Entered";
 	 				        response.sendRedirect("ModelMaster.jsp?msg=" +msg);
 						}
 						%>
</body>
</html>  