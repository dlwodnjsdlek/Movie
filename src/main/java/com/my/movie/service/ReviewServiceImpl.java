package com.my.movie.service;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.CastDao;
import com.my.movie.dao.DirectorDao;
import com.my.movie.dao.GenreDao;
import com.my.movie.dao.MovieDao;
import com.my.movie.dao.ReviewDao;
import com.my.movie.domain.Movie;
import com.my.movie.domain.Review;
import com.my.movie.domain.ReviewDto;
import com.my.movie.domain.ReviewReply;
import com.my.movie.domain.request.CreateReviewRequest;

@Repository
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private MovieDao movieDao;

	@Autowired
	private GenreDao genreDao;

	@Autowired
	private DirectorDao directorDao;

	@Autowired
	private CastDao castDao;

	@Autowired
	private ReviewDao reviewDao;

	private static final DecimalFormat formatter = new DecimalFormat("###,###");

	@Override
	public ReviewDto getReviewDtoByMovieId(int movieId, Integer userId) {
		Movie movie = movieDao.selectById(movieId);

		ReviewDto dto = new ReviewDto();
		dto.setMovie(movie);
		dto.setSummaryString(toSummaryString(movie));
		dto.setAudienceString(formatter.format(movie.getCumulativeAudience()));
		dto.setDirector(directorDao.findDirectorByMovieId(movieId));
		dto.setCasts(castDao.selectByMoveId(movieId));
		dto.setReviews(reviewDao.selectReviewByMovieId(movieId, 0, 5, userId));
		
		return dto;
	}

	private String toSummaryString(Movie movie) {
		List<String> genres = genreDao.searchGenre(movie.getMovieNum());
		StringBuilder builder = new StringBuilder();

		builder.append(movie.getMovieCountry());
		builder.append(" | ");

		for (String genre : genres) {
			builder.append(genre);
			builder.append(", ");
		}

		builder.setLength(builder.length() - 2);
		return builder.toString();
	}

	@Override
	public void insertReview(CreateReviewRequest request) {
		reviewDao.insertReview(request);
	}

	@Override
	public void deleteReview(int reviewId) {
		reviewDao.deleteReview(reviewId);
	}

	@Override
	public List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount, Integer userId) {
		return reviewDao.selectReviewByMovieId(movieId, startIndex, rowCount, userId);
	}

	@Override
	public List<ReviewReply> getReviewReplay(int reviewNum) {
		return reviewDao.selectReviewReplay(reviewNum);
	}

}
