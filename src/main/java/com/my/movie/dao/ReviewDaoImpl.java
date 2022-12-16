package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.ReviewMap;
import com.my.movie.dao.map.SympathMap;
import com.my.movie.domain.Review;
import com.my.movie.domain.ReviewReply;
import com.my.movie.domain.request.CreateReviewRequest;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private ReviewMap reviewMap;

	@Autowired
	private SympathMap sympathMap;
	
	@Override
	public void insertReview(CreateReviewRequest req) {
		reviewMap.insertReview(req);
	}

	@Override
	public List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount, Integer userId) {
		return toAnonymousUserId(reviewMap.selectReviewByMovieId(movieId, startIndex, rowCount), userId);
	}
	
	private List<Review> toAnonymousUserId(List<Review> reviews, Integer loginedUserId) {
		for (Review review : reviews) {
			String userId = review.getUserId();
			StringBuilder builder = new StringBuilder();
			builder.append(userId.subSequence(0, 3));

			for (int i = 0; i < userId.length() - 3; i++) {
				builder.append("*");
			}
			
			review.setUserId(builder.toString());
			review.setLikeCount(sympathMap.getLikeCount(review.getReviewNum(), "리뷰"));
			review.setDisLikeCount(sympathMap.getDisLikeCount(review.getReviewNum(), "리뷰"));
			review.setCommentCount(reviewMap.getCommentCount(review.getReviewNum()));
			
			if(loginedUserId != null) {
				Integer loginedUserLiked = sympathMap.isContentLiked(review.getReviewNum(), "리뷰", loginedUserId);
				if(loginedUserLiked != null) {
					review.setCurrentUserSympaths(loginedUserLiked);
				} else {
					review.setCurrentUserSympaths(0);
				}
			}
		}
		
		return reviews;
	}

	@Override
	public void deleteReview(int reviewId) {
		reviewMap.deleteReview(reviewId);
	}

	@Override
	public List<ReviewReply> selectReviewReplay(int reviewNum) {
		return reviewMap.selectReviewReplay(reviewNum);
	}
}
