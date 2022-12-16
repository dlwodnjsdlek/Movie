package com.my.movie.domain;

import lombok.Data;

@Data
public class InspectionDetail {
	//신고상세페이지 변수선언
	private Integer inspectionDetailNum; //신고상세번호
	private String inspectionContent; //컨텐츠별 신고사유
	private Integer userNum; //신고자 회원번호
	private Integer inspectionNum; //신고번호
	
	//join 변수선언
	private String userId; //회원번호
	private String userName; //회원이름
	private String nickname; //닉네임
}
