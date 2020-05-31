package come.team.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import come.team.domain.CartVO;
import come.team.domain.Criteria;
import come.team.domain.MemberVO;
import come.team.domain.PaymentDetailVO;
import come.team.domain.PaymentListVO;
import come.team.domain.PaymentVO;
import come.team.domain.ProductVO;
import come.team.service.CartService;
import come.team.service.MemberService;
import come.team.service.OrderService;
import come.team.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private CartService cartService;
	private ProductService productService;
	private OrderService orderService;
	private MemberService memberService;
	
	// 장바구니 담기	
	@PostMapping("/addCart")
	public String addCart(CartVO cart) {
		log.info("addCart start");
		cartService.addCart(cart);
		log.info("addCart finish");
		return "redirect:/cart/cartList";
	}
	
	// 장바구니 페이지 매핑
	@GetMapping("/cartList")
	public void getCartList(Model model, Criteria criteria, Principal principal) {
		log.info("get cartList");
		String id = principal.getName();
		List<CartVO> cartList = cartService.getCartList(id);
		
		for(int i=0; i<cartList.size(); i++) {
			ProductVO productVO = productService.productView(cartList.get(i).getProductCode());
			cartList.get(i).setPrice(productVO.getPrice());
		}
		model.addAttribute("cart", cartList);
	}
	
	// 장바구니 내용 삭제
	@ResponseBody
	@PostMapping(value = "/deleteCart")
	public void deleteCart(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		log.info("delete cart");

		int cartNo = 0;

		for (String i : chArr) {
			CartVO cart = new CartVO();
			cartNo = Integer.parseInt(i);
			cart.setCartNo(cartNo);
			cartService.deleteCart(cart);
			}
	}
		
	@GetMapping(value = "/cartList/json",
			produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CartVO>> getReviewList(Principal principal, Model model){
		String id = "";
		
		try {
			id = principal.getName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List<CartVO> cartList = cartService.getCartList(id);

		for (int i = 0; i < cartList.size(); i++) {
			ProductVO productVO = productService.productView(cartList.get(i).getProductCode());
			cartList.get(i).setPrice(productVO.getPrice());
		}
				
		return new ResponseEntity<List<CartVO>>(cartList, HttpStatus.OK);
	}
	
	
	// 주문 정보 입력
	@PostMapping("/orderInput")
	public String orderInput(PaymentVO payment, PaymentDetailVO paymentDetail, MemberVO member, Principal principal) throws Exception{
		log.info("start orderInput");
		
		//주문 번호 만들기(오늘날짜_랜덤으로 부여되는 번호)
		//ex) 20190620_xxxxxxx
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=0; i<=6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String payCode = ymd + "_" + subNum;
		//
		
		String id = principal.getName();
		
		payment.setPayCode(payCode); // 주문 정보에 생성된 payCode 주입
		
		orderService.orderInput(payment); // 주문 정보 입력
		
		// 포인트 차감
		member = memberService.getMember(id); //id에 대한 회원정보 받아오기
		
		int MemberPoint = member.getPoint(); //해당 회원정보의 point 받아오기
		int totalPrice = payment.getTotalPrice(); // 주문 과정에 이루어진 총 결제 금액
		
		member.setPoint(MemberPoint - totalPrice); // 회원이 가지고 있는 point - 총 결제금액을 memberVO에 set
		orderService.updatePoint(member); //바뀐 point를 회원정보에서 수정
		//
		
		paymentDetail.setPayCode(payCode); //payCode를 paymentDetail에  set
		orderService.orderDetailInput(paymentDetail); // 주문 상세 정보 입력
		
		cartService.deleteCartAfterOrder(id); //주문 후 카트 비우기
		
		log.info("finish orderInput");
		return "redirect:/cart/paymentList";  // 주문 내역 확인 페이지로 이동				
	}
	
	// 주문 목록
	@GetMapping("/paymentList")
	public void getPaymentList(PaymentVO payment, Model model, Principal principal) {
		log.info("get payment list");
		
		String id = principal.getName();
		payment.setId(id);
		
		List<PaymentVO> paymentList = orderService.paymentList(payment);
		
		model.addAttribute("paymentList", paymentList);
	}
	
	//주문 상세 목록
	@GetMapping("/paymentView")
	public void getPaymentDetailList(@RequestParam("payCode") String payCode, 
									PaymentVO payment, Model model, Principal principal) throws Exception {
		log.info("get payment view");
		
		String id = principal.getName();
		
		payment.setId(id);
		payment.setPayCode(payCode);
		
		List<PaymentListVO> paymentView = orderService.paymentView(payment);
		
		model.addAttribute("paymentView", paymentView);
	}
	
	// 주문 목록(관리자)
	@GetMapping("/adminPaymentList")
	public void adminPaymentList(PaymentVO payment, Model model) {
		log.info("get adminPayment List");
		
		model.addAttribute("paymentList", orderService.adminPaymentList(payment));
	}
}
