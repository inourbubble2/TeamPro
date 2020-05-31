package come.team.controller;
 

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.ReplyVO;
import come.team.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/inquiry/")
@Controller
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyMapper replyMapper;
	
	// 관리자 문의 답변 페이지 매핑
	@GetMapping("/registerForm")
	public void Reply(int inquiryNo, Model model) {
		log.info("get replyRegisterForm");
		model.addAttribute("inquiryNo", inquiryNo);
		
	}
	
	//관리자 문의 답변
	@PostMapping("/register")
	public String PostReply(ReplyVO replyVO, Model model) {
		log.info("start replyRegister");
		log.info("답변 제목: " + replyVO.getTitle());
		log.info("답변 내용: " + replyVO.getContent());
		log.info("문의 글 번호: " + replyVO.getInquiryNo());
		
		replyMapper.registerReplyInquiry(replyVO);
		
		log.info("replyRegister finish");
		return "redirect:/inquiry/list";
		
	}
	
	//관리자 문의답변 상세 조회
	@GetMapping("/view")
	public void getReplyView(int replyNo, Model model) {
		ReplyVO replyVO = replyMapper.getReplyView(replyNo);
		int inquiryNo = replyVO.getInquiryNo();
		model.addAttribute("replyList", replyMapper.getReplyListByInquiryNo(inquiryNo));
	
	}

}

