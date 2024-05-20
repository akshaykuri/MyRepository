<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
 <%@ include file="banner.jsp" %>    
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
			  String id1=request.getParameter("id1");
          	  //System.out.println("vijay   "+id1);
              String br="brcode"+id1;
              //System.out.println("vijay   "+br);
              String bcode=request.getParameter(br);
             //System.out.println("vijay   "+bcode);
              String bn="bname"+id1;
             //System.out.println("vijay   "+bn);
              String bname=request.getParameter(bn);
             //System.out.println("vijay   "+bname);
             String scrap="scr"+id1; 
             String sc=request.getParameter(scrap);
              
              int sc1=Integer.parseInt(sc);
              String mn="main"+id1;
              String mai=request.getParameter(mn);
              int mai1=Integer.parseInt(mai);
              String an=request.getParameter("ano");
              String att="atype"+id1;
              String at=request.getParameter(att);
              String status=request.getParameter("atatus");
              //System.out.println(" Asset Details :"+id1+"::"+bcode+"	:::		"+bname+"	::	"+sc1+"	::	"+mai1+"	::	"+an+"	::	"+at+" ::: "+status);
              //System.out.println("Assign status :"+status);
              //String ast="<script>document.writeln(myParam)</script>";
              if(status.equals("1"))
              {
              String msg1 = "ASSIGNED__ASSET__CANNOT__UPDATE";  
               response.sendRedirect("assetUpdateNONIT1.jsp?msg=" +msg1);  
              }
           else
              { 
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
				   prs1 = con1.prepareStatement("update asset_item set Branch='"+bcode+"',BranchName='"+bname+"',Scrap='"+sc1+"',Maintanance='"+mai1+"' where Asset_No='"+an+"' and AssetType='"+at+"'");
		           i=prs1.executeUpdate();
		           msg = "UPDATED__SUCCESSFULLY";
				} catch(SQLException ex)
                          {
                           ex.printStackTrace();
                          }	
                finally{
                        con1.close();		             
			           }
			           
			           
                if (i!=0)
  		      { 
                response.sendRedirect("assetUpdateNOONIT1.jsp?msg=" +msg);
  		      }
			           
              }      
			           
			           
			           
			           
			           
			           %>