package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Inspection;
import com.my.movie.domain.InspectionDetail;
import com.my.movie.service.InspectionService;

@Controller
@RequestMapping("admin/inspection")
public class InspectionController {

	@Autowired private InspectionService inspectionService;
	
	@GetMapping("inspection")
	public ModelAndView inspection(ModelAndView mv) {
		List<Inspection> insList = inspectionService.selectAll();
		mv.setViewName("admin/inspection/inspection");
		mv.addObject("inspection", insList);
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("inspections/{inspectionNum}/details")
	public List<InspectionDetail> inspectionDetail(@PathVariable Integer inspectionNum) {
		return inspectionService.selectDetail(inspectionNum);
	}
	
	@ResponseBody
	@PostMapping("inspection/status")
	public void fixStatus(@RequestBody Inspection inspection) {
		inspectionService.fixStatus(inspection);
	}
}