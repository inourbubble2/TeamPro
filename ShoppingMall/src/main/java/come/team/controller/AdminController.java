package come.team.controller;


import java.security.Principal;
import java.text.DateFormat;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.Criteria;
import come.team.domain.PageDTO;
import come.team.domain.PaymentVO;
import come.team.domain.ProductVO;
import come.team.service.MemberService;
import come.team.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {
	
	private ProductService productService;
	private MemberService memberService;
	
	@GetMapping("/index") //관리자 index를 관리자용 페이지
	public void index(Principal principal) {
		log.info("id: " + principal.getName());
	}
	
	@GetMapping("/list") //관리자가 상품 목록 확인
	public void list(Criteria criteria, Model model) {	
		criteria.setAmount(10);
		
		log.info("list: " + criteria);
		
		model.addAttribute("list", productService.findPagingList(criteria));
		
		int total = productService.countAll(criteria);
		
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
	}
	
	@GetMapping("/view") //관리자가 상품 상세 정보 확인
	public void view(String productCode, Model model) {
		model.addAttribute("product", productService.productView(productCode));
	}
		

	//상품 정보 등록 페이지 매핑	
	@GetMapping("/register") //관리자가 상품 정보 등록
	public void register() {
		log.info("get register");
	}
	
	
	// 상품 정보 등록하는 
	@PostMapping("/register") //관리자가 제품 등록하는
	public String register(ProductVO vo) {
		productService.register(vo);
		
		log.info("productVO: " + vo);
		
		return "redirect:/admin/list";
	}
	
	// 상품 정보 수정
	@GetMapping("/update")
	public void update(String productCode, Model model) {
		model.addAttribute("board", productService.productView(productCode));
	}
	
	@GetMapping("/updateCheck")
	public void list(ProductVO vo, Model model) {	
		log.info(vo);
		productService.update(vo);
	}
	
	// 상품 정보 삭제
	@GetMapping("/delete")
	public void delete(String productCode, Model model) {
		log.info("delete sequence start "+productCode);
		productService.delete(productCode);
		log.info("delete sequence ");
	}
	
	// 관리자가 회원 목록 확인
		@GetMapping("/memberlist")
		public void memberlist(Model model) {
			model.addAttribute("list", memberService.list());
		}
//		public ModelAndView memberlist() {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("admin/memberlist");
//			mv.addObject("list", memberService.list());
//			return mv;
//		}
		
	// 관리자가 회원 정보 확인 (DateFormat 전달)
	@GetMapping("/memberview")
	public void memberview(Model model, String id) {
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		model.addAttribute("mem", memberService.getMember(id));
		model.addAttribute("format", format);
	}
	
}
