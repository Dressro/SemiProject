package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.BoardDao;
import com.project.fp.dao.BoardDaoImpl;
import com.project.fp.dto.BoardDto;
import com.project.fp.dto.PagingDto;

public class BoardBizImpl implements BoardBiz {

	private BoardDao dao = new BoardDaoImpl();
	
	@Override
	public int free_allCount() {

		return dao.free_allCount();
	}

	@Override
	public List<BoardDto> board_selectList(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.board_selectList(dto);
	}

	public int notice_allCount() {

		return dao.notice_allCount();
	}

	@Override
	public int qna_allCount() {

		return dao.qna_allCount();
	}

	@Override
	public int dec_allCount() {

		return dao.dec_allCount();
	}

	@Override
	public List<BoardDto> free_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.free_selectList(Pdto);
	}

	@Override
	public List<BoardDto> notice_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.notice_selectList(Pdto);
	}

	@Override
	public List<BoardDto> qna_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.qna_selectList(Pdto);
	}

	@Override
	public List<BoardDto> dec_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.dec_selectList(Pdto);
	}

	@Override
	public BoardDto board_selectOne(int board_no) {
		// TODO Auto-generated method stub
		return dao.board_selectOne(board_no);
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
	public int dec_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.dec_insert(dto);
	}

	@Override
	public int free_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.free_update(dto);
	}

	@Override
	public int notice_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.notice_update(dto);
	}

	@Override
	public int qna_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.qna_update(dto);
	}

	@Override
	public int dec_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.dec_update(dto);
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
		return res;
	}

	@Override
	public List<BoardDto> free_selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> notice_selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> qna_selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> dec_selectList() {
		// TODO Auto-generated method stub
		return null;
	}





}
