package com.my.movie.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminCountList {
	private int countUser;
	private int countWithdrawalUser;
	private int countCommunity;
	private int countInspection;
}