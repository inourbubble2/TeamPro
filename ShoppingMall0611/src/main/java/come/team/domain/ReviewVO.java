package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	int reviewNo; //seq
	String productCode; //form
	String payCode; 
	String id; //principal로 가져오기
	String name; //principal -> getMember -> getName
	String content; //form
	int reviewPoint; //form
	Date reviewDate; //sysdate
}
