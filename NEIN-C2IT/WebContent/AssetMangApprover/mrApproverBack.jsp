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
	response.sendRedirect("adminlink.jsp?msg="+msgg);
}
</script>


</head>
<body>
<%

	//System.out.println("here.....");
	Connection conn = null,conn1 = null;
	Statement stlms=null,stmtmultidept=null;
	ResultSet rslms=null,rsmultidept=null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String db = "leavemanagement";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	PreparedStatement  psmt3 = null;
	String newidvalue = null,newidvalue1 = null;
	String[] item;
	String rde11=null,msg=null,allopt1="";
	int l = 0;
	int j = 0, i = 0,m;
	try 
	    {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url + dbName, userName,password);
		conn1 = DriverManager.getConnection(url+db,userName,password);
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		String levno=null,levname=null;
		String[] temp;
		String[] approvdept = new String[30];
		//String[] approvdept;
		String itnonit = request.getParameter("itnonit");
		String rmaster1 = request.getParameter("rmaster");
		String branch = request.getParameter("branch");
		String useroffice = request.getParameter("useroffice");
		System.out.println("IT/NON IT value " + itnonit);
		System.out.println("Branchvalue " + branch);
		String lno[] = request.getParameterValues("lno");
		//String lname[] = request.getParameterValues("lname");
		String empid[] = request.getParameterValues("empid");
		String allopt[] = request.getParameterValues("allop");
		String approveopt[] = request.getParameterValues("approvopt");
		String empname="",empbranch="",empdept="",empdesg="",empmailid="";
		l = lno.length;
		
		for (int k = 1; k < l; k++)
			   {
			    temp = lno[k].split("--");   
			    levno = temp[0];   
			    levname = temp[1];
			    int p=0;
			    //System.out.println("hereee " +p);
			    //System.out.println("hereee empid" +empid[k]);
			    String querymultidept = "SELECT distinct department_name	 from additional_departments where  emp_id ='"+empid[k]+"'";
			    stmtmultidept = conn1.createStatement();
				rsmultidept = stmtmultidept.executeQuery(querymultidept);
				while(rsmultidept.next())
				       { 
					   approvdept[p]=rsmultidept.getString(1);
					   //System.out.println("emp name" +approvdept[p]);
					   //System.out.println("emp name" +p);
					   p++;
				       }
				    
			    String query1 = "SELECT * from mrapprover where ( rmaster = '"+rmaster1+"' and levelno='"+levno+"' and itnonit='"+itnonit+"' and branch='"+branch+"'  and useroffice='"+useroffice+"' and empid ='" + empid[k] + "')";
			    stmt1 = conn.createStatement();
				rs = stmt1.executeQuery(query1);
				if(!rs.next())
				       { 
					   System.out.println("emp name" );
				       String query = "SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, u.email FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + empid[k] + "' ) AND u.employee_status = 'yes' ";
			   stlms = conn1.createStatement();
			   rslms = stlms.executeQuery(query);
			   if(rslms.next())
			       { 
				   empname=rslms.getString(1);
				   empbranch=rslms.getString(3);
				   empdesg=rslms.getString(2);
				   empdept=rslms.getString(4);
				   empmailid=rslms.getString(5);
				   System.out.println("emp name" + empname);
				   }
			    if(!empname.equals(""))
			       {
			    	if(p==0)
			    	     {
			              psmt3 = conn.prepareStatement("insert into mrapprover(levelno,levelname,itnonit,branch,empid,empname,empbranch,empdesg,empdept,empmailid,alloption,approvopt,useroffice,rmaster) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
			              psmt3.setString(1, levno);  
			              psmt3.setString(2, levname);
			              psmt3.setString(3, itnonit);
			              psmt3.setString(4, branch); 
			              psmt3.setString(5, empid[k]);
			              psmt3.setString(6, empname);
			              psmt3.setString(7, empbranch);
			              psmt3.setString(8, empdesg);
			              psmt3.setString(9, empdept);
			              psmt3.setString(10, empmailid);
			              psmt3.setString(11, allopt[k]);
			              psmt3.setString(12, approveopt[k]);
			              psmt3.setString(13, useroffice);
			              psmt3.setString(14, rmaster1);
			              j = psmt3.executeUpdate();
			              msg="Approver__inserted__successfully............";
			              empname="";empbranch="";empdesg="";empdept="";empmailid="";
			    	     }
			    	else
			    	     {
			    		  m=0;
			    		  while(m<p)
			    		      {
			    		      psmt3 = conn.prepareStatement("insert into mrapprover(levelno,levelname,itnonit,branch,empid,empname,empbranch,empdesg,empdept,empmailid,alloption,approvopt,useroffice,rmaster) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
			                  psmt3.setString(1, levno);  
			                  psmt3.setString(2, levname);
			                  psmt3.setString(3, itnonit);
			                  psmt3.setString(4, branch); 
			                  psmt3.setString(5, empid[k]);
			                  psmt3.setString(6, empname);
			                  psmt3.setString(7, empbranch);
			                  psmt3.setString(8, empdesg);
			                  psmt3.setString(9, approvdept[m]);
			                  psmt3.setString(10, empmailid);
			                  psmt3.setString(11, allopt[k]);
			                  psmt3.setString(12, approveopt[k]);
			                  psmt3.setString(13, useroffice);
			                  psmt3.setString(14, rmaster1);
				              
			                  j = psmt3.executeUpdate();
			                  msg="Approver__inserted__successfully............";
			                  
			                  m++;
			    		      }
			    		  empname="";empbranch="";empdesg="";empdept="";empmailid="";
			    	     }
			       }
			   else
			      {
				   msg="EmpID__'"+empid[k]+"'__Approver__not__inserted__successfully............";
			      }
				       }else
				       {}
			   }
		if (j!=0)
		   {
			response.sendRedirect("mrApprover.jsp?msg="+msg);
		   }
		else
		   {
			response.sendRedirect("mrApprover.jsp?msg="+msg);
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