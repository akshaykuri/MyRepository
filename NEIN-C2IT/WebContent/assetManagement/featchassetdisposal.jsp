<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>;
<%
System.out.println("-------------  Asset Available for Disposal-----------------");
String asset_no=request.getParameter("asset_no");  
//String city=(String)session.getAttribute("city");
System.out.println("asset_no :"+asset_no);
//String[] city1=city.split(" -");
//System.out.println("City name :"+city1[0]);
String buffer="";
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
        System.out.println("before execute");
        //ResultSet rs = stmt.executeQuery("select * from asset_item where (AssetType='" + uid + "' && BranchName='"+city1[0]+"' && assignStatus=0 && Scrap=0 && Maintanance=0); ");
        ResultSet rs = stmt.executeQuery("select ai.*,a_inv.* from asset_item ai,asset_inventory a_inv where (ai.Asset_No='"+asset_no+"' && ai.assignStatus=0 && ai.Scrap=0 && ai.Maintanance=0) and ai.Inventory_No = a_inv.Inventory_No");
	 
        System.out.println("after execute");
        
        // String buffer = "";
        while(rs.next()){
        	
        	//System.out.println("Hello inside while");
        	//System.out.println("Asset Item Details");
        	//System.out.println(":::"+rs.getString(1)+"::"+rs.getString(2));
        	
        		buffer = buffer + "<input type='text' id='Inventory_No ' value='"+rs.getString("Inventory_No")+"'>";
        		buffer = buffer + "<input type='text' id='Asset_No' value='"+rs.getString("Asset_No")+"'>";
        		buffer = buffer + "<input type='text' id='AssetType' value='"+rs.getString("AssetType")+"'>";
        		buffer = buffer + "<input type='text' id='Branch' value='"+rs.getString("Branch")+"'>";
        		buffer = buffer + "<input type='text' id='BranchName' value='"+rs.getString("BranchName")+"'>";
        		buffer = buffer + "<input type='text' id='Waranty' value='"+rs.getString("Waranty")+"'>";
        		buffer = buffer + "<input type='text' id='WarExpDate' value='"+rs.getString("WarExpDate")+"'>";
        		buffer = buffer + "<input type='text' id='EmpId' value='"+rs.getString("EmpId")+"'>";
        		buffer = buffer + "<input type='text' id='Assignedfor' value='"+rs.getString("Assignedfor")+"'>";
        		buffer = buffer + "<input type='text' id='assignedbraemp' value='"+rs.getString("assignedbraemp")+"'>";
        		buffer = buffer + "<input type='text' id='Remarks' value='"+rs.getString("Remarks")+"'>";
        		buffer = buffer + "<input type='text' id='ConfigField' value='"+rs.getString("ConfigField")+"'>";
        		buffer = buffer + "<input type='text' id='assetname' value='"+rs.getString("assetname")+"'>";
        		buffer = buffer + "<input type='text' id='serial_no' value='"+rs.getString("serial_no")+"'>";
        		buffer = buffer + "<input type='text' id='model_no' value='"+rs.getString("model_no")+"'>";
        		buffer = buffer + "<input type='text' id='brand' value='"+rs.getString("brand")+"'>";
        		buffer = buffer + "<input type='text' id='asset_invoice' value='"+rs.getString("asset_invoice")+"'>";
        		buffer = buffer + "<input type='text' id='asset_amount' value='"+rs.getString("asset_amount")+"'>";
        		buffer = buffer + "<input type='text' id='asset_date' value='"+rs.getString("asset_date")+"'>";
        		
        		buffer = buffer + "<input type='text' id='PoNo' value='"+rs.getString("PoNo")+"'>";
        		buffer = buffer + "<input type='text' id='InvAmount' value='"+rs.getString("InvAmount")+"'>";
        		buffer = buffer + "<input type='text' id='InventoryDoneBy' value='"+rs.getString("InventoryDoneBy")+"'>";
        		buffer = buffer + "<input type='text' id='PoDate' value='"+rs.getString("PoDate")+"'>";
        		
        		
        		
        
        }   
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