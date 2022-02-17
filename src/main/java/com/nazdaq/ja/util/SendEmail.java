package com.nazdaq.ja.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


import com.nazdaq.ja.model.User;


public class SendEmail implements Constants{	

	public static void main(String[] args) throws MessagingException {
		// TODO Auto-generated method stub
		//SendEmail se = new SendEmail();		
	}
	
	public void sendmailToUser(JavaMailSender mailSender, String mailTo, String  title, String body,String url, String ccEmailAddresss, String commonEmailAddress) throws MessagingException, javax.mail.MessagingException{
		
		
		
		if(mailTo.equals(null)||mailTo.equals("")){
			mailTo=commonEmailAddress;
		}
		
		// Create a new StringBuilder.
		StringBuilder builder = new StringBuilder();
		

		
		builder.append("<body topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" leftmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"100%\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%; height: 100%; -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%;\r\n" + 
				"	background-color: #F0F0F0;\r\n" + 
				"	color: #000000;\"\r\n" + 
				"	bgcolor=\"#F0F0F0\"\r\n" + 
				"	text=\"#000000\">\r\n" +  
				"<!-- Set message background color one again -->\r\n" + 
				"<table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%;\" class=\"background\"><tr><td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;\"\r\n" + 
				"	bgcolor=\"#F0F0F0\">\r\n" + 
				"\r\n" + 
				"<!-- WRAPPER -->\r\n" + 
				"<!-- Set wrapper width (twice) -->\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\"\r\n" + 
				"	width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n" + 
				"	max-width: 560px;\" class=\"wrapper\">\r\n" + 
				"\r\n" + 
				"	<tr>\r\n" + 
				"		<td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n" + 
				"			padding-top: 20px;\r\n" + 
				"			padding-bottom: 20px;\">\r\n" + 
				"\r\n" + 
				"			<a target=\"_blank\" style=\"text-decoration: none;\"\r\n" + 
				"				href=\"https://www.syn-ergy.com\"><img border=\"0\" vspace=\"0\" hspace=\"0\"\r\n" + 
				"				src='http://www.syn-ergy.com/wp-content/themes/synergy/img/logo.jpg'" + 
				"				width=\"200\" height=\"60\"\r\n" + 
				"				alt=\"Logo\" title=\"Logo\" style=\"\r\n" + 
				"				color: #000000;\r\n" + 
				"				font-size: 10px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block;\" /></a>\r\n" + 
				"\r\n" + 
				"		</td>\r\n" + 
				"	</tr>\r\n" + 
				"\r\n" + 
				"<!-- End of WRAPPER -->\r\n" + 
				"</table>\r\n" + 
				"\r\n" + 
				"<!-- WRAPPER / CONTEINER -->\r\n" + 
				"<!-- Set conteiner background color -->\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\"\r\n" + 
				"	bgcolor=\"#FFFFFF\"\r\n" + 
				"	width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n" + 
				"	max-width: 560px;\" class=\"container\">\r\n" + 
				"\r\n" + 
				"	<tr>\r\n" + 
				"		<td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 24px; font-weight: bold; line-height: 130%;\r\n" + 
				"			padding-top: 25px;\r\n" + 
				"			color: #000000;\r\n" + 
				"			font-family: sans-serif;\" class=\"header\">\r\n" + 
				"				"+title+"\r\n" + 
				"		</td>\r\n" + 
				"	</tr>\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"	<tr>\r\n" + 
				"		<td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;\r\n" + 
				"			padding-top: 20px;\" class=\"hero\">				\r\n" + 
				"					\r\n" + 
				"					<tr style=\"background-color:#D9E2DF\">\r\n" + 
				"						<td align=\"left\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 160%;\r\n" + 
				"							padding-top: 25px; \r\n" + 
				"							color: #000000;\r\n" + 
				"							font-family: sans-serif;\" class=\"paragraph\">");
		
		
	     builder.append(body);	
		
		
		
		builder.append("<br/>");	
		
		//builder.append("<h3> <b> N.B.: Please Login to EJMS from bellow link and submit your feedback to HRD about first day's experience by tomorrow. </b> </h3>");
		
		builder.append("</td>\r\n" + 
				"					</tr>\r\n" + 
				"				\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"		</td>\r\n" + 
				"	</tr>\r\n" + 
				"\r\n" + 
				"	\r\n" + 
				"\r\n" + 
				"	<tr>\r\n" + 
				"		<td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n" + 
				"			padding-top: 25px;\r\n" + 
				"			padding-bottom: 5px;\" class=\"button\"><a\r\n" + 
				"			href=\"https://github.com/konsav/email-templates/\" target=\"_blank\" style=\"text-decoration: underline;\">\r\n" + 
				"				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"max-width: 240px; min-width: 120px; border-collapse: collapse; border-spacing: 0; padding: 0;\"><tr><td align=\"center\" valign=\"middle\" style=\"padding: 12px 24px; margin: 0; text-decoration: underline; border-collapse: collapse; border-spacing: 0; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; -khtml-border-radius: 4px;\"\r\n" + 
				"					bgcolor=\"#E9703E\"><a target=\"_blank\" style=\"text-decoration: underline;\r\n" + 
				"					color: #FFFFFF; font-family: sans-serif; font-size: 17px; font-weight: 400; line-height: 120%;\"\r\n" + 
				"					href=" + url + ">\r\n" + 
				"						Click Here to View\r\n" + 
				"					</a>\r\n" + 
				"			</td></tr></table></a>\r\n" + 
				"		</td>\r\n" + 
				"	</tr>\r\n" + 
				"\r\n" + 
				"	<!-- LINE -->\r\n" + 
				"	<tr>	\r\n" + 
				"		<td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n" + 
				"			padding-top: 25px;\" class=\"line\"><hr\r\n" + 
				"			color=\"#E0E0E0\" align=\"center\" width=\"100%\" size=\"1\" noshade style=\"margin: 0; padding: 0;\" />\r\n" + 
				"		</td>\r\n" + 
				"	</tr>\r\n" + 
				"	<!-- LINE -->\r\n" + 
				"\r\n" + 
				"	<tr>\r\n" + 
				"		<td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 160%;\r\n" + 
				"			padding-top: 20px;\r\n" + 
				"			padding-bottom: 25px;\r\n" + 
				"			color: #000000;\r\n" + 
				"			font-family: sans-serif;\" class=\"paragraph\">\r\n" + 
				"				For Support: Send Email to <a href=\"rafiqul.islam@dynamicsrv.com\" target=\"_blank\" style=\"color: #127DB3; font-family: sans-serif; font-size: 17px; font-weight: 400; line-height: 160%;\">rafiqul.islam@dynamicsrv.com</a>\r\n" + 
				"		</td>\r\n" + 
				"	</tr>\r\n" + 
				"\r\n" + 
				"<!-- End of WRAPPER -->\r\n" + 
				"</table>\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"<!-- End of SECTION / BACKGROUND -->\r\n" + 
				"</td></tr></table>\r\n" + 
				"\r\n" + 
				"</body>");
		
		
		// Convert to string. 
		String result = builder.toString();
		sendMailTo(mailSender, mailTo,title, result, ccEmailAddresss);
	}
private String sendMailTo(JavaMailSender mailSender, String to, String b, String c, String ccEmailAddresss) throws MessagingException, javax.mail.MessagingException{
		
		
		String [] ccAll = ccEmailAddresss.split(",");
		Address[] ia = null;
		if(ccEmailAddresss != null && ccEmailAddresss.trim().length() > 0) {
			ia = new InternetAddress[ccAll.length];
		    int i = 0;
		    for (String address : ccAll) {
		        ia[i] = new InternetAddress(address);
		        i++;
		    }
		}
	    
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(to.trim());
		email.setSubject(b);
		email.setText(c);
		email.setFrom("HRMSMailService");
		MimeMessage message = mailSender.createMimeMessage();
		if(ccEmailAddresss != null && ccEmailAddresss.trim().length() > 0) {
			message.addRecipients(RecipientType.CC, ia);
		}
		
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");	
	    helper.setFrom(email.getFrom());
	    helper.setTo(email.getTo());
	    helper.setSubject(email.getSubject());
	    helper.setText("<html><body>"+email.getText()+"</body></html>",true);
		
		// sends the e-mail
	    if(isValidEmailAddress(to))
		mailSender.send(message);		
		// forwards to the view named "Result"
		return "Result";
	}
	
	
	public boolean isValidEmailAddress(String email) {
		boolean result = true;
		   try {
		      InternetAddress emailAddr = new InternetAddress(email);
		      emailAddr.validate();
		   } catch (Exception ex) {
		      result = false;
		   }
		return result;
	}

}
