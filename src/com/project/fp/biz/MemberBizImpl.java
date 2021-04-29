package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.MemberDao;
import com.project.fp.dao.MemberDaoImpl;
import com.project.fp.dto.MemberDto;

public class MemberBizImpl implements MemberBiz {

	private MemberDao dao = new MemberDaoImpl();

	@Override
	public List<MemberDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}
	
	@Override
	public List<MemberDto> selectDoctorList() {
		// TODO Auto-generated method stub
		return dao.selectDoctorList();
	}

	@Override

	public MemberDto selectSerch(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.selectSerch(dto);
	}

	@Override
	public MemberDto selectIdSerch(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.selectIdSerch(dto);
	}
	
	@Override
	public MemberDto selectOne(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.selectOne(dto);
	}

	@Override
	public int insert(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int delete(String member_id) {
		// TODO Auto-generated method stub
		return dao.delete(member_id);
	}

	@Override
	public int update(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto selectDetail(String member_id) {
		// TODO Auto-generated method stub
		return dao.selectDetail(member_id);
	}

	@Override
	public int grade_update(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.grade_update(dto);
	}
	
	@Override
	public int mypageupdate(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.mypageupdate(dto);
	}

	@Override
	public int mypagemod(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.mypagemod(dto);
	}






}
