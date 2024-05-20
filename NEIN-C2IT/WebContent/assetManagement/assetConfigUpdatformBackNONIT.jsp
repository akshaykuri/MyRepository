<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
 <%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<%System.out.println("------------- NONIT Asset Config Update Form Back  -----------------");
              String ano=request.getParameter("ano");
             // System.out.println("Asset No :"+ano);
              String inv=request.getParameter("inv");
             // System.out.println("Inventory No :"+inv);
              String c=request.getParameter("atype1");
             // System.out.println("Asset type :"+c);
              int i=0;
              Connection conn = null;
              String url = "jdbc:mysql://localhost:3306/";
              String dbName = "csdb";
              String driver = "com.mysql.jdbc.Driver";
              String userName = "root"; 
              String password = "";
              Statement st1=null;
              ResultSet rs1=null; 
              PreparedStatement prs1=null,prs2 = null;
              String config1="",msg=null;
              try
                 {
		             Class.forName("com.mysql.jdbc.Driver").newInstance();  
	                 conn = DriverManager.getConnection(url+dbName,userName,password);  
	                 st1= conn.createStatement();  
	                 rs1 = st1.executeQuery("SELECT configname FROM assetconfgfield WHERE (assettype='" + c + "');");
	                 while(rs1.next())
	                       {
	                	   String field=rs1.getString("configname");
	                	   String fieldval=request.getParameter(field);
	                       config1=config1+field+"="+fieldval+",";
	                       //System.out.println("Config  :"+config1);
	                       }
	                   //doi4,remarks4,uname,pass3,doi5,remarks5,dcardno,doi1,remarks1,card,doi6,remarks6
					 prs1 = conn.prepareStatement("update asset_item set ConfigField='"+config1+"',ConfigAddStatus=1 where Asset_No='"+ano+"'");
			         i=prs1.executeUpdate();
			         msg = "Config field updated..";
			         //System.out.println("Inventory No2 msg:"+ msg );
			  	}catch(SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        conn.close();		             
			           }
		        if (i!=0)
	  		         { 
	                 response.sendRedirect("assetConfigUpdateNONIT.jsp?msg=" +msg);
	  		         }
          %>