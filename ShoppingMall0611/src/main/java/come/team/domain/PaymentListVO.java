package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentListVO {//paymentVO와 paymentDetailVO의 정보를 모두 담고 있는 VO, DB에서 조인해서 결과값을 얻기 위해 사용된다.
	
	String payCode; //주문(결제) 코드
	String id; // 아이디
	String name; // 이름
 	int totalPrice; // 총 가격
	int price; // 한 개당 가격
	int amount; // 수량
	String productCode; // 상품코드
 	String address; // 주소
	String contact; // 연락처
	Date payDate; // 주문 날짜
	String productName; // 상품 이름
	
	int detailNo; // 주문 상세 정보 번호
	
	
	

}
