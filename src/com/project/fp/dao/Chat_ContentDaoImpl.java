package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.Chat_ContentDto;

public class Chat_ContentDaoImpl extends SqlMapConfig implements Chat_ContentDao {
	
	private String namespace = "com.project.fp.chat_content.";

	@Override
	public List<Chat_ContentDto> selectList() {
		
		List<Chat_ContentDto> list = new ArrayList<Chat_ContentDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList");
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Chat_ContentDto> selectOne(int ch_num) {
		
		List<Chat_ContentDto> list = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectOne", ch_num);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(Chat_ContentDto dto) {
		
		int res = 0;

		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insert",dto);
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
	public int update(Chat_ContentDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update", dto);
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
	public int delete(int ch_num) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete", ch_num);
			if (res > 0) {
				session.commit();
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
