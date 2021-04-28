package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.MemberDto;

public interface MemberDao {

	public List<MemberDto> selectList();
	
	public List<MemberDto> selectDoctorList();

	public MemberDto selectSerch(MemberDto dto);

	public MemberDto selectIdSerch(MemberDto dto);

	public MemberDto selectOne(MemberDto dto);
	
	public MemberDto selectDetail(String member_id);

	public int insert(MemberDto dto);

	public int delete(String member_id);

	public int update(MemberDto dto);
	
public int mypageupdate(MemberDto dto);
	
	public int mypagemod (MemberDto dto);
	
	public int grade_update(MemberDto dto);

}
