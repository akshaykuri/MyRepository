package com.nippon.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import java.util.List;
/*
import com.sun.org.apache.bcel.internal.generic.FALOAD;*/

import org.apache.poi.hssf.usermodel.HSSFCell;

public class DateUtil {

	@SuppressWarnings("deprecation")
	public static int calculateDateRangeBetweenTwoDates(Date startDate,
			Date endDate) {
		int result = 0;
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		int startDateNum = startCal.getTime().getDate();
		int endDateNum = endCal.getTime().getDate();
		/*if (startDateNum >= endDateNum){
			 
			return -1;
		}*/
		boolean breakCondition = false;
		ArrayList<Integer> listOfSundays = getSundaysForGivenMonthAndYear(
				startCal.get(Calendar.MONTH), startCal.get(Calendar.YEAR));
		int secondStaturday = getSecondSaturdayForGivenMonthAndYear(
				startCal.get(Calendar.MONTH), startCal.get(Calendar.YEAR));
	   
		//List<Date> listOfDaysBetweenDifffMonth = getListOfDaysBetweenTwoDates(startDate, endDate);
		for (int count = startDateNum; count <= endDateNum; count++) {
			breakCondition = false;
			for (Integer sunday : listOfSundays) {
				if (sunday == count || count == secondStaturday ) {
					breakCondition = true;
					continue;
				}

			}
			if (breakCondition == true)
				continue;
			++result;

		}
		return result;
	}

	@SuppressWarnings("deprecation")
	public static int getSecondSaturdayForGivenMonthAndYear(int month, int year) {

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, Calendar.SUNDAY);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		calendar.set(Calendar.WEEK_OF_MONTH, 2);
		return calendar.getTime().getDate();

	}
	
	public static Date getSecondSaturdayDateForGivenMonthAndYear(int month, int year) {

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, Calendar.SUNDAY);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		calendar.set(Calendar.WEEK_OF_MONTH, 2);
		return calendar.getTime();

	}

	@SuppressWarnings({ "unused", "deprecation" })
	public static ArrayList<Integer> getSundaysForGivenMonthAndYear(int month,
			int year) {
		ArrayList<Integer> listOfSundays = new ArrayList<Integer>();
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, month);
		c.set(Calendar.DAY_OF_MONTH, 1);
		int numOfWeeksInMonth = 1;
		while (c.get(Calendar.MONTH) == month) {
			c.add(Calendar.DAY_OF_MONTH, 1);
			if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
				listOfSundays.add(c.getTime().getDate());
			}
		}
		return listOfSundays;

	}
	@SuppressWarnings("unused")
	public static ArrayList<Date> getSundayDatesForGivenMonthAndYear(int month,
			int year) {
		ArrayList<Date> listOfSundays = new ArrayList<Date>();
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, month);
		c.set(Calendar.DAY_OF_MONTH, 1);
		int numOfWeeksInMonth = 1;
		while (c.get(Calendar.MONTH) == month) {
			c.add(Calendar.DAY_OF_MONTH, 1);
			if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
				listOfSundays.add(c.getTime());
			}
		}
		return listOfSundays;

	}

	public static int getNumberOfWeeks(int month, int year) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, month);
		c.set(Calendar.DAY_OF_MONTH, 1);
		int numOfWeeksInMonth = 1;
		while (c.get(Calendar.MONTH) == month) {
			c.add(Calendar.DAY_OF_MONTH, 1);
			if (c.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY) {
				numOfWeeksInMonth++;
			}
		}
		return numOfWeeksInMonth;
	}

	
	
	@SuppressWarnings("deprecation")
	public static List<Date> getListOfDaysBetweenTwoDates(Date startDate, Date endDate) {
	    List<Date> result = new ArrayList<Date>();
	    Calendar start = Calendar.getInstance();
	    start.setTime(startDate);
	    Calendar end = Calendar.getInstance();
	    end.setTime(endDate);
	   
	    Date secondSaturdayForStartDate = getSecondSaturdayDateForGivenMonthAndYear(start.get(Calendar.MONTH), start.get(Calendar.YEAR));
	    Date secondSaturdayForEndDate = getSecondSaturdayDateForGivenMonthAndYear(end.get(Calendar.MONTH), end.get(Calendar.YEAR));
	    ArrayList<Date> sundayForStartDate = getSundayDatesForGivenMonthAndYear(start.get(Calendar.MONTH), start.get(Calendar.YEAR));
	    ArrayList<Date> sundayForEndDate = getSundayDatesForGivenMonthAndYear(end.get(Calendar.MONTH), end.get(Calendar.YEAR));
	     
	    end.add(Calendar.DAY_OF_YEAR,1);
	    //Add 1 day to endDate to make sure endDate is included into the final list
	    while (start.before(end)) {
	    	
	    	result.add(start.getTime());
	    	for(Date sunday : sundayForStartDate){
		    	
		    	if((secondSaturdayForStartDate.getDate() == start.get(Calendar.DAY_OF_MONTH) && secondSaturdayForStartDate.getMonth() == start.get(Calendar.MONTH)) || (sunday.getDate() == start.get(Calendar.DAY_OF_MONTH) && sunday.getMonth() == start.get(Calendar.MONTH))){
		         result.remove(start.getTime());
		        continue;
		    	}
		    	}
	    	for(Date sunday : sundayForEndDate){
	    	
	    		if((secondSaturdayForEndDate.getDate() == start.get(Calendar.DAY_OF_MONTH) && secondSaturdayForEndDate.getMonth() == start.get(Calendar.MONTH)) || (sunday.getDate() == start.get(Calendar.DAY_OF_MONTH) && sunday.getMonth() == start.get(Calendar.MONTH))){
	         result.remove(start.getTime());
	        continue;
	    	}
	    	}
	    	
	    	start.add(Calendar.DAY_OF_YEAR,1);
	        
	    }
	    return result;
	}
		
	
	
	public static void main(String[] args) throws ParseException {
		String startDateString = "02/05/2016";
		String endDateString = "18/04/2016";
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = dateFormat.parse(startDateString);
		Date endDate = dateFormat.parse(endDateString);
		
		
	
	    
	    
		  /* Calendar start = Calendar.getInstance();
		    start.setTime(startDate);
		    start.add(Calendar.DATE, +1);
		    Date yesterday = start.getTime();
		    
		    System.out.println("YESTERDAY : " +yesterday);*/
	/*	
		List<Date> dates = new ArrayList<Date>();
		
		  
		  
		
		
		  Calendar cal = Calendar.getInstance();
		  cal.setTime(startDate);
		  
		  
		   // cal.add(Calendar.WEEK_OF_YEAR, +1);
	        cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
	       
	        if(cal.get(Calendar.DAY_OF_WEEK) ==  Calendar.SATURDAY){
				   
			     cal.set(Calendar.WEEK_OF_MONTH,3);
				 Date sat3 = cal.getTime();
				 System.out.println("3rd Saturday" +sat3);
				 
				 
				 
				 cal.set(Calendar.WEEK_OF_MONTH,4);
				 Date sat4 = cal.getTime();
				 System.out.println("4th Saturday" +sat4);
				 
				    dates.add(sat3);
			        dates.add(sat4);
				 
	        }
		
		System.out.println("MONTH " +dates);*/
		
		/*SimpleDateFormat format1 = new SimpleDateFormat("dd-M-yyyy");
		Date date = null;
		Calendar cal = Calendar.getInstance();

		for (int i = 0; i <= 51; i++) 
		{
		    try 
		    {
		        cal.add(Calendar.WEEK_OF_YEAR, +1);
		        cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		      
		        String formatted = format1.format(cal.getTime());
		        date = format1.parse(formatted);
		         
		        
		        
		          cal.set(Calendar.WEEK_OF_MONTH,3);
		          String saturday3 = format1.format(cal.getTime());
				  Date sat3 = format1.parse(saturday3);
				    
				  cal.set(Calendar.WEEK_OF_MONTH,4);
		          String saturday4 = format1.format(cal.getTime());
				  Date sat4 = format1.parse(saturday4);
		         
		      
		        dates.add(sat3);
		        dates.add(sat4);
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		System.out.println(dates);*/
		/*	List<Date> saturdays = new ArrayList<Date>();
		List<Date> dates = new ArrayList<Date>();
		long interval = 24*1000 * 60 * 60; // 1 hour in millis
		long endTime = endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
		long curTime = startDate.getTime();
		while (curTime <= endTime) {
		    dates.add(new Date(curTime));
		    curTime += interval;
		}
		for(int i=0;i<dates.size();i++){
		    Date lDate =(Date)dates.get(i);
		      Calendar cal = Calendar.getInstance();//For Second saturday
			  cal.setTime(lDate);
			  
			   if(cal.get(Calendar.DAY_OF_WEEK) ==  Calendar.SATURDAY){
				   
				     cal.set(Calendar.WEEK_OF_MONTH,3);
					 Date sat3 = cal.getTime();
					 System.out.println("3rd Saturday" +sat3);
					 
					 
					 
					 cal.set(Calendar.WEEK_OF_MONTH,4);
					 Date sat4 = cal.getTime();
					 System.out.println("4th Saturday" +sat4);
					 
					 
					 if(sat3.equals(lDate)){
						 
						 
						 saturdays.add(lDate);
					 }
					 if(sat4.equals(lDate)){
						 
						 saturdays.add(lDate);
					 }
					
			   }
		    String ds = dateFormat.format(lDate);    
		    System.out.println(" Date is ..." + ds);
		}
		
		*/
		
		
		
		
		
		
		//System.out.println(getListOfDaysBetweenTwoDates(startDate, endDate).size());
		;
		/*System.out.println(getSundaysForGivenMonthAndYear(Calendar.NOVEMBER, 2014));
		System.out.println(getSecondSaturdayDateForGivenMonthAndYear(Calendar.NOVEMBER, 2014));
		System.out.println(getSecondSaturdayForGivenMonthAndYear(Calendar.NOVEMBER, 2014));
		System.out.println(getSundayDatesForGivenMonthAndYear(Calendar.NOVEMBER, 2014));*/

	}

	public static boolean isCellDateFormatted(HSSFCell cell) {
		// TODO Auto-generated method stub
		return false;
	}

}