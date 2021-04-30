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
	
	public Order_TableDto() {

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

	public int getOrder_group() {
		return order_group;
	}

	public void setOrder_group(int order_group) {
		this.order_group = order_group;
	}

}
