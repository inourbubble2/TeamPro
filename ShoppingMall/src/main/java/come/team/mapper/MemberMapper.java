package come.team.mapper;

import java.util.List;

import come.team.domain.MemberVO;


public interface MemberMapper {
	
	public List<MemberVO> list();    //전체 User의 데이터 리스트
	
	public MemberVO getMember(String id);        //ID에 해당하는 User 데이터 읽기
	
	public void join(MemberVO vo);        //user 테이블 안에 UserVO 데이터를 삽입
	
	public void updateMember(MemberVO vo);        //user 테이블 안에 UserVO 데이터를 수정
	
	public void deleteMember(String id);        //ID에 해당하는 User 데이터 삭제
	
	public MemberVO read(String id); //로그인...
	

}
