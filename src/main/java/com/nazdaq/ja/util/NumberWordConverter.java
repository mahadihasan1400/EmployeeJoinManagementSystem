package com.nazdaq.ja.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class NumberWordConverter {
	 public static void main(final String[] args) {
	        System.out.println(convertDoubleToCurrency(1500D));
	    }
	 public static String convertDoubleToCurrency(Double number) {
		
		 NumberFormat format = NumberFormat.getCurrencyInstance(Locale.CANADA);
	        String currency = format.format(number);
		return currency.replace("$", "");
		 
	 }
	 
	 
	 public static String convertDateToString(Date date) {
		 
         DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
        return dateFormat.format(date).toString();  
        
	}
	 static String timeConversion(String s) {
			String timeFormate = "";
			String[] times = s.trim().split(":");
			String hour = times[0];
			String hourStr = "";
			String amPm="";
			if(Integer.parseInt(hour.trim())<24 && Integer.parseInt(hour.trim())>11) {
				amPm="PM";
			}if(Integer.parseInt(hour.trim())<11 || Integer.parseInt(hour.trim())>=23) {
				amPm="AM";
			}
			if(Integer.parseInt(hour.trim())>12) {
				hour=""+(Integer.parseInt(hour.trim())-12);
			}

			timeFormate = "" + hour + ":" + times[1] + ":" + times[2].toString().split("\\.")[0]+" "+amPm;
			return timeFormate.trim();
		}
	    public static String getCustomDateFromDateFormate(String date) {
			String customDate = "";
			String customDateFinal = "";
			String months[] = { "Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept",
					"Oct", "Nov", "Dec" };
			String[] dateUnit = date.split("-");
			customDate = dateUnit[2] + " ";
			
			
			for (int i = 1; i <= 12; i++) {
				if (Integer.parseInt(dateUnit[1]) == i) {
					customDateFinal = customDate.trim().substring(0, 2).trim() +" "+ months[i - 1] + ", " + dateUnit[0];
					break;
				}
			}
			return customDateFinal +" "+timeConversion(customDate.substring(2, customDate.length()-1));

		}
	
    public static final String[] units = {
            "", "one", "two", "three", "four", "five", "six", "seven",
            "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
            "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
    };
    
	public static void saveImage(String name, MultipartFile photo, int genaraleInfoId) {
		File diretorio = new File("/upload/ejms");
		if (!diretorio.exists()) {
			diretorio.mkdirs();
		}
		try {
			FileOutputStream arquivo = new FileOutputStream(
					diretorio.getAbsolutePath() + "/" + name + "-" + genaraleInfoId +  ".jpg");
			arquivo.write(photo.getBytes());
			arquivo.close();
		} catch (IOException ex) {

		}

	}
   
    public static final String[] tens = {
            "",        // 0
            "",        // 1
            "twenty",  // 2
            "thirty",  // 3
            "forty",   // 4
            "fifty",   // 5
            "sixty",   // 6
            "seventy", // 7
            "eighty",  // 8
            "ninety"   // 9
    };

    public static String convert(final int n) {
        if (n < 0) {
            return "minus " + convert(-n);
        }

        if (n < 20) {
            return units[n];
        }

        if (n < 100) {
            return tens[n / 10] + ((n % 10 != 0) ? " " : "") + units[n % 10];
        }

        if (n < 1000) {
            return units[n / 100] + " hundred" + ((n % 100 != 0) ? " " : "") + convert(n % 100);
        }

        if (n < 1000000) {
            return convert(n / 1000) + " thousand" + ((n % 1000 != 0) ? " " : "") + convert(n % 1000);
        }

        if (n < 1000000000) {
            return convert(n / 1000000) + " million" + ((n % 1000000 != 0) ? " " : "") + convert(n % 1000000);
        }

        return convert(n / 1000000000) + " billion"  + ((n % 1000000000 != 0) ? " " : "") + convert(n % 1000000000);
    }

   
}