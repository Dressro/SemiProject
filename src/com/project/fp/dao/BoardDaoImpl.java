package com.project.fp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.BoardDto;
import com.project.fp.dto.MemberDto;
import com.project.fp.dto.PagingDto;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {

	private String namespace = "com.project.fp.board.";

	@Override
	public int free_allCount() {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace + "free_allCount");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int notice_allCount() {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace + "notice_allCount");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_allCount() {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace + "qna_allCount");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int dec_allCount() {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace + "dec_allCount");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public List<BoardDto> index_free() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "index_free");
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> index_notice() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "index_notice");
			session.close();
		}
		return list;
	}
	
	@Override
	public List<BoardDto> index_dec() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "index_dec");
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> board_List() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "board_List");
			session.close();
		}
		return list;
	}
	
	@Override
	public List<BoardDto> board_M_search(BoardDto dto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "board_M_search", dto);
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> board_C_search(BoardDto dto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "board_C_search", dto);
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> board_MC_search(BoardDto dto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "board_MC_search", dto);
			session.close();
		}
		return list;
	}
	@Override
	public List<BoardDto> board_selectList(BoardDto dto) {
		// TODO Auto-generated method stub
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "board_selectList", dto);
			session.close();
		}
		return list;
	}
	
	@Override
	public List<BoardDto> Board_All_M_search(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "Board_All_M_search", Pdto);
			session.close();
		}
		return list;
	}
	
	@Override
	public List<BoardDto> Board_All_C_search(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "Board_All_C_search", Pdto);
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> Board_All_MC_search(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "Board_All_MC_search", Pdto);
			session.close();
		}
		return list;
	}
	
	@Override
	public List<BoardDto> free_selectList(PagingDto Pdto) {

		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "free_selectList", Pdto);
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> notice_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "notice_selectList", Pdto);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardDto> qna_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "qna_selectList", Pdto);
			session.close();
		}
		return list;
	}

	@Override
	public List<BoardDto> dec_selectList(PagingDto Pdto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace + "dec_selectList", Pdto);
			session.close();
		}
		return list;
	}

	@Override
	public BoardDto board_selectOne(int board_no) {
		BoardDto dto = null;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "board_selectOne", board_no);
			session.close();
		}
		return dto;
	}

	@Override
	public int free_insert(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int notice_insert(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "notice_insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_insert(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "qna_insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int dec_insert(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "dec_insert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int board_read(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "board_read", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int board_update(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "board_update", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int free_update(BoardDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"board_update",dto);
			if(res > 0) {
				session.commit();
			}
			session.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int notice_update(BoardDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"board_update",dto);
			if(res > 0) {
				session.commit();
			}
			session.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int qna_update(BoardDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"board_update",dto);
			if(res > 0) {
				session.commit();
			}
			session.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int dec_update(BoardDto dto) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"board_update",dto);
			if(res > 0) {
				session.commit();
			}
			session.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int free_answerInsert(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_answerinsert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_answerInsert(BoardDto dto) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "qna_answerinsert", dto);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int free_answerUpdate(int board_free_no) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_answerupdate", board_free_no);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int qna_answerUpdate(int board_qna_no) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "qna_answerupdate", board_qna_no);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int readcountupdate(int board_no) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "readcountupdate", board_no);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int free_delete(int board_free_no) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "free_delete", board_free_no);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int board_no) {
		int res = 0;
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "delete", board_no);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int multiDelete(String[] board_nos) {
		int count = 0;
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("board_nos", board_nos);
		
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"multiDelete",map);
			if(count == board_nos.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}

	

	
	

	

	

	

	

	

	

	

	
}
