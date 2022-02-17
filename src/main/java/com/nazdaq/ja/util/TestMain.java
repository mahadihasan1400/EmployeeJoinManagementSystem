package com.nazdaq.ja.util;

import java.util.Calendar;
import java.util.Date;

public class TestMain {

	public static void main(String[] args) {
		String a = "01-07-2017";
		String b = "30-06-2018";
		String fromYear = a.substring(a.length() -4, a.length());
		String toYear = b.substring(b.length() -4, b.length());
		
		// TODO Auto-generated method stub
		//Date now = new Date();
		//Calendar calc = Calendar.getInstance();
		//calc.setTime(now);
		//Integer currentYear = calc.get(Calendar.YEAR);
		String fyName = TestMain.getFiscalYearName();
		System.out.println("01-07-" + fyName.substring(0, 4));
		System.out.println("30-06-" + fyName.substring(5, fyName.length()));
		//System.out.println(fromYear+"-"+toYear);
	}
	
	private Integer myMathTest(Integer x) {
		return ((x*x)-9)/(x-3);
	}
	
	private static String getFiscalYearName() {
		String fiscalYearName = "";
		Date now  = new Date();
		Calendar calendar = Calendar.getInstance();;
		calendar.setTime(now);
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		
		if(month < 6 ) {
			fiscalYearName = (year-1) + "-" + year;
		} else {
			fiscalYearName = year + "-" + (year+1);
		}
		return fiscalYearName;
	}

}
