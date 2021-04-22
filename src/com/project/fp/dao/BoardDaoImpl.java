package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.BoardDto;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {

	private String namespace = "com.project.fp.board.";

	@Override
	public List<BoardDto> board_selectList(BoardDto dto) {
		// TODO Auto-generated method stub
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "board_selectList", dto);
		}
		return list;
	}

	@Override
	public List<BoardDto> free_selectList() {
		// TODO Auto-generated method stub
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "free_selectList");
		}
		return list;
	}

	@Override
	public List<BoardDto> notice_selectList() {
		// TODO Auto-generated method stub
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "notice_selectList");
		}
		return list;
	}

	@Override
	public List<BoardDto> qna_selectList() {
		// TODO Auto-generated method stub
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "qna_selectList");
		}
		return list;
	}

	@Override
	public List<BoardDto> dec_selectList() {
		// TODO Auto-generated method stub
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "dec_selectList");
		}
		return list;
	}
	
	@Override
	public BoardDto board_selectOne(int board_no) {
		// TODO Auto-generated method stub
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "board_selectOne", board_no);
		}
		return dto;
	}

	@Override
	public BoardDto free_selectOne(int board_free_no) {
		// TODO Auto-generated method stub
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "free_selectOne", board_free_no);
		}
		return dto;
	}

	@Override
	public BoardDto notice_selectOne(int board_notice_no) {
		// TODO Auto-generated method stub
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "notice_selectOne", board_notice_no);
		}
		return dto;
	}

	@Override
	public BoardDto qna_selectOne(int board_qna_no) {
		// TODO Auto-generated method stub
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "qna_selectOne", board_qna_no);
		}
		return dto;
	}

	@Override
	public BoardDto dec_selectOne(int board_dec_no) {
		// TODO Auto-generated method stub
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "dec_selectOne", board_dec_no);
		}
		return dto;
	}

	@Override
	public int free_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int notice_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "notice_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "qna_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int dec_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "dec_insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int free_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notice_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qna_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dec_update(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int free_answerInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_answerinsert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_answerInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "qna_answerinsert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int free_answerUpdate(int board_free_no) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_answerupdate", board_free_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_answerUpdate(int board_qna_no) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "qna_answerupdate", board_qna_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int readcountupdate(int board_no) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "readcountupdate", board_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int free_delete(int board_free_no) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_delete", board_free_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int board_no) {
		// TODO Auto-generated method stub
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "delete", board_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	
}
