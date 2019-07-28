package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.NoticeVO;
import come.team.mapper.MemberMapper;
import come.team.mapper.NoticeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	//notice list를 가져온다
	@Override
	public List<NoticeVO> list() {
		// TODO Auto-generated method stub
		return mapper.getNoticeList();
	}

	//noticeNo를 가진 notice를 불러온다
	@Override
	public NoticeVO view(int noticeNo) {
		// TODO Auto-generated method stub
		return mapper.getNoticeView(noticeNo);
	}

	//notice 행을 insert한다
	@Override
	public void insert(NoticeVO vo) {
		mapper.registerNotice(vo);
	}

	//notice 행을 update한다
	@Override
	public void update(NoticeVO vo) {
		// TODO Auto-generated method stub
		mapper.updateNotice(vo);
	}

	//notice 행을 delete한다
	@Override
	public void delete(int noticeNo) {
		// TODO Auto-generated method stub
		mapper.deleteNotice(noticeNo);
	}

}
