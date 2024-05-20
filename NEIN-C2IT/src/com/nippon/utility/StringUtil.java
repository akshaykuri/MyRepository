package com.nippon.utility;

public class StringUtil {
	
	public static boolean isNotEmpty(String input){
		
		if(input != null && !input.isEmpty()){
			return true;
		}
		return false;
		
	}
	
	public static boolean isEquals(String input,String compareString){
		boolean result = false;
		if(isNotEmpty(input) && isNotEmpty(compareString)){
			if(input.equals(compareString)){
				result = true;
			}else{
				result = false;
			}
			
		}
		return result;
	}

}