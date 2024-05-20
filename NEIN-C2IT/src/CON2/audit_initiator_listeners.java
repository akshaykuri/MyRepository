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



public class audit_initiator_listeners implements ServletContextListener{
	Scheduler scheduler = null;
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		try 
        {
     	 System.out.println("IN LISTENER1 Audit initiator...............");
     	 JobDetail job11 = JobBuilder.newJob(audit_initiator.class).withIdentity("AuditInitiator", "Group11").build(); 
 	     Trigger trigger11 = TriggerBuilder.newTrigger().withIdentity("AuditInitiator", "Group11")
        .withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(10,10)).build();
        scheduler = new StdSchedulerFactory().getScheduler();
		 scheduler.start();
		 scheduler.scheduleJob(job11, trigger11);
		  } catch (SchedulerException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		}
	}
		


	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
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
