package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	String payCode; // 주문(결제) 코드
	String id; // 아이디
	String name; // 이름
	int totalPrice; // 총 가격
	int amount; // 수량
	String productCode; // 상품 코드
	String address; // 주소
	String contact; // 연락처
	Date payDate; // 주문 날짜
	
	

}
