package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.MemberDto;
import com.project.fp.dto.PagingDto;

public interface MemberDao {

	public List<MemberDto> selectList();
	
	public List<MemberDto> selectDoctorList();
	
	public List<MemberDto> selectDoctorListPaging(PagingDto Pdto);

	public MemberDto selectSerch(MemberDto dto);

	public MemberDto selectIdSerch(MemberDto dto);

	public MemberDto selectOne(MemberDto dto);
	
	public MemberDto selectDetail(String member_id);

	public int insert(MemberDto dto);

	public int delete(String member_id);

	public int update(MemberDto dto);
	
	public int mypageupdate(MemberDto dto);
	
	public int mypagemod (MemberDto dto);
	
	public int myanimalupdate(MemberDto dto);
	
	public int grade_update(MemberDto dto);

}
