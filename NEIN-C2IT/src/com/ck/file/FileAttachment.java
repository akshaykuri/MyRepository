package com.ck.file;
import java.io.File;



import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

import CON2.Connection2;
import java.util.ArrayList;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
/**
 * Servlet implementation class FileAttachment
 */
@WebServlet("/FileAttachment")
public class FileAttachment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileAttachment() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void getAttachmentFile(String csId)
    {

	Connection conn = null;
	    byte[] bytes=null;
		String cs_id;
		System.out.println("CS IDD from mail check send pdf : "+csId);
		Map map = new HashMap();
		map.put("cs_id",csId);
		FileOutputStream fos = null;
		File fileReport = new File("C:/workspace/CheckSheet/JRXML/CheckSh1.jasper");
		//File reportFilejrxml = new File(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/CheckSh1.jrxml"));
       
		
		 try {
			// fos = new FileOutputStream(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/"+csId+".pdf"));
			 
			 fos = new FileOutputStream("C:/workspace/CheckSheet/JRXML/"+csId+".pdf");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try{
			 
			
			 	Connection2 dbConn = new Connection2();
			 		
			 		conn = dbConn.getConnection2();
			 		System.out.println("Create conn running jasper 11");
			 		
			 		 bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
			 		System.out.println("Create conn running jasper 22");
			 		fos.write(bytes);
			 		System.out.println("Create conn running jasper 33");
		 	}
	
	catch(Exception e)
	{
		
		e.printStackTrace();
	}
	
	// return reportFilejrxml;
	
    }
    
    public void getAttachmentFileHO(String csId)
    	{

    	System.out.println("CS IDD HEAD OFFICE from mail check send pdf : "+csId);
			
	    String filePath="C:/workspace/CheckSheet/JRXML/"+csId+".pdf";
			
		    
	    ///////////////////////////////////////////////////////////////////////
		    
	   try 
		 {
	     try 
			{
		    Document document = new Document();
	    	OutputStream outputStream =  new FileOutputStream(new File(filePath));
	    	PdfWriter.getInstance(document, outputStream);
	    	document.open();
	    	
	    	System.out.println("File path :::::::::::"+filePath);
	    	
	     	Image img = Image.getInstance("E:\\nipponlogo.GIF");
	        img.setAbsolutePosition(100f, 775f);
	        img.scaleAbsolute(25f, 25f);
	        document.add(img);
	       	
	    	        
		    Font myfont11 = new Font(FontFamily.TIMES_ROMAN,15.0f,Font.NORMAL,BaseColor.BLACK);
		    
		    Font myfont = new Font(FontFamily.TIMES_ROMAN,9.0f,Font.NORMAL,BaseColor.BLACK);
	    	
	    	Paragraph paragraphH=new Paragraph("NIPPON EXPRESS (INDIA) PRIVATE LIMITED",myfont11);
         	paragraphH.getFont().setStyle(Font.BOLD);
         	paragraphH.setAlignment(Element.ALIGN_CENTER);
         	document.add(paragraphH);
         	Paragraph paragraphH1=new Paragraph(" ");
          	document.add(paragraphH1);
	    	
	    	
	    	Paragraph paragraph=new Paragraph("IT CHECK SHEET",myfont);
         	paragraph.getFont().setStyle(Font.BOLD);
        	paragraph.setAlignment(Element.ALIGN_CENTER);
         	document.add(paragraph);
         	Paragraph paragraphH2=new Paragraph(" ");
          	document.add(paragraphH2);  
          	
           	
            Connection2 dbConn = new Connection2();
			Connection conn = dbConn.getConnection2();
            Statement st2,st3,st5,st6,st7,stt1,sts,stsb;
            ResultSet rs2,rs3,rs5,rs6,rs7,rst1,rss,rssb;
            String e_name="",city="",cs_date="",ps_raw="",ps_upworking="",ps_upsbackup="",ps_upspreventive="",si_working="",isp_router="",newins="",sr_ac="",tm="";
            String cr_working="",wg_firewall="",ln_server="",tele="",cctv="",cctv_backup="",access_con="",fire_a="",fire_l="",  ids_w="",ids_l="",ithardware_r="",ithardware_n="",preventive_e="",quarter_r="",main_remarks="";
            try
               {
          		stt1 = (Statement) conn.createStatement();
          		rst1 = (ResultSet) stt1.executeQuery("select * from cs_master where cs_id  = '"+csId+"'");
          		while(rst1.next())
          		      {
          			   e_name = rst1.getString("e_name");
          			   city = rst1.getString("city");
          			   cs_date =rst1.getString("cs_date");
          			   ps_raw = rst1.getString("ps_raw");
          			   ps_upworking = rst1.getString("ps_upsworking");
          			   ps_upsbackup = rst1.getString("ps_upsbackup");
          			   ps_upspreventive = rst1.getString("ps_upspreventive");
          			   si_working = rst1.getString("si_working");
          			   
          			   isp_router = rst1.getString("isp_router");
          			   newins = rst1.getString("NEWINS");
         	           sr_ac = rst1.getString("sr_ac");
         	           tm = rst1.getString("tm");
         	           
         	           tele = rst1.getString("tele");
         		       cctv =rst1.getString("cctv");
         		       cctv_backup = rst1.getString("cctv_backup");
         		       
         		       access_con = rst1.getString("access_con");
         		       fire_a = rst1.getString("fire_a");
         		       fire_l = rst1.getString("fire_l");
         		       ids_w = rst1.getString("ids_w");
         		       ids_l = rst1.getString("ids_l");
         		       
         		       ithardware_r = rst1.getString("ithardware_r");
         		       ithardware_n = rst1.getString("ithardware_n");
         		       preventive_e = rst1.getString("preventive_e");
         		       quarter_r = rst1.getString("quarter_r");
         		       main_remarks = rst1.getString("main_remarks");
         		       
         		       cr_working =rst1.getString("cr_working");
         		       wg_firewall = rst1.getString("wg_firewall");
         		       ln_server = rst1.getString("ln_server");  
         	           } 
          		}
          		catch (Exception e) {
          				 System.out.println(e);
          		}

      
	    	
          	Paragraph paragraph1=new Paragraph("System Admin: "+e_name+"                                                                                               Location: "+city,myfont);
         	paragraph1.getFont().setStyle(Font.NORMAL);
        	paragraph1.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph1);
         	
         	Paragraph paragraphHs=new Paragraph(" ");
          	document.add(paragraphHs);  
         	
         
         	
         	Paragraph paragraph2=new Paragraph("Check Sheet No: "+csId+"                                                                                        Date: "+cs_date,myfont);
         	paragraph2.getFont().setStyle(Font.NORMAL);
        	paragraph2.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph2);
         	Paragraph paragraphH3=new Paragraph(" ");
          	document.add(paragraphH3);  
         	
         	
         	Paragraph paragraph3=new Paragraph("1) Power supply",myfont);
         	paragraph3.getFont().setStyle(Font.NORMAL);
        	paragraph3.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph3);
         	
         	Paragraph paragraphH4=new Paragraph(" ");
          	document.add(paragraphH4);  
          	
         	Paragraph paragraph4=new Paragraph("        RAW Power Working                                                                                                                      "+ps_raw,myfont);
         	paragraph4.getFont().setStyle(Font.NORMAL);
        	paragraph4.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph4);
          	
         	Paragraph paragraph5=new Paragraph("        UPS Working                                                                                                                                   "+ps_upworking,myfont);
         	paragraph5.getFont().setStyle(Font.NORMAL);
        	paragraph5.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph5);
         	
         	Paragraph paragraph6=new Paragraph("        UPS Backup time ( to be checked weekly once)                                                                            "+ps_upsbackup+" hours",myfont);
         	paragraph6.getFont().setStyle(Font.NORMAL);
        	paragraph6.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph6);
         	
         	Paragraph paragraph7=new Paragraph("        UPS Preventive Maintenance                                                                                                          "+ps_upspreventive,myfont);
         	paragraph7.getFont().setStyle(Font.NORMAL);
        	paragraph7.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph7);
         	
         	Paragraph paragraph8=new Paragraph("        (to be checked 3 month once)",myfont);
         	paragraph8.getFont().setStyle(Font.NORMAL);
        	paragraph8.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph8);
         	
         	Paragraph paragraphH5=new Paragraph(" ");
          	document.add(paragraphH5);  
          	
         	
          	
          	Paragraph paragraph9s=new Paragraph("2) Server Status ( HO only )",myfont);
         	paragraph9s.getFont().setStyle(Font.NORMAL);
        	paragraph9s.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph9s);
         	
         	Paragraph paragraph9s1=new Paragraph("        Working                                                                                                                                           "+si_working,myfont);
         	paragraph9s1.getFont().setStyle(Font.NORMAL);
        	paragraph9s1.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph9s1);
                  	
         	Paragraph paragraphHs1=new Paragraph(" ");
          	document.add(paragraphHs1);  
          	
          	
          	PdfPTable pdfPTableS = new PdfPTable(5);
        	pdfPTableS.setWidthPercentage(90);
          	
        	pdfPTableS.getDefaultCell().setBorderWidth(0f);
          	
        	Paragraph s1=new Paragraph("HDD space",myfont);
        	PdfPCell c1 = new PdfPCell(s1);
        	Paragraph s2=new Paragraph("Driver",myfont);
        	PdfPCell c2 = new PdfPCell(s2);
        	Paragraph s3=new Paragraph("Current HDD Space",myfont);
        	PdfPCell c3 = new PdfPCell(s3);
        	Paragraph s4=new Paragraph("Used",myfont);
        	PdfPCell c4 = new PdfPCell(s4);
        	Paragraph s5=new Paragraph("Free Space",myfont);
        	PdfPCell c5 = new PdfPCell(s5);
        	
        	
        	 c1.setHorizontalAlignment(Element.ALIGN_CENTER);
     	     pdfPTableS.addCell(c1);
     	     c2.setHorizontalAlignment(Element.ALIGN_CENTER);
     	     pdfPTableS.addCell(c2);
     	     c3.setHorizontalAlignment(Element.ALIGN_CENTER);
     	     pdfPTableS.addCell(c3);
     	     c4.setHorizontalAlignment(Element.ALIGN_CENTER);
     	     pdfPTableS.addCell(c4);
     	     c5.setHorizontalAlignment(Element.ALIGN_CENTER);
    	     pdfPTableS.addCell(c5);
     	    
         	    sts = (Statement) conn.createStatement();
         	    rss = (ResultSet) sts.executeQuery("select * from serveritem where si_cs_id  = '"+csId+"'");
	            while(rss.next())
	                        {
	            	        String si_harddisk =rss.getString("si_harddisk");
	            	        String si_drive = rss.getString("si_drive");
	            	        
	            	        String hdd_space =rss.getString("hdd_space");
	            	        String si_drive_type =rss.getString("si_drive_type");
	            	       
	            	        String si_usedspace = rss.getString("si_usedspace");
	            	        
	            	        String si_freespace = rss.getString("si_freespace");
	            	        String si_drive_type_free =rss.getString("si_drive_type_free");
	            	        
	            	        Paragraph paragraph11=new Paragraph(si_harddisk,myfont);
			        	    PdfPCell pdfPCell11 = new PdfPCell(paragraph11);
			        	       
			        	    Paragraph paragraph12=new Paragraph(si_drive,myfont);
			        	    PdfPCell pdfPCell21 = new PdfPCell(paragraph12);
			        	     
			        	    Paragraph paragraph13=new Paragraph(hdd_space+" "+si_drive_type,myfont);
			        	    PdfPCell pdfPCell31 = new PdfPCell(paragraph13);
			        	      
			        	    Paragraph paragraph14=new Paragraph(si_usedspace,myfont);
			        	    PdfPCell pdfPCell41 = new PdfPCell(paragraph14);
			        	      
			        	    Paragraph paragraph15=new Paragraph(si_freespace+" "+si_drive_type_free,myfont);
			        	    PdfPCell pdfPCell51 = new PdfPCell(paragraph15);
	            	        
	            	        
			        	    pdfPCell11.setHorizontalAlignment(Element.ALIGN_LEFT);
			        	    pdfPTableS.addCell(pdfPCell11);
			        	    pdfPCell21.setHorizontalAlignment(Element.ALIGN_LEFT);
			        	    pdfPTableS.addCell(pdfPCell21);
			        	    pdfPCell31.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        	    pdfPTableS.addCell(pdfPCell31);
			        	    pdfPCell41.setHorizontalAlignment(Element.ALIGN_RIGHT); 
			        	    pdfPTableS.addCell(pdfPCell41);
			        	    pdfPCell51.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        	    pdfPTableS.addCell(pdfPCell51);
	            	        
	            	     
	                        }
	            
	            document.add(pdfPTableS);
	            
	        Paragraph paragraphH7=new Paragraph(" ");
	        document.add(paragraphH7);  
          	
          	
          	
          	
       	
         	Paragraph paragraph9=new Paragraph("3) MPLS VPN",myfont);
         	paragraph9.getFont().setStyle(Font.NORMAL);
        	paragraph9.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph9);
         	
         	Paragraph paragraphH6=new Paragraph(" ");
          	document.add(paragraphH6);  
        	
         	    st2 = (Statement) conn.createStatement();
	            rs2 = (ResultSet) st2.executeQuery("select * from mpls_item where mi_cs_id  = '"+csId+"'");
	            while(rs2.next())
	                  {
	                  String mpls =rs2.getString("mpls");
	                  String mpls_remarks = rs2.getString("mpls_remarks");
	                  String mpls_nameN = rs2.getString("mpls_name");
	                  
	                  Paragraph paragraph91=new Paragraph("        "+mpls_nameN+"                                                                                                              "+mpls,myfont);
		              paragraph91.getFont().setStyle(Font.NORMAL);
		              paragraph91.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph91);
		              }
      	
	            Paragraph paragraphH7s=new Paragraph(" ");
	          	document.add(paragraphH7s);  
	          	
	       	
	          	
         	Paragraph paragraph10=new Paragraph("4) INTERNET CONNECTION",myfont);
         	paragraph10.getFont().setStyle(Font.NORMAL);
        	paragraph10.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph10);
         	
         	Paragraph paragraphH8=new Paragraph(" ");
          	document.add(paragraphH8);  
         	    st3 = (Statement) conn.createStatement();
	            rs3 = (ResultSet) st3.executeQuery("select * from internet_item where ii_cs_id  = '"+csId+"'");
	            while(rs3.next())
	                  {
	            	  String inte =rs3.getString("internet");
	                  String int_nameN = rs3.getString("int_name");
	                
	                  Paragraph paragraph101=new Paragraph("        "+int_nameN+"                                                                                                                      "+inte,myfont);
		              paragraph101.getFont().setStyle(Font.NORMAL);
		              paragraph101.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph101);
		              }
	            
	            Paragraph paragraphH9=new Paragraph(" ");
	          	document.add(paragraphH9);    
	          	
         	Paragraph paragraph11=new Paragraph("5) ISP ( MPLS VPN ) Router                                                                                                                 "+isp_router,myfont);
         	paragraph11.getFont().setStyle(Font.NORMAL);
        	paragraph11.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph11);
         	
         	Paragraph paragraphH10=new Paragraph(" ");
          	document.add(paragraphH10);  
          	
          	
          	
          	
          	
          	
          	Paragraph paragraph9sb=new Paragraph("6) Server Backup (HO Only )",myfont);
         	paragraph9sb.getFont().setStyle(Font.NORMAL);
        	paragraph9sb.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph9sb);
         	
         	                 	
         	Paragraph paragraphHsb=new Paragraph(" ");
          	document.add(paragraphHsb);  
          	
          
	            
		          	PdfPTable pdfPTableSB = new PdfPTable(2);
		        	pdfPTableSB.setWidthPercentage(90);
           	
		        	pdfPTableSB.getDefaultCell().setBorderWidth(0f);
		        	
		        	stsb = (Statement) conn.createStatement();
		     	    rssb = (ResultSet) stsb.executeQuery("select * from backup_item where bi_cs_id = '"+csId+"'");
		            while(rssb.next())
		                        {
		            	        String bkup_name  = rssb.getString("bkup_name");
		    	                String bkup =rssb.getString("bkup");
	            	       
		            	        Paragraph paragraph11sb=new Paragraph(bkup_name,myfont);
				        	    PdfPCell pdfPCell11sb = new PdfPCell(paragraph11sb);
				        	       
				        	    Paragraph paragraph12sb=new Paragraph(bkup,myfont);
				        	    PdfPCell pdfPCell21sb = new PdfPCell(paragraph12sb);
			        	     
				        	    pdfPCell11sb.setHorizontalAlignment(Element.ALIGN_LEFT);
				        	    pdfPTableSB.addCell(pdfPCell11sb);
				        	    pdfPCell21sb.setHorizontalAlignment(Element.ALIGN_LEFT);
				        	    pdfPTableSB.addCell(pdfPCell21sb);
				        	    
		                        }
	            
	                 document.add(pdfPTableSB);
	            
	     
	            
	            
	            
	            Paragraph paragraphH7sb=new Paragraph(" ");
	          	document.add(paragraphH7sb);  
          	
          	
	        Paragraph paragraph12sa=new Paragraph("7) SAOBB IPVPN & SDWAN Router Working(HO Only)                                                              "+cr_working,myfont);
	        paragraph12sa.getFont().setStyle(Font.NORMAL);
	        paragraph12sa.setAlignment(Element.ALIGN_LEFT);
	        document.add(paragraph12sa);
	        
	        Paragraph paragraphH11sa=new Paragraph(" ");
	        document.add(paragraphH11sa);  
	        
	        Paragraph paragraph12fo=new Paragraph("8)  FortiGate 400D Firewall Working(HO Only)                                                                                 "+wg_firewall,myfont);
	        paragraph12fo.getFont().setStyle(Font.NORMAL);
	        paragraph12fo.setAlignment(Element.ALIGN_LEFT);
	        document.add(paragraph12fo);
	        
	        Paragraph paragraphH11fo=new Paragraph(" ");
	        document.add(paragraphH11fo);  
	        
	        Paragraph paragraph12of=new Paragraph("9) Office 365/Microsoft Teams/SharePoint(Working)                                                                         "+ln_server,myfont);
	        paragraph12of.getFont().setStyle(Font.NORMAL);
	        paragraph12of.setAlignment(Element.ALIGN_LEFT);
	        document.add(paragraph12of);
	        
	        Paragraph paragraphH11of=new Paragraph(" ");
	        document.add(paragraphH11of);  
          	 
       	    
         	Paragraph paragraph12=new Paragraph("10) NEWINS/NExAS/GS-NET/NEx-GLOW(Working)                                                                   "+newins,myfont);
         	paragraph12.getFont().setStyle(Font.NORMAL);
        	paragraph12.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph12);
         	
         	Paragraph paragraphH11=new Paragraph(" ");
          	document.add(paragraphH11);  
         	
         	Paragraph paragraph13=new Paragraph("11) Server Room AC ( Working )                                                                                                        "+sr_ac,myfont);
         	paragraph13.getFont().setStyle(Font.NORMAL);
        	paragraph13.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph13);
         	
         	Paragraph paragraph131=new Paragraph("        Temperature Maintained                                                                                                              "+tm+" degree",myfont);
         	paragraph131.getFont().setStyle(Font.NORMAL);
        	paragraph131.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph131);
         	
         	Paragraph paragraphH12=new Paragraph(" ");
          	document.add(paragraphH12);  
         	
         	Paragraph paragraph14=new Paragraph("12) Photocopier",myfont);
         	paragraph14.getFont().setStyle(Font.NORMAL);
        	paragraph14.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph14);
         	
         	Paragraph paragraphH13=new Paragraph(" ");
          	document.add(paragraphH13);  
         	    
         	    st5 = (Statement) conn.createStatement();
	            rs5 = (ResultSet) st5.executeQuery("select * from photocopier_item where pi_cs_id  = '"+csId+"'");
	            while(rs5.next())
	                  {
	            	  String phto_name  = rs5.getString("phto_name");
	            	  String phto =rs5.getString("phto");
	            	  
	            	  Paragraph paragraph141=new Paragraph("        "+phto_name+"                                                                                                                     "+phto,myfont);
		              paragraph141.getFont().setStyle(Font.NORMAL);
		              paragraph141.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph141);
         	          }
	            Paragraph paragraphH14=new Paragraph(" ");
	          	document.add(paragraphH14);  
	           
         	Paragraph paragraph15=new Paragraph("13)  Printer ( Laser Jet / Dot Matrix )",myfont);
         	paragraph15.getFont().setStyle(Font.NORMAL);
        	paragraph15.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph15);
         	
         	Paragraph paragraphH15=new Paragraph(" ");
          	document.add(paragraphH15);  
         	
		         st6 = (Statement) conn.createStatement();
		         rs6 = (ResultSet) st6.executeQuery("select * from printer_item where prt_cs_id  = '"+csId+"'");
		         while(rs6.next())
		               {
		         	   String prt_name  = rs6.getString("prt_name");
		         	   String prt =rs6.getString("prt");
		         	   
		         	  Paragraph paragraph151=new Paragraph("        "+prt_name+"                                                                                                                              "+prt,myfont);
		              paragraph151.getFont().setStyle(Font.NORMAL);
		              paragraph151.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph151);
		               }
		          	        
		         Paragraph paragraphH16=new Paragraph(" ");
		         document.add(paragraphH16);  
		          	
         	Paragraph paragraph16=new Paragraph("14)  Fax Machines",myfont);
         	paragraph16.getFont().setStyle(Font.NORMAL);
        	paragraph16.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph16);
         	
         	Paragraph paragraphH17=new Paragraph(" ");
          	document.add(paragraphH17);  
         	
         	    st7 = (Statement) conn.createStatement();
	            rs7 = (ResultSet) st7.executeQuery("select * from fax_item where fx_cs_id  = '"+csId+"'");
	            while(rs7.next())
	                  {
	            	  String fx_name  = rs7.getString("fx_name");
	            	  String fx =rs7.getString("fx");
	            	  
	            	  Paragraph paragraph161=new Paragraph("        "+fx_name+"                                                                                              "+fx,myfont);
		              paragraph161.getFont().setStyle(Font.NORMAL);
		              paragraph161.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph161);
	                  }
         
	            Paragraph paragraphH18=new Paragraph(" ");
	          	document.add(paragraphH18);  
	          	
	      	Paragraph paragraph17=new Paragraph("15)  Barcode Scanner / Printer	",myfont);
         	paragraph17.getFont().setStyle(Font.NORMAL);
        	paragraph7.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph17);
         	
         	Paragraph paragraphH19=new Paragraph(" ");
          	document.add(paragraphH19);  
         	
	         	st7 = (Statement) conn.createStatement();
	            rs7 = (ResultSet) st7.executeQuery("select * from barcode_item where br_cs_id  = '"+csId+"'");
	            while(rs7.next())
	                 {
	            	 String br_name  = rs7.getString("br_name");
	            	 String br =rs7.getString("br");
	            	 
	            	 Paragraph paragraph161=new Paragraph("        "+br_name+"                                                                                                             "+br,myfont);
		             paragraph161.getFont().setStyle(Font.NORMAL);
		             paragraph161.setAlignment(Element.ALIGN_LEFT);
		             document.add(paragraph161);
	                 }
	            Paragraph paragraphH20=new Paragraph(" ");
	          	document.add(paragraphH20); 
	          	
         	Paragraph paragraph18=new Paragraph("16) Telephone EPABX / Lines                                                                                                            "+tele,myfont);
         	paragraph18.getFont().setStyle(Font.NORMAL);
        	paragraph18.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph18);
         	
         	Paragraph paragraphH21=new Paragraph(" ");
          	document.add(paragraphH21);  
         	
         	Paragraph paragraph19=new Paragraph("17) CCTV ( Working )                                                                                                                         "+cctv,myfont);
         	paragraph19.getFont().setStyle(Font.NORMAL);
        	paragraph19.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph19);
         	
         	Paragraph paragraph191=new Paragraph("        Backup ( no. of days)                                                                                                                    "+cctv_backup,myfont);
         	paragraph191.getFont().setStyle(Font.NORMAL);
        	paragraph191.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph191);
         	
         	Paragraph paragraphH22=new Paragraph(" ");
          	document.add(paragraphH22);  
         	
         	Paragraph paragraph20=new Paragraph("18) Access Controller ( Working )                                                                                                       "+access_con,myfont);
         	paragraph20.getFont().setStyle(Font.NORMAL);
        	paragraph20.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph20);
         	
         	Paragraph paragraphH23=new Paragraph(" ");
          	document.add(paragraphH23);  
         	
         	Paragraph paragraph21=new Paragraph("19) Fire Alarm ( Working )                                                                                                                "+fire_a,myfont);
         	paragraph21.getFont().setStyle(Font.NORMAL);
        	paragraph21.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph21);
         	
         	Paragraph paragraph211=new Paragraph("    When was last checked                                                                                                                  "+fire_l,myfont);
         	paragraph211.getFont().setStyle(Font.NORMAL);
        	paragraph211.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph211);
         	
         	Paragraph paragraphH24=new Paragraph(" ");
          	document.add(paragraphH24);  
         	
         	Paragraph paragraph22=new Paragraph("20) Instruction Deducation system ( IDS ) ( Working )                                                                    "+ids_w,myfont);
         	paragraph22.getFont().setStyle(Font.NORMAL);
        	paragraph22.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph22);
         	
         	Paragraph paragraph221=new Paragraph("    When was last checked                                                                                                                  "+ids_l,myfont);
         	paragraph221.getFont().setStyle(Font.NORMAL);
        	paragraph221.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph221);
         	
         	Paragraph paragraphH25=new Paragraph(" ");
          	document.add(paragraphH25);  
         	
         	Paragraph paragraph23=new Paragraph("21) Any IT hardware under Repair ( Pls. specify)                                                                              "+ithardware_r,myfont);
         	paragraph23.getFont().setStyle(Font.NORMAL);
        	paragraph23.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph23);
         	
         	Paragraph paragraph231=new Paragraph("    Status or by it will be rectified and put into use.                                                                             "+ithardware_n,myfont);
         	paragraph231.getFont().setStyle(Font.NORMAL);
        	paragraph231.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph231);
         	
         	Paragraph paragraphH26=new Paragraph(" ");
          	document.add(paragraphH26);  
          	
         	Paragraph paragraph24=new Paragraph("22) Preventive Maintenance ( All IT equipment's)                                                                            "+preventive_e,myfont);
         	paragraph24.getFont().setStyle(Font.NORMAL);
        	paragraph24.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph24);
         	
         	Paragraph paragraph241=new Paragraph("    To be done every quater without fail",myfont);
         	paragraph241.getFont().setStyle(Font.NORMAL);
        	paragraph241.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph241);
         	
         	Paragraph paragraph242=new Paragraph("    If NO, provide reason                                                                                                                     "+quarter_r,myfont);
         	paragraph242.getFont().setStyle(Font.NORMAL);
        	paragraph242.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph242);
         	
         	Paragraph paragraphH27=new Paragraph(" ");
          	document.add(paragraphH27);  
         	
         	Paragraph paragraph25=new Paragraph("    Remarks (If any):",myfont);
         	paragraph25.getFont().setStyle(Font.NORMAL);
        	paragraph25.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph25);
         	
         	Paragraph paragraphH28=new Paragraph("");
          	document.add(paragraphH28);  
         	
         	Paragraph paragraph26=new Paragraph("    "+main_remarks,myfont);
         	paragraph26.getFont().setStyle(Font.NORMAL);
        	paragraph26.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph26);
         	
		    document.close();
		    outputStream.close();
		    
		    
		   }catch (DocumentException e)  
				{  
				e.printStackTrace();  
				}   
			catch (FileNotFoundException e)  
				{  
				e.printStackTrace();  
				}  
		    
		    
		    
		    
		   }catch (Exception e) 
			    {
			    System.out.println("Error On Email Sending....");
			    }	
		    
		    
    }
    
    
    
    
    
    
    
    public void getAttachmentFileOtherBranch(String csId) throws FileNotFoundException 
        {
  	    Connection conn = null;
	    byte[] bytes=null;
		String cs_id;
		System.out.println("CS IDD Other Branches from mail check send pdf : "+csId);
		
		FileOutputStream fos = null;
		File fileReport = new File("C:/workspace/CheckSheet/JRXML/CheckShOtherBranch.jasper");
		
		try 
		    {
			 fos = new FileOutputStream("C:/workspace/CheckSheet/JRXML/"+csId+".pdf");
		    } catch (FileNotFoundException e1) {
			        // TODO Auto-generated catch block
			        e1.printStackTrace();
		            }
		
		    try
		      {
		      Map map = new HashMap();
			  map.put("cs_id",csId);	
			  Connection2 dbConn = new Connection2();
			  conn = dbConn.getConnection2();
			  System.out.println("Create conn running jasper");
			  bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
			  System.out.println("Create conn running jasper 22");
			  fos.write(bytes);
			  System.out.println("Create conn running jasper 33");
		   	  }catch(Exception e)
					  {
					  e.printStackTrace();
					  }
    
       }
    public void getAttachmentFileOtherBranch1(String csId) throws FileNotFoundException 
        {
	    
	
		System.out.println("CS IDD Other Branches from mail check send pdf : "+csId);
		
	    String filePath="C:/workspace/CheckSheet/JRXML/"+csId+".pdf";
		
	    
	    ///////////////////////////////////////////////////////////////////////
		    
		    
		    
	   try 
		 {
	     try 
			{
		    Document document = new Document();
	    	OutputStream outputStream =  new FileOutputStream(new File(filePath));
	    	PdfWriter.getInstance(document, outputStream);
	    	document.open();
	    	
	    	System.out.println("File path :::::::::::"+filePath);
	    	
	     	Image img = Image.getInstance("E:\\nipponlogo.GIF");
	        img.setAbsolutePosition(100f, 775f);
	        img.scaleAbsolute(25f, 25f);
	        document.add(img);
	       	
	    	
	        PdfPTable pdfPTable = new PdfPTable(8);
	    	pdfPTable.setWidthPercentage(110);
	    	
	    	
//	        Font myfont = new Font();
//	        myfont.setStyle(Font.NORMAL);
//	    	myfont.setSize(9);
	    	
//	    	Font myfont11 = new Font();
//		    myfont11.setStyle(Font.NORMAL);
//		    myfont11.setSize(15);
		    
		    Font myfont11 = new Font(FontFamily.TIMES_ROMAN,15.0f,Font.NORMAL,BaseColor.BLACK);
		    
		    Font myfont = new Font(FontFamily.TIMES_ROMAN,9.0f,Font.NORMAL,BaseColor.BLACK);
	    	
	    	Paragraph paragraphH=new Paragraph("NIPPON EXPRESS (INDIA) PRIVATE LIMITED",myfont11);
         	paragraphH.getFont().setStyle(Font.BOLD);
         	paragraphH.setAlignment(Element.ALIGN_CENTER);
         	document.add(paragraphH);
         	Paragraph paragraphH1=new Paragraph(" ");
          	document.add(paragraphH1);
	    	
	    	
	    	Paragraph paragraph=new Paragraph("IT CHECK SHEET",myfont);
         	paragraph.getFont().setStyle(Font.BOLD);
        	paragraph.setAlignment(Element.ALIGN_CENTER);
         	document.add(paragraph);
         	Paragraph paragraphH2=new Paragraph(" ");
          	document.add(paragraphH2);  
          	
           	
            Connection2 dbConn = new Connection2();
			Connection conn = dbConn.getConnection2();
            Statement st2,st3,st5,st6,st7,stt1;
            ResultSet rs2,rs3,rs5,rs6,rs7,rst1;
            String e_name="",city="",cs_date="",ps_raw="",ps_upworking="",ps_upsbackup="",ps_upspreventive="",si_working="",isp_router="",newins="",sr_ac="",tm="";
            String tele="",cctv="",cctv_backup="",access_con="",fire_a="",fire_l="",  ids_w="",ids_l="",ithardware_r="",ithardware_n="",preventive_e="",quarter_r="",main_remarks="";
            try
               {
          		stt1 = (Statement) conn.createStatement();
          		rst1 = (ResultSet) stt1.executeQuery("select * from cs_master where cs_id  = '"+csId+"'");
          		while(rst1.next())
          		      {
          			   e_name = rst1.getString("e_name");
          			   city = rst1.getString("city");
          			   cs_date =rst1.getString("cs_date");
          			   ps_raw = rst1.getString("ps_raw");
          			   ps_upworking = rst1.getString("ps_upsworking");
          			   ps_upsbackup = rst1.getString("ps_upsbackup");
          			   ps_upspreventive = rst1.getString("ps_upspreventive");
          			   si_working = rst1.getString("si_working");
          			   
          			   isp_router = rst1.getString("isp_router");
          			   newins = rst1.getString("NEWINS");
         	           sr_ac = rst1.getString("sr_ac");
         	           tm = rst1.getString("tm");
         	           
         	           tele = rst1.getString("tele");
         		       cctv =rst1.getString("cctv");
         		       cctv_backup = rst1.getString("cctv_backup");
         		       
         		       access_con = rst1.getString("access_con");
         		       fire_a = rst1.getString("fire_a");
         		       fire_l = rst1.getString("fire_l");
         		       ids_w = rst1.getString("ids_w");
         		       ids_l = rst1.getString("ids_l");
         		       
         		       ithardware_r = rst1.getString("ithardware_r");
         		       ithardware_n = rst1.getString("ithardware_n");
         		       preventive_e = rst1.getString("preventive_e");
         		       quarter_r = rst1.getString("quarter_r");
         		       main_remarks = rst1.getString("main_remarks");
         	           } 
          		}
          		catch (Exception e) {
          				 System.out.println(e);
          		}

      
	    	
          	Paragraph paragraph1=new Paragraph("System Admin: "+e_name+"                                                                                               Location: "+city,myfont);
         	paragraph1.getFont().setStyle(Font.NORMAL);
        	paragraph1.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph1);
         	
         	Paragraph paragraphHs=new Paragraph(" ");
          	document.add(paragraphHs);  
         	
         
         	
         	Paragraph paragraph2=new Paragraph("Check Sheet No: "+csId+"                                                                                        Date: "+cs_date,myfont);
         	paragraph2.getFont().setStyle(Font.NORMAL);
        	paragraph2.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph2);
         	Paragraph paragraphH3=new Paragraph(" ");
          	document.add(paragraphH3);  
         	
         	
         	Paragraph paragraph3=new Paragraph("1) Power supply",myfont);
         	paragraph3.getFont().setStyle(Font.NORMAL);
        	paragraph3.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph3);
         	
         	Paragraph paragraphH4=new Paragraph(" ");
          	document.add(paragraphH4);  
          	
         	Paragraph paragraph4=new Paragraph("        RAW Power Working                                                                                                                      "+ps_raw,myfont);
         	paragraph4.getFont().setStyle(Font.NORMAL);
        	paragraph4.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph4);
          	
         	Paragraph paragraph5=new Paragraph("        UPS Working                                                                                                                                   "+ps_upworking,myfont);
         	paragraph5.getFont().setStyle(Font.NORMAL);
        	paragraph5.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph5);
         	
         	Paragraph paragraph6=new Paragraph("        UPS Backup time ( to be checked weekly once)                                                                            "+ps_upsbackup+" hours",myfont);
         	paragraph6.getFont().setStyle(Font.NORMAL);
        	paragraph6.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph6);
         	
         	Paragraph paragraph7=new Paragraph("        UPS Preventive Maintenance                                                                                                          "+ps_upspreventive,myfont);
         	paragraph7.getFont().setStyle(Font.NORMAL);
        	paragraph7.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph7);
         	
         	Paragraph paragraph8=new Paragraph("        (to be checked 3 month once)",myfont);
         	paragraph8.getFont().setStyle(Font.NORMAL);
        	paragraph8.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph8);
         	
         	Paragraph paragraphH5=new Paragraph(" ");
          	document.add(paragraphH5);  
          	
         	Paragraph paragraph9=new Paragraph("2) MPLS VPN",myfont);
         	paragraph9.getFont().setStyle(Font.NORMAL);
        	paragraph9.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph9);
         	
         	Paragraph paragraphH6=new Paragraph(" ");
          	document.add(paragraphH6);  
        	
         	    st2 = (Statement) conn.createStatement();
	            rs2 = (ResultSet) st2.executeQuery("select * from mpls_item where mi_cs_id  = '"+csId+"'");
	            while(rs2.next())
	                  {
	                  String mpls =rs2.getString("mpls");
	                  String mpls_remarks = rs2.getString("mpls_remarks");
	                  String mpls_nameN = rs2.getString("mpls_name");
	                  
	                  Paragraph paragraph91=new Paragraph("        "+mpls_nameN+"                                                                                                              "+mpls,myfont);
		              paragraph91.getFont().setStyle(Font.NORMAL);
		              paragraph91.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph91);
		              }
      	
	            Paragraph paragraphH7=new Paragraph(" ");
	          	document.add(paragraphH7);  
	          	
         	Paragraph paragraph10=new Paragraph("3) INTERNET CONNECTION",myfont);
         	paragraph10.getFont().setStyle(Font.NORMAL);
        	paragraph10.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph10);
         	
         	Paragraph paragraphH8=new Paragraph(" ");
          	document.add(paragraphH8);  
         	    st3 = (Statement) conn.createStatement();
	            rs3 = (ResultSet) st3.executeQuery("select * from internet_item where ii_cs_id  = '"+csId+"'");
	            while(rs3.next())
	                  {
	            	  String inte =rs3.getString("internet");
	                  String int_nameN = rs3.getString("int_name");
	                
	                  Paragraph paragraph101=new Paragraph("        "+int_nameN+"                                                                                                                      "+inte,myfont);
		              paragraph101.getFont().setStyle(Font.NORMAL);
		              paragraph101.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph101);
		              }
	            
	            Paragraph paragraphH9=new Paragraph(" ");
	          	document.add(paragraphH9);    
	          	
         	Paragraph paragraph11=new Paragraph("4) ISP ( MPLS VPN ) Router                                                                                                                 "+isp_router,myfont);
         	paragraph11.getFont().setStyle(Font.NORMAL);
        	paragraph11.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph11);
         	
         	Paragraph paragraphH10=new Paragraph(" ");
          	document.add(paragraphH10);  
         	
         	Paragraph paragraph12=new Paragraph("5) NEWINS Apllication ( Working )                                                                                                     "+newins,myfont);
         	paragraph12.getFont().setStyle(Font.NORMAL);
        	paragraph12.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph12);
         	
         	Paragraph paragraphH11=new Paragraph(" ");
          	document.add(paragraphH11);  
         	
         	Paragraph paragraph13=new Paragraph("6) Server Room AC ( Working )                                                                                                           "+sr_ac,myfont);
         	paragraph13.getFont().setStyle(Font.NORMAL);
        	paragraph13.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph13);
         	
         	Paragraph paragraph131=new Paragraph("        Temperature Maintained                                                                                                              "+tm+" degree",myfont);
         	paragraph131.getFont().setStyle(Font.NORMAL);
        	paragraph131.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph131);
         	
         	Paragraph paragraphH12=new Paragraph(" ");
          	document.add(paragraphH12);  
         	
         	Paragraph paragraph14=new Paragraph("7) Photocopier",myfont);
         	paragraph14.getFont().setStyle(Font.NORMAL);
        	paragraph14.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph14);
         	
         	Paragraph paragraphH13=new Paragraph(" ");
          	document.add(paragraphH13);  
         	    
         	    st5 = (Statement) conn.createStatement();
	            rs5 = (ResultSet) st5.executeQuery("select * from photocopier_item where pi_cs_id  = '"+csId+"'");
	            while(rs5.next())
	                  {
	            	  String phto_name  = rs5.getString("phto_name");
	            	  String phto =rs5.getString("phto");
	            	  
	            	  Paragraph paragraph141=new Paragraph("        "+phto_name+"                                                                                                                     "+phto,myfont);
		              paragraph141.getFont().setStyle(Font.NORMAL);
		              paragraph141.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph141);
         	          }
	            Paragraph paragraphH14=new Paragraph(" ");
	          	document.add(paragraphH14);  
	           
         	Paragraph paragraph15=new Paragraph("8)  Printer ( Laser Jet / Dot Matrix )",myfont);
         	paragraph15.getFont().setStyle(Font.NORMAL);
        	paragraph15.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph15);
         	
         	Paragraph paragraphH15=new Paragraph(" ");
          	document.add(paragraphH15);  
         	
		         st6 = (Statement) conn.createStatement();
		         rs6 = (ResultSet) st6.executeQuery("select * from printer_item where prt_cs_id  = '"+csId+"'");
		         while(rs6.next())
		               {
		         	   String prt_name  = rs6.getString("prt_name");
		         	   String prt =rs6.getString("prt");
		         	   
		         	  Paragraph paragraph151=new Paragraph("        "+prt_name+"                                                                                                                              "+prt,myfont);
		              paragraph151.getFont().setStyle(Font.NORMAL);
		              paragraph151.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph151);
		               }
		          	        
		         Paragraph paragraphH16=new Paragraph(" ");
		         document.add(paragraphH16);  
		          	
         	Paragraph paragraph16=new Paragraph("9)  Fax Machines",myfont);
         	paragraph16.getFont().setStyle(Font.NORMAL);
        	paragraph16.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph16);
         	
         	Paragraph paragraphH17=new Paragraph(" ");
          	document.add(paragraphH17);  
         	
         	    st7 = (Statement) conn.createStatement();
	            rs7 = (ResultSet) st7.executeQuery("select * from fax_item where fx_cs_id  = '"+csId+"'");
	            while(rs7.next())
	                  {
	            	  String fx_name  = rs7.getString("fx_name");
	            	  String fx =rs7.getString("fx");
	            	  
	            	  Paragraph paragraph161=new Paragraph("        "+fx_name+"                                                                                "+fx,myfont);
		              paragraph161.getFont().setStyle(Font.NORMAL);
		              paragraph161.setAlignment(Element.ALIGN_LEFT);
		              document.add(paragraph161);
	                  }
         
	            Paragraph paragraphH18=new Paragraph(" ");
	          	document.add(paragraphH18);  
	          	
	      	Paragraph paragraph17=new Paragraph("10)  Barcode Scanner / Printer	",myfont);
         	paragraph17.getFont().setStyle(Font.NORMAL);
        	paragraph7.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph17);
         	
         	Paragraph paragraphH19=new Paragraph(" ");
          	document.add(paragraphH19);  
         	
	         	st7 = (Statement) conn.createStatement();
	            rs7 = (ResultSet) st7.executeQuery("select * from barcode_item where br_cs_id  = '"+csId+"'");
	            while(rs7.next())
	                 {
	            	 String br_name  = rs7.getString("br_name");
	            	 String br =rs7.getString("br");
	            	 
	            	 Paragraph paragraph161=new Paragraph("        "+br_name+"                                                                              "+br,myfont);
		             paragraph161.getFont().setStyle(Font.NORMAL);
		             paragraph161.setAlignment(Element.ALIGN_LEFT);
		             document.add(paragraph161);
	                 }
	            Paragraph paragraphH20=new Paragraph(" ");
	          	document.add(paragraphH20); 
	          	
         	Paragraph paragraph18=new Paragraph("11) Telephone EPABX / Lines                                                                                                            "+tele,myfont);
         	paragraph18.getFont().setStyle(Font.NORMAL);
        	paragraph18.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph18);
         	
         	Paragraph paragraphH21=new Paragraph(" ");
          	document.add(paragraphH21);  
         	
         	Paragraph paragraph19=new Paragraph("12) CCTV ( Working )                                                                                                                         "+cctv,myfont);
         	paragraph19.getFont().setStyle(Font.NORMAL);
        	paragraph19.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph19);
         	
         	Paragraph paragraph191=new Paragraph("        Backup ( no. of days)                                                                                                                    "+cctv_backup,myfont);
         	paragraph191.getFont().setStyle(Font.NORMAL);
        	paragraph191.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph191);
         	
         	Paragraph paragraphH22=new Paragraph(" ");
          	document.add(paragraphH22);  
         	
         	Paragraph paragraph20=new Paragraph("13) Access Controller ( Working )                                                                                                       "+access_con,myfont);
         	paragraph20.getFont().setStyle(Font.NORMAL);
        	paragraph20.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph20);
         	
         	Paragraph paragraphH23=new Paragraph(" ");
          	document.add(paragraphH23);  
         	
         	Paragraph paragraph21=new Paragraph("14) Fire Alarm ( Working )                                                                                                                "+fire_a,myfont);
         	paragraph21.getFont().setStyle(Font.NORMAL);
        	paragraph21.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph21);
         	
         	Paragraph paragraph211=new Paragraph("    When was last checked                                                                                                                  "+fire_l,myfont);
         	paragraph211.getFont().setStyle(Font.NORMAL);
        	paragraph211.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph211);
         	
         	Paragraph paragraphH24=new Paragraph(" ");
          	document.add(paragraphH24);  
         	
         	Paragraph paragraph22=new Paragraph("15) Instruction Deducation system ( IDS ) ( Working )                                                                    "+ids_w,myfont);
         	paragraph22.getFont().setStyle(Font.NORMAL);
        	paragraph22.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph22);
         	
         	Paragraph paragraph221=new Paragraph("    When was last checked                                                                                                                  "+ids_l,myfont);
         	paragraph221.getFont().setStyle(Font.NORMAL);
        	paragraph221.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph221);
         	
         	Paragraph paragraphH25=new Paragraph(" ");
          	document.add(paragraphH25);  
         	
         	Paragraph paragraph23=new Paragraph("16) Any IT hardware under Repair ( Pls. specify)                                                                              "+ithardware_r,myfont);
         	paragraph23.getFont().setStyle(Font.NORMAL);
        	paragraph23.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph23);
         	
         	Paragraph paragraph231=new Paragraph("    Status or by it will be rectified and put into use.                                                                             "+ithardware_n,myfont);
         	paragraph231.getFont().setStyle(Font.NORMAL);
        	paragraph231.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph231);
         	
         	Paragraph paragraphH26=new Paragraph(" ");
          	document.add(paragraphH26);  
          	
         	Paragraph paragraph24=new Paragraph("17) Preventive Maintenance ( All IT equipment's)                                                                            "+preventive_e,myfont);
         	paragraph24.getFont().setStyle(Font.NORMAL);
        	paragraph24.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph24);
         	
         	Paragraph paragraph241=new Paragraph("    To be done every quater without fail",myfont);
         	paragraph241.getFont().setStyle(Font.NORMAL);
        	paragraph241.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph241);
         	
         	Paragraph paragraph242=new Paragraph("    If NO, provide reason                                                                                                                     "+quarter_r,myfont);
         	paragraph242.getFont().setStyle(Font.NORMAL);
        	paragraph242.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph242);
         	
         	Paragraph paragraphH27=new Paragraph(" ");
          	document.add(paragraphH27);  
         	
         	Paragraph paragraph25=new Paragraph("    Remarks (If any):",myfont);
         	paragraph25.getFont().setStyle(Font.NORMAL);
        	paragraph25.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph25);
         	
         	Paragraph paragraphH28=new Paragraph("");
          	document.add(paragraphH28);  
         	
         	Paragraph paragraph26=new Paragraph("    "+main_remarks,myfont);
         	paragraph26.getFont().setStyle(Font.NORMAL);
        	paragraph26.setAlignment(Element.ALIGN_LEFT);
         	document.add(paragraph26);
         	
	    	
          
    	    
            document.add(pdfPTable);
		    document.close();
		    outputStream.close();
		    
		    
		   }catch (DocumentException e)  
				{  
				e.printStackTrace();  
				}   
			catch (FileNotFoundException e)  
				{  
				e.printStackTrace();  
				}  
		    
		    
		    
		    
		   }catch (Exception e) 
			    {
			    System.out.println("Error On Email Sending....");
			    }	
		    
		    
		    
		    
	
		    
       }

    
    
    public void getAttachmentFileForISP(String isp,String branchNo,String fileName)
    {

	     Connection conn = null;
	     byte[] bytes=null;
		 System.out.println("CID ::: "+isp);
		 Map mapx = new HashMap();
		 mapx.put("CID",isp);
		
		 File savedFile = new File("E:/neinSoft/files/C2IT/Ispoutage/NEIN/CID/"+branchNo); 
		
		 if(!savedFile.exists()) 
		 {
		    savedFile.mkdirs();
		    savedFile.setWritable(true);
		 }
		 
		FileOutputStream fos = null;
		File fileReport = new File("C:/workspace/CheckSheet/JRXML/ISPOutAge.jasper");
		 
		try {
		     
	         fos = new FileOutputStream("E:/neinSoft/files/C2IT/Ispoutage/NEIN/CID/"+branchNo+"/"+fileName+".pdf");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try{ 
			 	    Connection2 dbConn = new Connection2(); 
			 		conn = dbConn.getConnection2();
			 		System.out.println("ISP File File Created"); 
			 	    bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), mapx, conn); 
			 		fos.write(bytes); 
		 	}
	
	catch(Exception e)
	{ 
		e.printStackTrace();
	} 
	
    }

    
    
    
    
    ////////////////////////  ITClerance report send  /////////////////////
    
    public void getAttachmentFileITClearance(String formno)
        {
 	    Connection conn = null;
	    byte[] bytes=null;
		String cs_id;
		System.out.println("itclerance i report send : "+formno);
		Map map = new HashMap();
		map.put("cs_id",formno);
		FileOutputStream fos = null;
		File fileReport = new File("C:/workspace/ITCLERANCE/JRXML/OutstandingReport.jasper");
		try  
		   {
		   fos = new FileOutputStream("C:/workspace/ITCLERANCE/JRXML/"+formno+".pdf");
		   } catch (FileNotFoundException e1) {
		 	e1.printStackTrace();
		   }
	    try
		   {
		   Connection2 dbConn = new Connection2();
		   conn = dbConn.getConnection2();
 		   System.out.println("Create conn running jasper : "+fileReport.getPath());
		   bytes = JasperRunManager.runReportToPdf(fileReport.getPath(), map, conn);
		   fos.write(bytes);
	  	   }
   	    catch(Exception e)
	     {
		 e.printStackTrace();
	     }
	}
   
  /////////////////////////////////////////////////////////////////////////////  
    
    
    public void getAttachmentFileIMS(String imsId)
    {

		Connection conn = null;
	    byte[] bytes=null;
		String ims_id;
		System.out.println("CS IDD IMS from mail check send pdf : "+imsId);
		//System.out.println("second value  : "+ims_id);
		Map map = new HashMap();
		map.put("ims_id",imsId);
		FileOutputStream fos2 = null;
		File fileReport2 = new File("C:/workspace/CheckSheet/JRXML/IMS.jasper");
		//File reportFilejrxml = new File(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/CheckSh1.jrxml"));
        
		 try {
			// fos = new FileOutputStream(getServletConfig().getServletContext().getRealPath("/WebContent/JRXML/"+csId+".pdf"));
			 System.out.println("CS IDD IMS from mail check send pdf NEXT TIME  : "+imsId);
			 fos2 = new FileOutputStream("C:/workspace/CheckSheet/JRXML/"+imsId+".pdf");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try{
			 
			
			 		Connection2 dbConn = new Connection2();
			 		
			 		conn = dbConn.getConnection2();
			 		System.out.println("Create conn running jasper");
			 		
			 		 bytes = JasperRunManager.runReportToPdf(fileReport2.getPath(), map, conn);
			 		 
			 		fos2.write(bytes);
			 		 
		 	}
	
	catch(Exception e)
	{
		
		e.printStackTrace();
	}
	
	// return reportFilejrxml;
	
    }
/*   public static void main(String a[]){
	   
	   FileAttachment ft = new FileAttachment();
	   
	   ft.getAttachmentFileIMS("NEIN/CS/IMS/90-14");
   }*/
}
