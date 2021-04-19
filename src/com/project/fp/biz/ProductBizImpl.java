package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.ProductDao;
import com.project.fp.dao.ProductDaoImpl;
import com.project.fp.dto.ProductDto;

public class ProductBizImpl implements ProductBiz {
	
	private ProductDao dao = new ProductDaoImpl();

	@Override
	public List<ProductDto> selectList() {

		return dao.selectList();
	}

	@Override
	public ProductDto selectOne(int prod_num) {

		return dao.selectOne(prod_num);
	}

	@Override
	public int insert(ProductDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(ProductDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int prod_num) {

		return dao.delete(prod_num);
	}

}
