<%@ page import="java.sql.*"%>  
<%@ page import = "java.util.ResourceBundle" %>
   
   <%
        String name=null;
        Connection conn = null; 
        
        ResourceBundle dbProperties = ResourceBundle.getBundle("nepldb");
		String userName = dbProperties.getString("nepldb.username");
		String password = dbProperties.getString("nepldb.password");
		String url = dbProperties.getString("nepldb.url");
		String driver = dbProperties.getString("nepldb.driverName");
		String dbName = dbProperties.getString("nepldb.dbName");
	 
	    String s=request.getParameter("pordernon"); 
	    int length = String.valueOf(s).length();
	    String buffer="<div id='resultFromAjax5' style='display:none;'>"; 
    
    if(length==11){
    	
      if(s==null || s.trim().equals(""))
           {  
               out.print("Please enter id");  
           }
    else
           {  
           try
             {  
        	   Class.forName(driver).newInstance();
        	   conn = DriverManager.getConnection(url+dbName,userName,password);
               
               Statement stmt = conn.createStatement();  
              
               ResultSet rs = stmt.executeQuery("SELECT po_date FROM po WHERE (pordernon='" + s + "');");
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p001' value='"+rs.getString(1)+"'>";
	                  
	                   }  
               
               buffer=buffer+"</div>";
               
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
    }
%>  