<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%@ page import="java.util.ResourceBundle"%>
<%
		System.out.println("------ View Module Features Table View -----------");
		String moduleIdValue = request.getParameter("idValue");
		System.out.println("module Idvalue ::"+moduleIdValue);
		String buffer="";
	  	String name=null;
		Connection conn = null; 
		
		 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
      	String userName = dbProperties.getString("csdb.username");
      	String password = dbProperties.getString("csdb.password");
      	String url = dbProperties.getString("csdb.url");
      	String driver = dbProperties.getString("csdb.driverName");
      	
      	String dbName = dbProperties.getString("tmsdb.dbName");
    	String urltmsdb = dbProperties.getString("tmsdb.url");
      	
      	
      String query= " SELECT * FROM `applicationfeatures` WHERE `applicationModule_id`=? ";
      try{ 
			Class.forName(driver).newInstance();  
		    conn = DriverManager.getConnection(urltmsdb+dbName,userName,password);  
        	PreparedStatement prep = conn.prepareStatement(query);
        	prep.setInt(1,Integer.parseInt(moduleIdValue));
         	ResultSet rs = prep.executeQuery();
         	int i=1;
         	String reqmodule=null;
       	    buffer = "<table  id='viewTableId' align='center' border='1'><tr><th>SL.No</th> <th>Feature Name</th><th colspan=6>User Rights </th> </tr> ";
       			while (rs.next())
       			{
       				buffer=buffer+ "<tr><td align='center'>"+i+"</td>"
           			+ "<td align='center'>"+ rs.getString("applicationFeatures_name")+ " </td>"
           			+ "<td align='center'><input type='checkbox' name='name"+ rs.getString("applicationModule_id")+ "' id='all"+ rs.getString("applicationFeatures_id")+ "' value='all"+rs.getString("applicationFeatures_id")+"' onclick='checkVerify(this.id),checkedFetureValue(this.id,"+rs.getString("applicationModule_id")+")' >All</td>"
           			+ "<td align='center'><input type='checkbox' name='name"+ rs.getString("applicationModule_id")+ "' id='create"+ rs.getString("applicationFeatures_id")+ "' value='create"+rs.getString("applicationFeatures_id")+"' onclick='checkedFetureValue(this.id,"+rs.getString("applicationModule_id")+")' >Create</td>"
           			+ "<td align='center'><input type='checkbox' name='name"+ rs.getString("applicationModule_id")+ "' id='view"+rs.getString("applicationFeatures_id")+ "'  value='view"+rs.getString("applicationFeatures_id")+"' onclick='checkedFetureValue(this.id,"+rs.getString("applicationModule_id")+")' > View</td>"
           			+ "<td align='center'><input type='checkbox' name='name"+ rs.getString("applicationModule_id")+ "' id='update"+rs.getString("applicationFeatures_id")+ "' value='update"+rs.getString("applicationFeatures_id")+"' onclick='checkedFetureValue(this.id,"+rs.getString("applicationModule_id")+")'>Update</td>"
           			+ "<td align='center'><input type='checkbox' name='name"+ rs.getString("applicationModule_id")+ "' id='delete"+rs.getString("applicationFeatures_id")+ "' value='delete"+rs.getString("applicationFeatures_id")+"' onclick='checkedFetureValue(this.id,"+rs.getString("applicationModule_id")+")'>Delete</td>"
           			+ "<td align='center'><input type='checkbox' name='name"+ rs.getString("applicationModule_id")+ "' id='export"+rs.getString("applicationFeatures_id")+ "' value='export"+rs.getString("applicationFeatures_id")+"' onclick='checkedFetureValue(this.id,"+rs.getString("applicationModule_id")+")'>Export</td> "
           			+ "</tr>";
           			i++;
           			reqmodule=rs.getString("applicationModule_id");
       			}
       			buffer=buffer+"<input type='hidden' name='reqFeture"+reqmodule+"' id='idreqFeture"+reqmodule+"' readonly/>";
       			buffer=buffer+"</table>";
       			
     
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