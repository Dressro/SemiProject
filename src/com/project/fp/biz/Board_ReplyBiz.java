package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.Board_ReplyDto;

public interface Board_ReplyBiz {
	
	public List<Board_ReplyDto> reply_selectList(int board_no);
	public int reply_insert(Board_ReplyDto Rdto);
	public int reply_update(Board_ReplyDto Rdto);
	public int reply_delete(int reply_no);
	public int r_reply_insert(Board_ReplyDto Rdto);
	public int reply_groupseq_update(int board_no);
	
	public int replyProc(Board_ReplyDto Rdto);

}
