package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeNo; // 공지사항 글 번호
	private String id; // 아이디
	private String title; // 제목
	private String content; // 내용
	private Date noticeDate; // 작성 날짜

}
