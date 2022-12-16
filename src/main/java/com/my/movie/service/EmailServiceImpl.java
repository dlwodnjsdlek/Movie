package com.my.movie.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@PropertySource("classpath:application.properties")
@Slf4j
@RequiredArgsConstructor
@Service
public class EmailServiceImpl implements EmailService {
    private final JavaMailSender javaMailSender;
	@Value("${spring.mail.username}") private String id;
    private String code = createKey();
    
    // 4자리 인증코드
    public static String createKey() {
        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 4; i++) {
            key.append(rnd.nextInt(10));
        }
        return key.toString();
    }
    
    public MimeMessage createMessage(String to)throws MessagingException, UnsupportedEncodingException {
        log.info("보내는 대상 : "+ to);
        log.info("인증 번호 : " + code);
        MimeMessage  message = javaMailSender.createMimeMessage();

        message.addRecipients(MimeMessage.RecipientType.TO, to); // to 보내는 대상
        message.setSubject("비밀번호 찾기 인증 코드"); //메일 제목

        // 메일 내용
        String msg="";
        msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">비밀번호 찾기 인증코드</h1>";
        msg += "<p style=\"font-size: 17px; padding-right: 30px; padding-left: 30px;\">아래 확인 코드를 비밀번호 찾기에서 입력해주세요.</p>";
        msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 32px 0 40px;\"><table style=\"border-collapse: collapse; border: 0; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
        msg += code;
        msg += "</td></tr></tbody></table></div>";

        message.setText(msg, "utf-8", "html");
        message.setFrom(new InternetAddress(id,"movie_Admin"));

        return message;
    }

    //메일발송
    public String sendSimpleMessage(String to)throws Exception {
        MimeMessage message = createMessage(to);
        try{
            javaMailSender.send(message); // 메일 발송
        }catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
        return code; // 메일로 보냈던 인증 코드를 서버로 리턴
    }
}