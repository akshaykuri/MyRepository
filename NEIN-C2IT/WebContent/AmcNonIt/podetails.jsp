<%@ page import="java.sql.*"%>  
  
   <%
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "nepldb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
    String s=request.getParameter("pordernon");  
    //System.out.println("Value of po no :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
    //System.out.println("Value oflengthS :"+length);
    if(length==11){
    if(s==null || s.trim().equals(""))
           {  
           out.print("Please enter id");  
           }
    else
           {  
           try
             {  
	           Class.forName("com.mysql.jdbc.Driver").newInstance();  
               conn = DriverManager.getConnection(url+dbName,userName,password);  
               Statement stmt = conn.createStatement();  
              
               //SELECT p.`pordernon`,p.`po_date`,p.`VendorText`,p.`textarea1`,v.vmobile FROM `po` p LEFT OUTER JOIN vendormaster v ON p.`VendorText` = v.vname
               //WHERE `pordernon`='NEIN/90-502'

              // ResultSet rs = stmt.executeQuery("select * from emp where (EMP_NO='" + s + "'); ");
               
               ResultSet rs = stmt.executeQuery("SELECT po_date,VendorText,tarea2,tarea22 FROM po WHERE (pordernon='" + s + "');");
               
               while(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>" + "<input type='text' id='p2' value='"+rs.getString(2)+"'>" + "<input type='text' id='p3' value='"+rs.getString(3)+"'>" + "<input type='text' id='p4' value='"+rs.getString(4)+"'>";
	                  
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