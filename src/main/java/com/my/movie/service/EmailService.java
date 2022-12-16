package com.my.movie.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface EmailService {
    public MimeMessage createMessage(String to)throws MessagingException, UnsupportedEncodingException;
    public static String createKey() {
		return null;
	}
    public String sendSimpleMessage(String to)throws Exception;
}