package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryVO {
	
	int inquiryNo; // 문의사항 글 번호	
	String id; // 아이디
	String name; // 이름
	String title; // 제목
	String content; // 내용
	Date inquiryDate; // 문의사항 작성 날짜

}
