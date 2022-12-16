package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Inspection {
	//신고목록페이지 변수선언
	private Integer inspectionNum; //신고번호
	private Integer inspectionContentNum; //신고된 컨텐츠번호
	private String inspectionContentName; //신고된 컨텐츠명
	private String inspectionStatus; //신고처리상태
	private String inspectionStatusName; //신고처리상태명
	private LocalDate resultDate; //처리결과일
	
	//union 변수선언
	private String userId; //회원번호
	private String userName; //회원이름
	private String nickname; //닉네임
	private String anyContent; //컨텐츠모음
	private Integer inspectionDetailsCount; //신고건 카운트
	
	//신고상세페이지 변수선언
	private Integer inspectionDetailNum;
	private String anyInspectionContent;
}
