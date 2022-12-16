package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Inspection;
import com.my.movie.domain.InspectionDetail;

public interface InspectionService {
	List<Inspection> selectAll();
	List<InspectionDetail> selectDetail(Integer inspectionNum);
	void fixStatus(Inspection inspection);
}