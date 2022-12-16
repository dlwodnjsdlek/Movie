package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Review;
import com.my.movie.domain.ReviewDto;
import com.my.movie.domain.ReviewReply;
import com.my.movie.domain.request.CreateReviewRequest;

public interface ReviewService {

	ReviewDto getReviewDtoByMovieId(int movieId, Integer userId);

	void insertReview(CreateReviewRequest request);

	void deleteReview(int reviewId);

	List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount, Integer userId);

	List<ReviewReply> getReviewReplay(int reviewNum);
	
}
