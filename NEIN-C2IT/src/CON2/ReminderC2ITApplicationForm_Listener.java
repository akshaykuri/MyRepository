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

public class ReminderC2ITApplicationForm_Listener implements ServletContextListener{
	Scheduler scheduler = null;

	

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		

      try 
         {
      	 System.out.println("IN LISTENER1 C2ITReminder...............");
      	 JobDetail job = JobBuilder.newJob(ReminderC2ITApplicationForm_Job.class).withIdentity("C2ITReminder", "Group").build(); 
  	     Trigger trigger = TriggerBuilder.newTrigger().withIdentity("C2ITReminder", "Group")
         .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(5,10)).build();
         scheduler = new StdSchedulerFactory().getScheduler();
		 scheduler.start();
		 scheduler.scheduleJob(job, trigger);
		  } catch (SchedulerException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
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

