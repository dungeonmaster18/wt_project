package model;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public void sendEmail(String toEmail, String message,String subject){
        // Recipient's email ID needs to be mentioned.
        //change accordingly

        // Sender's email ID needs to be mentioned
        String from = "dungeonmaster018@gmail.com";//change accordingly
        final String username = "dungeonmaster018";//change accordingly
        final String password = "Umesh@1996";//change accordingly

        // Assuming you are sending email through relay.jangosmtp.net
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            MimeMessage msg = new MimeMessage(session);
	      //set message headers
	      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      msg.addHeader("format", "flowed");
	      msg.addHeader("Content-Transfer-Encoding", "8bit");

	      msg.setFrom(new InternetAddress("no_reply@bdcd.com", "NoReply-BDCD"));

	      msg.setReplyTo(InternetAddress.parse("no_reply@bdcd.com", false));

	      msg.setSubject(subject, "UTF-8");

	      msg.setText(message, "UTF-8");

	      msg.setSentDate(new Date());

	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
	      System.out.println("Message is ready");
    	  Transport.send(msg);  

	      System.out.println("EMail Sent Successfully!!");
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }
    }
    
    public static void main(String args[]){
        SendEmail s=new SendEmail();
        s.sendEmail("umesh4257@gmail.com","Hi", "Test");
    }
    
}
