package CON2;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.Minutes;
import org.joda.time.Seconds;

public class TimeDifferenceForm {
	String dateDifference = null;
	int datedifff = 0;
	public int getTimeDifference(String dateStart,String datestop){

	SimpleDateFormat format  = new SimpleDateFormat("yyyy-MM-dd");
	Date d1=null;
	Date d2=null;

	try{

	d1 = format.parse(dateStart);
	d2 = format.parse(datestop);

	DateTime dt1 = new DateTime(d1);
	DateTime dt2 = new DateTime(d2);
	int days = Days.daysBetween(dt2, dt1).getDays();
	
    dateDifference = "D:"+days;
    datedifff = days;



	}
	catch(Exception e)
	{
	e.printStackTrace();
	}

	return datedifff;
	}
	}

