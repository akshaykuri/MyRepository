<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
		System.out.println("-------------  asset Available 8 -----------------");
		String uid=request.getParameter("AssetType");  
		String bname=request.getParameter("bname");
		 
		if(bname.equals("HEAD OFFICE"))
		{
			 bname = "Head Office";
		}
		if(bname.equals("BANGALORE"))
		{
			bname = "Bangalore Icon Office";
		}
		if(bname.equals("AHMEDABAD"))
		{
			bname = "Ahmedabad Branch Office";
		}
		if(bname.equals("AHEMDABAD"))
		{
			
			bname = "Ahmedabad Branch Office";
		}
		if(bname.equals("MUMBAI"))
		{
			bname = "Mumbai Branch Office";
		}
		if(bname.equals("KOLKATA"))
		{
			bname = "Kolkata Branch Office";
		}
		if(bname.equals("COIMBATORE"))
		{
			bname = "Coimbatore Branch Office";
		}
		if(bname.equals("COCHIN"))
		{
			bname = "Cochin Branch Office";
		}
		if(bname.equals("DELHI"))
		{
			bname = "Delhi Branch Office";
		}
		if(bname.equals("HYDERABAD"))
		{
			bname = "Hyderabad Branch Office";
		}
		
		if(bname.equals("CHENNAI"))
		{
			bname = "Chennai Branch Office";
		}
		
		if(bname.equals("NEEMRANA"))
		{
			bname = "Neemrana Logistics Center";
		}
		
		if(bname.equals("PUNE"))
		{
			bname = "Pune Branch Office";
		}
		
		if(bname.equals("RGMO"))
		{
			bname = "RGMO";
		}
		
		
		if(bname.equals("JAIPUR"))
		{
			bname = "Jaipur WH";
		}
		
		if(bname.equals("CHANDIGARH"))
		{
			bname = "Chandigarh(CHD)";
		}
		
		if(bname.equals("LUCKNOW"))
		{
			bname = "Lucknow WH";
		}
		
		if(bname.equals("MOHALI"))
		{
			bname = "Mohali WH";
		}
		
		if(bname.equals("DEHRADUN"))
		{
			bname = "Deharadun";
		}
		
		if(bname.equals("JAMMU"))
		{
			bname = "Jammu WH";
		}
		
		if(bname.equals("INDORE"))
		{
			bname = "Indore Office";
		}
		
		if(bname.equals("KPCT"))
		{
			bname = "KPCT";
		}
		
		if(bname.equals("DELHI WH"))
		{
			bname = "Delhi Branch Office";
		}
		
		if(bname.equals("VISHAKHAPATNAM"))
		{
			bname = "Vishakhapatnam Branch Office";
		}
		
		System.out.println("Asset Available Branch Name :"+bname);
		String city=(String)session.getAttribute("city");
		String[] city1=city.split(" -");
		//String buffer="<select name='assetno' id='idano' onchange='assetConfigFetch(this.value)' style=\"font-size: 11px;width: 142px;overflow: auto;height: 20px \"><option value='-1'>Select</option>";
		//String buffer="<select name='mobAssetNo' id='idmobAssetNo' onchange='mobileAssetConfigFetch(this.value)' style=\"font-size: 11px;width: 110px; overflow: auto; height: 20px \"><option value='-1'>Select</option>";  
		String buffer="<select name='hardDiscAssetNo' id='idHardDiscAssetNo' onchange='hardDiscAssetConfigFetch(this.value)' style=\"font-size: 11px;width: 110px; overflow: auto; height: 20px \"><option selected='Select' >Select</option>"; 
		String name=null;
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "csdb";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root"; 
		String password = "";
		    try{ 
		    	Class.forName("com.mysql.jdbc.Driver").newInstance();  
		        conn = DriverManager.getConnection(url+dbName,userName,password);  
		        Statement stmt = conn.createStatement();  
		        ResultSet rs = stmt.executeQuery("select * from asset_item where (AssetType='" + uid + "' && BranchName='"+bname+"'  && assignStatus=0 && Scrap=0 && Maintanance=0); ");
		        while(rs.next()){  
		        	buffer=buffer+"<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>";
		        	}   
		        buffer=buffer+"</select>";
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