package com.nazdaq.ja.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncoderMD5 {

	public static void main(String[] args) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		PasswordEncoderMD5 pemd = new PasswordEncoderMD5();
		System.out.println(pemd.getEncryptedPassword("123456"));

	}
	
	public String getEncryptedPassword(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte byteData[] = md.digest();
		// convert the byte to hex format method 1
		StringBuffer hashedPassword = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			hashedPassword.append(Integer.toString(
					(byteData[i] & 0xff) + 0x100, 16).substring(1));
		}		
		return hashedPassword.toString();
	}

}
