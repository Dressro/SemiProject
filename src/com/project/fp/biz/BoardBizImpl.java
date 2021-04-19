package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.BoardDao;
import com.project.fp.dao.BoardDaoImpl;
import com.project.fp.dto.BoardDto;

public class BoardBizImpl implements BoardBiz {

	private BoardDao dao = new BoardDaoImpl();

	@Override
	public List<BoardDto> free_selectList() {
		// TODO Auto-generated method stub
		return dao.free_selectList();
	}

	@Override
	public List<BoardDto> notice_selectList() {
		// TODO Auto-generated method stub
		return dao.notice_selectList();
	}

	@Override
	public List<BoardDto> qna_selectList() {
		// TODO Auto-generated method stub
		return dao.qna_selectList();
	}

	@Override
	public BoardDto free_selectOne(int board_free_no) {
		// TODO Auto-generated method stub
		return dao.free_selectOne(board_free_no);
	}

	@Override
	public BoardDto notice_selectOne(int board_notice_no) {
		// TODO Auto-generated method stub
		return dao.notice_selectOne(board_notice_no);
	}

	@Override
	public BoardDto qna_selectOne(int board_qna_no) {
		// TODO Auto-generated method stub
		return dao.qna_selectOne(board_qna_no);
	}

	@Override
	public int free_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.free_insert(dto);
	}

	@Override
	public int notice_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.notice_insert(dto);
	}

	@Override
	public int qna_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.qna_insert(dto);
	}

	@Override
	public int readcountupdate(int board_no) {
		// TODO Auto-generated method stub
		return dao.readcountupdate(board_no);
	}

	@Override
	public int free_delete(int board_free_no) {
		// TODO Auto-generated method stub
		return dao.free_delete(board_free_no);
	}

	@Override
	public int delete(int board_no) {
		// TODO Auto-generated method stub
		return dao.delete(board_no);
	}

	@Override
	public int free_answerProc(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		res = dao.free_answerUpdate(dto.getBoard_free_no());
		res = dao.free_answerInsert(dto);
		return res;
	}

	@Override
	public int qna_answerProc(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		res = dao.qna_answerUpdate(dto.getBoard_qna_no());
		res = dao.qna_answerInsert(dto);
		return 0;
	}

}
