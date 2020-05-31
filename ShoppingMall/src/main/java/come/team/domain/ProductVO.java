package come.team.domain;

import lombok.Data;

@Data
public class ProductVO {
	
	private String productCode; // 상품 코드
	private String productName; // 상품 이름
	private String manufacturer; // 제조사
	private int price; // 개당 가격
	private String description; // 상품 설명
	private String os; // 상품 OS
	private String productType; // 상품 종류(노트북, 데스크탑)
 	private int stock; // 재고량
	private String usability; // 사용 용도

}
