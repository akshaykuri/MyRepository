package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageCheckList {
String driver;
	Date gdate = null;
	public String getMailMessage(String cs_id)
	{     
	StringBuffer stringBuffer = new StringBuffer();
		Connection con = null;
		PreparedStatement pst = null,pst2=null,pst3=null,pst4=null,pst5=null,pst6=null,pst7=null,pst8=null,pst9=null,pstt1=null,pstt2=null,pstt3=null,pstt4=null;   
		ResultSet resultSet = null,rs2 = null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null,rst1=null,rst2=null,rst3=null,rst4=null;
		try{ 
		System.out.println("value of MR ID "+cs_id);
		Connection2 dbConn = new Connection2();
		con = dbConn.getConnection2();
		//pst= con.prepareStatement("SELECT mr_date FROM mr_master where mr_id=?");
		pst= con.prepareStatement("SELECT cs_id,cs_date FROM cs_master where cs_id=?");
		pst.setString(1,cs_id);
		
		//pst.setString(1,"NEIN/MR/90-171");
		 
	resultSet = pst.executeQuery();
		System.out.println("before while");
		while(resultSet.next()){
			
			System.out.println("inside while");
			//driver = resultSet.getString(1);
			
			gdate = resultSet.getDate(2);
			//gdate = resultSet.getString(1);
			System.out.println("date in mail message"+gdate);
			  
		}
	 
       

      // String textArea1,textArea2,textArea3,textArea4,VendorText,rupes,taxes,desg,emp,po_date,theName,delivery,paytrm,warranty,orderval,vat1,vat2,totalcon,vattext,abcvat1,vat3,nmrupees,abc1,abc2,abc3,abc4,termscond,tarea2,tarea22,tarea3,tarea33,tarea4,tarea44,transid,itemhead;
      //String idextend,mr_id,mr_name,mr_approved,mr_discuss,mr_date,e_name,e_designation,totalcon,desg,emp,theName,transid,mr_remarks,mr_remarks2,mr_remarks3,mr_remarks4,emp2,desg2,emp3,desg3,emp4,desg4,stauts;
      //String idextend,mr_id,mr_name,mr_approved,mr_date,mr_discuss,e_name,e_designation,totalcon,mr_itemName,mr_asset,mr_itemQuantity,mr_abbreviation,mr_itemRate,desg,emp,theName,transid,mr_remarks,stauts,mail;
		//String cm_date,idextend,complain_id,cm_name,cm_location,cm_type,cm_problem,desg,emp,transid;
		    stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
		    					"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
		    		             "<head >"+
		    		             "<jsp:useBean id =con class=CON2.Connection2 />"+
		    		        
		    		           
		    		             /*"<center>--------------------------------------------------------------</center>"+*/
		    		             "__________________________________________________________________________________________________________________________________________________"+
		    		             "<br>"+
		    		          
		    		             " "+
		    		             "<table border=\"0\" width=\"900\"><tr><td>"+
		    		             "<center>"+
		    		             "<label><font color=\"black\"><u><b>IT CHECK SHEET</b></u></font></label> <br />"+
		    		             "</center></td></tr></table>"+
		    						"<br><br>");
		    						
		    						 pstt1 = con.prepareStatement("select * from cs_master where cs_id=?");
		    			            pstt1.setString(1, cs_id);
		    			            rst1 = pstt1.executeQuery();
		    			            System.out.println("hhhhhhhhh"+cs_id);
		    			           while(rst1.next()){
		    							
		    							        String city = rst1.getString("city");
		    							        String cs_date =rst1.getString("cs_date");
		    							        String cs_time = rst1.getString("cs_time");
		    							        System.out.println("cityhhhhhhhhhhhhhhhhh"+city);
		    							        String ps_raw = rst1.getString("ps_raw");
		    							        String ps_upworking = rst1.getString("ps_upsworking");
		    							        String ps_upsbackup = rst1.getString("ps_upsbackup");
		    							        String ps_upspreventive = rst1.getString("ps_upspreventive");
		    							        String si_working = rst1.getString("si_working");
		    							        System.out.println("cs master 1 master"+cs_date);
		    							        stringBuffer.append(
		    							        		"<table border=\"0\" width=\"900\">"+

		    							        		"<tr>"+
		    							        		"<td>CheckSheet No.:<textarea id=\"idcs_id\" name=\"cs_id\" rows=\"1\">"+cs_id+"</textarea></td>"+
		    							        		"<td align=\"right\">Location:<textarea id=\"idcity\" name=\"city\" rows=\"1\">"+city+"</textarea></td>"+
		    							        		"</tr>"+
		    							        		"<tr >"+
		    							        		"<td >Creation Date (dd/mm/yyyy):  <textarea id=\"idcs_date\" name=\"cs_date\" rows=\"1\">"+cs_date+"</textarea></td>"+
		    							        		"<td align=\"right\">Creation Time:   <textarea id=\"idcs_time\" name=\"cs_time\" rows=\"1\">"+cs_time+"</textarea></td>"+
		    							        		"</tr>"+

		    							        		"</table>"+
		    							        		"<br />"+

		    							        		"<table border=\"2\" cellspacing=\"1\" width=\"900\">"+

		    							        		"<tr>"+
		    							        		"<td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center>1</center></td>"+
		    							        		"<td >&nbsp;Power supply </td><td width=\"443\"></td></tr>"+
		    							        		"<tr>"+
		    							        			"<td width=\"30\" align=\"center\" rowspan=\"5\"><center></center></td>"+
		    							        			"<td colspan=\"2\">&nbsp;RAW Power Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		    							        				"<input type =\"text\" name = \"ps_raw\" value ="+ps_raw+" /></td>"+
		    							        		"</tr>"+
		    							        		"<tr>"+
		    							        			"<td colspan=\"2\">&nbsp;UPS Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		    							        		        "<input type =\"text\" name = ps_upsworking value ="+ps_upworking+" readonly=\"readonly\" /></td>"+
		    							        		"</tr>"+
		    							        		"<tr>"+
		    							        			"<td colspan=\"2\">&nbsp;UPS Backup Time(To be checked weekly once)</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		    							        				"<input type =\"text\" name = ps_upsbackup value ="+ps_upsbackup+"  />hours</td>"+
		    							        		"</tr>"+ 

		    							        		 "<tr>"+
		    							        		 	"<td colspan=\"2\"  height=\"20\">&nbsp;UPS Preventive Maintenance<br />(to be checked 3 months once) </td>"+
		    							        		    "<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		    							        				"<input type =\"text\" name = ps_upspreventive value ="+ps_upspreventive+" readonly=\"readonly\" /></td>"+
		    							        		"</tr>"+ 
		    							        		 "<tr></tr>"+
		    							        		 
		    							        		"<tr>"+
		    							        		"<td width=\"25\" align=\"center\" height=\"5\" colspan=\"2\"><center>2</center></td>"+

		    							        		"<td>&nbsp;Server Status ( HO only)</td><td width=\"100\"></td></tr>"+
		    							        		"<tr>"+
		    							        			"<td width=\"14\" align=\"center\" rowspan=\"1\"><center></center></td>"+
		    							        			"<td colspan=\"2\">&nbsp;Working</td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		    							        				"<input type =\"text\" name = si_working value ="+si_working+" readonly=\"readonly\" /></td>"+
		    							        		"</tr></table>"+
		    							        		
		    							        		
		    							        		
		    							        		
		    							        "<table class=\"dynatable\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\" >"+
		    									"<tr><td width=\"36\"   height=\"21\" ></td>"+
		    									    "<td width=\"10\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
		    										"<td width=\"213\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>HDD SPACE</td>"+				
		    										"<td width=\"213\" align=\"center\"  height=\"21\" >DRIVES</td>"+
		    										"<td width=\"213\" align=\"center\"  height=\"21\" >USED</td>"+
		    										"<td width=\"213\" align=\"center\"  height=\"21\" >Free Space</td>"+
		    										
		    									"</tr>");
		    							        int i=0;
		    							        
		    							        pst2 = con.prepareStatement("select * from serveritem where si_cs_id=? ORDER BY id ASC");
		    		    			            pst2.setString(1, cs_id);
		    		    			            rs2 = pst2.executeQuery();
		    						            while(rs2.next()){
		    						            	
		    						            	        String si_drive = rs2.getString("si_drive");
		    						            	        String si_harddisk =rs2.getString("si_harddisk");
		    						            	        String si_usedspace = rs2.getString("si_usedspace");
		    						            	        String si_freespace = rs2.getString("si_freespace");
		    						            	       i++;
		    						            	       String si_driveN = "idsi_harddisk";
		    						            	       System.out.println("server master"+si_drive);
		    						     stringBuffer.append(
		    						    		 "<tr class=\"prototype\">"+
		    									   "<td width=\"36\"  height=\"21\" ></td>"+
		    									   
		    										"<td width=\"10\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"id[]\" value="+i+" size=1 class=\"id\" /></td>"+		
		    										"<td width=\"217\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"si_harddisk\" size=\"10\" value="+si_harddisk+" id=\"idsi_harddisk\" style=\"background:lightgrey;\" />"+	 
		    										"</td>"+
		    					                      "<td width=\"217\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"si_drive\" size=\"10\" value="+si_drive+" id=\"idsi_harddisk\" style=\"background:lightgrey;\" />"+	 
		    										"</td>"+
		    										"<td width=\"218\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"si_usedspace\" size=\"10\" value="+si_usedspace+" class=\"incRate\" style=\"background:lightgrey;\" /></td>"+ 
		    										"<td width=\"218\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"si_freespace\" size=\"10\" value="+si_freespace+" class=\"incRate\" style=\"background:lightgrey;\" /></td>"+      
		    									"</tr>");
		    						            }
		    						            stringBuffer.append("</table>"+
		    						            		"<table border=\"1\" cellspacing=\"1\" width=\"900\">"+

		    						            		"<tr>"+
		    						            		"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>3</center></td>"+

		    						            		"<td width=\"390\">&nbsp;MPLS VPN </td><td width=\"445\"></td></tr>"+

		    						            		"</table>"+
		    						            		"<table class=\"dynatable2\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\" >"+
		    						        			
		    						    				"<tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		    						    				   "<td width=\"20\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
		    						    					"<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>LOCATION</td>"+				
		    						    					"<td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" >Downtime:<br /> (if NO, pls. specify total no. of hours down)</td>"+
		    						    				"</tr>");     
		    						            int j=0;
		    						            pst3 = con.prepareStatement("select * from mpls_item where mi_cs_id=? ORDER BY id ASC");
		    		    			            pst3.setString(1, cs_id);
		    		    			            rs3 = pst3.executeQuery();
		    						            
		    						            
		    						            while(rs3.next()){
		    						            	
		    						            	        String mpls_name = rs3.getString("mpls_name");
		    						            	        String mpls =rs3.getString("mpls");
		    						            	        String mpls_remarks = rs3.getString("mpls_remarks");
		    						            	        System.out.println("mpls master"+mpls_name);
		    						            	       j++;
		    						            	       String mpls_nameN = "idmpls_name";
		    						         stringBuffer.append("<tr class=\"prototype2\">"+
		    						        		 	"<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		    						        		 	"<td width=\"20\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"id2[]\" value="+j+" size=1 class=\"id2\" /></td>"+					
		    						        		 	"<td width=\"345\" align=\"center\"  height=\"21\" >"+mpls_name+"</td>"+
		    						        		 	"<td width=\"100\" align=\"center\"  height=\"21\" >"+mpls+"</td>"+
		    						        		 	"<td width=\"245\" align=\"center\"  height=\"21\" >"+mpls_remarks+"</td>"+     
		    						        		 	"</tr>");
		    						                               }
		    						            
		    					stringBuffer.append("</table>"+
		    						        		   "<table border=\"2\" cellspacing=\"1\" width=\"900\">"); 
		    						           
		    						           
		    						           pstt2 = con.prepareStatement("select isp_router from cs_master where cs_id=?");
		    		    			            pstt2.setString(1, cs_id);
		    		    			            rst2 = pstt2.executeQuery();
		    						           while(rst2.next()){
		    						           	 String isp_router = rst2.getString("isp_router");  
		    						           	System.out.println("csmaster master"+isp_router);
		    						           	 stringBuffer.append("<tr>"+
		    						        	"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>4</center></td>"+
		    						        	"<td width=\"300\" >&nbsp;ISP (MPLS VPN)Router</td>"+
		    						        	"<td width=\"40\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		    						        		"<input type =\"text\" name = isp_router value ="+isp_router+" /></td>"+
		    						                                 "</tr>");
		    						           }
		    						           
		    			      	stringBuffer.append("<tr>"+
		    			      					"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>5</center></td>"+
		    			      					"<td width=\"435\" >&nbsp;INTERNET CONNECTION</td><td width=\"400\"></td>"+
		    			      					"</tr>"+
		    			      					"</table>"+
		    			      					"<table class=\"dynatable3\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\"  bgcolor=\"\">"+
		    			      					"<tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		    			      					"<td width=\"60\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
		    			      					"<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>INTERNET</td>"+				
		    			      					"<td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" ></td>"+
		    			      					"</tr>");		           
		    						            	       
		    			      					int k=0;
		    			      					pst4 = con.prepareStatement("select * from internet_item where ii_cs_id=? ORDER BY id ASC"); 
		    			      					pst4.setString(1,cs_id);
		    			      					rs4=pst4.executeQuery();
		    			      					while(rs4.next()){
					            	
		    			      						String int_name = rs4.getString("int_name");
		    			      						String internet =rs4.getString("internet");
		    			      						k++;
		    			      						System.out.println("internet master"+int_name);
		    			      						String int_nameN = "idint_name";	            	       
					            	   stringBuffer.append("<tr class=\"prototype3\">"+
					            			   "<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
					            			   "<td width=\"60\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"id3[]\" value="+k+" size=1 class=\"id3\" ></td>"+					
					            			   "<td width=\"320\" align=\"center\"  height=\"21\" ><input type=\"text\" class=\"incinternet\" id=\"idint_name\" value="+int_name+"></td>"+
					            			   "<td width=\"100\" align=\"center\"  height=\"21\" ><input type=\"text\" class=\"incinternet\"  value="+internet+"></td>"+
					            			   "<td width=\"245\" align=\"center\"  height=\"21\" ></td>"+      
					            	   		   "</tr>");   	 
		    			      										}
		    			      					
		    			      					
		    			      stringBuffer.append("</table><table border=\"2\" cellspacing=\"1\" width=\"900\">"+
		    			    		  			"<tr>"+
		    			    		  			"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>6</center></td>"+
		    			    		  			"<td width=\"390\" >&nbsp;SERVER BACKUP</td><td width=\"445\"></td>"+
		    			    		  			"</tr>"+
		    			    		  			"</table>"+

		    			    		  			"<table class=\"dynatable4\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\"  bgcolor=\"\">"+
		    			    		  			"<tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		    			    		  			"<td width=\"60\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
		    			    		  			"<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>Server Backup Details</td>"+				
		    			    		  			"<td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" ></td>"+
		    			    		  			"</tr>");					
		    						            	       
		    			      int l=0;
					            				pst5 = con.prepareStatement("select * from backup_item where bi_cs_id=? ORDER BY id ASC"); 
		      									pst5.setString(1,cs_id);
		      									rs5=pst5.executeQuery();       
		      									while(rs5.next()){
		      											String bkup_name  = rs5.getString("bkup_name");
		      											String bkup =rs5.getString("bkup");
		      											l++;
		      											System.out.println("backup master"+bkup_name);
		      											String int_nameN = "idint_name"; 
		      				   stringBuffer.append("<tr class=\"prototype4\">"+
		      						   			"<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      						   			"<td width=\"60\" align=\"center\"  height=\"21\" ><input type=\"text\" name=\"id4[]\" value="+l+" size=1 class=\"id4\" /></td>"+					
		      						   			"<td width=\"320\" align=\"center\"  height=\"21\" >"+bkup_name+"</td>"+
		      						   			"<td width=\"100\" align=\"center\"  height=\"21\" >"+bkup+"</td>"+
		      						   			"<td width=\"245\" align=\"center\"  height=\"21\" ></td>"+      
		      						   			"</tr>");			
		      									}
		      									
		      				  stringBuffer.append("</table>");
		      				pstt3 = con.prepareStatement("select * from cs_master where cs_id=?");
		      				pstt3.setString(1,cs_id);
		      				rst3 = pstt3.executeQuery();
		      				while(rst3.next()){
		      					
		      					        String udb = rst3.getString("udb");
		      					        String cr_working =rst3.getString("cr_working");
		      					        String wg_firewall = rst3.getString("wg_firewall");
		      					        
		      					        String fdb = rst3.getString("fdb");
		      					        String ln_server = rst3.getString("ln_server");
		      					        String NEWINS = rst3.getString("NEWINS");
		      					        String sr_ac = rst3.getString("sr_ac");
		      					        String tm = rst3.getString("tm");
		      					      System.out.println("cs _master 3 master"+udb);
                           stringBuffer.append("<table border=\"2\" cellspacing=\"1\" width=\"900\">"+
                        	/*	   "<tr>"+
                        		   "<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>7</center></td>"+
                        		   "<td width=\"390\" >&nbsp;User Data backup taken(Automatic user backup)<br /> (weekly sheduled backup)</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		   "<input type =\"text\" name = udb value ="+udb+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
                        		   "</tr>"+*/
                        		   "<tr>"+
                        		   "<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>8</center></td>"+
                        		   "<td width=\"390\" >&nbsp;SAOBB IPVPN & SDWAN Router Working(HO Only)</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		   "<input type =\"text\" name = cr_working value ="+cr_working+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
                        		  " </tr>"+
                        		   "<tr>"+
                        		   "<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>9</center></td>"+
                        		   "<td width=\"390\" >&nbsp;FortiGate 400D Firewall Working(HO Only)</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		  " <input type =\"text\" name = wg_firewall value ="+wg_firewall+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
                        		   "</tr>"+
                        	/*	  " <tr>"+
                        		  " <td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>10</center></td>"+
                        		   "<td width=\"390\" >&nbsp;Firewall Database (10.206.10.11) - (HO only)</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		   "<input type =\"text\" name = fdb value ="+fdb+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
                        		   "</tr>"+*/
                        		   "<tr>"+
                        		   "<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>11</center></td>"+
                        		   "<td width=\"390\" >&nbsp;Office 365/Microsoft Teams/SharePoint(Working)</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		   "<input type =\"text\" name = ln_server value ="+ln_server+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
                        		   "</tr>"+
                        		   "<tr>"+
                        		   "<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>12</center></td>"+
                        		   "<td width=\"390\" >&nbsp;NEWINS/NExAS/GS-NET/NEx-GLOW(Working)</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		   "<input type =\"text\" name = NEWINS value ="+NEWINS+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
                        		   "</tr>"+
                        		  "<tr>	"+
                        		   "<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>13</center></td>"+
                        		   "<td width=\"390\" >&nbsp;Server Room AC (Working) <br /> Temperature Maintained</td><td width=\"445\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        		   "<input type =\"text\" name = sr_ac value ="+sr_ac+" readonly=\"readonly\" onclick=\"popup();\"/><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type =\"text\" size=\"30\" name = \"tm\" value ="+tm+"  />"+
                        		"</td>"+
                        		   "</tr>");
		      				}
		      				stringBuffer.append("</table><table border=\"2\" cellspacing=\"1\" width=\"900\">"+
		      						"<tr>"+
		      						"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>14</center></td>"+
		      						"<td width=\"390\" >&nbsp;Photocopier</td><td width=\"445\"></td>"+
		      						"</tr>"+
		      						"</table>"+
		      						"<table class=\"dynatable5\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\"  bgcolor=\"\">"+
		      						"<tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      						"<td width=\"60\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
		      						"<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>Photocopier Details</td>"+				
		      						"<td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" ></td>"+
		      						"</tr>");
		      						int m=0;
				          
		      					pst6 = con.prepareStatement("select * from photocopier_item where pi_cs_id=? ORDER BY id ASC"); 
								pst6.setString(1,cs_id);
								rs6=pst6.executeQuery();
								while(rs6.next()){
										String phto_name  = rs6.getString("phto_name");
				            	        String phto =rs6.getString("phto");
				            	        System.out.println("photocopier master"+phto_name);
				            	       	m++;
		      				stringBuffer.append("<tr class=\"prototype5\">"+
		      						"<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      						"<td width=\"60\" align=\"center\"  height=\"21\" >"+m+"</td>"+					
		      						"<td width=\"320\" align=\"center\"  height=\"21\" >"+phto_name+"</td>"+
		      						"<td width=\"100\" align=\"center\"  height=\"21\" >"+phto+"</td>"+
		      						"<td width=\"245\" align=\"center\"  height=\"21\" ></td>"+      
		      						"</tr>");
								}
								
								
						stringBuffer.append("</table>"+
								"<table border=\"2\" cellspacing=\"1\" width=\"900\">"+
								"<tr>"+
								"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>15</center></td>"+
								"<td width=\"390\" >&nbsp;Printer(Laser Jet /Dot Matrix)</td><td width=\"445\"></td>"+
								"</tr>"+
								"</table>"+
								"<table class=\"dynatable6\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\"  bgcolor=\"\">"+
								"<tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
								"<td width=\"60\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
								"<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>Printer Details</td>"+				
								"<td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" ></td>"+
								"</tr>");		
		      				
								int n=0;
								pst7 = con.prepareStatement("select * from printer_item where prt_cs_id=? ORDER BY id ASC"); 
								pst7.setString(1,cs_id);
								rs7=pst7.executeQuery();
					            
					           
					            while(rs7.next()){
					            			String prt_name  = rs7.getString("prt_name");
					            	        String prt =rs7.getString("prt");
					            	        System.out.println("printer master"+prt_name);
					            	       	n++;
		      				stringBuffer.append("<tr class=\"prototype6\">"+
		      					"<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      					"<td width=\"60\" align=\"center\"  height=\"21\" >"+n+"</td>"+					
		      					"<td width=\"320\" align=\"center\"  height=\"21\" >"+prt_name+"</td>"+
		      					"<td width=\"100\" align=\"center\"  height=\"21\" >"+prt+"</td>"+
		      					"<td width=\"245\" align=\"center\"  height=\"21\" ></td> "+     
		      					"</tr>");
					            }
					            
					       stringBuffer.append("</table>"+
					    		  " <table border=\"2\" cellspacing=\"1\" width=\"900\">"+
					    		  " <tr>"+
					    		  " <td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>16</center></td>"+
					    		  " <td width=\"390\" >&nbsp;Fax Machines</td><td width=\"445\"></td>"+
					    		  " </tr>"+
					    		  " </table>"+
					    		  " <table class=\"dynatable7\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\"  bgcolor=\"\">"+
					    		  " <tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
					    		  " <td width=\"60\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
					    		   "<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>Fax Machines Details</td>"+				
					    		  " <td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" ></td>"+
					    		   "</tr");     
		      				
					    		   int o=0;
						            
						            pst8 = con.prepareStatement("select * from fax_item where fx_cs_id=? ORDER BY id ASC"); 
						            pst8.setString(1,cs_id);
						            rs8=pst8.executeQuery();
						            while(rs8.next()){
						            	        
						            	        String fx_name  = rs8.getString("fx_name");
						            	        String fx =rs8.getString("fx");
						            	       	o++;
						            	       	System.out.println("fax master"+fx_name);
		      				stringBuffer.append("<tr class=\"prototype7\">"+
		      						"<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      						"<td width=\"60\" align=\"center\"  height=\"21\" >"+o+"</td>"+					
		      						"<td width=\"320\" align=\"center\"  height=\"21\" >"+fx_name+"</td>"+
		      						"<td width=\"100\" align=\"center\"  height=\"21\" >"+fx+"</td>"+
		      						"<td width=\"245\" align=\"center\"  height=\"21\" ></td> "+     
		      						"</tr>");
						            }
						            
		      				stringBuffer.append("</table>"+
		      						"<table border=\"2\" cellspacing=\"1\" width=\"900\">"+
		      						"<tr>"+
		      						"<td width=\"65\" align=\"center\" height=\"5\" colspan=\"2\"><center>17</center></td>"+
		      						"<td width=\"390\" >&nbsp;Barcode Scanner/Printer</td><td width=\"445\"></td>"+
		      						"</tr>"+
		      						"</table>"+
		      						"<table class=\"dynatable8\" border=\"2\" cellspacing=\"1\" width=\"900\" style=\"height: 150\"  bgcolor=\"\">"+
		      						"<tr><td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      						"<td width=\"60\" align=\"center\"  height=\"21\" >SL<br />NO.</td>"+
		      						"<td width=\"320\" align=\"center\"  height=\"21\" ><font color=\"red\" size=\"4\">*</font>Barcode Scanner/Printer Details</td>	"+			
		      						"<td width=\"445\" align=\"center\"  height=\"21\" colspan=\"4\" ></td>"+
		      						"</tr>");
		      						
						            pst8 = con.prepareStatement("select * from barcode_item where br_cs_id=? ORDER BY id ASC"); 
						            pst8.setString(1,cs_id);
						            rs8=pst8.executeQuery();int p=0;
						            while(rs8.next()){
						            	
						            	        String br_name  = rs8.getString("br_name");
						            	        String br =rs8.getString("br");
						            	        System.out.println("barcode master"+br_name);
						            	       	p++;
		      				stringBuffer.append("<tr class=\"prototype8\">"+
		      						"<td width=\"30\" align=\"center\"  height=\"21\" ></td>"+
		      						"<td width=\"60\" align=\"center\"  height=\"21\" >"+p+"</td>"+					
		      						"<td width=\"320\" align=\"center\"  height=\"21\" >"+br_name+"</td>"+
		      						"<td width=\"100\" align=\"center\"  height=\"21\" >"+br+"</td>"+
		      						"<td width=\"245\" align=\"center\"  height=\"21\" ></td>"+      
		      						"</tr>");
						            }
						      stringBuffer.append("</table>");      
						            pstt4 = con.prepareStatement("select * from cs_master where cs_id=?");
				      				pstt4.setString(1,cs_id);
				      				rst4 = pstt4.executeQuery();
						       
						            while(rst4.next()){
						            	
						            	        String tele = rst4.getString("tele");
						            	        String cctv =rst4.getString("cctv");
						            	        String cctv_backup = rst4.getString("cctv_backup");
						            	        
						            	        String access_con = rst4.getString("access_con");
						            	        String fire_a = rst4.getString("fire_a");
						            	        String fire_l = rst4.getString("fire_l");
						            	        String ids_w = rst4.getString("ids_w");
						            	        String ids_l = rst4.getString("ids_l");
						            	      
						            	        String ithardware_r = rst4.getString("ithardware_r");
						            	        String ithardware_n = rst4.getString("ithardware_n");
						            	        String preventive_e = rst4.getString("preventive_e");
						            	        String quarter_r = rst4.getString("quarter_r");
						            	        String main_remarks = rst4.getString("main_remarks");      
						            	        System.out.println("cs 4  master"+access_con);
						         stringBuffer.append("<table border=\"2\" cellspacing=\"1\" width=\"900\">"+
						        		" <tr>"+
						        		" <td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>18</center></td>"+
						        		 "<td width=\"408\" >&nbsp;Telephone EPABX /Lines</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		" <input type =\"text\" name = tele value ="+tele+" readonly=\"readonly\" onclick=\"popup();\"/></td>"+
						        		" </tr>"+
						        		 "<tr>"+
						        		" <td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>19</center></td>"+

						        		" <td width=\"408\">&nbsp;CCTV(Working)</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		" <input type =\"text\" name = cctv value ="+cctv+" readonly=\"readonly\" onclick=\"popup();\"/></td></tr>"+
						        		" <tr>"+
						        		" <td width=\"32\" align=\"center\" rowspan=\"1\"><center></center></td>"+
						        		" <td colspan=\"2\" width=\"408\">&nbsp;Backup(no. of days)</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = cctv_backup value ="+cctv_backup+"  onclick=\"popup();\"/></td>"+
						        		 "</tr>"+

						        		" <tr>"+
						        		" <td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>20</center></td>"+
						        		 "<td width=\"408\" >&nbsp;Access Controller(working)</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = access_con value ="+access_con+" readonly=\"readonly\"/></td>"+
						        		 "</tr>"+

						        		" <tr>"+
						        		" <td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>21</center></td>"+
						        		 "<td width=\"408\">&nbsp;Fire Alarm(Working)</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = fire_a value ="+fire_a+" readonly=\"readonly\" onclick=\"popup();\"/></td></tr>"+
						        		 "<tr>"+
						        		 "<td width=\"32\" align=\"center\" rowspan=\"1\"><center></center></td>"+
						        		 "<td colspan=\"2\" width=\"408\">&nbsp;When was last checked</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = fire_l value ="+fire_l+" /></td>"+
						        		 "</tr>"+

						        		" <tr>"+
						        		" <td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>22</center></td>"+
						        		 "<td width=\"408\">&nbsp;Intrusion Deduction System (IDS) (working)</td><td width=\"460\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = \"ids_w\" value ="+ids_w+" /></tr>"+
						        		 "<tr>"+
						        		 "<td width=\"32\" align=\"center\" rowspan=\"1\"><center></center></td>"+
						        		" <td colspan=\"2\" width=\"408\">&nbsp;When was last checked</td><td width=\"460\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = ids_l value ="+ids_l+" /></td>"+
						        		 "</tr>"+
						        		 "<tr>"+
						        		" <td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>23</center></td>"+
						        		 "<td width=\"408\">&nbsp;Any IT hardware under Repair(Pls. specify)</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = \"ithardware_r\" value ="+ithardware_r+" /></td></tr>"+
						        		 "<tr>"+
						        		 "<td width=\"32\" align=\"center\" rowspan=\"1\"><center></center></td>"+
						        		" <td colspan=\"2\" width=\"408\">&nbsp;Status or by it will be rectified and put into use</td><td  width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = \"ithardware_n\" value ="+ithardware_n+"  /></td>"+
						        		 "</tr>"+

						        		 "<tr>"+
						        		 "<td width=\"32\" align=\"center\" height=\"5\" colspan=\"2\"><center>24</center></td>"+
						        		 "<td width=\"408\">&nbsp;Preventive Maintenance (All IT equipment's)</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		 "<input type =\"text\" name = \"preventive_e\" value ="+preventive_e+" readonly=\"readonly\" onclick=\"popup();\"/></tr>"+
						        		 "<tr>"+
						        		 "<td width=\"32\" align=\"center\" rowspan=\"1\"><center></center></td>"+
						        		 "<td colspan=\"2\" width=\"408\">&nbsp;To be done every quater without fail <br />&nbsp; If No, provide reason</td><td width=\"460\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						        		"<input type =\"text\" name = \"quarter_r\" value ="+quarter_r+"></td>"+
						        		" </tr>"+

						        		" </table>"+
						        		 "<label>Remarks (If any)</label><br />"+main_remarks+"");   
		      				
						            }
						            stringBuffer.append("<table border=\"2\" cellspacing=\"1\" width=\"900\">");
						            
						            
						            pst9 = con.prepareStatement("select desg,emp,mail from cs_master where cs_id=?"); 
						            pst9.setString(1,cs_id);
						            rs9=pst9.executeQuery();
						            
						            while(rs9.next()){
						            	
						            	        String desg = rs9.getString("desg");
						            	        String emp =rs9.getString("emp");
						            	        String mail = rs9.getString("mail");
		      				stringBuffer.append("<tr>SENT TO:"+
		      						"<td><input type =\"text\" name = \"quarter_r\" value ="+desg+" />"+
		      						"<input type =\"text\" name = \"quarter_r\" value ="+emp+" />"+
		      						"</td>"+
		      						"</tr>"+
		      						"<tr>"+
		      						"<td>"+
		      						"<input type=\"text\" value= "+mail+"/>"+
		      						"</td>"+
		      						"</tr>  ");
						            }
		      				
		      				
		      				
		      				
		      				
		      				
					           stringBuffer.append("</table>" +
					        		   "<br><br>"+
						           		
						           		"<br>"+
						           		"<br>"+
						           		"__________________________________________________________________________________________________________________________________________________"+
						           		
						           		"<br><br>"+
						           		"<br><br>"+
						           	
						           		
						           		"<br><br>"+
						           		"<br><br>"+
						           		"</head>"+
						           		"</html>");   	
					           
				    				
		}
		}
		catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("catch   ---");
			  e.printStackTrace();
			  
			  System.out.println(e.toString());
		}
		finally{
			DbUtil.closeDBResources(null,pst,con);
			DbUtil.closeDBResources(rs2,pst2,null);
			DbUtil.closeDBResources(rs3,pst3,null);
			DbUtil.closeDBResources(rs4,pst4,null);
			DbUtil.closeDBResources(rs5,pst5,null);
			DbUtil.closeDBResources(rs6,pst6,null);
			DbUtil.closeDBResources(rs7,pst7,null);
			DbUtil.closeDBResources(rs8,pst8,null);
			DbUtil.closeDBResources(rs9,pst9,null);
			DbUtil.closeDBResources(rst1,pstt1,null);
			DbUtil.closeDBResources(rst2,pstt2,null);
			DbUtil.closeDBResources(rst3,pstt3,null);
			DbUtil.closeDBResources(rst4,pstt4,null);
			
		}
		//stringBuffer.delete(0, stringBuffer.length());
		//stringBuffer.setLength(0);
		//stringBuffer.setLength(1);
		return stringBuffer.toString();
	}
	
	
	public static void main(String[] args) {
		
		MailMessage mail = new  MailMessage();
		
	
		
		System.out.println(mail.getMailMessage("NEIN/CS-1"));
	}
}
