package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.BoardDto;
import com.project.fp.dto.PagingDto;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {

	private String namespace = "com.project.fp.board.";
	
	@Override
	public int free_allCount() {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace+"free_allCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int notice_allCount() {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace+"notice_allCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int qna_allCount() {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace+"qna_allCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int dec_allCount() {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace+"dec_allCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<BoardDto> free_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "free_selectList", Pdto);
		}
		return list;
	}

	@Override
	public List<BoardDto> notice_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "notice_selectList", Pdto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardDto> qna_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "qna_selectList", Pdto);
		}
		return list;
	}

	@Override
	public List<BoardDto> dec_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "dec_selectList", Pdto);
		}
		return list;
	}

	@Override
	public BoardDto free_selectOne(int board_free_no) {
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)){
			dto = session.selectOne(namespace+"free_selectOne", board_free_no);
		}
		return dto;
	}

	@Override
	public BoardDto notice_selectOne(int board_notice_no) {
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)){
			dto = session.selectOne(namespace+"notice_selectOne", board_notice_no);
		}
		return dto;
	}

	@Override
	public BoardDto qna_selectOne(int board_qna_no) {
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)){
			dto = session.selectOne(namespace+"qna_selectOne", board_qna_no);
		}
		return dto;
	}

	@Override
	public BoardDto dec_selectOne(int board_dec_no) {
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)){
			dto = session.selectOne(namespace+"dec_selectOne", board_dec_no);
		}
		return dto;
	}

	@Override
	public int free_insert(BoardDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"free_insert",dto);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"notice_insert",dto);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"qna_insert",dto);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"dec_insert",dto);
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

		return 0;
	}

	@Override
	public int notice_update(BoardDto dto) {

		return 0;
	}

	@Override
	public int qna_update(BoardDto dto) {

		return 0;
	}

	@Override
	public int dec_update(BoardDto dto) {

		return 0;
	}

	@Override
	public int free_answerInsert(BoardDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"free_answerinsert",dto);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"qna_answerinsert",dto);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"free_answerupdate",board_free_no);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"qna_answerupdate",board_qna_no);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"readcountupdate",board_no);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"free_delete",board_free_no);
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
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"delete",board_no);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}





}
