package com.project.fp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.fp.dto.PagingDto;
import com.project.fp.dto.ProductDto;

public class ProductDaoImpl extends SqlMapConfig implements ProductDao {
	
	private String namespace = "com.project.fp.product.";

	@Override
	public List<ProductDto> selectList() {
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ProductDto prod_selectone(String prod_name) {
		
		ProductDto dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "prod_selectone", prod_name);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public ProductDto selectOne(int prod_num) {

		ProductDto dto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			dto = session.selectOne(namespace + "selectOne", prod_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ProductDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace+"insert",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int update(ProductDto dto) {
		
		int res = 0;

		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"update", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int prod_num) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.delete(namespace+"delete", prod_num);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int multiDelete(String[] prod_nums) {
int count = 0;
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("prod_nums", prod_nums);
		
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.delete(namespace+"multiDelete",map);
			if(count == prod_nums.length) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public List<ProductDto> selectcategory(String prod_category) {
			List<ProductDto> list = null;
			try(SqlSession session = getSqlSessionFactory().openSession(false)) {
				list = session.selectList(namespace+"selectcategoryList",prod_category);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		}

	@Override
	public int pay_update(ProductDto dto) {

		int res = 0;

		try(SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.update(namespace+"pay_update", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	
	@Override
	public int count() {
		int res = 0;

		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.selectOne(namespace + "product_allCount");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<ProductDto> prod_selectList(PagingDto Pdto) {
			List<ProductDto> list = new ArrayList<ProductDto>();
			
			try(SqlSession session = getSqlSessionFactory().openSession(false)) {
				list = session.selectList(namespace+"product_selectList", Pdto);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		}
	
	

}
