<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
	System.out.println("------------ Assign Asset Back1  -------------");
	String uid1=request.getParameter("it_nonit");  
	String buffer1="<select name='assetName1' id='idaType' onchange='assetnofetch(this.value)' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";
	//String buffer="";
	//	System.out.println(uid1);
	String name=null;
	Connection conn1 = null;
	String url1 = "jdbc:mysql://localhost:3306/";
	String dbName1 = "csdb";
	String driver1 = "com.mysql.jdbc.Driver";
	String userName1 = "root"; 
	String password1 = "";
	//select * from branch_master ORDER BY b_name
	//ArrayList array=new ArrayList();
    try{ 
    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
        conn1 = DriverManager.getConnection(url1+dbName1,userName1,password1);  
        Statement stmt1 = conn1.createStatement();  
        ResultSet rs1 = stmt1.executeQuery("select * from asset_type where (it_nonit='" + uid1 + "'); ");
        while(rs1.next())
              {  
        	  buffer1=buffer1+"<option value='"+rs1.getString(3)+"'>"+rs1.getString(3)+"</option>";
        	  }   
      response.getWriter().println(buffer1);
    } catch(Exception e)
                {   
	            System.out.println(e);
	            } 
                   finally
	                 {
	            	  conn1.close();
			         }
	%>