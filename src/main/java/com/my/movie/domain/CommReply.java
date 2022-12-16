package com.my.movie.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommReply {
	private String communityReplyContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private LocalDate communityReplyDate;
	private int userNum;
	private int communityNum;
	private String nickname;
	private String inspectionContent;
	private int communityReplyNum;
}
