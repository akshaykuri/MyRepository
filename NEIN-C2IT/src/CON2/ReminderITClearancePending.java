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

public class ReminderITClearancePending implements ServletContextListener{
	Scheduler scheduler = null;

	

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub		
		// Setup the Job class and the Job group

      try 
        {
      	System.out.println("IN LISTENER1");
      	
  		JobDetail job = JobBuilder.newJob(ReminderITClearancePending_job.class).withIdentity("ITClearance", "Group").build(); 
  		JobDetail job1 = JobBuilder.newJob(ReminderITClearancePending_job.class).withIdentity("ITClearance1", "Group1").build(); 
  		JobDetail job2 = JobBuilder.newJob(ReminderITClearancePending_job.class).withIdentity("ITClearance2", "Group2").build(); 
  		JobDetail job3 = JobBuilder.newJob(ReminderITClearancePending_job.class).withIdentity("ITClearance3", "Group3").build(); 
  		JobDetail job4 = JobBuilder.newJob(ReminderITClearancePending_job.class).withIdentity("ITClearance4", "Group4").build(); 
  		JobDetail job5 = JobBuilder.newJob(ReminderITClearancePending_job.class).withIdentity("ITClearance5", "Group5").build(); 
  	
          // Create a Trigger that fires every 5 minutes.
          Trigger trigger = TriggerBuilder.newTrigger().withIdentity("ITClearance", "Group")
              .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(5,10)).build();
          	  scheduler = new StdSchedulerFactory().getScheduler();
			  scheduler.start();
		      scheduler.scheduleJob(job, trigger);
		    
		    
		  Trigger trigger1 = TriggerBuilder.newTrigger().withIdentity("ITClearance1", "Group1")
	          .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(10,10)).build();
	          scheduler = new StdSchedulerFactory().getScheduler();
		  	  scheduler.start();
		      scheduler.scheduleJob(job1, trigger1);
		      
		      
		  Trigger trigger2 = TriggerBuilder.newTrigger().withIdentity("ITClearance2", "Group2")
		      .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(12,10)).build();
		      scheduler = new StdSchedulerFactory().getScheduler();
		  	  scheduler.start();
		      scheduler.scheduleJob(job2, trigger2);
		      
		  Trigger trigger3 = TriggerBuilder.newTrigger().withIdentity("ITClearance3", "Group3")
		      .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(14,10)).build();
		      scheduler = new StdSchedulerFactory().getScheduler();
		  	  scheduler.start();
		      scheduler.scheduleJob(job3, trigger3);
		      
		  Trigger trigger4 = TriggerBuilder.newTrigger().withIdentity("ITClearance4", "Group4")
		      .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(17,0)).build();
		      scheduler = new StdSchedulerFactory().getScheduler();
		  	  scheduler.start();
		      scheduler.scheduleJob(job4, trigger4);
		      
		  Trigger trigger5 = TriggerBuilder.newTrigger().withIdentity("ITClearance5", "Group5")
		      .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(18,24)).build();
		      scheduler = new StdSchedulerFactory().getScheduler();
		  	  scheduler.start();
		      scheduler.scheduleJob(job5, trigger5);
		    
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

