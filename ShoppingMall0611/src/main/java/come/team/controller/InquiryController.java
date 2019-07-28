package come.team.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.Criteria;
import come.team.domain.InquiryVO;
import come.team.domain.MemberVO;
import come.team.domain.PageDTO;
import come.team.domain.ReplyVO;
import come.team.service.InquiryService;
import come.team.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/inquiry")
public class InquiryController {
	
	private InquiryService inquiryService;
	private ReplyService replyService;
	
	// 문의 사항 리스트
	@GetMapping("/list")
	public void getInquiryList(Criteria criteria, Model model) {
		
		List<InquiryVO> inquiry = inquiryService.getInquiryList(criteria);
		model.addAttribute("inquiry", inquiry);
		
		List<ReplyVO> reply = replyService.getReplyList();
		model.addAttribute("reply", reply);
		
		
		int total = inquiryService.getInquiryNum() + replyService.getReplyNum();
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
	}
	
	// 문의 사항 상세 조회
	@GetMapping("/view")
	public void getInquiryView(int inquiryNo, Model model) {
		
		model.addAttribute("inquiry", inquiryService.getInquiryView(inquiryNo));
		model.addAttribute("reply", replyService.getReplyListByInquiryNo(inquiryNo));
		
	}
	
	// 문의사항 작성 페이지로 매핑
	@GetMapping("/registerForm")
	public void getRegisterInquiry() {
		log.warn("get registerForm");
	}
	
	// 문의사항 작성
	@PostMapping("/register")
	public String registerInquiry(InquiryVO inquiryVO) {
		log.info("register start");
		log.info("제목: " + inquiryVO.getTitle());		
		log.info("작성자: " + inquiryVO.getName());
		log.info("내용: " + inquiryVO.getContent());
		
		inquiryService.registerInquiry(inquiryVO);
		log.info("register finish");
		return "redirect:/inquiry/list";
	}
	
	//게시물 삭제
	@PreAuthorize("principal.username == #id)")
	@GetMapping("/delete")
	public String getdeleteInquiry(int inquiryNo, Model model) {
		log.warn("접속"); 
		log.warn(inquiryNo);
		log.warn(model);		
			
		model.addAttribute("delete", inquiryNo);
		log.info("delete start");
		inquiryService.deleteInquiry(inquiryNo);
		log.info("delete finish");
		return "redirect:/inquiry/list";
	}
	
	
	//게시물 수정 페이지로 매핑
	@PreAuthorize("principal.username == #id") // 작성자만 수정할 수 있게끔
	@GetMapping("/modifyForm")
	public void getModifyInquiry(int inquiryNo, Model model) {
		log.warn("=======================");
		log.warn(inquiryNo);
		model.addAttribute("inquiry", inquiryService.getInquiryView(inquiryNo));
		
	}
		
	//게시물 수정
	@PreAuthorize("principal.username == #id") // 작성자만 삭제할 수 있게끔
	@PostMapping("/modifyUpdate")
	public String postModifyInquiry(InquiryVO inquiryVO, Model model) {
			
		log.warn("수정되었습니다.");
		log.warn("-----------");

		model.addAttribute("inquiry", inquiryVO);
		inquiryService.modifyInquiry(inquiryVO);
			
		return "redirect:/inquiry/list";
	}

}