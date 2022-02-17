package com.nazdaq.ja.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.time.LocalTime;

public class ProjectConfigpath {
public static String getProjectPath() {
	return System.getProperty("user.dir");
}
public static String getFileName() {
	LocalDate localDate=LocalDate.now();
	Integer year=localDate.getYear();
	Integer month=localDate.getMonthValue();
	Integer days=localDate.getDayOfMonth();
	LocalTime localTime=LocalTime.now();
	Integer hour=localTime.getHour();
	Integer minute=localTime.getMinute();
	Integer second=localTime.getSecond();
	Integer nanosecond=localTime.getNano();

	String fileName=year.toString()+month.toString()+days.toString()+hour.toString()+minute.toString()+second.toString()+nanosecond.toString();
	return fileName;
}
public String getPath() throws UnsupportedEncodingException {
String path = this.getClass().getClassLoader().getResource("").getPath();
String fullPath = URLDecoder.decode(path, "UTF-8");
String pathArr[] = fullPath.split("/resources");
System.out.println(fullPath);
System.out.println(pathArr[0]);
fullPath = pathArr[0];
String reponsePath = "";
// to read a file from webcontent
reponsePath = new File(fullPath).getPath() + File.separatorChar + "newfile.txt";
return reponsePath;
}
public static BufferedImage resize(BufferedImage img, int height, int width) {
    Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
    BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
    Graphics2D g2d = resized.createGraphics();
    g2d.drawImage(tmp, 0, 0, null);
    g2d.dispose();
    return resized;
}
public static void main(String[] args) throws UnsupportedEncodingException {
	System.out.println(new ProjectConfigpath().getPath());
}


}
