<%@ page import="java.sql.*"%>  
  
   <%
    //System.out.println("i am in Fetch details");
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
    String s=request.getParameter("assetNoCheck");  
    //System.out.println("Value of asset no :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
  //  buffer = buffer + "<input type='text' id = 'p6' value='1'>";
    //System.out.println("Value oflengthS :"+length);
    if(length!=0){
    if(s==null)
           {  
      	     out.print("Please enter Asset NO ");  
           }
    else
           {  
  		//	System.out.println("i AM IN ELSE");
           try
             {  
	           Class.forName("com.mysql.jdbc.Driver").newInstance();  
               conn = DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
               ResultSet rs = stmt.executeQuery("SELECT * FROM `asset_item` where `Asset_No`='" + s + "';");
            //	System.out.println("I am in side the Assetnovalidation");
               while(rs.next())
                      {
            	   		System.out.println("I am in side the Assetnovalidation111111111");
            		       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(2)+"'>";
            		       buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(3)+"'>";
            		       buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(4)+"'>";
	           		       buffer = buffer + "<input type='text' id='p5' value='"+s+"'>";
	           		       buffer = buffer + "<input type='text' id = 'p6' value='1'>";
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