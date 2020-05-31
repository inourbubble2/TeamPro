package come.team.service;

import java.util.List;

import come.team.domain.MemberVO;

public interface MemberService {
	
	List<MemberVO> list();    //전체 유저
	String findPasswordById(String id);    //로그인에 필요한 비밀번호 불러오기
	
	MemberVO getMember(String id); // 회원 정보 얻어 오기
	
	void join(MemberVO vo); //회원 가입, 회원 정보 등록
	
	void update(MemberVO vo); //회원 정보 수정
	
	void delete(String id); //회원 탈퇴
}
