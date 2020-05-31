package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.MemberVO;
import come.team.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> list() { //회원 정보 리스트 
		return mapper.list();
	}

	@Override
	public String findPasswordById(String id) {
		MemberVO vo = mapper.getMember(id);
		return vo.getPassword();
	}

	@Override
	public void join(MemberVO vo) { //회원가입
		mapper.join(vo);
	}

	@Override
	public MemberVO getMember(String id) { //회원 정보 상세 조회
		return mapper.getMember(id);
	}

	@Override
	public void update(MemberVO vo) { //회원정보 수정
		mapper.updateMember(vo);
		
	}

	@Override
	public void delete(String id) {// 회원탈퇴
		mapper.deleteMember(id);
	}

}
