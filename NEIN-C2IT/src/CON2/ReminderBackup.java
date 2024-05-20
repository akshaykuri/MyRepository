package CON2;
import static org.quartz.JobBuilder.newJob;

import java.util.Calendar;
import java.util.Date;

import static org.quartz.TriggerBuilder.newTrigger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import static org.quartz.SimpleScheduleBuilder.*;
import java.text.SimpleDateFormat;  
import java.util.Locale;




public class ReminderBackup implements ServletContextListener 
        {
        Scheduler scheduler = null;
        @Override
        public void contextInitialized(ServletContextEvent servletContext) 
                {
                //System.out.println("Context Initialized");
                try 
                   {
                	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                	Calendar cal = Calendar.getInstance();
                	String d=dateFormat.format(cal.getTime());
                	//System.out.println("Current date :"+d);
      		        String s=d.substring(3,5);
      		        //System.out.println(s);
                 	cal.add( Calendar.DATE, 1 );    
                	String convertedDate=dateFormat.format(cal.getTime());    
                	//System.out.println("Date increase by one.."+convertedDate);
                	String s1=convertedDate.substring(3,5);
                	//System.out.println(s1);
                	scheduler = new StdSchedulerFactory().getScheduler();
                    scheduler.start();
                    
                    //////// Backup status entery/////////////
                    JobDetail jobAssetRemainder = newJob(ReminderBackup1.class).withIdentity("job5","Group5").build();
                    Trigger trigger5 =  newTrigger().withIdentity("TriggerName5", "Group5").startNow().withSchedule(simpleSchedule().withIntervalInSeconds(60).repeatForever()).build();
                    scheduler.scheduleJob(jobAssetRemainder, trigger5);
                    //////// Backup status entery/////////////
                    //////// Check  and  Veryfy///////////// 
                    if(!s.equals(s1))
                           {
                    	   //System.out.println("Date increase by one.."+convertedDate);
                	       JobDetail jobAssetRemainder2 = newJob(ReminderBackup2.class).withIdentity("job10","Group10").build();
                           Trigger trigger6 =  newTrigger().withIdentity("TriggerName10", "Group10").withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(15,1)).build();
                           scheduler.scheduleJob(jobAssetRemainder2, trigger6);
                           }
                    //////// Check  and  Veryfy///////////// 
                 
                    //////// Backup status entery pending reminder /////////////
                    JobDetail jobAssetRemainder3 = newJob(ReminderBackup3.class).withIdentity("job6","Group6").build();
                    Trigger trigger3 =  newTrigger().withIdentity("TriggerName6", "Group6").withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(23,59)).build();
                    scheduler.scheduleJob(jobAssetRemainder3, trigger3);
                    ////////Backup status entery pending reminder/////////////
         
                 
                  
                   }
                	catch (SchedulerException e)
                	    {
          				e.printStackTrace();
                	    }
                }
        @Override
        public void contextDestroyed(ServletContextEvent servletContext)
                {
                //System.out.println("Context Destroyed");
                try 
                    {
                    scheduler.shutdown();
                    } 
                catch (SchedulerException e) 
                    {
                    e.printStackTrace();
                    }
              }
}