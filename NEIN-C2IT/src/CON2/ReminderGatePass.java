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

public class ReminderGatePass implements ServletContextListener{
	Scheduler scheduler = null;

	

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub		
		// Setup the Job class and the Job group

      try {
      	System.out.println("IN LISTENER1");
      	
  		JobDetail job = JobBuilder.newJob(ReminderGatePass_jobs.class).withIdentity("GatePass", "Group").build(); 
  	
          // Create a Trigger that fires every 5 minutes.
          Trigger trigger = TriggerBuilder.newTrigger().withIdentity("GatePass", "Group")
           .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(11,30)).build();
          	scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
		    scheduler.scheduleJob(job, trigger);
		    
		   // System.out.println("after scheduler");
		    
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

