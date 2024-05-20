<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<%
			  System.out.println("------------- Asset Config Add Back  -----------------");
              String c=request.getParameter("allconf");
              String ano=request.getParameter("ano");
              //  System.out.println("Asset No :"+ano);
              
              String inv=request.getParameter("inv");
              String atype1=request.getParameter("atype");
              
              //  System.out.println("AssetType :"+atype1);
              String Brand1=request.getParameter("BRAND");
              String Serial1=request.getParameter("SERIAL");
              String Model1=request.getParameter("MODEL");
              String Dcserila=request.getParameter("D-CPU-SR-NO");
              String DcModel=request.getParameter("D-CPU-MODEL-NO");
              String Dcbrand=request.getParameter("D-CPU-BRNAD");
              String Dmserial=request.getParameter("D-MONITER-SR-NO");
              String Dmbrand=request.getParameter("D-MONITER-BRAND");
              String Dmmodel=request.getParameter("D-MONITER-MODEL-NO");
            //  System.out.println("Desktop :: "+Dcserila+" :: "+DcModel+" :: "+Dcbrand+" :: "+Dmserial+" :: "+Dmbrand+" :: "+Dmmodel);
            //  System.out.println("laptop :: "+Brand1+"::"+Serial1+"::"+Model1);
              int i=0;
              Connection con1 = null;
              String url1 = "jdbc:mysql://localhost:3306/";
              String db1 = "csdb";
              String driver1 = "com.mysql.jdbc.Driver";
              String userName1 ="root";
              String password1="",msg="";
              Statement st1=null;
              ResultSet rs1=null; 
              PreparedStatement prs1=null,prs2 = null;
              try
                 {
	             Class.forName(driver1).newInstance();
                 con1 = DriverManager.getConnection(url1+db1,userName1,password1);
                 //doi4,remarks4,uname,pass3,doi5,remarks5,dcardno,doi1,remarks1,card,doi6,remarks6
                 
                 if(atype1.equals("DESKTOP"))
                 {
                	 prs1 = con1.prepareStatement("update asset_item set serial_no='"+Serial1+"', ConfigField='"+c+"',model_no='"+Model1+"',brand='"+Brand1+"',ConfigAddStatus=1 where Asset_No='"+ano+"'");
    		     }
				 prs1 = con1.prepareStatement("update asset_item set serial_no='"+Serial1+"', ConfigField='"+c+"',model_no='"+Model1+"',brand='"+Brand1+"',ConfigAddStatus=1 where Asset_No='"+ano+"'");
		           i=prs1.executeUpdate();
		           msg = "Inventory_No _ :"+inv;
				} catch(SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        con1.close();		             
			           }
                if (i!=0)
  		      { 
                response.sendRedirect("AddAssetConfigField.jsp?msg=" +msg);
  		      }
			           
         %>