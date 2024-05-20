package CON2;



import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import javax.servlet.annotation.WebServlet;




import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

/**
 * Servlet implementation class MgmtReport_Listners
 */
@WebServlet("/MgmtReport_Listners")
public class MgmtReport_Listners implements ServletContextListener{
Scheduler scheduler = null;



@Override
public void contextInitialized(ServletContextEvent arg0) {
	 try {
	      	System.out.println("MGMT LISTENER");

	  		JobDetail job10 = JobBuilder.newJob(MgmtReport.class).withIdentity("job10", "Group10").build(); 
	  	
	        
	  	    Trigger trigger = TriggerBuilder.newTrigger().withIdentity("TriggerName10", "Group10")
	          .withSchedule(CronScheduleBuilder.monthlyOnDayAndHourAndMinute(1,5,10)).build();
	          
	            scheduler = new StdSchedulerFactory().getScheduler();
				scheduler.start();
			    scheduler.scheduleJob(job10, trigger);
			    
			    System.out.println("after scheduler");
			    
			  } catch (SchedulerException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			}
		}

@Override
public void contextDestroyed(ServletContextEvent arg0) {

	System.out.println(" MGMT Context Destroyed");
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
