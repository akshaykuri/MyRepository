<%@ page import="java.sql.*"%>  
<%@page import="java.util.ResourceBundle"%>  
   <%
   //System.out.println("Value of dsctype .....");
    String name=null;
    Connection conn = null,cn66=null,cn5=null;
    ResultSet rs =null;
    ResourceBundle dbPropertiesl = ResourceBundle.getBundle("ccpdb");
	String userNamel = dbPropertiesl.getString("ccpdb.username");
	String passwordl = dbPropertiesl.getString("ccpdb.password");
	String urll = dbPropertiesl.getString("ccpdb.url");
	String driverl = dbPropertiesl.getString("ccpdb.driverName");
	String dbNamel = dbPropertiesl.getString("ccpdb.dbName");
	
    String dsctype=request.getParameter("dsctype");  
    String empcode=request.getParameter("empcode"); 
    
    //System.out.println("Value of dsctype :"+dsctype);
   // System.out.println("Value of empcode :"+empcode);
    
    String buffer="<div id='resultFromAjax21' style='display:none;'>";
   

           try
             {  
        	   Class.forName(driverl).newInstance();
        	   conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
        	   Statement stmt = conn.createStatement(); 
               Statement st66 = conn.createStatement(); 
               String ro=null,ro1=null,desg=null;
               if(dsctype.equals("DSC_CHA"))
                   {
            	    rs = stmt.executeQuery("SELECT  dongleNo from dsc_main_sub WHERE userId='" + empcode + "' AND dscStatus = 'Active' ");  
                   }
               else
                   {
            	   rs = stmt.executeQuery("SELECT  dongleNo from dsco_main_sub WHERE userId='" + empcode + "' AND dscStatus = 'Active' ");  
                   }
               
               
               
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='dscNo1' value='"+rs.getString(1)+"'>";
	                   }
             
              // System.out.println("Value of Buffer :"+buffer);
               buffer=buffer+"</div>";
               //System.out.println("Value of Buffer :"+buffer);
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  conn.close();
		         }

%>  