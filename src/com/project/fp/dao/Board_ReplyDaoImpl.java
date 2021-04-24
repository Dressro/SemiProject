package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.Board_ReplyDto;

public class Board_ReplyDaoImpl extends SqlMapConfig implements Board_ReplyDao {
	
	private String namespace = "com.project.fp.board_reply.";

	@Override
	public List<Board_ReplyDto> reply_selectList(int board_no) {
		
		List<Board_ReplyDto> list = new ArrayList<Board_ReplyDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"reply_selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int reply_insert(Board_ReplyDto Rdto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"reply_insert", Rdto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int reply_update(Board_ReplyDto Rdto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"reply_update", Rdto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int reply_delete(int reply_no) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"reply_delete", reply_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int r_reply_insert(Board_ReplyDto Rdto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"r_reply_insert", Rdto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int reply_groupseq_update(int board_no) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"reply_groupseq_update", board_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
