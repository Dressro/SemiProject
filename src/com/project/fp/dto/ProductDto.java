package com.project.fp.dto;

import java.util.Date;

public class ProductDto {
	
	private int prod_num;
	private String prod_name;
	private String prod_explain;
	private int prod_sale;
	private int prod_price;
	private int prod_recomm;
	private int prod_stock;
	private String prod_category;
	private int prod_in;
	private int prod_out;
	private Date prod_indate;
	private Date prod_outdate;
	private String prod_mfr;
	private String prod_client;
	
	public ProductDto() {
	}

	public ProductDto(int prod_num, String prod_name, String prod_explain, int prod_sale, int prod_price, int prod_recomm,
			int prod_stock, String prod_category, int prod_in, int prod_out, Date prod_indate, Date prod_outdate,
			String prod_mfr, String prod_client) {
		this.prod_num = prod_num;
		this.prod_name = prod_name;
		this.prod_explain = prod_explain;
		this.prod_sale = prod_sale;
		this.prod_price = prod_price;
		this.prod_recomm = prod_recomm;
		this.prod_stock = prod_stock;
		this.prod_category = prod_category;
		this.prod_in = prod_in;
		this.prod_out = prod_out;
		this.prod_indate = prod_indate;
		this.prod_outdate = prod_outdate;
		this.prod_mfr = prod_mfr;
		this.prod_client = prod_client;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_explain() {
		return prod_explain;
	}

	public void setProd_explain(String prod_explain) {
		this.prod_explain = prod_explain;
	}

	public int getProd_sale() {
		return prod_sale;
	}

	public void setProd_sale(int prod_sale) {
		this.prod_sale = prod_sale;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public int getProd_recomm() {
		return prod_recomm;
	}

	public void setProd_recomm(int prod_recomm) {
		this.prod_recomm = prod_recomm;
	}

	public int getProd_stock() {
		return prod_stock;
	}

	public void setProd_stock(int prod_stock) {
		this.prod_stock = prod_stock;
	}

	public String getProd_category() {
		return prod_category;
	}

	public void setProd_category(String prod_category) {
		this.prod_category = prod_category;
	}

	public int getProd_in() {
		return prod_in;
	}

	public void setProd_in(int prod_in) {
		this.prod_in = prod_in;
	}

	public int getProd_out() {
		return prod_out;
	}

	public void setProd_out(int prod_out) {
		this.prod_out = prod_out;
	}

	public Date getProd_indate() {
		return prod_indate;
	}

	public void setProd_indate(Date prod_indate) {
		this.prod_indate = prod_indate;
	}

	public Date getProd_outdate() {
		return prod_outdate;
	}

	public void setProd_outdate(Date prod_outdate) {
		this.prod_outdate = prod_outdate;
	}

	public String getProd_mfr() {
		return prod_mfr;
	}

	public void setProd_mfr(String prod_mfr) {
		this.prod_mfr = prod_mfr;
	}

	public String getProd_client() {
		return prod_client;
	}

	public void setProd_client(String prod_client) {
		this.prod_client = prod_client;
	}

}
