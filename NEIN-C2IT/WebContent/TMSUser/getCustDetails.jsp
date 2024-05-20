<%@ page import="java.sql.*"%>  
<%@page import="java.util.ResourceBundle"%>  
   <%
    //System.out.println("Here");
    String name=null;
    Connection conn = null,cn666=null,cn66=null;
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	
	String dbName = dbProperties.getString("tmsdb.dbName");
	String urltmsdb = dbProperties.getString("tmsdb.url");
	
	String custcode=request.getParameter("custid"); 
   System.out.println("Value of S custcode :"+custcode);
 
    //System.out.println("Session branch :"+loc); 
    String buffer="<div id='resultFromAjaxcustdetails' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
          try
             {  
        	  Class.forName(driver).newInstance();
              conn = DriverManager.getConnection(urltmsdb+dbName,userName,password); 
             Statement stmt = conn.createStatement();  
             //Statement stmt1 = conn.createStatement();  
             String custname="",address="",conperson="",email="",mob="";
             cn666 = DriverManager.getConnection(urltmsdb+dbName,userName,password); 
             Statement  stlevel= cn666.createStatement(); 
             ResultSet rslevel =null;
             rslevel = stlevel.executeQuery("select * from customermasterdetails where coustmer_Code='"+custcode+"'");
             if(rslevel.next())
                 {      
            	 custname=rslevel.getString("customer_Name");
            	 address=rslevel.getString("customerAddress");
            	 conperson=rslevel.getString("contact_person_name");
            	 email=rslevel.getString("email");
            	 mob=rslevel.getString("mobile_no");
                 }
        	      
        	   buffer = buffer + "<input type='text' id='custname1' value='"+custname+"'>";
               buffer = buffer + "<input type='text' id='address1' value='"+address+"'>";
               buffer = buffer + "<input type='text' id='conperson1' value='"+conperson+"'>";
               buffer = buffer + "<input type='text' id='empmailid1' value='"+email+"'>";
               buffer = buffer + "<input type='text' id='emp_mob1' value='"+mob+"'>";
               
               buffer=buffer+"</div>";
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
         

%>  