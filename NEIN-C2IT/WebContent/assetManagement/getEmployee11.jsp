<%@ page import="java.sql.*"%>  
  
   <%
    String name=null;
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "csdb";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "";
    String s=request.getParameter("EMP_NO");  
    // System.out.println("Value of S1 :"+s);
    int length = String.valueOf(s).length();
    int flag=0;
    String buffer="<div id='resultFromAjax1' style='display:none;'>";
    //System.out.println("Value of length S1 :"+length);
    Class.forName("com.mysql.jdbc.Driver").newInstance();  
    conn = DriverManager.getConnection(url+dbName,userName,password);  
    Statement stmt = conn.createStatement();  
    String query2="";
             try
               {  
	           ResultSet rs = stmt.executeQuery("select emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,idfile,level,dscpass,imei,isp,dcardtype,ABType,mobModelNo,mobSerialNo,mobDOI,emailAccess,mobRemarks,hardModNo,hardSerNo,hardDOI,cap,capType,hardRemarks,otherDesc,otherDOI,otherRemarks,atype,ano,asdoi,aconf,asremarks,shpath,scpathdoi,schpathrem,apcr,apcrdoi,apcrrem,mobileNo,SIMno,SIMProvided,lotusMod,lotusOwner,lotusIP,ftpAddress,ftpDOI,ftpRemarks,matype,mano,hatype,hano  from assignotherassetemp  where (EmpId ='" + s + "'); ");
               while(rs.next())
                      { 
            	          //  System.out.println("  test "+rs.getString(63));
	            	       buffer = buffer + "<input type='text' id='p11' value='"+rs.getString(1)+"'>";
		                   buffer = buffer + "<input type='text' id='p21' value='"+rs.getString(2)+"'>";
		                   buffer = buffer + "<input type='text' id='p31' value='"+rs.getString(3)+"'>";
		                   buffer = buffer + "<input type='text' id='p41' value='"+rs.getString(4)+"'>";
		                   buffer = buffer + "<input type='text' id='p51' value='"+rs.getString(5)+"'>";
		                   buffer = buffer + "<input type='text' id='p61' value='"+rs.getString(6)+"'>";
		                   buffer = buffer + "<input type='text' id='p71' value='"+rs.getString(7)+"'>";
	                   
		                   buffer = buffer + "<input type='text' id='p81' value='"+rs.getString(8)+"'>";
		                   buffer = buffer + "<input type='text' id='p91' value='"+rs.getString(9)+"'>";
		                   buffer = buffer + "<input type='text' id='p101' value='"+rs.getString(10)+"'>";
		                   buffer = buffer + "<input type='text' id='p111' value='"+rs.getString(11)+"'>";
		                   buffer = buffer + "<input type='text' id='p121' value='"+rs.getString(12)+"'>";
		                   buffer = buffer + "<input type='text' id='p131' value='"+rs.getString(13)+"'>";
		                   buffer = buffer + "<input type='text' id='p141' value='"+rs.getString(14)+"'>";
	               
		                   buffer = buffer + "<input type='text' id='p151' value='"+rs.getString(15)+"'>";
		                   buffer = buffer + "<input type='text' id='p161' value='"+rs.getString(16)+"'>";
		                   buffer = buffer + "<input type='text' id='p171' value='"+rs.getString(17)+"'>";
		                   buffer = buffer + "<input type='text' id='p181' value='"+rs.getString(18)+"'>";
		                   buffer = buffer + "<input type='text' id='p191' value='"+rs.getString(19)+"'>";
		                   buffer = buffer + "<input type='text' id='p201' value='"+rs.getString(20)+"'>";
		                   buffer = buffer + "<input type='text' id='p211' value='"+rs.getString(21)+"'>";
		                   buffer = buffer + "<input type='text' id='p221' value='"+rs.getString(22)+"'>";
		               
	                   		//p311,p711,p1111,p1811,p1812,p1813,p2111
		                  
	                   	   buffer = buffer + "<input type='text' id='p311' value='"+rs.getString(23)+"'>";
		                   buffer = buffer + "<input type='text' id='p711' value='"+rs.getString(24)+"'>";
		                   buffer = buffer + "<input type='text' id='p1111' value='"+rs.getString(25)+"'>";
		                   buffer = buffer + "<input type='text' id='p1811' value='"+rs.getString(26)+"'>";
		                   buffer = buffer + "<input type='text' id='p1812' value='"+rs.getString(27)+"'>";
		                   buffer = buffer + "<input type='text' id='p1813' value='"+rs.getString(28)+"'>";
		                   buffer = buffer + "<input type='text' id='p2111' value='"+rs.getString(29)+"'>";
	                   
	                 	  ////////////////////////////////
	                   
		                   buffer = buffer + "<input type='text' id='pa' value='"+rs.getString(30)+"'>";
		                   buffer = buffer + "<input type='text' id='pb' value='"+rs.getString(31)+"'>";
		                   buffer = buffer + "<input type='text' id='pc' value='"+rs.getString(32)+"'>";
		                   buffer = buffer + "<input type='text' id='pd' value='"+rs.getString(33)+"'>";
		                   buffer = buffer + "<input type='text' id='pe' value='"+rs.getString(34)+"'>";
		                   buffer = buffer + "<input type='text' id='pf' value='"+rs.getString(35)+"'>";
		               
		                   buffer = buffer + "<input type='text' id='pg' value='"+rs.getString(36)+"'>";
		                   buffer = buffer + "<input type='text' id='ph' value='"+rs.getString(37)+"'>";
		                   buffer = buffer + "<input type='text' id='pi' value='"+rs.getString(38)+"'>";
		                   buffer = buffer + "<input type='text' id='pj' value='"+rs.getString(39)+"'>";
		                   buffer = buffer + "<input type='text' id='pk' value='"+rs.getString(40)+"'>";
		                   buffer = buffer + "<input type='text' id='pl' value='"+rs.getString(41)+"'>";
		                   buffer = buffer + "<input type='text' id='pm' value='"+rs.getString(42)+"'>";
		                   buffer = buffer + "<input type='text' id='pn' value='"+rs.getString(43)+"'>";
		                   
		                   buffer = buffer + "<input type='text' id='q1' value='"+rs.getString(44)+"'>";
		                   buffer = buffer + "<input type='text' id='q2' value='"+rs.getString(45)+"'>";
		                   buffer = buffer + "<input type='text' id='q3' value='"+rs.getString(46)+"'>";
		                   buffer = buffer + "<input type='text' id='q4' value='"+rs.getString(47)+"'>";
		                   buffer = buffer + "<input type='text' id='q5' value='"+rs.getString(48)+"'>";
		                   buffer = buffer + "<input type='text' id='q6' value='"+rs.getString(49)+"'>";
		                   buffer = buffer + "<input type='text' id='q7' value='"+rs.getString(50)+"'>";
		                   buffer = buffer + "<input type='text' id='q8' value='"+rs.getString(51)+"'>";
		                   buffer = buffer + "<input type='text' id='q9' value='"+rs.getString(52)+"'>";
		                   buffer = buffer + "<input type='text' id='q10' value='"+rs.getString(53)+"'>";
		                   buffer = buffer + "<input type='text' id='q11' value='"+rs.getString(54)+"'>";
	                   
	                  
		                   // new fields 
		                 
		                 //  System.out.println("mobile Details :"+rs.getString(55)+rs.getString(56)+rs.getString(57));
		                //   System.out.println("lotus:"+rs.getString(58)+rs.getString(59)+rs.getString(60));
		                //   System.out.println("ftp Details :"+rs.getString(61)+rs.getString(62)+rs.getString(63));
		                  
		                   buffer = buffer + "<input type='text' id='mobileNo1' value='"+rs.getString(55)+"'>";
		                   buffer = buffer + "<input type='text' id='SIMno1' value='"+rs.getString(56)+"'>";
		                   buffer = buffer + "<input type='text' id='SIMProvided1' value='"+rs.getString(57)+"'>";
		                   buffer = buffer + "<input type='text' id='lotusMod1' value='"+rs.getString(58)+"'>";
		                   buffer = buffer + "<input type='text' id='lotusOwner1' value='"+rs.getString(59)+"'>";
		                   buffer = buffer + "<input type='text' id='lotusIP1' value='"+rs.getString(60)+"'>";
		                   buffer = buffer + "<input type='text' id='ftpAddress1' value='"+rs.getString(61)+"'>";
		                   buffer = buffer + "<input type='text' id='ftpDOI1' value='"+rs.getString(62)+"'>";
		                   buffer = buffer + "<input type='text' id='ftpRemarks1' value='"+rs.getString(63)+"'>";
		                 
		                   buffer = buffer + "<input type='text' id='matype' value='"+rs.getString(64)+"'>";
		                   buffer = buffer + "<input type='text' id='mano' value='"+rs.getString(65)+"'>";
		                   buffer = buffer + "<input type='text' id='hatype' value='"+rs.getString(66)+"'>";
		                   buffer = buffer + "<input type='text' id='hano' value='"+rs.getString(67)+"'>";
		                 
		                
		                   
		                   //new fieldss 
	                   
	                   
	                 }  
                       //  System.out.println("Value of Buffer :"+buffer);
                       buffer=buffer+"</div>";
                       //System.out.println("Value of Buffer :"+buffer);
                       response.getWriter().print(buffer);
                     }catch(Exception e)
                             {   
                             System.out.println(e);
                             } 
                      finally
                             {
            	             conn.close();
		                     }
   %>  