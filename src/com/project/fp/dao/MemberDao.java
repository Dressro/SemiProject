package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.MemberDto;

public interface MemberDao {

	public List<MemberDto> selectList();

	public MemberDto selectSerch(MemberDto dto);

	public MemberDto selectIdSerch(MemberDto dto);

	public MemberDto selectOne(MemberDto dto);
	
	public MemberDto selectdetail(String member_id);

	public int insert(MemberDto dto);

	public int delete(String member_id);

	public int update(MemberDto dto);
}
