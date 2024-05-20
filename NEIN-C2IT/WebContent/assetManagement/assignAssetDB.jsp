<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>

<body>
<%

	System.out.println("------------ Assign Asset DB  -------------");
	Date date = new Date();
    SimpleDateFormat ft = new SimpleDateFormat ("dd-MMM-YYYY");
    //String str = ft.format(date);
    

    Statement st=null,st1=null,st2=null,st3=null;
    ResultSet rs=null,rs1=null,rs2=null,rs3=null;  
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	PreparedStatement prs1 = null,prs2 = null,prs3=null,prs4 = null,prs5=null,prs6=null,prs7=null,prs12=null;
	int j = 0, i = 0,p=0;
	String assettype = request.getParameter("it");
	String assetname = request.getParameter("assetName");
    String assetno = request.getParameter("assetno");
    String empbranch = request.getParameter("empBranch");
    System.out.println("emp branch  " + empbranch);
    System.out.println("asset no :  " + assetno);
    String branchcode = request.getParameter("branchCode");
	String assignfor = request.getParameter("assign");
	String dateofasg = request.getParameter("date1");
	String asto=request.getParameter("subbranch");
    String str = dateofasg;
	
	System.out.println("it / nonit  " + assettype);
	System.out.println("asset name  " + assetname);
	//System.out.println("asset no " + assetno);
	System.out.println("assign for  " + assignfor);
	//System.out.println("date " + dateofasg);
	String asgby = (String)session.getAttribute("Nname");
	int asgempid=Integer.parseInt((String)session.getAttribute("empid"));
	String confi=null,branch=null;
	String brcode=null;
		try 
	    {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url + dbName, userName,password);
		Statement stmt = conn.createStatement();
        ///////////////////////
    	String query1 = "select id,ConfigField,Branch from asset_item where Asset_No='"+assetno+"' ";
    	st1 = conn.createStatement();
    	rs1 = st1.executeQuery(query1);
    	if(rs1.next())
    	   {
    	   p=rs1.getInt("id");
    	   confi=rs1.getString("ConfigField");
    	   brcode=rs1.getString("Branch");
    	   System.out.println("Id value of asset P :"+p);
    	   }
    	///////////////////////////////
    	
    	
    	///////////////////////
    	String query2 = "select m_b_no from branch_master_main where m_b_name='"+empbranch+"' ";
    	st3 = conn.createStatement();
    	rs3 = st1.executeQuery(query2);
    	if(rs3.next())
    	   {
    	   branch=rs3.getString("m_b_no");
    	   System.out.println("branch no1 :"+branch);
    	   }
    	///////////////////////////////
		    	System.out.println("Braanch code:"+ branchcode);
		     	String branchname = request.getParameter("bname");
		    
		     	String branchphno = request.getParameter("branchPhNo");
		    	String branchaddress = request.getParameter("branchAddrs");
		    	String remarks2 = request.getParameter("remarks1");
		    	System.out.println("branch name " + branchname);
		    	
		    	System.out.println("branch ph no " + branchphno);
		    	System.out.println("branch address " + branchaddress);
		    	System.out.println("office remarks  " + remarks2);
	    	    String query21 = "select * from asset_trans where (New_Asset_No='"+assetno+"' AND curAID=1) ";
	    	    st2 = conn.createStatement();
	    	    rs2 = st2.executeQuery(query21);
	    	    if(rs2.next())
	    	           {
		    		       prs12 = conn.prepareStatement("update asset_trans set toUser='"+asto+"' where New_Asset_No='"+assetno+"' AND curAID=1");
			               prs12.executeUpdate();
			           } 
	    	    prs3 = conn.prepareStatement("insert into assignassetoffice(BranchCode,BranchName,BranchPHNo,BranchAddress,AssetType,AssetName,AssetNo,DateOfAssigned,AssignedByName,AssignFor,Remarks,ConfigField,assignToBranch,AssignedByEmpId) values(?,?,?,?,?,?,?,'"+str+"','"+asgby+"',?,?,?,?,?)");
		    	
		    	prs5 = conn.prepareStatement("update asset_item set EmpId='"+branchcode+"',assignStatus=1 where Asset_No='"+assetno+"'");
		        prs5.executeUpdate();
		        
		        prs6 = conn.prepareStatement("update asset_item set Assignedfor='OFFICE',assignedbraemp='"+branchname+"' where Asset_No='"+assetno+"'");
		        prs6.executeUpdate();
		       
		    	//prs3.setInt(1, new Integer(branchcode));
		    	prs3.setString(1, branchcode);
		    	prs3.setString(2, branchname);
		    	//prs3.setString(3, subbranch);
		    	prs3.setString(3, branchphno);
		    	prs3.setString(4, branchaddress);
		        prs3.setString(5, "IT");
		        prs3.setString(6, assetname);
		        prs3.setString(7, assetno);
		        prs3.setString(8, "OFFICE");
		        prs3.setString(9,remarks2);
		        prs3.setString(10,confi);
		        prs3.setString(11,asto);
		        prs3.setInt(12,asgempid);
			    j=prs3.executeUpdate();
			    /*  } else{
		        	String msg2="Wrong - \b Branch - \b selected - \b for - \b asset - \b No";
		        	response.sendRedirect("assignAsset.jsp?msg=" +msg2);} */
		        
		if ( j!=0)
		   { 
            String msg="ASSET- \b ASSIGNED - \b SUCCESSFULLY";
            response.sendRedirect("assignAsset.jsp?msg=" +msg);
		   }
		
		 }catch (Exception e)
		        {
		    	e.printStackTrace();
		    	}
		 finally 
		        {
		    	conn.close();
		    	}
%>
</body>
</html>