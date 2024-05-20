<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>


</head>
<body>
<%
	//System.out.println("here.....");
	System.out.println("-------------  Asm Inv NOnIt DB -----------------");
	Connection conn = null,conn1 = null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	PreparedStatement prs2 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
	String newidvalue = null,newidvalue1 = null;
	String[] item;
	String rde11=null;
	String msg=null;
	int l = 0;
	int j = 0, i = 0;
	int incre = 0,incre1 = 0;
	int id = 100,id1 = 100;
	try 
	    {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url + dbName, userName,password);
		Statement stmt = conn.createStatement();
		String val0 = request.getParameter("abc3");
		String val1 = request.getParameter("abc4");
		String val2 = request.getParameter("txtCalendar");
		String val3 = request.getParameter("abc5");
		String val4 = request.getParameter("abc6");
		String val5 = request.getParameter("abc7");
		String val6 = request.getParameter("abc8");
		String val7 = request.getParameter("txtCalendar2");
		String val8 = request.getParameter("abc9");
		String InvBy =(String)session.getAttribute("Nname");

		System.out.println("idextend value " + val0);
		System.out.println("idextend value " + val1);
		System.out.println("idextend value " + val2);
		System.out.println("idextend value " + val3);
		System.out.println("idextend value " + val4);
		System.out.println("idextend value " + val5);
		System.out.println("idextend value " + val6);
		System.out.println("idextend value " + val7);
		System.out.println("idextend value " + val8);
		System.out.println("inventory done by : " + InvBy);
		//String id1[] = request.getParameterValues("id");
		//System.out.println("id value  :" + id1[1]);
		String astType1[] = request.getParameterValues("astType");
		l = astType1.length;
		String branch[] = request.getParameterValues("branchName1");
		//String subbranch[] = request.getParameterValues("Subcity");
		String waranty[] = request.getParameterValues("war");
		String expdate[] = request.getParameterValues("txtCalendar3");
		String remark[] = request.getParameterValues("remarks");
		prs3 = conn.prepareStatement("select * from asset_inventory where(PoNo='" + val1 + "' && InvNo='" + val3 + "'); ");
		rs1 = prs3.executeQuery();
		if(rs1.next())
	    {%> 
	            <script language="javascript"> //Java Script alert message 
	            alert("Your INVOICE no allready inserted of selected PO No..");
	            window.history.back();
	            </script>
		<%}
	else
		{
		prs2 = conn.prepareStatement("select max(idextend) as idd from asset_inventory ");
		rs = prs2.executeQuery();
		
		
		if (rs.next())
		    {
			int rde = rs.getInt("idd");
			System.out.println("idextend :" + rde);
			if (rde == 0)
			   {
				id = 100;
			   }
			else
			   {
				id = rs.getInt(1);
			   }
			incre = id + 1;
			newidvalue = "NEIN/INV-" + incre;
			System.out.println("NewID  value " + newidvalue);
			psmt2 = conn.prepareStatement("insert into asset_inventory(idextend,Inventory_No,InventoryDate,PoNo,PoDate,InvNo,InvDate,InvAmount,VName,VMobNo,VAddress,InventoryDoneBy) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			psmt2.setInt(1, incre);
			psmt2.setString(2, newidvalue);
			psmt2.setString(3, val0);
			psmt2.setString(4, val1);
			psmt2.setString(5, val2);
			psmt2.setString(6, val3);
			psmt2.setString(7, val7);
			psmt2.setInt(8, new Integer(val8));
			psmt2.setString(9, val4);
			psmt2.setString(10,val5);
			psmt2.setString(11, val6);
			psmt2.setString(12, InvBy);
			i=psmt2.executeUpdate();
			for (int k = 1; k < l; k++)
			   {
				System.out.println(astType1[k]);
				System.out.println(branch[k]);
				
				//System.out.println(subbranch[k]);
				System.out.println(val2);
				System.out.println(val7);
				prs4 = conn.prepareStatement("select max(idextend) as idd1 from asset_item where Branch='"+branch[k]+"'");
				rs2 = prs4.executeQuery();
				if (rs2.next())
			        {
				    int rde1 = rs2.getInt("idd1");
				    System.out.println("idextend :" + rde1);
				    if (rde1 == 0)
				          {
					       id1 = 100;
				          } 
				       else
				          {
					       id1 = rs2.getInt(1);
				           }
				     incre1 = id1 + 1;
				     }
				
				String at=astType1[k].substring(0,3);
				String at1=at.toUpperCase();
				newidvalue1 = "NEIN/"+at1+"/"+branch[k]+"-"+incre1;
			    System.out.println("New asset ID  value : " + newidvalue1);
			    
			   try
			   {
			    prbran = conn.prepareStatement("select m_b_name from branch_master_main where m_b_no='"+branch[k]+"'");
			    rs242 = prbran.executeQuery();
			    if (rs242.next())
		        {
				rde11 = rs242.getString("m_b_name");
		        }
				System.out.println("branch name : " + rde11);
			   }catch (Exception e)
		        {
		    	e.printStackTrace();
		    	}    
				
			 	psmt3 = conn.prepareStatement("insert into asset_item(idextend,Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,Remarks) values(?,?,?,?,?,?,?,?,?);");
				psmt3.setInt(1, incre1);
				psmt3.setString(2, newidvalue);  // Inventory no
				psmt3.setString(3, newidvalue1);  // Asset no
				psmt3.setString(4, astType1[k]);
				psmt3.setString(5, branch[k]);
				psmt3.setString(6, rde11);
				
				//psmt3.setString(6, subbranch[k]);
				psmt3.setInt(7, new Integer(waranty[k]));
				psmt3.setString(8, expdate[k]);
				psmt3.setString(9, remark[k]);
				j = psmt3.executeUpdate();
			    msg = "INSERTED__SUCCESSFULLY";
			    }
		}
		if (i!=0 && j != 0)
		   {
			response.sendRedirect("AsmInventoryNONIT.jsp?msg=" +msg);
			}
		if (i!=0 && j == 0)
		   {
			psmt4 = conn.prepareStatement("delete from asset_inventory where(Inventory_No='" + newidvalue + "');");
			psmt4.executeUpdate();
		   %> 
         <script language="javascript"> //Java Script alert message 
         alert("Sorry you dint entered asset details... ");
         window.history.back();
         </script>
		   <%}
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