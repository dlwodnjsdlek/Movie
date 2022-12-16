package com.my.movie.dao.map;

import java.util.List;
import java.util.stream.Collectors;

import com.my.movie.domain.Inspection;
import com.my.movie.domain.InspectionDetail;

public interface InspectionMap {
	List<Inspection> selectAll();
	List<InspectionDetail> selectDetail(Integer inspectionNum);
	void updateStatus(Inspection inspection);
}
