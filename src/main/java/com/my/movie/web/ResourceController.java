package com.my.movie.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.movie.service.ImageService;

@Controller
@RequestMapping("img")
public class ResourceController {

	@Autowired
	private ImageService imageService;

	@GetMapping
	public ResponseEntity<byte[]> getImage(@RequestParam String fileName) {
		File file = imageService.getImage(fileName);

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));

			ResponseEntity<byte[]> result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			return result;
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
