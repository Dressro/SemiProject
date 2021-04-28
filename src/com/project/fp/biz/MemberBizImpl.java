package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.MemberDao;
import com.project.fp.dao.MemberDaoImpl;
import com.project.fp.dto.MemberDto;
import com.project.fp.security.AES256_str;
import com.project.fp.security.RSA_num;

public class MemberBizImpl implements MemberBiz {

	private MemberDao dao = new MemberDaoImpl();

	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> list = dao.selectList();
		for (MemberDto dto : list) {
			try {
				dto.setMember_id(AES256_str.Decrypt(dto.getMember_id()));
				dto.setMember_password(AES256_str.Decrypt(dto.getMember_password()));
				dto.setMember_name(AES256_str.Decrypt(dto.getMember_name()));
				dto.setMember_nicname(AES256_str.Decrypt(dto.getMember_nicname()));
				dto.setMember_email(AES256_str.Decrypt(dto.getMember_email()));
				dto.setMember_phone(AES256_str.Decrypt(dto.getMember_phone()));
				dto.setMember_addr(AES256_str.Decrypt(dto.getMember_addr()));
				dto.setMember_point(RSA_num.decryption(dto.getMember_point()));
				dto.setMember_dr_info(AES256_str.Decrypt(dto.getMember_dr_info()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@Override
	public List<MemberDto> selectDoctorList() {
		List<MemberDto> doclist = dao.selectDoctorList();
		for (MemberDto dto : doclist) {
			try {
				dto.setMember_id(AES256_str.Decrypt(dto.getMember_id()));
				dto.setMember_password(AES256_str.Decrypt(dto.getMember_password()));
				dto.setMember_name(AES256_str.Decrypt(dto.getMember_name()));
				dto.setMember_nicname(AES256_str.Decrypt(dto.getMember_nicname()));
				dto.setMember_email(AES256_str.Decrypt(dto.getMember_email()));
				dto.setMember_phone(AES256_str.Decrypt(dto.getMember_phone()));
				dto.setMember_addr(AES256_str.Decrypt(dto.getMember_addr()));
				dto.setMember_point(RSA_num.decryption(dto.getMember_point()));
				dto.setMember_dr_info(AES256_str.Decrypt(dto.getMember_dr_info()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return doclist;
	}

	@Override

	public MemberDto selectSerch(MemberDto dto) {
		MemberDto searchdto = new MemberDto();
		try {
			dto.setMember_id(AES256_str.Encrypt(dto.getMember_id()));
			searchdto = dao.selectSerch(dto);
			searchdto.setMember_id(AES256_str.Decrypt(searchdto.getMember_id()));
			searchdto.setMember_password(AES256_str.Decrypt(searchdto.getMember_password()));
			searchdto.setMember_name(AES256_str.Decrypt(searchdto.getMember_name()));
			searchdto.setMember_nicname(AES256_str.Decrypt(searchdto.getMember_nicname()));
			searchdto.setMember_email(AES256_str.Decrypt(searchdto.getMember_email()));
			searchdto.setMember_phone(AES256_str.Decrypt(searchdto.getMember_phone()));
			searchdto.setMember_addr(AES256_str.Decrypt(searchdto.getMember_addr()));
			searchdto.setMember_point(RSA_num.decryption(searchdto.getMember_point()));
			searchdto.setMember_dr_info(AES256_str.Decrypt(searchdto.getMember_dr_info()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return searchdto;
	}

	@Override
	public MemberDto selectIdSerch(MemberDto dto) {
		MemberDto iddto = new MemberDto();
		try {
			dto.setMember_name(AES256_str.Encrypt(dto.getMember_name()));
			dto.setMember_email(AES256_str.Encrypt(dto.getMember_email()));
			iddto = dao.selectIdSerch(dto);
			iddto.setMember_id(AES256_str.Decrypt(iddto.getMember_id()));
			iddto.setMember_password(AES256_str.Decrypt(iddto.getMember_password()));
			iddto.setMember_name(AES256_str.Decrypt(iddto.getMember_name()));
			iddto.setMember_nicname(AES256_str.Decrypt(iddto.getMember_nicname()));
			iddto.setMember_email(AES256_str.Decrypt(iddto.getMember_email()));
			iddto.setMember_phone(AES256_str.Decrypt(iddto.getMember_phone()));
			iddto.setMember_addr(AES256_str.Decrypt(iddto.getMember_addr()));
			iddto.setMember_point(RSA_num.decryption(iddto.getMember_point()));
			iddto.setMember_dr_info(AES256_str.Decrypt(iddto.getMember_dr_info()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return iddto;
	}
	
	@Override
	public MemberDto selectOne(MemberDto dto) {
		MemberDto onedto = new MemberDto();
		try {
			dto.setMember_id(AES256_str.Encrypt(dto.getMember_id()));
			dto.setMember_password(AES256_str.Encrypt(dto.getMember_password()));
			onedto = dao.selectOne(dto);
			onedto.setMember_id(AES256_str.Decrypt(onedto.getMember_id()));
			onedto.setMember_password(AES256_str.Decrypt(onedto.getMember_password()));
			onedto.setMember_name(AES256_str.Decrypt(onedto.getMember_name()));
			onedto.setMember_nicname(AES256_str.Decrypt(onedto.getMember_nicname()));
			onedto.setMember_email(AES256_str.Decrypt(onedto.getMember_email()));
			onedto.setMember_phone(AES256_str.Decrypt(onedto.getMember_phone()));
			onedto.setMember_addr(AES256_str.Decrypt(onedto.getMember_addr()));
			onedto.setMember_point(RSA_num.decryption(onedto.getMember_point()));
			onedto.setMember_dr_info(AES256_str.Decrypt(onedto.getMember_dr_info()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return onedto;
	}

	@Override
	public int insert(MemberDto dto) {
		try {
			dto.setMember_id(AES256_str.Encrypt(dto.getMember_id()));
			dto.setMember_password(AES256_str.Encrypt(dto.getMember_password()));
			dto.setMember_name(AES256_str.Encrypt(dto.getMember_name()));
			dto.setMember_nicname(AES256_str.Encrypt(dto.getMember_nicname()));
			dto.setMember_email(AES256_str.Encrypt(dto.getMember_email()));
			dto.setMember_phone(AES256_str.Encrypt(dto.getMember_phone()));
			dto.setMember_addr(AES256_str.Encrypt(dto.getMember_addr()));
			dto.setMember_point(RSA_num.encryption(dto.getMember_point()));
			dto.setMember_dr_info(AES256_str.Encrypt(dto.getMember_dr_info()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dao.insert(dto);
	}

	@Override
	public int delete(String member_id) {
		return dao.delete(member_id);
	}

	@Override
	public int update(MemberDto dto) {
		try {
			dto.setMember_id(AES256_str.Encrypt(dto.getMember_id()));
			dto.setMember_password(AES256_str.Encrypt(dto.getMember_password()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dao.update(dto);
	}

	@Override
	public MemberDto selectdetail(String member_id) {
		MemberDto detaildto = new MemberDto();
		try {
			String en_id = AES256_str.Encrypt(member_id);
			detaildto = dao.selectdetail(en_id);
			detaildto.setMember_id(AES256_str.Decrypt(detaildto.getMember_id()));
			detaildto.setMember_password(AES256_str.Decrypt(detaildto.getMember_password()));
			detaildto.setMember_name(AES256_str.Decrypt(detaildto.getMember_name()));
			detaildto.setMember_nicname(AES256_str.Decrypt(detaildto.getMember_nicname()));
			detaildto.setMember_email(AES256_str.Decrypt(detaildto.getMember_email()));
			detaildto.setMember_phone(AES256_str.Decrypt(detaildto.getMember_phone()));
			detaildto.setMember_addr(AES256_str.Decrypt(detaildto.getMember_addr()));
			detaildto.setMember_point(RSA_num.decryption(detaildto.getMember_point()));
			detaildto.setMember_dr_info(AES256_str.Decrypt(detaildto.getMember_dr_info()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return detaildto;
	}





}
