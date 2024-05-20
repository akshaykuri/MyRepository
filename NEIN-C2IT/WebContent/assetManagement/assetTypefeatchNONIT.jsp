<%@ page import="java.sql.*"%>  
  
   <%
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
    String s=request.getParameter("atype");  
    System.out.println("Asset No :"+s);
    String buffer="<div id='resultFromAjax'>";
    ResultSet rs1,rs;
    String val=null;
          try
             {  
	           Class.forName("com.mysql.jdbc.Driver").newInstance();  
               conn = DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
               rs = stmt.executeQuery("SELECT AssetType FROM asset_item WHERE (Asset_No='" + s + "' AND ConfigAddStatus=0);");
               if(rs.next())
                   { 
     	           val=rs.getString(1);
                   }
               if(val!=null)
                   {
            	   rs1 = stmt.executeQuery("SELECT configname FROM assetconfgfield WHERE (assettype='" + val + "');");
                   while(rs1.next())
                      { 
                	   buffer = buffer + rs1.getString(1)+" : " ;
            	       buffer = buffer + "<input type='text' id='p1' value=''>";
            	       buffer = buffer + "</br>"; 
	                  }  
                   }
               //System.out.println("Value of Buffer :"+buffer);
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