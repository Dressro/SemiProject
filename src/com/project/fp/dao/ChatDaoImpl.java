package com.project.fp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.ChatDto;

public class ChatDaoImpl extends SqlMapConfig implements ChatDao {
	
	private String namespace = "com.project.fp.chat.";

	@Override
	public List<ChatDto> selectList(ChatDto dto) {
		
		List<ChatDto> list = new ArrayList<ChatDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ChatDto selectOne(int ch_num) {
		
		ChatDto dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace+"selectOne", ch_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ChatDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insert",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ChatDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int chat_num) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete",chat_num);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}

