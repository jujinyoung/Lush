package member.service;


import java.io.UnsupportedEncodingException;

import java.util.Date;

import java.util.Properties;

 

import javax.mail.Authenticator;

import javax.mail.Message;

import javax.mail.MessagingException;

import javax.mail.Session;

import javax.mail.Transport;

import javax.mail.internet.AddressException;

import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;

 
public class GoogleMail {
	   

    public void sendmail(String email, String certificationCode) {

        Properties prop = System.getProperties();

        prop.put("mail.smtp.starttls.enable", "true");

        prop.put("mail.smtp.host", "smtp.gmail.com");

        prop.put("mail.smtp.auth", "true");

        prop.put("mail.smtp.port", "587");
        
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

        

        Authenticator auth = new MySMTPAuthenticator();

        

        Session session = Session.getDefaultInstance(prop, auth);

        

        MimeMessage msg = new MimeMessage(session);

    

        try {

            msg.setSentDate(new Date());

            

            msg.setFrom(new InternetAddress("lushmaster@gmail.com", "RUSHMASTER"));

            InternetAddress to = new InternetAddress(email);         

            msg.setRecipient(Message.RecipientType.TO, to);            

            msg.setSubject("안녕하세요 러쉬 이메일 인증번호입니다", "UTF-8");            

            msg.setText(certificationCode, "UTF-8");            

            System.out.println("google mail 실행");

            Transport.send(msg);

            

        } catch(AddressException ae) {            

            System.out.println("AddressException : " + ae.getMessage());           

        } catch(MessagingException me) {            

            System.out.println("MessagingException : " + me.getMessage());

        } catch(UnsupportedEncodingException e) {

            System.out.println("UnsupportedEncodingException : " + e.getMessage());

        }

                

    }
}
