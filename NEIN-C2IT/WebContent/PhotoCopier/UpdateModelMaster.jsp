<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import="CON2.Connection2"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out1 = response.getWriter();
		
		String id1=request.getParameter("cid");
		int id=Integer.parseInt(id1);		
		String b_id=request.getParameter("location");
		int branchid=Integer.parseInt(b_id);
		
		String brand=request.getParameter("brand");
		String modelno=request.getParameter("modelno");
		String sno=request.getParameter("sno");
		String agreementno=request.getParameter("agreementno");
		String vendortype=request.getParameter("vendortype");
		String machinetype=request.getParameter("machinetype");
		String vendorname=request.getParameter("vendorname");
		
		String fcblack1=request.getParameter("fcblack");
        int fcblack=Integer.parseInt(fcblack1);
        String fccolor1=request.getParameter("fccolor");
        int fccolor=Integer.parseInt(fccolor1);
        String fccolorprint1=request.getParameter("fccolorprint");
        int fccolorprint=Integer.parseInt(fccolorprint1);
        
		String chargefcblack1=request.getParameter("chargefcblack");
        float chargefcblack=Float.parseFloat(chargefcblack1);
        String chargefccolor1=request.getParameter("chargefccolor");
        float chargefccolor=Float.parseFloat(chargefccolor1);
        String chargefccolorprint1=request.getParameter("chargefccolorprint");
        float chargefccolorprint=Float.parseFloat(chargefccolorprint1);
        
        String fca31=request.getParameter("fca3");
        int fca3=Integer.parseInt(fca31);
        String chargea31=request.getParameter("chargea3");
        float chargea3=Float.parseFloat(chargea31);
		
		String rentamt1=request.getParameter("rentamt");
		float rentamt=Float.parseFloat(rentamt1);
		/* String txtamt1=request.getParameter("txtamt");
		float txtamt=Float.parseFloat(txtamt1); */
		
		String agreementdate1=request.getParameter("agreementdate");
		Date utilDate1 = new SimpleDateFormat("dd-MM-yyyy").parse(agreementdate1);
		java.sql.Date agreementdate = new java.sql.Date(utilDate1.getTime()); 
			
		String agreementsdate1=request.getParameter("agreementsdate");
		Date utilDate2 = new SimpleDateFormat("dd-MM-yyyy").parse(agreementsdate1);
		java.sql.Date agreementsdate = new java.sql.Date(utilDate2.getTime()); 
		
		String agreementedate1=request.getParameter("agreementedate");
		Date utilDate3 = new SimpleDateFormat("dd-MM-yyyy").parse(agreementedate1);
		java.sql.Date agreementedate = new java.sql.Date(utilDate3.getTime()); 
		
		String installed=request.getParameter("installed");
		Date utilDate4 = new SimpleDateFormat("dd-MM-yyyy").parse(installed);
		java.sql.Date installeddate = new java.sql.Date(utilDate4.getTime()); 
		
         System.out.println("installeddate"+installeddate);
		int i=0;
		try
		{
			 Connection con = null;
			 Connection2 dbConn = new Connection2();
			 con = dbConn.getConnection2();
			
			 Statement st=null,st1=null;
			 ResultSet rs=null;
			 String msg=null;
			 
		     st1=con.createStatement();
			 i=st1.executeUpdate(
					 " UPDATE `photocopier_model_master` SET `branch_id`='"+branchid+"',`brand`='"+brand+"',`modelno`='"+modelno+"',"+
					 " `serialno`='"+sno+"',`agreementno`='"+agreementno+"',`agreementdate`='"+agreementdate+"',`agreementsdate`='"+agreementsdate+"',"+
					 " `agreementedate`='"+agreementedate+"',`vendortype`='"+vendortype+"',`rentamt`='"+rentamt+"',"+
					 " `machinetype`='"+machinetype+"',`freecopyblack`='"+fcblack+"',`freecopycolor`='"+fccolor+"',`freecopycolorprint`='"+fccolorprint+"',"+
					 " `chargeblackcopy`='"+chargefcblack+"',`chargecolorcopy`='"+chargefccolor+"',`chargecolorprint`='"+chargefccolorprint+"', "+
					 "`vendorname`='"+vendorname+"',freea3='"+fca3+"',chargea3='"+chargea3+"',`installed_date`='"+installeddate+"' "+
					 " WHERE id='"+id+"'");
			 msg = "Data__Updated__SUCCESSFULLY";
			 response.sendRedirect("DisplayModelMaster.jsp?msg="+msg);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}%>

