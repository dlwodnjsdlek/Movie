package com.my.movie.service;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {

	public String uploadImage(MultipartFile file) throws Exception;
	
	public File getImage(String fileName);
	
}
