package com.my.movie.service;

import java.io.File;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class ImageServiceImpl implements ImageService {

	private static final String IMAGE_PATH = "C:\\DEV\\attach";

	@Override
	public String uploadImage(MultipartFile multipartFile) throws Exception {
		String fileExtension = multipartFile.getContentType().replace("image/", ".");
		String current = String.valueOf(System.currentTimeMillis());
		String saveFileName = current.concat(fileExtension);

		try {
			multipartFile.transferTo(new File(IMAGE_PATH, saveFileName));
		} catch (Exception e) {
			throw e;
		}
		
		return saveFileName;
	}

	@Override
	public File getImage(String fileName) {
		return new File(IMAGE_PATH, fileName);
	}
}
