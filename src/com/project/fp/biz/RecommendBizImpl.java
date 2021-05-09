package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.RecommendDao;
import com.project.fp.dao.RecommendDaoImpl;
import com.project.fp.dto.ProductDto;
import com.project.fp.dto.RecommendDto;

public class RecommendBizImpl implements RecommendBiz {
	
	private RecommendDao dao = new RecommendDaoImpl();
	ProductBiz p_biz = new ProductBizImpl();
	List<ProductDto> p_list = p_biz.rank_list();
	@Override
	public int insert(RecommendDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public RecommendDto selectOne(RecommendDto dto) {
		// TODO Auto-generated method stub
		return dao.selectOne(dto);
	}

	@Override
	public int update(RecommendDto dto) {
		if(dto.getRecommend_second()==0) {
			dto.setRecommend_second(p_list.get(1).getProd_num());
		}
		if(dto.getRecommend_third()==0) {
			dto.setRecommend_third(p_list.get(2).getProd_num());
		}
		if(dto.getRecommend_fourth()==0) {
			dto.setRecommend_fourth(p_list.get(3).getProd_num());
		}
		if(dto.getRecommend_fifth()==0) {
			dto.setRecommend_fifth(p_list.get(4).getProd_num());
		}
		return dao.update(dto);
	}

	

}
