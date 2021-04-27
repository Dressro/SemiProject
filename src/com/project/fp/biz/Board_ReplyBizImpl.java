package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.Board_ReplyDao;
import com.project.fp.dao.Board_ReplyDaoImpl;
import com.project.fp.dto.Board_ReplyDto;

public class Board_ReplyBizImpl implements Board_ReplyBiz {
	
	private Board_ReplyDao dao = new Board_ReplyDaoImpl();

	@Override
	public List<Board_ReplyDto> reply_selectList(int board_no) {

		return dao.reply_selectList(board_no);
	}

	@Override
	public int reply_insert(Board_ReplyDto Rdto) {

		return dao.reply_insert(Rdto);
	}

	@Override
	public int reply_update(Board_ReplyDto Rdto) {

		return dao.reply_update(Rdto);
	}

	@Override
	public int reply_delete(int reply_no) {

		return dao.reply_delete(reply_no);
	}

	@Override
	public int r_reply_insert(Board_ReplyDto Rdto) {

		return dao.r_reply_insert(Rdto);
	}

	@Override
	public int reply_groupseq_update(int board_no) {

		return dao.reply_groupseq_update(board_no);
	}

	@Override
	public int replyProc(Board_ReplyDto Rdto) {
		// transaction
		int update = dao.reply_groupseq_update(Rdto.getBoard_no());
		int insert = dao.r_reply_insert(Rdto);
		
		return (update + insert);
	}

}
