package com.my.movie.web;

import org.springframework.web.bind.annotation.RestController;

import com.my.movie.service.EmailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController	
public class EmailController {
	private final EmailService emailService;
	
	public String mailConfirm(String email) throws Exception {
		String code = emailService.sendSimpleMessage(email);
		log.info("인증코드 : " + code); 
		return code; 
	}
}