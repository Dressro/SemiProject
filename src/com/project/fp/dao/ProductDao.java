package com.project.fp.dao;

import java.util.List;

import com.project.fp.dto.PagingDto;
import com.project.fp.dto.ProductDto;

public interface ProductDao {
	
	public List<ProductDto> selectList();
	public List<ProductDto> selectcategory(String prod_category);
	public List<ProductDto> prod_selectList(PagingDto Pdto);
	public ProductDto prod_selectone(String prod_name);
	public ProductDto selectOne(int prod_num);
	public int insert(ProductDto dto);
	public int update(ProductDto dto);
	public int pay_update(ProductDto dto);
	public int delete(int prod_num);
	public int count();
	
	public int multiDelete(String[] prod_nums);
	public int category_count(String prod_category);
	public List<ProductDto> feed_selectList(PagingDto Pdto);
	public List<ProductDto> care_selectList(PagingDto Pdto);
	public List<ProductDto> living_selectList(PagingDto Pdto);
	public List<ProductDto> outing_selectList(PagingDto Pdto);
	public List<ProductDto> toy_selectList(PagingDto Pdto);
	public List<ProductDto> fashion_selectList(PagingDto Pdto);
	public List<ProductDto> prod_search(ProductDto dto);
	public List<ProductDto> product_all_search(PagingDto Pdto);
}