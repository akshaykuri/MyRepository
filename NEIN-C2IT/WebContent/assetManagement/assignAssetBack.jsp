<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
	System.out.println("------------ Assign Asset Back  -------------");
	String uid=request.getParameter("m_b_no");  
	String buffer="<select name='Subcity' id='idsubBranch' onchange='branchDataFetch(this.value)' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";
	//String buffer="";
	//System.out.println();
	String name=null;
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root"; 
	String password = "";
	//select * from branch_master ORDER BY b_name
	//ArrayList array=new ArrayList();
    try{ 
    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
        conn = DriverManager.getConnection(url+dbName,userName,password);  
        Statement stmt = conn.createStatement();  
        ResultSet rs = stmt.executeQuery("select * from branch_master where (b_no='" + uid + "'); ");
        // String buffer = "";
        while(rs.next()){  
        	//buffer=buffer+"<option value='"+rs.getString("EMP_NAME")+"'>"+rs.getString("EMP_NAME")+"</option>";
        	buffer=buffer+"<option value='"+rs.getString(2)+"'>"+rs.getString(2)+"</option>";
        	//buffer1=buffer1+"<option value='"+rs1.getString(3)+"'>"+rs1.getString(3)+"</option>";
        	//buffer =buffer+rs.getString(2);
        	
        	}   
      // buffer=buffer+"</select>";   
        response.getWriter().println(buffer);
  
    } catch(Exception e)
                {   
	            System.out.println(e);
	            } 
                   finally
	                 {
	            	  conn.close();
			         }
	%>