/**
 * 
 */
package com.nazdaq.ja.util;
import java.text.DecimalFormat;
/**
 * @author abu.taleb
 *
 */
public class EnglishNumberToWords {
	
	private static final String[] specialNames = {
        "",
        " lakh",
        " crore"
    };
	
	private static final String[] tensNames = {
        "",
        " ten",
        " twenty",
        " thirty",
        " forty",
        " fifty",
        " sixty",
        " seventy",
        " eighty",
        " ninety"
	};

    private static final String[] numNames = {
            "",
            " one",
            " two",
            " three",
            " four",
            " five",
            " six",
            " seven",
            " eight",
            " nine",
            " ten",
            " eleven",
            " twelve",
            " thirteen",
            " fourteen",
            " fifteen",
            " sixteen",
            " seventeen",
            " eighteen",
            " nineteen"
    };

    private static String convertLessThanOneThousand(int number) {
        String soFar;

        if (number % 100 < 20){
            soFar = numNames[number % 100];
            number /= 100;
        }
        else {
            soFar = numNames[number % 10];
            number /= 10;

            soFar = tensNames[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        return numNames[number] + " hundred" + soFar;       
        
    }
    
    private static String convertLessThanOneLakh(int number) {
        String soFar;
        String t = "", t2 = "";

        if (number % 100 < 20){
            soFar = numNames[number % 100];
            number /= 100;
        }
        else {
            soFar = numNames[number % 10];
            number /= 10;

            soFar = tensNames[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        
        if(number+"".length() > 1){
        	if(number < 20){
        		t = numNames[number];
        	}else{
        		t = 	numNames[number % 10];
            	int x = number - (number % 10);
            	t2 = tensNames[x/10];
        	}
        	
        } else {
        	t = 	numNames[number];
        }
        //return numNames[number] + " Lakh" + soFar;      
        return t2 +" " + t + " Lakh" + soFar;
        
    }
    
    private static String convertThousand(int number) {
        String soFar;
        String t = "", t2 = "";

        if (number % 100 < 20){
            soFar = numNames[number % 100];
            number /= 100;
        }
        else {
            soFar = numNames[number % 10];
            number /= 10;

            soFar = tensNames[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        
        if(number+"".length() > 1){
        	if(number < 20){
        		t = numNames[number];
        	}else{
        		t = 	numNames[number % 10];
            	int x = number - (number % 10);
            	t2 = tensNames[x/10];
        	}
        	
        }  
        return t2 +" " + t + " thousand" + soFar;
        
    }
    
    


    public static String convert(long number) {
        // 0 to 999 999 999 999
        if (number == 0) { return "zero"; }

        String snumber = Long.toString(number);

        // pad with "0"
        String mask = "000000000000";
        DecimalFormat df = new DecimalFormat(mask);
        snumber = df.format(number);

        // XXXnnnnnnnnn left 3 character
        //int billions = Integer.parseInt(snumber.substring(0,3));
        int billions = Integer.parseInt(snumber.substring(0,2));
        // nnnXXXnnnnnn bilions + right side 3 character
        int millions  = Integer.parseInt(snumber.substring(2,5));
        // nnnnnnXXXnnn  milion + right 3 character
        int hundredThousands = Integer.parseInt(snumber.substring(5,9));
        // right 3 character
        int thousands = Integer.parseInt(snumber.substring(9,12));

        String tradBillions;
        switch (billions) {
            case 0:
                tradBillions = "";
                break;
            case 1 :
                tradBillions = convertLessThanOneThousand(billions)
                        + " thousand ";
                break;
            default :
                tradBillions = convertLessThanOneThousand(billions)
                        + " thousand ";
        }
        String result =  tradBillions;

        String tradMillions;
        if(billions > 0)
        switch (millions) {
            case 0:
                tradMillions = " Crore";
                break;
            case 1 :
                tradMillions = convertLessThanOneThousand(millions)
                        + " Crore ";
                break;
            default :
                tradMillions = convertLessThanOneThousand(millions)
                        + " Crore ";
        } else{
        	switch (millions) {
            case 0:
                tradMillions = "";
                break;
            case 1 :
                tradMillions = convertLessThanOneThousand(millions)
                        + " Crore ";
                break;
            default :
                tradMillions = convertLessThanOneThousand(millions)
                        + " Crore ";
        }
        }
        
        
        result =  result + tradMillions;

        String tradHundredThousands;
        switch (hundredThousands) {
            case 0:
                tradHundredThousands = "";
                break;
            case 1 :
                tradHundredThousands = "one thousand ";
                break;
            default :
            	char [] bils = (hundredThousands+"").toCharArray();
            	
            	if(bils.length > 2) {
            		if(indexExists(bils, 1)&& Integer.parseInt(bils[1]+"") > 0){
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands)
                                + " thousand ";
                	} else if(indexExists(bils, 2)&& Integer.parseInt(bils[2]+"") > 0){
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands)
                                + " thousand ";
                	} else if(indexExists(bils, 0)&& Integer.parseInt(bils[0]+"") > 0){
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands)
                                + " ";
                	} else {
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands);
                	}
            	} else {
            		if(indexExists(bils, 1)&& Integer.parseInt(bils[1]+"") > 0){
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands)
                                + " thousand ";
                	} else if(indexExists(bils, 0)&& Integer.parseInt(bils[0]+"") > 0){
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands)
                                + " thousand ";
                	} else {
                		tradHundredThousands = convertLessThanOneLakh(hundredThousands);
                	}
            	}
            	
        }
        result =  result + tradHundredThousands;

        String tradThousand;
        tradThousand = convertLessThanOneThousand(thousands);
        result =  result + tradThousand;

        // remove extra spaces!
        return "taka "+ result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ")+" Only";
    }
    public static boolean indexExists(char [] bils, final int index) {
        return index >= 0 && index < bils.length;
    }
     public static void main(String[] args) {
       /* System.out.println("*** " + EnglishNumberToWords.convert(0));
        System.out.println("*** " + EnglishNumberToWords.convert(1));
        System.out.println("*** " + EnglishNumberToWords.convert(16));
        System.out.println("*** " + EnglishNumberToWords.convert(100));
        System.out.println("*** " + EnglishNumberToWords.convert(118));
        System.out.println("*** " + EnglishNumberToWords.convert(200));
        System.out.println("*** " + EnglishNumberToWords.convert(219));
        System.out.println("*** " + EnglishNumberToWords.convert(800));
        System.out.println("*** " + EnglishNumberToWords.convert(801));
        System.out.println("*** " + EnglishNumberToWords.convert(1316));
        System.out.println("*** " + EnglishNumberToWords.convert(1000000));
        System.out.println("*** " + EnglishNumberToWords.convert(2000000));
        System.out.println("*** " + EnglishNumberToWords.convert(3000200));
        System.out.println("*** " + EnglishNumberToWords.convert(700000));
        System.out.println("*** " + EnglishNumberToWords.convert(9000000));
        System.out.println("*** " + EnglishNumberToWords.convert(9001000));
        System.out.println("*** " + EnglishNumberToWords.convert(123456789));
        System.out.println("*** " + EnglishNumberToWords.convert(2147483647));*/
        System.out.println("*** " + EnglishNumberToWords.convert(500000L));

    }
}
