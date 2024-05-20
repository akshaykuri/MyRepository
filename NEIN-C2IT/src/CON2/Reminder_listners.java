package CON2;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Reminder_listners implements ServletContextListener{
	Scheduler scheduler = null;

	

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub		
		// Setup the Job class and the Job group

      try {
      	System.out.println("IN LISTENER");

  		JobDetail job = JobBuilder.newJob(Reminder_jobs.class).withIdentity("CronQuartzJob", "Group").build(); 
  	
          // Create a Trigger that fires every 5 minutes.
          Trigger trigger = TriggerBuilder.newTrigger().withIdentity("TriggerName1", "Group")
           .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(5,12)).build();
          //.withSchedule(SimpleScheduleBuilder.repeatHourlyForever()).build();         
          //*CronScheduleBuilder.dailyAtHourAndMinute(10,32)*/(4,05)
          //newTrigger().withIdentity("TriggerName","Group").withSchedule(CronScheduleBuilder.cronSchedule("0/5 * * * * ?")).build();
          // Setup the Job and Trigger with Scheduler & schedule jobs
                    
			scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
		    scheduler.scheduleJob(job, trigger);
		    
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
