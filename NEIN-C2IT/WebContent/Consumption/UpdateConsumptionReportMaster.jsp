<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<%
                String type=request.getParameter("type");
				String empno=request.getParameter("empno");
				String empname=request.getParameter("empname");
				String id1=request.getParameter("id");
				int id=Integer.parseInt(id1);
				String location=request.getParameter("location");
				int branchId=Integer.parseInt(location);
				String branchNo1=request.getParameter("branchNo");
				int branchNo=Integer.parseInt(branchNo1);
				String number=request.getParameter("number");
				String relationnumber=request.getParameter("relationnumber");
				String isptype=request.getParameter("isptype");
				String typename=request.getParameter("typename");
				String monthlycharges1=request.getParameter("monthlycharges");
				float monthlycharges=0;
				 if(monthlycharges1.isEmpty()){
					   monthlycharges=0;
				     }
				   else{
					  monthlycharges =Float.parseFloat(monthlycharges1);						
				      }
				
				String status=request.getParameter("status");
				
				String msg=null;
		int i=0;
		try
		{
			Connection conn = null;
			Connection2 dbConn = new Connection2();
			conn = dbConn.getConnection2();
			Statement st=null,st1=null;
			ResultSet rs=null,rs1=null; 
			
			
		/* 	String query1 = "select isptype from consumptionreportmaster where isptype='"+isptype+"' "+
                            "AND typename='"+typename+"'  AND empno='"+empno+"' AND number='"+number+"'";

	          st1 = conn.createStatement();
	          rs1 = st1.executeQuery(query1);
	          
	      if(!rs1.next()){ */
		     st=conn.createStatement();
			 i=st.executeUpdate("UPDATE `consumptionreportmaster` SET `isptype`='"+isptype+"',`typename`='"+typename+"',"+
					            "`empno`='"+empno+"',`empname`='"+empname+"',`branchId`='"+branchId+"',`branchNo`='"+branchNo+"',"+
					            "`number`='"+number+"',`relationnumber`='"+relationnumber+"',`monthlycharges`='"+monthlycharges+"',"+
					            "`status`='"+status+"',`type`='"+type+"' WHERE `id`='"+id+"'");
			 
		  }
	      /* else{
	    	  System.out.println("Already entered");
	    	  msg = " Data - \b IS - \b ALLREADY - \b EXIT ";
	    	  response.sendRedirect("DisplayConsumptionReportMaster.jsp");
	      } */
	  /*  } */
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally{
			 msg = " Data__IS__Updated";
			  response.sendRedirect("DisplayConsumptionReportMaster.jsp");
		}
		%>

