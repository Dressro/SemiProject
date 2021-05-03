package com.project.fp.dto;

import java.util.Date;

public class Order_TableDto {
	
	private int order_num;
	private Date order_date;
	private int order_quantity;
	private int order_price;
	private String order_step;
	private String order_pay;
	private int order_group;
	private int prod_num;
	private String member_id;
	private String prod_name;
	private int total_price;
	
	

	public Order_TableDto(int order_num, Date order_date, int order_quantity, int order_price, String order_step,
			String order_pay, int order_group, int prod_num, String member_id, String prod_name) {
		super();
		this.order_num = order_num;
		this.order_date = order_date;
		this.order_quantity = order_quantity;
		this.order_price = order_price;
		this.order_step = order_step;
		this.order_pay = order_pay;
		this.order_group = order_group;
		this.prod_num = prod_num;
		this.member_id = member_id;
		this.prod_name = prod_name;
	}
	
	public Order_TableDto(int order_num, Date order_date, int order_quantity, int order_price, String order_step,
			String order_pay, int order_group, int prod_num, String member_id) {
		this.order_num = order_num;
		this.order_date = order_date;
		this.order_quantity = order_quantity;
		this.order_price = order_price;
		this.order_step = order_step;
		this.order_pay = order_pay;
		this.order_group = order_group;
		this.prod_num = prod_num;
		this.member_id = member_id;
	}

	public Order_TableDto(int order_num, Date order_date, int order_quantity, int order_price, String order_step,
			String order_pay, int order_group, int prod_num, String member_id, String prod_name, int total_price) {
		super();
		this.order_num = order_num;
		this.order_date = order_date;
		this.order_quantity = order_quantity;
		this.order_price = order_price;
		this.order_step = order_step;
		this.order_pay = order_pay;
		this.order_group = order_group;
		this.prod_num = prod_num;
		this.member_id = member_id;
		this.prod_name = prod_name;
		this.total_price = total_price;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	public int getOrder_group() {
		return order_group;
	}

	public void setOrder_group(int order_group) {
		this.order_group = order_group;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public Order_TableDto() {

	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getOrder_step() {
		return order_step;
	}

	public void setOrder_step(String order_step) {
		this.order_step = order_step;
	}

	public String getOrder_pay() {
		return order_pay;
	}

	public void setOrder_pay(String order_pay) {
		this.order_pay = order_pay;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "Order_TableDto [order_num=" + order_num + ", order_date=" + order_date + ", order_quantity="
				+ order_quantity + ", order_price=" + order_price + ", order_step=" + order_step + ", order_pay="
				+ order_pay + ", order_group=" + order_group + ", prod_num=" + prod_num + ", member_id=" + member_id
				+ ", prod_name=" + prod_name + ", total_price=" + total_price + "]";
	}


	
}
