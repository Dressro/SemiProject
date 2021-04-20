package com.project.fp.dao;

import java.util.HashMap;
import java.util.List;

import com.project.fp.dto.MemberDto;

public interface MemberDao {

	public List<MemberDto> selectList();
	public MemberDto selectOne(MemberDto dto);
	public int insert(MemberDto dto);
	public int delete(String member_id);
	public int update(MemberDto dto);
}
