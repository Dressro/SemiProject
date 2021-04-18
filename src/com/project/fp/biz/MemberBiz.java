package com.project.fp.biz;

import java.util.HashMap;
import java.util.List;

import com.project.fp.dto.MemberDto;

public interface MemberBiz {

	public List<MemberDto> selectList();
	public MemberDto selectOne(MemberDto dto);
	public int insert(MemberDto dto);
	public int delete(String id);
	public int update(MemberDto dto);
}
