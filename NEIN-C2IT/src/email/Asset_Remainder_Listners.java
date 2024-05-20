package email;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Asset_Remainder_Listners implements ServletContextListener{
	Scheduler scheduler = null;

	

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub		
		// Setup the Job class and the Job group

      try {
      	System.out.println(".................Asset Remainder LISTENER................");

  		JobDetail job1 = JobBuilder.newJob(Asset_Configuration_Remainder_Job.class).withIdentity("CronQuartzJob", "Group").build(); 
  		
  		JobDetail job2 = JobBuilder.newJob(Asset_Warant_Expairy_Remainder_Job.class).withIdentity("CronQuartzJob", "Group1").build(); 
  	  	
          // Create a Trigger that fires every 5 minutes.
          Trigger trigger = TriggerBuilder.newTrigger().withIdentity("TriggerName", "Group")
           .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(03,45)).build();
         
          Trigger trigger1 = TriggerBuilder.newTrigger().withIdentity("TriggerName1", "Group1")
          .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(03,55)).build();
      
          //.withSchedule(SimpleScheduleBuilder.repeatHourlyForever()).build();         
          //*CronScheduleBuilder.dailyAtHourAndMinute(10,32)*/(4,05)
          //newTrigger().withIdentity("TriggerName","Group").withSchedule(CronScheduleBuilder.cronSchedule("0/5 * * * * ?")).build();
          // Setup the Job and Trigger with Scheduler & schedule jobs
                    
			scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
		    scheduler.scheduleJob(job1, trigger);
		    scheduler.scheduleJob(job2, trigger1);
		   
		    System.out.println("after scheduler");
		    
		  } catch (SchedulerException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
		System.out.println("Context Destroyed");
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
