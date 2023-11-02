package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;
import kr.spring.entity.Member;
import kr.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<Board> getList(Criteria cri) {
		// 게시글 전체목록 가져오기 기능
		List<Board> list = mapper.getList(cri);
		
		return list;
	}

	@Override
	public Member login(Member vo) {
		// 로그인하는 기능
		Member mvo = mapper.login(vo);
		
		return mvo;
	}

	@Override
	public void insertSelectKey(Board board) {
		
		mapper.insertSelectKey(board);
		
	}

	@Override
	public Board get(int idx) {
		
		Board vo = mapper.read(idx);
		
		return vo;
	}

	@Override
	public void modify(Board vo) {
		
		mapper.update(vo);
		
	}

	@Override
	public void remove(int idx) {
		mapper.delete(idx);
		
	}

	@Override
	public void reply(Board vo) {
		// 부모글의 정보 가져오기
		Board parent = mapper.read(vo.getIdx());
		vo.setBoardgroup(parent.getBoardgroup());
		// 답글순서 
		vo.setBoardsequence(parent.getBoardsequence()+1);
		vo.setBoardlevel(parent.getBoardlevel()+1);
		
		mapper.replySeqUpdate(parent);
		
		mapper.replyInsert(vo);
		
		
	}

	@Override
	public int totalCount(Criteria cri) {

		
			
		
		return mapper.totalCount(cri);
	}

	
	
	
	
	
	
	
	
	
}
