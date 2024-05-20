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
    String s=request.getParameter("pordernon1");  
 System.out.println("Value of AMC po no :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax3' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
    if(length<=15){
    if(s==null || s.trim().equals(""))
           {  
           out.print("Please enter id");  
           }
    else
           {  
           try
             {  
        	   Class.forName(driver).newInstance();
        	   conn= DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
              
               //SELECT p.`pordernon`,p.`po_date`,p.`VendorText`,p.`textarea1`,v.vmobile FROM `po` p LEFT OUTER JOIN vendormaster v ON p.`VendorText` = v.vname
               //WHERE `pordernon`='NEIN/90-502'

              // ResultSet rs = stmt.executeQuery("select * from emp where (EMP_NO='" + s + "'); ");
              //  System.out.println("Value of AMC po no tryyyyyyyyy:"+s);
               ResultSet rs = stmt.executeQuery("SELECT po_date,VendorText,tarea2,tarea22 FROM po WHERE (pordernon='" + s + "');");
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='ap1' value='"+rs.getString(1)+"'>" + "<input type='text' id='ap2' value='"+rs.getString(2)+"'>" + "<input type='text' id='ap3' value='"+rs.getString(3)+"'>" + "<input type='text' id='ap4' value='"+rs.getString(4)+"'>";
	                  
	                   }  
                // System.out.println("Value of Buffer :"+buffer);
               buffer=buffer+"</div>";
              // System.out.println("Value of Buffer :"+buffer);
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