<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String Locname=request.getParameter("Locname");
String assignedLocation=request.getParameter("assignedLocation");
String assignedLocationNew[] = request.getParameterValues("assignedLocationNew");

String msg=null;
String Locpost = request.getParameter("Locpost");
String LocID = request.getParameter("idd");
String LocPWD = request.getParameter("Npwd");
String delet = request.getParameter("delet");
String mailId = request.getParameter("mailId");
/* System.out.println("num : "+num);
System.out.println("Locname : "+Locname);
System.out.println("assigned Location  : "+assignedLocation);
System.out.println("Locpost : "+Locpost);
System.out.println("LocID : "+LocID);
System.out.println("LocPWD : "+LocPWD);
System.out.println("delet : "+delet); */

Connection conn = null;
Statement st=null,st1=null;
PreparedStatement psmt = null,psmt2=null,psmt3=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 
	
	st=conn.createStatement();
	//int i = st.executeUpdate("update assigned_master set Locname='"+Locname+"',assignedLocation='"+assignedLocation+"' where id='"+num+"'");

    if(assignedLocationNew==null||assignedLocationNew[0]==null)
    {
    	 msg = "You__Have__Not__Selected__Any__Of__Sub__Branch. \\n \\n __ __ __ __ __ __ __ __ __ __ __ __ Try Again";
    }
	
    psmt2 = conn.prepareStatement("SELECT Locpost FROM handling_master WHERE Locpost=?");
	psmt2.setString(1,Locpost);
	ResultSet rs = psmt2.executeQuery();
	 
/* 	psmt3 = conn.prepareStatement("SELECT assignedLocation FROM handling_master WHERE assignedLocation=?");
	psmt3.setString(1,assignedLocation);
	ResultSet rs2 = psmt2.executeQuery(); */
	
	if(!rs.next() ){
		msg = "Sorry__Person__is__not__Athorized__to__be__added__in__this__module";
		response.sendRedirect("displayadmin.jsp?msg="+msg);
	}
	/* else if(rs2.next()){
		msg = "Location is Aready Available";
		response.sendRedirect("displayadmin.jsp?msg="+msg);
	} */
	else
	{
		
	psmt= conn.prepareStatement("update handling_master set Locname=?,assignedLocation=? where id=? AND Locpost=?");
	psmt.setString(1,Locname);
	psmt.setString(2,assignedLocation);
	psmt.setString(3,num);
	psmt.setString(4,"GENERAL MANAGER");
	
	int i = psmt.executeUpdate();
	System.out.println("i value in assignedLocationUpdate   :"+i);
	if(i >= 1){

		try{ System.out.println("inside for try");
		
		st1 = conn.createStatement();
       // System.out.println("st1"+st1);
		for(int k=0;k<assignedLocationNew.length;k++)
		{
			System.out.println("inside for loop"+assignedLocationNew[k]);
			st1.executeUpdate("insert into handling_master(Locname,Locpost,LocID,LocPWD,assignedLocation,delet,mailId) values('"+Locname+"','"+Locpost+"','"+LocID+"','"+LocPWD+"','"+assignedLocationNew[k]+"','"+delet+"','"+mailId+"')");
			 msg = "'"+Locname+"''s__location__Updates__Successfully ";
//			System.out.println("outside for loop");
		 }
		}
		catch(Exception e){


		     e.printStackTrace();
		}


		}
	else{
		 msg = "You__Have__Not__Selected__Any__Sub__Branch. ,,,,,,,,,,,,,,,,,,,,,,,,,,,\\n \\n __ __ __ __ __ __ __ __ __ __ __ __ Try Again";
		
	}
	
	
	
	//System.out.println("outside for loop"+msg);
	//response.sendRedirect("createBOMuser.jsp?msg="+msg);
	response.sendRedirect("displayadmin.jsp?msg="+msg);
	//response.sendRedirect("DisplayHandlingLocation.jsp?msg="+msg);
}

} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(null,st,conn);
	DbUtil.closeDBResources(null,st1,null);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);

			}%>

