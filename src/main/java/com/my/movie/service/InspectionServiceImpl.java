package com.my.movie.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.InspectionDao;
import com.my.movie.domain.Inspection;
import com.my.movie.domain.InspectionDetail;

@Service
public class InspectionServiceImpl implements InspectionService {
	@Autowired private InspectionDao inspectionDao;

	@Override
	public List<Inspection> selectAll() {
		List<Inspection> insList = inspectionDao.selectAll();
		List<Inspection> rtnInsList = new ArrayList<Inspection>();
		for(int i = 0; i < insList.size(); i++) {
			Inspection oneInspection = insList.get(i);
			String insepctionStatus = oneInspection.getInspectionStatus();
			String insepctionStatusName = "";
			if("0".equals(insepctionStatus)) {
				insepctionStatusName = "미처리";
			}else if("1".equals(insepctionStatus)) {
				insepctionStatusName = "신고반려";
			}else if("2".equals(insepctionStatus)) {
				insepctionStatusName = "신고삭제";
			}
			oneInspection.setInspectionStatusName(insepctionStatusName);
			rtnInsList.add(oneInspection);
		}
		return rtnInsList;
	}

	@Override
	public List<InspectionDetail> selectDetail(Integer inspectionNum) {
		return inspectionDao.selectDetail(inspectionNum);
	}
	
	@Override
	public void fixStatus(Inspection inspection) {
		inspectionDao.updateStatus(inspection);
	}
}