package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int replyNo;		//답변 글번호(PK) rno
	private String title;       //제목 		  reply
	private String id; 		    //아이디	      replyer
	private int inquiryNo;		// 문의 글번호         bno
  	private Date replyDate;
  	private String content;		//답변내용
  
  	 private int replyCount; 	//댓글 갯수
}
