package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.my.movie.domain.Review;
import com.my.movie.domain.request.CreateReviewRequest;
import com.my.movie.domain.request.RemoveReviewRequest;
import com.my.movie.domain.request.ViewMoreReviewRequest;
import com.my.movie.service.ReviewService;

@RestController
@RequestMapping("rev")
public class ReviewRestController {

	@Autowired
	private ReviewService reviewService	;

	@PostMapping("add")
	public void addReview(@RequestBody CreateReviewRequest request) {
		reviewService.insertReview(request);
	}

	@PostMapping("remove")
	public Boolean removeReview(@RequestBody RemoveReviewRequest request) {
		try {
			reviewService.deleteReview(request.getReviewId());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@PostMapping("morerev")
	public String viewMoreReview(@RequestBody ViewMoreReviewRequest request, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userNum");
		
		int movieId = request.getMovieId();
		int startIndex = request.getStartIndex();
		int rowCount = request.getRowCount();

		try {
			List<Review> reviews = reviewService.selectReviewByMovieId(movieId, startIndex, rowCount, userId);
			ObjectMapper mapper = new ObjectMapper();
			mapper.registerModule(new JavaTimeModule());
			return mapper.writeValueAsString(reviews);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}
	
	@PostMapping("viewcomment")
	public String viewReviewComment(@RequestParam(name="revNum") int reviewNum) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.registerModule(new JavaTimeModule());
		
		return mapper.writeValueAsString(reviewService.getReviewReplay(reviewNum));
	}
}
