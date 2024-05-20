<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2" %>

				<%
				String id=request.getParameter("id");
				String circuitId=request.getParameter("circuitid");
				String linktype=request.getParameter("linktype");
				String location=request.getParameter("location");
				String isp_name=request.getParameter("isp_name");
				String Lanpool=request.getParameter("Lanpool");
				String Wanpool=request.getParameter("Wanpool");
				String Account_Relationship=request.getParameter("Account_Relationship");
				String Bandwidth=request.getParameter("Bandwidth");
				String Media=request.getParameter("Media");
				String ARC=request.getParameter("ARC");
				String OTC=request.getParameter("OTC");
				String pono=request.getParameter("ponumber");
				String podate=request.getParameter("podate");
				String nickName=request.getParameter("nickName");
				String ImpactedMPLSIds=request.getParameter("ImpactedMPLSIds"); 
				
				int i=0;
				try
				{
				Connection conn = null;
				Connection2 dbConn = new Connection2();
				conn = dbConn.getConnection2(); 
				Statement st=null,st1=null;
				ResultSet rs=null;
				
			    st1=conn.createStatement();
				 i=st1.executeUpdate("update circuitidmaster_details set circuit_Id='"+circuitId+"',`linktype_id`='"+linktype+"',isp_name='"+isp_name+"',"+
						 "`branch_id`='"+location+"',`lanpool`='"+Lanpool+"',`wanpool`='"+Wanpool+"',`Acc_relation_no`='"+Account_Relationship+"',"+
						 "`bandwidth`='"+Bandwidth+"',`media`='"+Media+"',`arc`='"+ARC+"',`otc`='"+OTC+"',`po_number`='"+pono+"',`po_date`='"+podate+"',"+
						 "`ImpactedMPLS`='"+ImpactedMPLSIds+"',`nickName`='"+nickName+"'  where id='"+id+"'");
				 response.sendRedirect("DisplayCircuitIdMaster.jsp");
			}
			catch(Exception e)
			{
				System.out.println(e);
			}%>

