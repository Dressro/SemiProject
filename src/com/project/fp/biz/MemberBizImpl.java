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
	public MemberDto selectSerch(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.selectSerch(dto);
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
	public int delete(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.delete(dto);
	}

	@Override
	public int update(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
