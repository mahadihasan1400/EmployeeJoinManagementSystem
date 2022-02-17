package com.nazdaq.ja.util;

public class UtilitiesFunction {
	public String  getCustomDateFromDateFormate(String date) {
		String customDate="";
		String months[]= {"January","February","March","April","May","June","July","August","September","October","Novermber","December"};
		String[] dateUnit=date.split("-");
		customDate=dateUnit[2]+" ";
		for (int i = 1; i <=12; i++) {
			if (Integer.parseInt(dateUnit[1])==i) {
				customDate=customDate +months[i-1]+", "+dateUnit[0];
				break;
			}
		}
		return customDate;
		
	}
}
