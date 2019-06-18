package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	int payNo;
	int cartNo;
	String id;
	String name;
	int price;
	int amount;
	String productCode;
	String address;
	String contact;
	Date payDate;
	
	

}
