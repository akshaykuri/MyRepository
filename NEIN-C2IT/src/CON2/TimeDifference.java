package CON2;

//public class TimeDifference {
import java.text.SimpleDateFormat;
import java.util.Date;

import java.text.SimpleDateFormat;
import java.util.Date;
 
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.Minutes;
import org.joda.time.Seconds;





public class TimeDifference{
	String dateDifference = null;
public String getTimeDifference(String dateStart,String datestop){

//String dateStart = "01/14/2012 09:29:58";
//String datestop = "01/15/2012 10:31:48";

//SimpleDateFormat format  = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	SimpleDateFormat format  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date d1=null;
Date d2=null;
try{

d1 = format.parse(dateStart);
d2 = format.parse(datestop);

//System.out.println(d1);
//System.out.println(d2);

//System.out.println("d2 value : "+d2.getTime());
//System.out.println("d1 value : "+d1.getTime());

DateTime dt1 = new DateTime(d1);
DateTime dt2 = new DateTime(d2);

/*long diff = d2.getTime() - d1.getTime();

System.out.println("diff java "+diff);

long diffSecond = diff / 1000 % 60;
long diffMinutes = diff / (60*1000)%60;
long diffHrs = diff / (60*60*1000)%24;
long diffDays = diff / (24*60*60*1000);*/
//int diffDays = (int)diff / (24*60*60*1000);

//dateDifference = "Days :"+diffDays+" Hrs: "+diffHrs+"min:"+diffMinutes+"Second:"+diffSecond ;
//dateDifference = "D:"+diffDays+" H:"+diffHrs+" M:"+diffMinutes+" S:"+diffSecond ;
//System.out.println("dt1 "+dt1);
//System.out.println("dt2 "+dt2);

//System.out.print(Days.daysBetween(dt1, dt2).getDays() + " days, ");
//System.out.print(Hours.hoursBetween(dt1, dt2).getHours() % 24 + " hours, ");
//System.out.print(Minutes.minutesBetween(dt1, dt2).getMinutes() % 60 + " minutes, ");
//System.out.print(Seconds.secondsBetween(dt1, dt2).getSeconds() % 60 + " seconds.");






long days = Days.daysBetween(dt1, dt2).getDays();
long hours = Hours.hoursBetween(dt1, dt2).getHours() % 24 ;
long minu = Minutes.minutesBetween(dt1, dt2).getMinutes() % 60;
long sec = Seconds.secondsBetween(dt1, dt2).getSeconds() % 60;

dateDifference = "D:"+days+" H:"+hours+" M:"+minu+" S:"+sec ;




}
catch(Exception e)
{
e.printStackTrace();
}

return dateDifference;
}
int dateDifferenceInt = 0;
public String getTimeDifference2(String dateStart,String datestop){

	//String dateStart = "01/14/2012 09:29:58";
	//String datestop = "01/15/2012 10:31:48";

	//SimpleDateFormat format  = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		SimpleDateFormat format  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date d1=null;
	Date d2=null;

	try{

	d1 = format.parse(dateStart);
	d2 = format.parse(datestop);

	//System.out.println(d1);
	//System.out.println(d2);

	//System.out.println("d2 value : "+d2.getTime());
	//System.out.println("d1 value : "+d1.getTime());

	DateTime dt1 = new DateTime(d1);
	DateTime dt2 = new DateTime(d2);

	/*long diff = d2.getTime() - d1.getTime();

	System.out.println("diff java "+diff);

	long diffSecond = diff / 1000 % 60;
	long diffMinutes = diff / (60*1000)%60;
	long diffHrs = diff / (60*60*1000)%24;
	long diffDays = diff / (24*60*60*1000);*/
	//int diffDays = (int)diff / (24*60*60*1000);
	/*long milliseconds1 = d1.getTime();
	long milliseconds2 = d2.getTime();

	long diff = milliseconds2 - milliseconds1;
*/
	//System.out.print("Diff : "+diff);
	  
	    
	//dateDifference = "Days :"+diffDays+" Hrs: "+diffHrs+"min:"+diffMinutes+"Second:"+diffSecond ;
	//dateDifference = "D:"+diffDays+" H:"+diffHrs+" M:"+diffMinutes+" S:"+diffSecond ;
	//System.out.println("dt1 "+dt1);
	//System.out.println("dt2 "+dt2);

	//System.out.print(Days.daysBetween(dt1, dt2).getDays() + " days, ");
	//System.out.print(Hours.hoursBetween(dt1, dt2).getHours() % 24 + " hours, ");
	//System.out.print(Minutes.minutesBetween(dt1, dt2).getMinutes() % 60 + " minutes, ");
	//System.out.print(Seconds.secondsBetween(dt1, dt2).getSeconds() % 60 + " seconds.");

	long days = Days.daysBetween(dt1, dt2).getDays();
	long hours = Hours.hoursBetween(dt1, dt2).getHours() % 24 ;
	long minu = Minutes.minutesBetween(dt1, dt2).getMinutes() % 60;
	long sec = Seconds.secondsBetween(dt1, dt2).getSeconds() % 60;
	//System.out.print("D1 value :"+dt1);
	//System.out.print("\n D2 value :"+dt2);
	//System.out.print("\n days value :"+days);
	//System.out.print("\n hours value :"+hours);
	//System.out.print("\n minu value :"+minu);
	//System.out.print("\n sec value :"+sec);
	
	
	 dateDifferenceInt = (int) hours;


	//long dateDifference =diff;

	}
	catch(Exception e)
	{
	e.printStackTrace();
	}

	return dateDifference;
	}


}

