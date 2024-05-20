<%@ page import="java.sql.*"%>  
<%@ page import = "java.util.ResourceBundle" %>
   <%
    String name=null;
    Connection conn = null;
    ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
    String userName = dbProperties.getString("csdb.username");
    String password = dbProperties.getString("csdb.password");
    String url = dbProperties.getString("csdb.url");
    String driver = dbProperties.getString("csdb.driverName");
    String dbName = dbProperties.getString("csdb.dbName");
    String s=request.getParameter("Asset_No");  
    //System.out.println("asset nooooooo----- :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
    if(length<=15){
    if(s==null || s.trim().equals(""))
           {  
           out.print("Please enter asset number");  
           }
    else
           {  
           try
             {  

        	   Class.forName(driver).newInstance();
        	   conn= DriverManager.getConnection(url+dbName,userName,password); 
               Statement stmt = conn.createStatement();  
                  ResultSet rs = stmt.executeQuery("SELECT AssetType,serial_no,model_no,brand,ConfigField FROM asset_item WHERE (Asset_No='" + s + "');");
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString("AssetType")+"'>" + "<input type='text' id='p2' value='"+rs.getString("serial_no")+"'>" + "<input type='text' id='p3' value='"+rs.getString("model_no")+"'>" + "<input type='text' id='p4' value='"+rs.getString("brand")+"'>" + "<input type='text' id='p5' value='"+rs.getString("ConfigField")+"'>";
	                  
	                   }  
               //  System.out.println("Value of Buffer :"+buffer);
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
          }
    }
%>  