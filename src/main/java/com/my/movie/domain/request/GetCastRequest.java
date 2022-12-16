package com.my.movie.domain.request;

import lombok.Data;

@Data
public class GetCastRequest {

	private int startIndex;
	
	private int rowCount;
	
}

