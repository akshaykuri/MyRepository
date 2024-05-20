<%@ page import="java.sql.*"%>  
<%@page import="java.util.ResourceBundle"%>
  
   <%
    String name=null;
    Connection conn = null,cn66=null,cn5=null;
    /* String url = "jdbc:mysql://localhost:3306/";
    String dbName = "leavemanagement";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = ""; */
    ResourceBundle dbPropertiesl = ResourceBundle.getBundle("csdb");
    String userNamel = dbPropertiesl.getString("csdb.username");
    String passwordl = dbPropertiesl.getString("csdb.password");
    String urll = dbPropertiesl.getString("csdb.url");
    String driverl = dbPropertiesl.getString("csdb.driverName");
    String dbNamel = dbPropertiesl.getString("csdb.dbName");

	
   
    String hcategory=request.getParameter("k");
    String hbranch=request.getParameter("t");
   
    System.out.println("Value of S :"+hcategory);
    System.out.println("Value of S :"+hbranch);
    
    String buffer="<select name='Hsname' style='width: 100%;'><option value=''>Select</option>"; 
    //System.out.println("Value oflengthS :"+length);
    
    if(hcategory==null || hcategory.trim().equals(""))
           {  
           out.print("Please Select hardware Category");  
           }
    else
           {  
           try
             {  
        	   Class.forName(driverl).newInstance();
        	      conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
        	      Statement stmt = conn.createStatement(); 
               Statement st66 = conn.createStatement(); 
               String ro=null,ro1=null,desg=null;
               
               ResultSet rs = stmt.executeQuery("SELECT Sub_Category FROM `hardware_master` where Category='"+hcategory+"' AND Branch='"+hbranch+"'");
               while(rs.next())
                      { 
            	   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>"; 

                      }
               
              
            
               buffer=buffer+"</select>";
             System.out.println("Value of Buffer :"+buffer); 
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  conn.close();
		         }
          }
    
%>  