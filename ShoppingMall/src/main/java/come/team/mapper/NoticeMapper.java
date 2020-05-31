package come.team.mapper;

import java.util.List;

import come.team.domain.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> getNoticeList(); //공지사항 리스트
	
	public NoticeVO getNoticeView(int noticeNo); //공지사항 상세 조회
	
	public void registerNotice(NoticeVO vo); //공지사항 글 작성
	
	public void updateNotice(NoticeVO vo); //공지사항 글 수정
	
	public void deleteNotice(int noticeNo); //공지사항 글 삭제

}
