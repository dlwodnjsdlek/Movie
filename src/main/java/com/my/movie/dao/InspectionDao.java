package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Inspection;
import com.my.movie.domain.InspectionDetail;

public interface InspectionDao {
	List<Inspection> selectAll();
	List<InspectionDetail> selectDetail(Integer inspectionNum);
	void updateStatus(Inspection inspection);
}