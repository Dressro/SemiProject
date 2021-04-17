package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.MemberDto;

public interface MemberDao {

	public List<MemberDto> selectList();
	public MemberDto selectOne(String id);
	public int insert(MemberDto dto);
	public int delete(String id);
	public int update(MemberDto dto);
}
