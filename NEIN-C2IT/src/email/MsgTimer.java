package email;
import java.io.File;

import java.io.InputStream;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class MsgTimer {
	public static void main(String args[]){
        //Displaying current time
        System.out.println("Time now is -> " + new Date());
 
        //Creating timer which executes once after five seconds
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TaskExampleRepeating(), 20000, 3000);
        
    }
}
 
class TaskExampleRepeating extends TimerTask{
    //This task will repeat every five seconds
	private static int count = 0;
    public void run(){
    	count++;
        if (count >= 10) {
        	 Timer timer = new Timer();
            timer.cancel();
            timer.purge();
            return;
        }
        System.out.println(new Date() + " ->" + " I will repeat every 5 seconds.");
    }
}

