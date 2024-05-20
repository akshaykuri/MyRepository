<%@page import="CON2.MailMessageRegistration"%>

<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.Date.*" %>
<%@page import="java.util.Locale" %>
<%@page import="CON2.Connection2" %> 

<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@page import="java.util.ResourceBundle"%>

<%@page import="sun.org.mozilla.javascript.internal.regexp.SubString"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>

<jsp:useBean id ="nonApproveMail" class="CON2.NonApprovMail" /> 
<jsp:useBean id ="successpoSender" class="CON2.ItNonitMailSender" /> 
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>

<jsp:useBean id = "con" class="CON2.Connection2" /> 



<jsp:useBean id = "pdf" class="com.ck.file.FileAttachment" /> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 

<html>
<head>
<meta charset="UTF-8">
</head>
<%! 
                  MailMessageRegistration mailMessage = new MailMessageRegistration();
                  Connection conn = null, conn1 = null,cn2=null,cn4=null,cn5=null; 
	              Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
	              ResultSet rs = null,rs4=null,rs5=null;
	              String message = null;
	              String convertdDate=null;
	             
	              %>
	              <%
	              cn2 = con.getConnection2();
	              st2 = cn2.createStatement();
	              PreparedStatement psmt=null,psmt2=null,psmt3=null,psmt4=null,psmt4it;
	              %>
	              
<%!
Date form_date=null;
String []fileName=null;
String itemName =null;
FileItem item = null;
ArrayList<String> filenameList;

String startDate=null,endDate=null, TstartDate=null,TendDate=null,DDendDate=null,  UstartDate=null, UendDate=null,  TDendDate=null;
String Delaydate="",Testing_Sdate=null,Testing_Edate=null,Tdelaydate=null,USdate=null,UEdate=null;


//form fields initialization
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,i_empid=null,form_no=null,f_date=null,mmdradio=null,
desg=null,emp=null,mail=null,empid1=null,levelno=null,txtmail_msg=null,Type=null,Subtype=null,developer=null,Sdate=null,
Edate=null,d_name=null,d_desg=null,d_mail=null,d_empid=null,d_level=null,Dradio=null,Tradio=null,Uradio=null,TLink=null,Udelaydate=null,
NSApplication=null,NSDept=null,NSDesc=null,Npath=null,CSApplication=null,CSModule=null,CSPatchChange=null,CSDesc=null,Cpath=null,
ename=null,edesg=null,email=null,eid=null,Phase=null,count=null,msg=null,feedback=null,Roempid1=null, Roname=null,
Rodesg=null,  Rolevelno=null,Romail=null,uatChanges=null,hidChanges=null,b_no=null,flowtype=null,CDSdate=null,CDEdate=null
,deveSD=null,deveED=null,Vradio=null,cdradio=null,ctradio=null,appname=null,cVersion=null,uVersion=null,CTEdate=null,UatMail=null,um="",um1="",UatMail1=null,um2="",um3="",uname=null,upass=null,flevel=null,
Hradio=null,Hemp=null,hsdate=null,hedate=null,HCradio=null, exdate=null,hcv=null,huv=null,hardCD=null,configradio=null,
patchname=null,issueradio=null,issuename=null,ci_Sdate=null,ci_Edate=null,Config_Sdate=null,Config_Edate=null,AdminSD=null,AdminED=null,patch=null,
DIfiles=null,DUFC=null,iemp_code=null,ifull_name=null,idepart=null,idesignation=null,id_resignation=null,UChang=null,
FpsLink=null, owner=null, team=null, ReqBy=null, IniBy=null,mempid=null, mname=null, mdesg=null, mmail=null;
String [] n=null;
String [] d=null;
String [] m=null;
String [] ii=null;
int c=0,j=0;





public String getMonthNumber(String month){
	if(month.equals("Jan")) return "01";
	if(month.equals("Feb")) return "02";
	if(month.equals("Mar")) return "03";
	if(month.equals("Apr")) return "04";
	if(month.equals("May")) return "05";
	if(month.equals("Jun")) return "06";
	if(month.equals("Jul")) return "07";
	if(month.equals("Aug")) return "08";
	if(month.equals("Sep")) return "08";
	if(month.equals("Oct")) return "10";
	if(month.equals("Nov")) return "11";
	if(month.equals("Dec")) return "12";
	return month;
	
	
	}


%>	              
	          
<%
String em1=null,em2=null,em=null,em3=null,KPmail="",kpName="",kpDesg="",kpId="";
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart) 
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try 
   {
	
	b_no = (String) session.getAttribute("b_no");
   items = upload.parseRequest(request);
   } catch (FileUploadException e) {
      e.printStackTrace();
   }
Iterator itr = items.iterator();

while (itr.hasNext()) 
      {
      item = (FileItem) itr.next();
      if(item.isFormField()) 
             {
              String name = item.getFieldName();
              String value = item.getString();
              if(name.equals("i_name")){
            	  i_name=value; 
                }
              if(name.equals("i_desg")){
            	  i_desg=value; 
                }
              if(name.equals("i_city")){
            	  i_city=value; 
                }
              if(name.equals("i_b_no")){
            	  i_b_no=value; 
                }
              if(name.equals("i_admin")){
            	  i_admin=value; 
                }
              if(name.equals("i_email_id")){
            	  i_email_id=value; 
                }
              if(name.equals("form1_no")){
            	  form_no=value; 
                }
              if(name.equals("emp_id")){
            	  i_empid=value; 
              }
              if(name.equals("f_date")){
            	  f_date=value; 
            	 
            		form_date = new Date(sdf.parse(f_date).getTime());
                }
              if(name.equals("mmdradio")){
            	  mmdradio=value; 
                }
              if(name.equals("flowtype")){
            	  flowtype=value;
              }
              if(name.equals("desg")){
            	  desg=value; 
                }
              if(name.equals("emp")){
            	  emp=value; 
                }
              
              if(name.equals("mail1")){
            	  mail=value; 
                }
              if(name.equals("empid1")){
            	  empid1=value; 
                }
              if(name.equals("levelno")){
            	  levelno=value; 
                }
              if(name.equals("txtmail_msg")){
            	  txtmail_msg=value; 
                }
                if(name.equals("Roempid1")){
                	Roempid1=value;
                }
                if(name.equals("Roname")){
                	Roname=value;
                }
                if(name.equals("Rodesg")){
                	Rodesg=value;
                }
                if(name.equals("Rolevelno")){
                	Rolevelno=value;
                }
                if(name.equals("Romail")){
                	Romail=value;
                }
                
                if(name.equals("Type")){
            	  Type=value; 
                }
              if(name.equals("Subtype")){
            	  Subtype=value; 
                }
              if(name.equals("Developer")){
            	  developer=value; 
                }
              if(name.equals("date1")){
            	  Sdate=value; 
                }
              if(name.equals("date11")){
            	  Edate=value; 
                }
              if(name.equals("iddevname")){
            	  d_name=value; 
                }
              if(name.equals("iddevdesg")){
            	  d_desg=value; 
                }
              if(name.equals("iddevmail")){    
            	  d_mail=value; 
                }
              if(name.equals("iddevempid")){
            	  d_empid=value; 
                }
              if(name.equals("dlevelno")){
            	  d_level=value; 
                }
              if(name.equals("TSdate")){
            	  Testing_Sdate=value; 
                }
              if(name.equals("TEdate")){
            	  Testing_Edate=value; 
                }
              if(name.equals("DDelaydate")){
            	  Delaydate=value; 
                }
              if(name.equals("Developing")){
            	  Dradio=value; 
                }
              if(name.equals("Testing")){
            	  Tradio=value;             
                }                                     
              if(name.equals("USdate")){
            	  USdate=value; 
                }  
                if(name.equals("UEdate")){
                	UEdate=value; 
                  }
                if(name.equals("TDelaydate")){
                	Tdelaydate=value; 
                  }
                if(name.equals("UAT")){      
                	Uradio=value; 
                  }
                if(name.equals("TLink")){
                	TLink=value; 
                  }
                if(name.equals("UDelaydate")){
                	Udelaydate=value; 
                  }
                if(name.equals("NSApplication")){
                	NSApplication=value; 
                  }
                if(name.equals("NSDept")){
                	NSDept=value; 
                  }
                if(name.equals("NSDesc")){
                	NSDesc=value; 
                  }   
                if(name.equals("NSAttachmentsPath")){    
                	Npath=value;       
                  }
                  if(name.equals("CSAplication")){
                	  CSApplication=value; 
                    }
                  if(name.equals("CSModule")){
                	  CSModule=value; 
                    }
                  if(name.equals("CSPathChange")){
                	  CSPatchChange=value; 
                    }
                  if(name.equals("CSDesc")){
                	  CSDesc=value; 
                    }
                  if(name.equals("CSAttachmentsPath")){
                	  Cpath=value; 
                      }
                    if(name.equals("phase")){
                    	Phase=value; 
                    	}     
                      if(name.equals("pCount")){
                    	  count=value;
                    	  System.out.println("the C Value Is"+count);
                    	  c=Integer.parseInt(count);
                    	 
                      }
                      
                      for(int y=1;y<=c;y++){
                    	  
                      if(name.equals("ename"+y)){
                    	  ename=value;
                    	  em=ename.concat(",");
                    	  kpName=kpName+em;
                    	  System.out.println("tehjjjjj"+kpName);
                      }
                      if(name.equals("edesg"+y)){
                		  edesg=value;
                		  em2=edesg.concat(",");
                		  kpDesg=kpDesg+em2;
                		  System.out.println("desg"+kpDesg);
                      }
                      if(name.equals("email"+y)){ 
                		  email=value;
                		 em1=email.concat(",");
                  		KPmail=KPmail+em1;
                  		
                  		System.out.println("mail"+KPmail);
                		 
                      }
                      if(name.equals("eid"+y)){
                		  eid=value;
                		  em3=eid.concat(",");
                		  kpId=kpId+em3;
                		  System.out.println("id"+kpId);
                      }
                      
                      
                      }
                      
                      if(name.equals("feedback")){
                		  feedback=value;
                	  }
                      if(name.equals("uatChanges")){
                    	  uatChanges=value;
                      }
                      if(name.equals("HiddenChanges")){
                    	  hidChanges=value;
                      }
                      if(name.equals("CDSdate")){
                    	  CDSdate=value;  
                      }
                      if(name.equals("CDEdate")){
                    	  CDEdate=value;
                      }
                      if(name.equals("cdevelop")){
                    	  cdradio=value;  
                      }
                      if(name.equals("Versions")){
                    	  Vradio=value;
                      }
                      if(name.equals("cDeveloping")){
                    	  ctradio=value;
                      }
                      if(name.equals("appname")){
                    	  appname=value;
                      } 
                      if(name.equals("cVersion")){
                    	  cVersion=value;
                      }
                      if(name.equals("uVersion")){
                    	  uVersion=value;
                      }
                      if(name.equals("CTEdate")){
                    	  CTEdate=value;
                      }
                      if(name.equals("uname")){ 
                    	  uname=value;
                      }
                      if(name.equals("upass")){
                    	  upass=value;
                      }
                      if(name.equals("live")){
                    	  flevel=value;
                      }
                      
                      if(name.equals("Hradio")){
                    	  Hradio=value;
                      }
                      if(name.equals("HSdate")){
                    	  hsdate=value;
                      }
                      if(name.equals("HEdate")){
                    	  hedate=value;
                      }
                      if(name.equals("HCradio")){
                    	  HCradio=value;
                    	  
                      }
                      if(name.equals("ExDate")){
                    	exdate=value;  
                      }
                      if(name.equals("hcv")){
                    	  hcv=value;
                      }
                      if(name.equals("huv")){
                    	  huv=value;
                      }
                      if(name.equals("hardCD")){
                    	  hardCD=value;
                      }
                      if(name.equals("patch")){
                    	  patchname=value;
                      }
                      if(name.equals("issue")){
                    	  issueradio=value;
                      }
                      if(name.equals("configissues")){
                    	  issuename=value;
                      }
                      if(name.equals("ci_Sdate")){
                    	  ci_Sdate=value;
                    	  }
                      if(name.equals("ci_Edate")){
                    	  ci_Edate=value;
                      }
                      if(name.equals("config")){
                    	  configradio=value;
                      }
                      if(name.equals("Config_Sdate")){
                    	  Config_Sdate=value;
                      }
                      if(name.equals("Config_Edate")){
                    	  Config_Edate=value;
                      }
                      if(name.equals("patch")){
                    	  patch=value;
                      }
                      if(name.equals("DIfiles")){
                    	  DIfiles=value;
                      }
                      if(name.equals("DIchanges")){
                    	  DUFC=value;
                      }    
                     if(name.equals("emp_code")){
                    	 iemp_code=value;
                     }
                      if(name.equals("full_name")){
                    	  ifull_name=value;
                      }
                      if(name.equals("depart")){
                    	  idepart=value;
                      }
                      if(name.equals("designation")){
                    	  idesignation=value;
                    	  
                      }
                      if(name.equals("d_resignation")){
                    	  id_resignation=value;
                      }
                      if(name.equals("UChang")){
                    	  UChang=value;
                      } 
                      if(name.equals("psLink")){
                    	  FpsLink=value;
                      }
                      if(name.equals("owner")){
                    	  owner=value;
                      }
                      if(name.equals("team")){
                    	  team=value;
                      }
                      if(name.equals("ReqBy")){
                    	  ReqBy=value;
                      }
                      if(name.equals("IniBy")){
                    	  IniBy=value;
                      }   
                      if(name.equals("mempid")){
                    	  mempid=value;
                      }
                      if(name.equals("mname")){
                    	  mname=value;
                      }
                      if(name.equals("mdesg")){
                    	  mdesg=value;
                      }
                      if(name.equals("mmail")){
                    	  mmail=value;
                      }
                      
                      
             }else{
                     
                      
  		try
		       {
  			
  			String fieldName=item.getFieldName();
  			if(fieldName.equals("Rfile")){
  			
            itemName = item.getName();
            File savedFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/Requirements");
            if(!savedFile.exists())
            {
            savedFile.mkdirs();
            savedFile.setWritable(true);
            }
            File  insertFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/Requirements/"+itemName);
         		   			   item.write(insertFile);
         		   			   cn4=con.getConnection2();
         		   			   st4=cn4.createStatement();
         		   			 st4.executeUpdate("Insert into file_paths(form_no,path,filename,Uploaded_By,empid,Uploaded_Date)Values('"+form_no+"','E:/neinSoft/C2IT/AuditForm/"+form_no+"/Requirements/"+itemName+"','"+itemName+"','"+i_name+"','"+i_empid+"','"+form_date+"')");
  			
  			
  			} else if(fieldName.equals("finalfile")) {
  				itemName = item.getName();
  	            File savedFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/FinalRequirements");
  	            if(!savedFile.exists())
  	            {
  	            savedFile.mkdirs();
  	            savedFile.setWritable(true);
  	            }
  	            File  insertFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/FinalRequirements/"+itemName);
  	         		   			   item.write(insertFile);
  	         		   			   cn4=con.getConnection2();
  	         		   			   st4=cn4.createStatement();
  	         		   			 st4.executeUpdate("Insert into file_paths(form_no,path,filename,Uploaded_By,empid,Uploaded_Date)Values('"+form_no+"','E:/neinSoft/C2IT/AuditForm/"+form_no+"/FinalRequirements/"+itemName+"','"+itemName+"','"+i_name+"','"+i_empid+"','"+form_date+"')");
  				
  			
  			
  			}else if(fieldName.equals("devfile")){
  				itemName = item.getName();
  	            File savedFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/Developer");
  	            if(!savedFile.exists())
  	            {
  	            savedFile.mkdirs();
  	            savedFile.setWritable(true);
  	            }
  	            File  insertFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/Developer/"+itemName);
  	         		   			   item.write(insertFile);
  	         		   			   cn4=con.getConnection2();
  	         		   			   st4=cn4.createStatement();
  	         		   			 st4.executeUpdate("Insert into file_paths(form_no,path,filename,Uploaded_By,empid,Uploaded_Date)Values('"+form_no+"','E:/neinSoft/C2IT/AuditForm/"+form_no+"/Developer/"+itemName+"','"+itemName+"','"+i_name+"','"+i_empid+"','"+form_date+"')");
  				
  			}else if(fieldName.equals("finaldevfile")){
  				itemName = item.getName();
  	            File savedFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/DeveloperFinalFiles");
  	            if(!savedFile.exists())
  	            {
  	            savedFile.mkdirs();
  	            savedFile.setWritable(true);
  	            }
  	            File  insertFile = new File("E:/neinSoft/C2IT/AuditForm/"+form_no+"/DeveloperFinalFiles/"+itemName);
  	         		   			   item.write(insertFile);
  	         		   			   cn4=con.getConnection2();
  	         		   			   st4=cn4.createStatement();
  	         		   			 st4.executeUpdate("Insert into file_paths(form_no,path,filename,Uploaded_By,empid,Uploaded_Date)Values('"+form_no+"','E:/neinSoft/C2IT/AuditForm/"+form_no+"/DeveloperFinalFiles/"+itemName+"','"+itemName+"','"+i_name+"','"+i_empid+"','"+form_date+"')");
  				
  				
  			}
		       }catch(Exception e){
	            	System.out.println(e);
		       }
		      
           }
    
     }
                    	  
}             
System.out.println("The Value Of Phase...."+Phase);            
 
  System.out.println("The Value Of Dradio"+Dradio) ;
  System.out.println("The Value Of Tradio"+Tradio) ;
  System.out.println("The Value Of Uradio"+Uradio) ;
  System.out.println("The Value Of Hradio"+Hradio) ;
  System.out.println("The Value Of HCradio"+HCradio) ;
  System.out.println("The Value Of config"+configradio) ;
  System.out.println("The Value Of issue"+issueradio) ;
  System.out.println("The Flow is..."+flowtype); 
  System.out.println("The flevel is..."+flevel); 
  System.out.println("The Uchang is..."+UChang); 
  
     
  System.out.println("The manager mail..."+mmail); 
  System.out.println("The Subtype..."+Subtype); 
              

if(Sdate!=null){
String [] parts=Sdate.split("-");
String month=getMonthNumber(parts[1]);
startDate=parts[0]+"-"+month+"-"+parts[2];
System.out.println(startDate);   
}
if(Edate!=null){
String [] parts1=Edate.split("-");
String month1=getMonthNumber(parts1[1]);
endDate=parts1[0]+"-"+month1+"-"+parts1[2];
System.out.println(endDate);

}





System.out.println("The Testing Start Date"+Testing_Sdate);
System.out.println("The Testing end Date"+Testing_Edate);
//testing Start Date And End Date
if(Testing_Sdate!=null && !Testing_Sdate.isEmpty()){
	String [] parts2=Testing_Sdate.split("-");
	String month2=getMonthNumber(parts2[1]);
	TstartDate=parts2[0]+"-"+month2+"-"+parts2[2]; 
	System.out.println(TstartDate);
	}
	if(Testing_Edate!=null && !Testing_Sdate.isEmpty() ){
	String [] parts3=Testing_Edate.split("-");
	String month3=getMonthNumber(parts3[1]);
	TendDate=parts3[0]+"-"+month3+"-"+parts3[2];
	System.out.println(TendDate);

	}
	



// if Developing not completed within given date
System.out.println("Developing Delay Date"+Delaydate);
if(Delaydate!=null && !Delaydate.isEmpty()){
	String [] parts4=Delaydate.split("-");
	String month4=getMonthNumber(parts4[1]);
	DDendDate=parts4[0]+"-"+month4+"-"+parts4[2];
	System.out.println(DDendDate);
	
}




//UAT Start Date And End Date
if(USdate!=null && !USdate.isEmpty()){
	String [] parts5=USdate.split("-");
	String month5=getMonthNumber(parts5[1]);
	UstartDate=parts5[0]+"-"+month5+"-"+parts5[2]; 
	System.out.println(UstartDate);
	}
	if(UEdate!=null && !USdate.isEmpty()){
	String [] parts6=UEdate.split("-");
	String month6=getMonthNumber(parts6[1]);
	UendDate=parts6[0]+"-"+month6+"-"+parts6[2]; 
	System.out.println(UendDate);

	}
	 
//if testing not completed within given date
System.out.println("Tdelay Date Is"+Tdelaydate);

System.out.println("Tdelay Date Is"+Tdelaydate);
if(Tdelaydate!=null && !Tdelaydate.isEmpty()){
	String [] parts7=Tdelaydate.split("-");
	String month7=getMonthNumber(parts7[1]);
	TDendDate=parts7[0]+"-"+month7+"-"+parts7[2];
	System.out.println(TDendDate);

	}



if(CDSdate!=null && !CDSdate.isEmpty()){
	String [] parts8=CDSdate.split("-");
	String month8=getMonthNumber(parts8[1]);
	deveSD=parts8[0]+"-"+month8+"-"+parts8[2];
}
 if(CDEdate!=null && !CDEdate.isEmpty()){
		String [] parts9=CDEdate.split("-");
		String month9=getMonthNumber(parts9[1]);
		deveED=parts9[0]+"-"+month9+"-"+parts9[2];
	}
 







System.out.println("f_date "+f_date   +"           form_date   :"+form_date);

message = mailMessage.getAuditForm(form_no.trim());

System.out.println("radio...... : "+mmdradio);
System.out.println("empid1 value is...... : "+flowtype);

if(hsdate!=null && !hsdate.isEmpty()){
	String [] parts8=hsdate.split("-");
	String month8=getMonthNumber(parts8[1]);
	deveSD=parts8[0]+"-"+month8+"-"+parts8[2];
}
 if(hedate!=null && !hedate.isEmpty()){
		String [] parts9=hedate.split("-");
		String month9=getMonthNumber(parts9[1]);
		deveED=parts9[0]+"-"+month9+"-"+parts9[2];
	}
if(exdate!=null && !exdate.isEmpty()){
	String [] parts8=exdate.split("-");
	String month8=getMonthNumber(parts8[1]);
	deveSD=parts8[0]+"-"+month8+"-"+parts8[2];
}
System.out.println("hardcd"+hardCD);
if(hardCD!=null && !hardCD.isEmpty()){
	String [] parts9=hardCD.split("-");
	String month9=getMonthNumber(parts9[1]);
	deveED=parts9[0]+"-"+month9+"-"+parts9[2];
	
}
    

if(ci_Sdate!=null && !ci_Sdate.isEmpty()){
	
	String [] parts8=ci_Sdate.split("-");
	String month8=getMonthNumber(parts8[1]);
	AdminSD=parts8[0]+"-"+month8+"-"+parts8[2];
	
}

if(ci_Edate!=null && !ci_Edate.isEmpty()){
	
	String [] parts9=ci_Edate.split("-");
	String month9=getMonthNumber(parts9[1]);
	AdminED=parts9[0]+"-"+month9+"-"+parts9[2];
	
}


if(Config_Sdate!=null && !Config_Sdate.isEmpty()){
	
	String [] parts8=Config_Sdate.split("-");
	String month8=getMonthNumber(parts8[1]);
	AdminSD=parts8[0]+"-"+month8+"-"+parts8[2];
	
}

if(Config_Edate!=null && !Config_Edate.isEmpty()){
	
	String [] parts9=Config_Edate.split("-");
	String month9=getMonthNumber(parts9[1]);
	AdminED=parts9[0]+"-"+month9+"-"+parts9[2];
	
}

if(exdate!=null && !exdate.isEmpty()){
	
	String [] parts9=exdate.split("-");
	String month9=getMonthNumber(parts9[1]);
	AdminED=parts9[0]+"-"+month9+"-"+parts9[2];
	
}



if(Hradio!=null && Hradio!="" && Type.equals("Hardware")){
	System.out.println("manager approves hardware");
	if(Hradio.equals("Approved")){
	psmt = cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	psmt.setString(1,Hradio);
	psmt.setString(2,txtmail_msg);
	psmt.setString(3,"over");
	psmt.setString(4,form_no);
	int i = psmt.executeUpdate();
	
	PreparedStatement psmt10=null;
    psmt10 = cn2.prepareStatement("insert into auditform_item (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
    psmt10.setString(1,form_no);
    psmt10.setString(2,d_desg);
    psmt10.setString(3,d_name);
    psmt10.setString(4,"Pending");
    psmt10.setString(5,"Pending");
    psmt10.setDate(6,form_date);
    psmt10.setString(7,d_mail);
    psmt10.setString(8,"now");
    psmt10.setString(9,d_empid);
    psmt10.setString(10,d_level);
  
    int b = psmt10.executeUpdate();
    
    PreparedStatement psmt11=null;
    psmt11 = cn2.prepareStatement("Insert Into audit_hardware_flow(form_no,Hardware_name,Stage,Status,Start_Date,Completion_Date,remarks) Values(?,?,?,?,?,?,?)");
    psmt11.setString(1,form_no);
    psmt11.setString(2,appname);
   
    psmt11.setString(3,"Task");
    psmt11.setString(4,"Pending");
    psmt11.setString(5,deveSD);
    psmt11.setString(6,deveED);
    psmt11.setString(7,"Pending");

    int h=psmt11.executeUpdate();
    
	postMail.AuditFormWithAttachment(i_email_id,i_name,d_mail,"","Hardware Request :  " +form_no+ " ","Dear Sir,<br>"+  " "+i_name+  " "+  "Assigned a Task, Please Complete the Task within Time.<br><b>Start_Date:</b>"+deveSD+"&nbsp &nbsp<b>Completion_Date:</b>"+deveED+"<br> "+message,form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"\\");     
    
	}else{
		System.out.println("manager not approves hardware");
		psmt = cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
		psmt.setString(1,Hradio);
		psmt.setString(2,txtmail_msg);
		psmt.setString(3,"over");
		psmt.setString(4,form_no);
		int i = psmt.executeUpdate();
		
		PreparedStatement ps10=null;
		ps10=cn2.prepareStatement("UPDATE `audit_form` SET `Project_Status`='NOT APPROVED' WHERE form_no='"+form_no+"'");
		int r=ps10.executeUpdate();

    	postMail.AuditFormWithAttachment(i_email_id,i_name,id_resignation,"","Hardware Request :  " +form_no+ " ", "Dear Sir,<br>"+  " "+"Your Hardware request " +form_no+ " not approved by :" +i_name+ "<br><br><b>"+message+"<u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"\\");
    }
	}
	


if(HCradio!=null && !HCradio.isEmpty() && Type.equals("Hardware")){
	if(HCradio.equals("Approved")){
		System.out.println("admin completes task");
		if(configradio!=null && configradio.equals("Yes")){
			System.out.println("configuration yes");
			if(issueradio!=null && issueradio.equals("Yes")){
				System.out.println("issues yes");
			PreparedStatement psmt11=null;
		    psmt11 = cn2.prepareStatement("INSERT INTO audit_hardware_flow(form_no,Hardware_name,Stage,Status,Start_Date,Completion_Date,Issues,remarks)Values(?,?,?,?,?,?,?,?)");
		    psmt11.setString(1,form_no);
		    psmt11.setString(2,appname); 
		    psmt11.setString(3,"Configuration Issues");
		    psmt11.setString(4,"Pending");
		    psmt11.setString(5,AdminSD);
		    psmt11.setString(6,AdminED);
		    psmt11.setString(7, issuename);
		    psmt11.setString(8,"Pending");
		    int h=psmt11.executeUpdate();
		    
		    PreparedStatement psmt15=null;
		    psmt15 = cn2.prepareStatement("UPDATE `audit_hardware_flow` SET Status=?,remarks=? WHERE Stage='Configuration Test' AND form_no=?");
		    psmt15.setString(1,"Completed");
		    psmt15.setString(2, txtmail_msg);
		    psmt15.setString(3,form_no); 
			int hk=psmt15.executeUpdate();
			
			
			postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Hardware Request: "+form_no+"","<p> Dear Sir,<br>"+
	  	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	  	    		"When Configuration Testing Found Some Issues,Please Find Below Timelines To Resolve The Issue.<br>"+
	  	    		"<b>Issue:</b>&nbsp &nbsp"+issuename+".<br>"+
					"<b>Start Date:</b>&nbsp &nbsp"+AdminSD+"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+AdminED+"<br>"+message+""); 
		    
		    
			}else{
				System.out.println("no issues");
				PreparedStatement psmt12=null;
			    psmt12 = cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' And Status='Pending' ");
			    psmt12.setString(1,HCradio);
			    psmt12.setString(2,txtmail_msg);
			    psmt12.setString(3,"over");
			    psmt12.setString(4,form_no);
			    int i = psmt12.executeUpdate();
			    
			    PreparedStatement psmt15=null;
			    psmt15 = cn2.prepareStatement("UPDATE `audit_hardware_flow` SET Status=?,remarks=? WHERE Status=? AND form_no=?");
			    psmt15.setString(1,"Completed");
			    psmt15.setString(2, "Completed");
			    psmt15.setString(3,"Pending");
			    psmt15.setString(4,form_no); 
				int hk=psmt15.executeUpdate();
				
				
				/* PreparedStatement psmt17=null;
			    psmt17 = cn2.prepareStatement("UPDATE `audit_hardware_flow` SET Status=?,remarks=? WHERE Stage=? AND form_no=?");
			    psmt17.setString(1,"Completed");
			    psmt17.setString(2, txtmail_msg);
			    psmt17.setString(3,"Configuration Test");
			    psmt17.setString(4,form_no); 
				int hh1=psmt17.executeUpdate();
				
				 PreparedStatement psmt16=null;
				    psmt16 = cn2.prepareStatement("UPDATE `audit_hardware_flow` SET Status=?,remarks=? WHERE Stage=? AND form_no=?");
				    psmt16.setString(1,"Completed");
				    psmt16.setString(2, txtmail_msg);
				    psmt16.setString(3,"Configuration Issues");
				    psmt16.setString(4,form_no); 
					int hh=psmt16.executeUpdate(); */
			    
			    
			    PreparedStatement psmt11=null;  
			    psmt11 = cn2.prepareStatement("INSERT INTO Version_Management_Hardware(form_no,Hardware_name,Current_Version,Updated_Version,Patch,Date,Expiry_Renewal_Date)Values(?,?,?,?,?,?,?)");
			    psmt11.setString(1,form_no);
			    psmt11.setString(2,appname); 
			    psmt11.setString(3,hcv);
			    psmt11.setString(4,huv);
			    psmt11.setString(5,patch);
			    psmt11.setDate(6,form_date);
			    psmt11.setString(7,AdminED);
			    int k=psmt11.executeUpdate();
			    
			    PreparedStatement ps10=null;
				ps10=cn2.prepareStatement("UPDATE `audit_form` SET `Project_Status`='Completed' WHERE form_no='"+form_no+"'");
				int r=ps10.executeUpdate();
				
				cn5=con.getConnection2();
			      st5=cn5.createStatement();
			      rs5=st5.executeQuery("SELECT DISTINCT Mail FROM `auditform_item` Where form_no='"+form_no+"'");
			       while(rs5.next()){
			    	   UatMail1=rs5.getString(1);
				       um2=UatMail1.concat(",");
				       um3=um3+um2;
			       }
			       postMail.postMail(i_email_id,i_name,"pass1234",um3,"Hardware Request: "+form_no+"","<p> Dear Team,<br>"+
			   	    	
			    		   "The Task Is Successfully Completed.<br>"+
							""+message+"");
				
				
			}
		}else{
			System.out.println("configuration no");
			PreparedStatement psmt15=null;
		    psmt15 = cn2.prepareStatement("INSERT INTO audit_hardware_flow(form_no,Hardware_name,Stage,Status,Start_Date,Completion_Date,remarks)Values(?,?,?,?,?,?,?)");
		    psmt15.setString(1,form_no);
		    psmt15.setString(2,appname); 
		    psmt15.setString(3,"Configuration Test");
		    psmt15.setString(4, "Pending");
		    psmt15.setString(5,AdminSD);
		    psmt15.setString(6,AdminED);
		    psmt15.setString(7,txtmail_msg);
		    int h=psmt15.executeUpdate();
		    
		    postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Hardware Request: "+form_no+"","<p> Dear Sir,<br>"+
	  	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	  	    		"These Are The Dates For Configuration Testing.<br>"+
					"<b>Start Date:</b>&nbsp &nbsp"+AdminSD+"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+AdminED+"<br>"+message+""); 
		    
		}
	}else{	
		System.out.println("task not completed");
		PreparedStatement psmt11=null;
	    psmt11 = cn2.prepareStatement("UPDATE  Audit_Hardware_Flow SET Completion_Date=?,remarks=? WHERE form_no=? And Stage=?");
	    psmt11.setString(1,deveED);
	    psmt11.setString(2,txtmail_msg);
	    psmt11.setString(3,form_no);
	    psmt11.setString(4,"Task");
	    int h=psmt11.executeUpdate();
	    
	    postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Hardware Request: "+form_no+"","<p> Dear Sir,<br>"+
  	    		
  	    		"The Task You Assigned Is not Completed.<br>"+
  	    		
  	    		"<b>Reason:</b>&nbsp &nbsp"+txtmail_msg+".&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+deveED+".<br>"+message+""); 
	    
	    
		
	}
}




if(Phase!=null && Phase.equals("00")){
	
System.out.println("Phase 0");	
psmt = cn2.prepareStatement("UPDATE  branch_requirements SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' And levelno IS NOT NULL ");
psmt.setString(1,"Completed");
psmt.setString(2,txtmail_msg);
psmt.setString(3,"over");
psmt.setString(4,form_no);
int i = psmt.executeUpdate();

n=kpName.split(",");
d=kpDesg.split(",");
m=KPmail.split(",");
ii=kpId.split(",");
System.out.println("the cccccccccccccc"+c);
System.out.println("the KPmail...."+KPmail);
for(j=0;j<c;j++){ 
	System.out.println("the cccccccccccccc"+n[j]);
	System.out.println("the cccccccccccccc"+d[j]);
	PreparedStatement psmt10=null;
	psmt10 = cn2.prepareStatement("insert into branch_requirements (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno,Branch) values (?,?,?,?,?,?,?,?,?,?,?)");
    psmt10.setString(1,form_no);
    psmt10.setString(2,d[j]);
    psmt10.setString(3,n[j]);
    psmt10.setString(4,"Pending");
    psmt10.setString(5,"Pending");
    psmt10.setDate(6,form_date);
    psmt10.setString(7,m[j]);
    psmt10.setString(8,"now");
    psmt10.setString(9,ii[j]);
    psmt10.setString(10,"01");
    psmt10.setString(11,b_no);

	int b = psmt10.executeUpdate(); 
	
}	
postMail.AuditFormWithAttachment(i_email_id,i_name,KPmail,"","Software Development Request :  " +form_no+ " ","Dear Team,<br>"+  " "+ "Please Give Suggestions Or feedback for the initiated application.  "+form_no+ ""+" <br><br><b>"+message+"<u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"\\");
}
if(Phase!=null && Phase.equals("01") && Type.equals("Software")){
	System.out.println("Phase 1");	

	psmt = cn2.prepareStatement("UPDATE  branch_requirements SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' And levelno='01' ");
	psmt.setString(1,"Completed");
	psmt.setString(2,feedback);
	psmt.setString(3,"over");
	psmt.setString(4,form_no);
	int i = psmt.executeUpdate();
	
}



if(Phase!=null && Phase.equals("02") && Type.equals("Software")){
	
	System.out.println("Phase 2");
	PreparedStatement psmt7=null;
	psmt7 = cn2.prepareStatement("UPDATE  branch_requirements SET Status=?,remarks=?,Presence=? WHERE form_no=? And empid='"+session.getAttribute("EmpNo")+"' And levelno='02'");
	psmt7.setString(1,"Completed");
	psmt7.setString(2,txtmail_msg);
	psmt7.setString(3,"over");
	psmt7.setString(4,form_no);
	int i = psmt7.executeUpdate();
	
	PreparedStatement psmt10=null;
	psmt10 = cn2.prepareStatement("insert into auditform_item (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
    psmt10.setString(1,form_no);
    psmt10.setString(2,Rodesg);      
    psmt10.setString(3,Roname);
    psmt10.setString(4,"Pending");
    psmt10.setString(5,"Pending");
    psmt10.setDate(6,form_date);
    psmt10.setString(7,Romail);
    psmt10.setString(8,"now");
    psmt10.setString(9,Roempid1);
    psmt10.setString(10,Rolevelno);

	int b = psmt10.executeUpdate(); 
	
	postMail.AuditFormWithAttachment(i_email_id, i_name, Romail,"","Software Development Request :  " +form_no+ " ","Dear Sir,<br>"+  " "+ i_name+  " "+ "request your approval for the Development Form.  "+form_no+ ""+" <br><br><b>"+message+"<u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"//FinalRequirements\\");
}




if((mmdradio!=null && mmdradio.equals("Approved"))) 
    { 
	if(flowtype.equals("Normal"))
	    {
		System.out.println("Normal Approval Routine");
	    psmt = cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' And Status='Pending'");
	    psmt.setString(1,mmdradio);
	    psmt.setString(2,txtmail_msg);
	    psmt.setString(3,"over");
	    psmt.setString(4,form_no);
	    int i = psmt.executeUpdate();
  	    PreparedStatement psmt10=null;
	    psmt10 = cn2.prepareStatement("insert into auditform_item (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
	    psmt10.setString(1,form_no);
	    psmt10.setString(2,desg);
	    psmt10.setString(3,emp);
	    psmt10.setString(4,"Pending");
	    psmt10.setString(5,"Pending");
	    psmt10.setDate(6,form_date);
	    psmt10.setString(7,mail);
	    psmt10.setString(8,"now");
	    psmt10.setString(9,empid1);
	    psmt10.setString(10,levelno);
	
    	int b = psmt10.executeUpdate(); 
    	postMail.AuditFormWithAttachment(i_email_id,i_name,mail,"","Software Development Request :  " +form_no+ " ","Dear Sir,<br>"+  " "+i_name+  " "+ "request your approval for Development Form. "+form_no+ ""+" <br><br><b>"+message+"<u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"//FinalRequirements\\");
	    }
	else {
		if(flowtype.equals("Selecting") && !d_level.equals("100"))
    {

		 
	System.out.println("Developer Details Storing In Development Status...");
	PreparedStatement psmt14=null;
	psmt14 = cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=?,Presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
    psmt14.setString(1,mmdradio);
    psmt14.setString(2,txtmail_msg);
    psmt14.setString(3,"over");
    psmt14.setString(4,form_no);
    int i = psmt14.executeUpdate();
    
    PreparedStatement psmt10=null;
    psmt10 = cn2.prepareStatement("insert into auditform_item (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
    psmt10.setString(1,form_no);
    psmt10.setString(2,d_desg);
    psmt10.setString(3,d_name);
    psmt10.setString(4,"Pending");
    psmt10.setString(5,"Pending");
    psmt10.setDate(6,form_date);
    psmt10.setString(7,d_mail);
    psmt10.setString(8,"now");
    psmt10.setString(9,d_empid);
    psmt10.setString(10,d_level);
  
    int b = psmt10.executeUpdate(); 
    
  
    psmt2 = cn2.prepareStatement("insert into Development_Status(Form_no,Developer_Name,Developer_Mail,Status,Stage,Start_Date,End_Date,remarks) values (?,?,?,?,?,?,?,?)");
    psmt2.setString(1,form_no);
    psmt2.setString(2,d_name);
    psmt2.setString(3,d_mail);
    psmt2.setString(4,"Pending");
    psmt2.setString(5,"Development");
    psmt2.setString(6,startDate);
    psmt2.setString(7,endDate);
    psmt2.setString(8,"Pending");
    int j = psmt2.executeUpdate();
    
    PreparedStatement psmt5=null;
    
    
	postMail.AuditFormWithAttachment(i_email_id,i_name,d_mail,"","Software Development Request :  " +form_no+ " ","Dear Sir,<br>"+  " "+ i_name+  " "+  "Assigned a Project, Please find the attachments for project requirements And prepare Supported documents and upload.<br>Please Find below timelines to Complete this project<br> <b>Start Date:</b>&nbsp &nbsp"+startDate+
			"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+endDate+ ""+message,form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"//FinalRequirements\\"); 
	}
	
	}
    }else if(mmdradio!=null&&mmdradio.equals("Not Approved")){
    	System.out.println("not approved");
    	psmt = cn2.prepareStatement("UPDATE  auditform_item SET status=?,remarks=?,presence=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
    	psmt.setString(1,mmdradio);
    	psmt.setString(2,txtmail_msg);
    	psmt.setString(3,"over");
    	psmt.setString(4,form_no);
    	int i = psmt.executeUpdate();
    	
    	
    	PreparedStatement psmt61=null;
    	psmt61=cn2.prepareStatement("UPDATE `audit_form` SET `Project_Status`='NOT APPROVED' WHERE form_no='"+form_no+"'");
		int kk=psmt61.executeUpdate();
    	postMail.AuditFormWithAttachment(i_email_id,i_name,id_resignation,"","Software Development Request :  " +form_no+ " ", "Dear Sir,<br>"+  " "+ "Your request for Development Form :" +form_no+ " not approved by :" +i_name+ "<br><br><b>"+message+"<u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"//FinalRequirements\\");
    	
    	
    }
   
    else if(flowtype!=null && flowtype.equals("Selecting") && d_level.equals("100")){
	System.out.println("Developer files uploading");
	
	   PreparedStatement psmt5=null;
       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
       psmt5.setString(1,d_level);
       psmt5.setString(2,form_no);
	   int j=psmt5.executeUpdate();
	       
	   PreparedStatement psmt61=null;
       psmt61=cn2.prepareStatement("Insert Into branch_requirements(form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno)values(?,?,?,?,?,?,?,?,?,?)");
       psmt61.setString(1,form_no);
       psmt61.setString(2,idesignation);
       psmt61.setString(3,ifull_name);
       psmt61.setString(4,"Pending");
       psmt61.setString(5,"Pending");
       psmt61.setDate(6, form_date);
       psmt61.setString(7,id_resignation);
       psmt61.setString(8,"now");
       psmt61.setString(9, iemp_code);
       psmt61.setString(10,"03");
	   int j1=psmt61.executeUpdate();    
	
	   postMail.AuditFormWithAttachment(i_email_id,i_name,id_resignation,"","Software Development Request :  " +form_no+ " ","Dear Sir,<br>"+  " "+  "Please Find  Uploaded Documents For The Application.If You Have Any Suggestions Or Changes login to Development Form And Give Your Suggestions."+ "<br><br><b> "+message+"<u> Open the following URL</u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>",form_no,"E://neinsoft//C2IT//AuditForm//"+form_no+"//Developer\\");       
       
       
       
} else if(DIfiles!=null){
	if(DIfiles.equals("Suggestions")){
		System.out.println("suggestions");
		PreparedStatement psmt5=null;
		psmt5=cn2.prepareStatement("UPDATE auditform_item SET levelno=? WHERE form_no=? and Status='Pending'");
	       psmt5.setString(1,d_level);
	       psmt5.setString(2,form_no);
		   int j=psmt5.executeUpdate();
		   
		PreparedStatement psmt61=null;
	       psmt61=cn2.prepareStatement("UPDATE `branch_requirements` SET Status=?,remarks=?,Presence=? WHERE form_no=? And levelno='03' And empid='"+session.getAttribute("EmpNo")+"'");
	       psmt61.setString(1,"Completed");
	       psmt61.setString(2,DUFC);
	       psmt61.setString(3,"over");
		   psmt61.setString(4,form_no);
		   int j1=psmt61.executeUpdate(); 
		   
		   postMail.postMail(i_email_id,i_name,"pass1234",d_mail,"Software Development Request: "+form_no+"","<p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   "These Are The suggestions Given By Initiator.Please Include these Suggestions And Upload Again."+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   "<b>Suggestions:</b>"+DUFC+"<br>"+message+""); 
		   
		
	}else{
		System.out.println(" no suggestions");
		PreparedStatement psmt5=null;
		psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno='102' WHERE form_no='"+form_no+"'  and Status='Pending' ");
	     
	       
		   int j=psmt5.executeUpdate();
		   
		   
		PreparedStatement psmt61=null;
	       psmt61=cn2.prepareStatement("UPDATE `branch_requirements` SET Status=?,remarks=?,Presence=? WHERE form_no=? And levelno='03' And empid='"+session.getAttribute("EmpNo")+"'");
	       psmt61.setString(1,"Completed");
	       psmt61.setString(2,DIfiles);
	       psmt61.setString(3,"over");
		   psmt61.setString(4,form_no);
		   int j1=psmt61.executeUpdate();
		   postMail.postMail(i_email_id,i_name,"pass1234",d_mail,"Software Development Request: "+form_no+"","<p> Dear Sir,<br>"+
				   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
				   "The Uploaded Files Has no Suggestions, please  Proceed With Development."+message); 
		
	}
}else if(d_level!=null && d_level.equals("102")){
	
	PreparedStatement psmt5=null;
	psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
    psmt5.setString(1,d_level);
    psmt5.setString(2,form_no);
	int j=psmt5.executeUpdate();

}else if(Dradio!=null && !Dradio.isEmpty())
    {
	
	if(Dradio.equals("Testing")){
		System.out.println("testing");
		PreparedStatement psmt17=null;
		 psmt17 = cn2.prepareStatement("UPDATE  Development_Status SET Status=?,remarks=? WHERE form_no=?  and Developer_Name='"+session.getAttribute("Nname")+"'");
	 	    psmt17.setString(1,"Completed");
	 	    psmt17.setString(2,txtmail_msg);
	 	   	psmt17.setString(3,form_no);
	 	    int i = psmt17.executeUpdate();

	 	    PreparedStatement psmt11=null;
	       psmt11 = cn2.prepareStatement("insert into Development_Status(Form_no,Developer_Name,Developer_Mail,Status,Stage,Start_Date,End_Date,remarks) values (?,?,?,?,?,?,?,?)");
	       psmt11.setString(1,form_no);
	       psmt11.setString(2,d_name);
	       psmt11.setString(3,d_mail);
	       psmt11.setString(4,"Pending");
	       psmt11.setString(5,"Testing");  
	       psmt11.setString(6,TstartDate);
	       psmt11.setString(7,TendDate);
	       psmt11.setString(8,"Pending");
	     
	       int b = psmt11.executeUpdate();
	       
	       PreparedStatement psmt5=null;
	       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	       psmt5.setString(1,d_level);
	       psmt5.setString(2,form_no);
	       
	      
	       int j=psmt5.executeUpdate();
	 	 /*   String managerMail="neinsoft.support@nipponexpress.com" ; */
	 	   
	 	postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
"The "+appname+" Project Development Is Completed."+
" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
"These are the dates For Testing.&nbsp &nbsp &nbsp"+
"<b>Start Date:</b>&nbsp &nbsp"+TstartDate+
"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+TendDate+
""+message+""); 
	        
	
	}else{
	        	psmt = cn2.prepareStatement("UPDATE  Development_Status SET End_Date=?,remarks=? WHERE form_no=?  and Developer_Name='"+session.getAttribute("Nname")+"' ");
	     	    psmt.setString(1,DDendDate);
	     	    psmt.setString(2,txtmail_msg);
	     	   	psmt.setString(3,form_no);
	     	    int i = psmt.executeUpdate();
	     	  /*  String managerMail="neinsoft.support@nipponexpress.com" ; */
	  	    postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
	  	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	  	    		"The"+appname+" Project Development Is not Completed."+
	  	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	  	    		"<b>Reason:</b>&nbsp &nbsp"+txtmail_msg+"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+DDendDate+"<br>"+message+""); 
	        	
	        }
	        } 
	
	else if(Tradio!=null && !Tradio.isEmpty()){
		if(Tradio.equals("UAT")){
			System.out.println("UAT");
		
			psmt = cn2.prepareStatement("UPDATE  Development_Status SET Status=?,remarks=? WHERE form_no=?  and Stage='Testing'");
	 	    psmt.setString(1,"Completed");
	 	    psmt.setString(2,txtmail_msg);
	 	   	psmt.setString(3,form_no);
	 	    int i = psmt.executeUpdate();
	 	   PreparedStatement psmt11=null;
	       psmt11 = cn2.prepareStatement("insert into Development_Status(Form_no,Developer_Name,Developer_Mail,Status,Stage,Start_Date,End_Date,remarks,Test_Server_link) values (?,?,?,?,?,?,?,?,?)");
	       psmt11.setString(1,form_no);
	       psmt11.setString(2,d_name);
	       psmt11.setString(3,d_mail);
	       psmt11.setString(4,"Pending");
	       psmt11.setString(5,"UAT");
	       psmt11.setString(6,UstartDate);  
	       psmt11.setString(7,UendDate);
	       psmt11.setString(8,"Pending");
	       psmt11.setString(9,TLink);
	     
	       int b = psmt11.executeUpdate(); 

	       
	       PreparedStatement psmt5=null;
	       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	       psmt5.setString(1,d_level);
	       psmt5.setString(2,form_no);
	       
	     
	       int j=psmt5.executeUpdate();
	      /*  String managerMail="neinsoft.support@nipponexpress.com"; */
	       postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
	    		   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	    		   "The "+appname+" Project Testing Is Completed."+message+"");
	       cn4=con.getConnection2();
	       st4=cn4.createStatement();
	       rs4=st4.executeQuery("SELECT DISTINCT mail FROM `branch_requirements` WHERE form_no='"+form_no+"'");
	       while(rs4.next()){
	    	   UatMail=rs4.getString("mail");
	       um=UatMail.concat(",");
	       um1=um1+um;
	       }
	       postMail.postMail(i_email_id,i_name,"pass1234",um1,"Software Development Status: "+form_no+"","<p> Dear Team,<br>"+
	    	
	    		   "The "+appname+" Project is Pending with UAT.Use Below credentials for test server login,"+
	    		   "If You want give any changes or feedback please login through C2IT select pending UAT in Dashboard and give your suggestions.Please Inform all Users.<br>"+
	    		  
	    		   "<b>Test Server Link:</b>&nbsp &nbsp"+TLink+
	    		   "<br><b>User Name:</b>&nbsp &nbsp"+uname+
	    		   "&nbsp &nbsp &nbsp &nbsp<b>Password:</b>&nbsp &nbsp"+upass+
	    		   "<br>Link Will Be Open From&nbsp &nbsp <b>Start Date:</b>"+UstartDate+"&nbsp &nbsp <b> End Date:</b>"+UendDate+""+
	    		   ""+message+""); 
		
	}else{
		psmt = cn2.prepareStatement("UPDATE  Development_Status SET End_Date=?,remarks=? WHERE form_no=?  and Stage='Testing' ");
 	    psmt.setString(1,TDendDate);
 	    psmt.setString(2,txtmail_msg);
 	   	psmt.setString(3,form_no);
 	    int i = psmt.executeUpdate();
 	/*    String managerMail="neinsoft.support@nipponexpress.com"  */;
 	    postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
 	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
 	    		"The <b>"+appname+"</b> Project Testing Is not Completed."+
 	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
 	    		"<b>Reason:</b>&nbsp &nbsp"+txtmail_msg+"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+TDendDate+"<br>"+message+""); 
		
		
	}
	}else if(Uradio!=null && !Uradio.isEmpty()){
		if(Uradio.equals("TestServer")){
			psmt = cn2.prepareStatement("UPDATE  Development_Status SET Status=?,remarks=?,Test_Server_link=? WHERE form_no=?  and Stage='UAT'");
	 	    psmt.setString(1,"Completed");
	 	    psmt.setString(2,txtmail_msg);
	 	    psmt.setString(3,TLink);
	 	   	psmt.setString(4,form_no);
	 	    int i = psmt.executeUpdate();
	 	   PreparedStatement psmt5=null;
	       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	       psmt5.setString(1,d_level);
	       psmt5.setString(2,form_no);
	       
	      
	       int j=psmt5.executeUpdate();
			
			
		}else{
			psmt = cn2.prepareStatement("UPDATE  Development_Status SET End_Date=?,remarks=? WHERE form_no=?  and Stage='UAT' ");
	 	    psmt.setString(1,Udelaydate);
	 	    psmt.setString(2,txtmail_msg);
	 	   	psmt.setString(3,form_no);
	 	    int i = psmt.executeUpdate();
			
		}
		
	}
	
	else if(hidChanges!=null && hidChanges.equals("uatChanges")){
		
	    		PreparedStatement psmt5=null;
	   	       psmt5=cn2.prepareStatement("insert into UAT_Changes(form_no,empname,empmail,empdesg,Changes,Date)values (?,?,?,?,?,?)");
	   	       psmt5.setString(1,form_no);  
	   	       psmt5.setString(2,i_name);
	   	       psmt5.setString(3,i_email_id);
	   	       psmt5.setString(4,i_desg);
	   	       psmt5.setString(5,uatChanges);
	   	       psmt5.setDate(6,form_date);
	   	       int g=psmt5.executeUpdate();
	    	  }
	else if(UChang!=null && !UChang.isEmpty()){
		if(UChang.equals("Changes")){
		System.out.println("Changes Development");
		psmt2 = cn2.prepareStatement("insert into Development_Status(Form_no,Developer_Name,Developer_Mail,Status,Stage,Start_Date,End_Date,remarks) values (?,?,?,?,?,?,?,?)");
	    psmt2.setString(1,form_no);
	    psmt2.setString(2,d_name);
	    psmt2.setString(3,d_mail);
	    psmt2.setString(4,"Pending");
	    psmt2.setString(5,"Changes Development");
	    psmt2.setString(6,deveSD); 
	    psmt2.setString(7,deveED);
	    psmt2.setString(8,"Pending");
	    int j = psmt2.executeUpdate();
	    
	    PreparedStatement psmt5=null;
	       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
	       psmt5.setString(1,d_level);
	       psmt5.setString(2,form_no);
	       
	      
	       int h=psmt5.executeUpdate();
	       
	       postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
	    		   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	    		   "The "+appname+" Project UAT Changes Development Is Started."+
	    		   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	    		   "These are the dates to complete Development.&nbsp &nbsp &nbsp"+
	    		   "<b>Start Date:</b>&nbsp &nbsp"+deveSD+
	    		   "&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+deveED+
	    		   ""+message+"");
	       
	    
		}else{
			System.out.println("No UAT Changes going live");
			if(Subtype!=null && Subtype.equals("New")){
				psmt2 = cn2.prepareStatement("insert into version_management(form_no,application_name,current_version,CurrentVersion_Date) values (?,?,?,?)");
			    psmt2.setString(1,form_no);
			    psmt2.setString(2,appname);
			    psmt2.setString(3,cVersion);
				psmt2.setDate(4,form_date);
			    int j = psmt2.executeUpdate();
			}else{
			
			psmt2 = cn2.prepareStatement("insert into version_management(form_no,application_name,current_version,updated_version,UpdateVersion_Date) values (?,?,?,?,?)");
		    psmt2.setString(1,form_no);
		    psmt2.setString(2,appname);
		    psmt2.setString(3,cVersion);
		    psmt2.setString(4,uVersion);
		    psmt2.setDate(5,form_date);
		    int j = psmt2.executeUpdate();
			}
		    
		    PreparedStatement psmt5=null;
		       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=? WHERE form_no=?  and Status='Pending' ");
		       psmt5.setString(1,"Approved");
		       psmt5.setString(2,"Completed");
		       psmt5.setString(3,form_no);
		       		      
		       int h=psmt5.executeUpdate();
		       
		       PreparedStatement psmt10=null;
			    psmt10 = cn2.prepareStatement("insert into auditform_item (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
			    psmt10.setString(1,form_no);
			    psmt10.setString(2,mdesg);
			    psmt10.setString(3,mname);
			    psmt10.setString(4,"Pending");
			    psmt10.setString(5,"Pending");
			    psmt10.setDate(6,form_date);
			    psmt10.setString(7,mmail);
			    psmt10.setString(8,"now");
			    psmt10.setString(9,mempid);
			    psmt10.setString(10,"108");
			
		    	int b = psmt10.executeUpdate(); 
		    	postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
		 	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
		 	    		"Development for the <b>"+appname+"</b> Project has been Completed successfully.Request you to review and Provide sign-off for GO-Live."+
		 	    		"<br>"+message+""); 
			
		}
		
		
		
	}else if(ctradio!=null && !ctradio.isEmpty()){
		if(ctradio.equals("Testing")){
			System.out.println("Changes Testing");
			PreparedStatement psmt10=null;
			psmt10 = cn2.prepareStatement("UPDATE  Development_Status SET Status=?,remarks=? WHERE form_no=?  and Stage='Changes Development'");
	 	    psmt10.setString(1,"Completed");
	 	    psmt10.setString(2,txtmail_msg);
	 	    psmt10.setString(3,form_no);
	 	    int i = psmt10.executeUpdate();
			
			psmt2 = cn2.prepareStatement("insert into Development_Status(Form_no,Developer_Name,Developer_Mail,Status,Stage,Start_Date,End_Date,remarks) values (?,?,?,?,?,?,?,?)");
		    psmt2.setString(1,form_no);
		    psmt2.setString(2,d_name);
		    psmt2.setString(3,d_mail);
		    psmt2.setString(4,"Pending");
		    psmt2.setString(5,"Changes Testing");
		    psmt2.setString(6,TstartDate);  
		    psmt2.setString(7,TendDate);
		    psmt2.setString(8,"Pending");
		    int j = psmt2.executeUpdate();
		    
		    PreparedStatement psmt5=null;
		       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET levelno=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
		       psmt5.setString(1,d_level);
		       psmt5.setString(2,form_no);
		       
		      
		       int h=psmt5.executeUpdate();
		       postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
		    		   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
		    		   "The "+appname+" Project UAT Changes Development Is Completed."+
		    		   " <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
		    		   "These are the dates For Testing.&nbsp &nbsp &nbsp"+
		    		   "<b>Start Date:</b>&nbsp &nbsp"+TstartDate+
		    		   "&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+TendDate+
		    		   ""+message+""); 
		}
		else{
			PreparedStatement psmt10=null;
			psmt10 = cn2.prepareStatement("UPDATE  Development_Status SET End_Date=?,remarks=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
     	    psmt10.setString(1,DDendDate);
     	    psmt10.setString(2,txtmail_msg);
     	   	psmt10.setString(3,form_no);
     	    int i = psmt10.executeUpdate();
     	   postMail.postMail(i_email_id,i_name,"pass1234",mmail,"NSoftware Development Status: "+form_no+"","<p> Dear Sir,<br>"+
	  	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	  	    		"The"+appname+" Project UAT Changes Development Is not Completed."+
	  	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
	  	    		"<b>Reason:</b>&nbsp &nbsp"+txtmail_msg+"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+DDendDate+"<br>"+message+""); 
     	  
			
		}
		
	}else if(Vradio!=null && !Vradio.isEmpty()){
		if(Vradio.equals("Versions")){
			PreparedStatement psmt10=null;
			psmt10 = cn2.prepareStatement("UPDATE  Development_Status SET Status=?,remarks=? WHERE form_no=?  and  Stage='Changes Testing'");
	 	    psmt10.setString(1,"Completed");
	 	    psmt10.setString(2,txtmail_msg);
	 	    psmt10.setString(3,form_no);
	 	    int i = psmt10.executeUpdate();
			
	 	   if(Subtype!=null && Subtype.equals("New")){
				psmt2 = cn2.prepareStatement("insert into version_management(form_no,application_name,current_version,CurrentVersion_Date) values (?,?,?,?)");
			    psmt2.setString(1,form_no);
			    psmt2.setString(2,appname);
			    psmt2.setString(3,cVersion);
				psmt2.setDate(4,form_date);
			    int j = psmt2.executeUpdate();
			}else{
			
			psmt2 = cn2.prepareStatement("insert into version_management(form_no,application_name,current_version,updated_version,UpdateVersion_Date) values (?,?,?,?,?)");
		    psmt2.setString(1,form_no);
		    psmt2.setString(2,appname);
		    psmt2.setString(3,cVersion);
		    psmt2.setString(4,uVersion);
		    psmt2.setDate(5,form_date);
		    int j = psmt2.executeUpdate();
			}
		    
		    PreparedStatement psmt5=null;
		       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' ");
		       psmt5.setString(1,"Approved");
		       psmt5.setString(2,"Completed");
		       psmt5.setString(3,form_no);
		       		      
		       int h=psmt5.executeUpdate();
		       
		       PreparedStatement psmt11=null;
			    psmt11 = cn2.prepareStatement("insert into auditform_item (form_no,desg,emp,Status,remarks,Date,mail,Presence,empid,levelno) values (?,?,?,?,?,?,?,?,?,?)");
			    psmt11.setString(1,form_no);
			    psmt11.setString(2,mdesg);
			    psmt11.setString(3,mname);
			    psmt11.setString(4,"Pending");
			    psmt11.setString(5,"Pending");
			    psmt11.setDate(6,form_date);
			    psmt11.setString(7,mmail);
			    psmt11.setString(8,"now");
			    psmt11.setString(9,mempid);
			    psmt11.setString(10,d_level);
			
		    	int b = psmt11.executeUpdate(); 
		       
		    	postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
		 	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
		 	    		"Development for the <b>"+appname+"</b> Project has been Completed successfully.Request you to review and Provide sign-off for GO-Live."+
		 	    		"<br>"+message+"");
			
		}else{
			psmt = cn2.prepareStatement("UPDATE  Development_Status SET End_Date=?,remarks=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' And Status='Pending'");
     	    psmt.setString(1,CTEdate);
     	    psmt.setString(2,txtmail_msg);
     	   	psmt.setString(3,form_no);
     	    int i = psmt.executeUpdate();
     	   postMail.postMail(i_email_id,i_name,"pass1234",mmail,"Software Development Status: "+form_no+"","<p> Dear Sir,<br>"+
   	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
   	    		"The <b>"+appname+"</b> Project Testing Is not Completed."+
   	    		" <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp "+
   	    		"<b>Reason:</b>&nbsp &nbsp"+txtmail_msg+"&nbsp &nbsp &nbsp &nbsp<b>Completion Date:</b>&nbsp &nbsp"+CTEdate+"<br>"+message+""); 
		}
		
	}else if(flevel!=null && flevel.equals("live")){
		System.out.println("live");
		psmt2 = cn2.prepareStatement("insert into Development_Status(Form_no,Developer_Name,Developer_Mail,Status,Stage,Start_Date,remarks,Test_Server_link) values (?,?,?,?,?,?,?,?)");
	    psmt2.setString(1,form_no);
	    psmt2.setString(2,d_name);
	    psmt2.setString(3,d_mail);
	    psmt2.setString(4,"Completed");
	    psmt2.setString(5,"Live");
	    psmt2.setDate(6, form_date);
	    psmt2.setString(7,"Completed");
	    psmt2.setString(8,FpsLink);
	    int j = psmt2.executeUpdate();
	         
	    PreparedStatement psmt70=null;
	    psmt70=cn2.prepareStatement("UPDATE `audit_form` SET `Server_Link`=?,`Project_owner`=?,`Team_Size`=?,`Requested_By`=?,`Approved_By`=?,`Completed_Date`=?,`Project_Status`=? WHERE form_no=?");
	    psmt70.setString(1,FpsLink);
	    psmt70.setString(2,owner);
	    
	    psmt70.setString(3,team);
	    psmt70.setString(4,ReqBy);
	    psmt70.setString(5,IniBy);
	    psmt70.setDate(6,form_date);
	    psmt70.setString(7,"Completed");
	    psmt70.setString(8,form_no);
	    
	    int z=psmt70.executeUpdate();
	    
	    
	    
	    
	    PreparedStatement psmt5=null;
	       psmt5=cn2.prepareStatement("UPDATE  auditform_item SET Status=?,remarks=? WHERE form_no=?  and empid='"+session.getAttribute("EmpNo")+"' And Status='Pending' ");
	       psmt5.setString(1,"Approved");
	       psmt5.setString(2,txtmail_msg);
	       psmt5.setString(3,form_no);
	       		      
	       int h=psmt5.executeUpdate();
	      cn5=con.getConnection2();
	      st5=cn5.createStatement();
	      rs5=st5.executeQuery("SELECT Mail FROM `auditform_item` Where form_no='"+form_no+"' UNION ALL SELECT Mail FROM branch_requirements where form_no='"+form_no+"'");
	       while(rs5.next()){
	    	   UatMail1=rs5.getString(1);
		       um2=UatMail1.concat(",");
		       um3=um3+um2;
	       }
	       postMail.postMail(i_email_id,i_name,"pass1234",um3,"Software Development Status: "+form_no+"","<p> Dear Team,<br>"+
	   	    	
	    		   "The "+appname+" Project is Live.Please Inform all users.<br>"+
					"<b>Server Link:</b>&nbsp &nbsp<a>"+FpsLink+
	    		   "</a>"+message+"");
		
	}else{
		System.out.println("The else Part");
	}
	      

	Tradio="";
	Dradio="";
    flowtype="";
    d_level="";
    startDate="";
    endDate="";
    TstartDate="";
    TendDate="";
    DDendDate="";
    UstartDate="";
    UendDate="";
    deveSD="";
    deveED="";
    mmdradio=null;  
    HCradio="";
    Hradio="";
    configradio="";
 issueradio="";
 Phase=null;
 ctradio=null;
 UChang=null;
 DIfiles=null;
 DUFC=null;
 flevel=null;
 Vradio=null;
 hidChanges=null;
message = null;
msg = "REGISTRATION__SAVED__AND__SENT__SUCCESSFULLY";
response.sendRedirect("../adminHR.jsp?msg="+msg);


%>


</html>
