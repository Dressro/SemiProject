package com.project.fp.biz;

import java.util.List;

import com.project.fp.dao.ProductDao;
import com.project.fp.dao.ProductDaoImpl;
import com.project.fp.dto.PagingDto;
import com.project.fp.dto.ProductDto;

public class ProductBizImpl implements ProductBiz {
	
	private ProductDao dao = new ProductDaoImpl();

	@Override
	public List<ProductDto> selectList() {

		return dao.selectList();
	}
	

	@Override
	public List<ProductDto> prod_selectList(PagingDto Pdto) {
		return dao.prod_selectList(Pdto);
	}
	
	
	@Override
	public ProductDto prod_selectone(String prod_name) {
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		return dao.prod_selectone(prod_name);
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

	@Override
	public int multiDelete(String[] prod_nums) {
		
		return dao.multiDelete(prod_nums);
	}

	@Override
	public List<ProductDto> selectcategory(String prod_category) {
		return dao.selectcategory(prod_category);
	}

	@Override
	public int pay_update(ProductDto dto) {

		return dao.pay_update(dto);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return dao.count();
	}


	@Override
	public int category_count(String prod_category) {
		// TODO Auto-generated method stub
		return dao.category_count(prod_category);
	}


	@Override
	public List<ProductDto> feed_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.feed_selectList(Pdto);
	}
	
	@Override
	public List<ProductDto> care_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.care_selectList(Pdto);
	}
	
	@Override
	public List<ProductDto> living_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.living_selectList(Pdto);
	}

	@Override
	public List<ProductDto> outing_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.outing_selectList(Pdto);
	}

	@Override
	public List<ProductDto> toy_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.toy_selectList(Pdto);
	}
	

	@Override
	public List<ProductDto> fashion_selectList(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.fashion_selectList(Pdto);
	}


	@Override
	public List<ProductDto> prod_search(ProductDto dto) {
		// TODO Auto-generated method stub
		return dao.prod_search(dto);
	}


	@Override
	public List<ProductDto> product_all_search(PagingDto Pdto) {
		// TODO Auto-generated method stub
		return dao.product_all_search(Pdto);
	}


	@Override
	public List<ProductDto> rank_list() {
		// TODO Auto-generated method stub
		return dao.rank_list();
	}

}