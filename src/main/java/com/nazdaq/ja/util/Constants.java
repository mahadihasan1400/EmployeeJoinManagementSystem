package com.nazdaq.ja.util;

public interface Constants {
	//status Phase-1
	public static final String STATUS_DELETE = "0";	
	public static final String STATUS_ACTIVE = "1"; 
	public static final String STATUS_REJECT = "2"; 
	//closed means Approved
	public static final String STATUS_CLOSE = "3";	
	//Auth Role 
	
	public static final String AUTH_COO = "ROLE_COO";	
	public static final String AUTH_COO_PA = "ROLE_COO_PA";	
	public static final String AUTH_COA = "ROLE_ACC_COA";	
	public static final String AUTH_ACC_FIN = "ROLE_ACC_FIN";	
	//status Phase-2
	public static final String P_2_OPEN = "4"; 
	public static final String P_2_SUBMITTED = "5"; 
	public static final String P_2_MANAGER_SUBMIT_TO_HRD = "6";
	public static final String P_2_HR_SEND_BACK_2_MANAGER = "7";
	public static final String P_2_MANAGER_APPROVED = "8";
	public static final String P_2_EMP_AGREE = "9";
	public static final String P_2_EMP_DISAGREE = "10";	
	
	//PAF Type
	public static final String OPEN = "1"; 
	public static final String SPECIAL_OPEN = "2"; 
	public static final String CLOSED = "0"; 
	
	//SMS & Email
	public static final String encoding = "UTF-8";
    public static final String ampersand = "&";
    public static final String equal = "=";
    public static final String APPROVAL = "APPROVAL";
	public static final String REJECT = "REJECT";
	public static final String NOTIFICATION = "NOTIFICATION";
	
	
	
	//active-inactive
	public static final String INACTIVE = "0";
	public static final String ACTIVE = "1";	
	public static final String RESIGNED = "2";
	public static final String SEC_EMPLOYEE = "3";
	
	//holiday-weekend	
	public static final String WEEKEND = "1";
	public static final String HOLIDAY = "2";
	
	//month
	public static final String JANUARY = "January";
	public static final String FEBRUARY = "February";
	public static final String MARCH = "March";
	public static final String APRIL = "April";
	public static final String MAY = "May";
	public static final String JUNE = "June";
	public static final String JULY = "July";
	public static final String AUGUST = "August";
	public static final String SEPTEMBER = "September";
	public static final String OCTOBER = "October";
	public static final String NOVEMBER = "November";
	public static final String DECEMBER = "December";
	
}
