package come.team.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class MemberVO {
	private String id; // 아이디
	private String password; // 비밀번호
	private String name; // 이름
	private String address; // 주소
	private String contact; // 연락처
	private String email; // 이메일
	private int point; // 결제 포인트
	private Date regiDate; //가입 날짜
	private Date updateDate; // 회원정보 수정 날짜
	private boolean enabled; // 아이디 활성화 여부
	private List<AuthVO> authList; 
}
