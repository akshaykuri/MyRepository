package CON2;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import sun.text.resources.FormatData;

//import com.sun.java.util.jar.pack.Attribute.FormatException;
public class DateFormat {
	public Date getFormatedDate(String dateString)
	{
		Date formatDate = null;
	    
		SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
		
		//System.out.println("TOdays Date "+sdf);
		try{
				formatDate = new Date(sdf.parse(dateString).getTime());
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return formatDate;
	}
	
public Timestamp getFormatedDateforCalender(String dateString)
	{
		Timestamp tsDate = null;
	    Date formatDate=null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	//	System.out.println("DATE STRING 1 : "+dateString);
	//	System.out.println("DATE STRING sdf 1 : "+sdf);
		
	try{
				formatDate = new Date(sdf.parse(dateString).getTime());
				
				//tsDate = Timestamp.valueOf(dateString);
				System.out.println("ffffffffff1111111111111"+formatDate);
				tsDate = new Timestamp(formatDate.getTime());
				System.out.println("ffffffffff22222222222"+tsDate);
			//	System.out.println("DATE STRING 2 : "+dateString);
			//	System.out.println("DATE STRING sdf 2 : "+sdf);
			//	System.out.println("DATE STRING formatDate 2 : "+tsDate);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tsDate;
	}
	public Date getFormatedDateforCalenderReport(String dateString)
	{
		Date formatDate = null;
	    
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		
	try{
				formatDate = new Date(sdf.parse(dateString).getTime());
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return formatDate;
	}
	/*public static void main(String[] args) {
		
		DateFormat dateF = new DateFormat();
		
		String ex = "27-11-2013 0:59:19";
		
		Timestamp ts = dateF.getFormatedDateforCalender(ex);
		
		System.out.println(ts);
	}
	*/
}
