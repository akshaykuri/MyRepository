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
String Locpost = request.getParameter("designation4");
String LocID = request.getParameter("id4");
String LocPWD = request.getParameter("pwd4");
String delet = request.getParameter("branch4");
String mailid = request.getParameter("mail4");

Connection conn = null;
Statement st=null,st1=null;
PreparedStatement psmt = null,psmt2=null;
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
	
	psmt= conn.prepareStatement("update assigned_master set Locname=?,assignedLocation=? where id=?");
	psmt.setString(1,Locname);
	psmt.setString(2,assignedLocation);
	psmt.setString(3,num);
	
	int i = psmt.executeUpdate();
	System.out.println("i value in assignedLocationUpdate   :"+i);
	if(i >= 1){

		try{ System.out.println("inside for try");
		
		st1 = conn.createStatement();
        System.out.println("st1"+st1);
		for(int k=0;k<assignedLocationNew.length;k++)
		{
			System.out.println("inside for loop"+assignedLocationNew[k]);
			st1.executeUpdate("insert into assigned_master(Locname,Locpost,LocID,LocPWD,assignedLocation,delet,Nmail) values('"+Locname+"','"+Locpost+"','"+LocID+"','"+LocPWD+"','"+assignedLocationNew[k]+"','"+delet+"','"+mailid+"')");
			 msg = "Updates__Successfully ";
//			System.out.println("outside for loop");
		 }
		}
		catch(Exception e){


		     e.printStackTrace();
		}


		}
	else{
		 msg = "You__Have__Not__Selected__Any__Sub__Branch. \\n \\n __ __ __ __ __ __ __ __ __ __ __ __ Try Again";
		
	}
	
	
	
	//System.out.println("outside for loop"+msg);
	//response.sendRedirect("createBOMuser.jsp?msg="+msg);
	response.sendRedirect("DisplayDelHo.jsp?msg="+msg);
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(null,st,conn);
	DbUtil.closeDBResources(null,st1,null);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	

	}	%>

