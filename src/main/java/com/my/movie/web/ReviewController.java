package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Review;
import com.my.movie.domain.ReviewDto;
import com.my.movie.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {
	@Autowired
	private ReviewService reivewService;
	
	@GetMapping("/{movieNum}")
	public ModelAndView movieDetail(ModelAndView mv, @PathVariable Integer movieNum, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userNum");
		
		ReviewDto dto = reivewService.getReviewDtoByMovieId(movieNum, userId);
		findLoginedUserReview(dto, userId);
		
		if (dto.getMovie() == null) {
			mv.setViewName("../main");
		} else {
			mv.setViewName("review/review");
			mv.addObject("review", dto);
		}

		return mv;
	}
	/*
	@PostMapping
	public ModelAndView movieDetail(ModelAndView mv, @RequestParam(value = "movieNo") Integer movieNo, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userNum");
		
		ReviewDto dto = reivewService.getReviewDtoByMovieId(movieNo, userId);
		findLoginedUserReview(dto, userId);
		
		if (dto.getMovie() == null) {
			mv.setViewName("../main");
		} else {
			mv.setViewName("review/review");
			mv.addObject("review", dto);
		}

		return mv;
	}
*/
	private void findLoginedUserReview(ReviewDto dto, Integer userNum) {
		dto.setReviewWriten(false);
		List<Review> reviews = dto.getReviews();
		
		if((userNum == null) || (reviews.size() == 0)) {
			return;
		}
		
		Review writeReview = null;

		for (Review review : dto.getReviews()) {
			if (userNum == review.getUserNum()) {
				writeReview = review;
				dto.setReviewWriten(true);
				break;
			}
		}
		
		if(writeReview != null) {
			reviews.remove(writeReview);
			reviews.add(0, writeReview);	
		}
	}
}
