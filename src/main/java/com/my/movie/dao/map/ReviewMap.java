package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Review;
import com.my.movie.domain.ReviewReply;
import com.my.movie.domain.request.CreateReviewRequest;

public interface ReviewMap {
	
	void insertReview(CreateReviewRequest req);
	
	List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount);

	void deleteReview(int reviewId);

	Integer getCommentCount(int reviewNum);

	List<ReviewReply> selectReviewReplay(int reviewNum);
	
}

