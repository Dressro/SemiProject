package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.ProductDto;

public interface ProductDao {
	
	public List<ProductDto> selectList();
	public ProductDto prod_selectone(String prod_name);
	public ProductDto selectOne(int prod_num);
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int delete(int prod_num);
	
	public int multiDelete(String[] prod_nums);
}
