package com.project.fp.biz;

import java.util.List;

import com.project.fp.dto.ProductDto;

public interface ProductBiz {
	
	public List<ProductDto> selectList();
	public ProductDto selectOne(int prod_num);
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int delete(int prod_num);
	public int multiDelete(String[] prod_nums);
}
