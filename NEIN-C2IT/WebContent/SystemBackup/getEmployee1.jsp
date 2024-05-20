<%@ page import="java.sql.*"%>  
  
   <%
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
    
    String s=request.getParameter("EMP_NO");  
    //System.out.println("Value of S :"+s);
    int length = String.valueOf(s).length();
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
    String buffer1="";
    if(length<=4){
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
              // Statement stmt1 = conn.createStatement(); 
               ResultSet rs = stmt.executeQuery("select * from systemuserbackup where (empno='" + s + "'); ");
               //ResultSet rs1 = stmt1.executeQuery("select * from systembackupschdaytime where (empno='" + s + "'); ");
               if(rs.next())
                      { 
            	       buffer = buffer + "<input type='text' id='p1' name= 'idp1' value='"+rs.getString(2)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(3)+"'>";
	                   buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(4)+"'>";
	                   buffer = buffer + "<input type='text' id='p4' value='"+rs.getString(5)+"'>";
	                   buffer = buffer + "<input type='text' id='p5' value='"+rs.getString(6)+"'>";
	                   buffer = buffer + "<input type='text' id='p6' value='"+rs.getString(8)+"'>";
	                   buffer = buffer + "<input type='text' id='p7' value='"+rs.getString(9)+"'>";
	                   } 
               
               /* while(rs1.next())
                     { 
            	     buffer1 = buffer1 + "##";
     	             buffer1 = buffer1 + rs1.getString(3);
     	             buffer1 = buffer1 + ",";
                     buffer1 = buffer1 + rs1.getString(4);
                     buffer1 = buffer1 + ",";
                     buffer1 = buffer1 + rs1.getString(5);
                     buffer1 = buffer1 + ",";
                     buffer1 = buffer1 + rs1.getString(6);
                     }   */
                //System.out.println("Value of Buffer :"+buffer);
               /*  buffer1 = buffer1 + "##";
                buffer = buffer + "<input type='text' id='p8' value='"+buffer1+"'>"; */
                buffer=buffer+"</div>";
               // System.out.println("Value of Buffer :"+buffer);
               // System.out.println("Value of Buffer1 :"+buffer1);
               
               //response.sendRedirect("backupchecklist.jsp?msg="+buffer);
              // response.sendRedirect("backupchecklist.jsp?msg="+buffer);
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