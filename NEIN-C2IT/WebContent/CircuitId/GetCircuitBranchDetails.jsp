<%@ page import="java.sql.*"%>  
<%@page import="CON2.Connection2" %>
   <%
    String name=null;
    Connection conn = null; 
    Connection2 dbConn = new Connection2();
    conn = dbConn.getConnection2();
    String s=request.getParameter("circuitid");  
    String buffer="<div id='resultFromAjax2' style='display:none;'>";
   
    String nickName="",ImpactedMPLS="",ImpactedMPLSIds="",circuitId="";
    int br_id=0;
    
           try
             {  
	            
               Statement stmt = conn.createStatement();  
               
               Statement stmt1 = conn.createStatement(); 
               Statement stmt2 = conn.createStatement(); 
                   
               ResultSet rs = stmt.executeQuery("SELECT c.`id`, c.`circuit_Id`, c.`linktype_id`, c.`branch_id`, c.`lanpool`,"+
							        	 	    " c.`wanpool`, c.`Acc_relation_no`, c.`bandwidth`, c.`media`, c.`arc`, c.`otc`,"+
							        	 	    " b.`b_name`,b.b_no,c.isp_name,c.ImpactedMPLS,c.nickName "+
							        		    " FROM `circuitidmaster_details` c "+
							        		    " INNER JOIN `branch_master` b ON b.`id`=c.`branch_id` where c.`circuit_Id`='" + s + "'");
               while(rs.next())
                      { 
            	          
            	          //circuitId=rs.getString("circuit_Id"); 
            	          nickName=rs.getString("nickName"); 
            	          ImpactedMPLSIds=rs.getString("ImpactedMPLS");
            	          br_id=rs.getInt("branch_id"); 
            	          
            	       buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>";
	                   buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(2)+"'>";
	                   buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(3)+"'>";
	                   buffer = buffer + "<input type='text' id='p4' value='"+rs.getString(12)+"'>";
	                   buffer = buffer + "<input type='text' id='p5' value='"+rs.getString(5)+"'>";
	                   buffer = buffer + "<input type='text' id='p6' value='"+rs.getString(6)+"'>";
	                   buffer = buffer + "<input type='text' id='p7' value='"+rs.getString(7)+"'>";
	                   buffer = buffer + "<input type='text' id='p8' value='"+rs.getString(8)+"'>";
	                   buffer = buffer + "<input type='text' id='p9' value='"+rs.getString(9)+"'>";
	                   buffer = buffer + "<input type='text' id='p10' value='"+rs.getString(10)+"'>";
	                   buffer = buffer + "<input type='text' id='p11' value='"+rs.getString(11)+"'>";
	                   buffer = buffer + "<input type='text' id='p12' value='"+rs.getString(4)+"'>";
	                   buffer = buffer + "<input type='text' id='p13' value='"+rs.getString(13)+"'>";
	                   buffer = buffer + "<input type='text' id='p14' value='"+rs.getString("isp_name")+"'>";
	                   buffer = buffer + "<input type='text' id='p16' value='"+rs.getString("b_name")+"'>";
	                   
                      }  
              
               
               if(ImpactedMPLSIds == null){
            	   ImpactedMPLSIds="0";
   		        }
   		       
               String ImpactedMPLSIds1=ImpactedMPLSIds;
               ResultSet rs1 = stmt1.executeQuery("select * from circuitidmaster_details where id in ("+ImpactedMPLSIds1+") ORDER BY branch_id");
               
               
               while(rs1.next()){
            	   if(ImpactedMPLS == ""){
            		   ImpactedMPLS=rs1.getString("nickName");
            	   }
            	   else{
            		   ImpactedMPLS=ImpactedMPLS+","+rs1.getString("nickName");
            	   }
            	   
               }
               buffer = buffer + "<input type='text' id='p15' value='"+ImpactedMPLS+"'>";
               

               buffer=buffer+"</div>";            
               response.getWriter().print(buffer);
          
                     } catch(Exception e)
                     {   
                     System.out.println(e);
                     } 
               finally
                 {
            	  conn.close();
		         }
               
%>  