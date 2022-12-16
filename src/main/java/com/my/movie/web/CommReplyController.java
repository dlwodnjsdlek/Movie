//package com.my.movie.web;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.my.movie.domain.CommReply;
//import com.my.movie.service.CommReplyService;
//
//@RestController
//@RequestMapping("communityReply")
//public class CommReplyController {
//	@Autowired private CommReplyService commReplyService;
//	
//	@GetMapping
//	public ModelAndView main(ModelAndView mv) {
//		mv.setViewName("community/contentOut");
//		return mv;
//	}
//	
////	@GetMapping("list/{communityNum}")
////	public List<CommReply> getCommReplies(@PathVariable int communityNum) {
////		return commReplyService.getCommReplies(communityNum);
////	}
//
//	@PostMapping("list")
//	public List<CommReply> getCommReplies(@RequestB int communityNum) {
//		return commReplyService.getCommReplies(communityNum);
//	}
//
//	@PostMapping("add")
//	public void addReply(@RequestBody CommReply commReply) {
//		commReplyService.addCommReply(commReply);
//	}
//}