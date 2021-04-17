package com.project.fp.dto;

public class ReceiveDto {

	private int order_num;
	private String receive_name;
	private String receive_addr;
	private String receive_phone;
	private String receive_memo;

	public ReceiveDto() {

	}

	public ReceiveDto(int order_num, String receive_name, String receive_addr, String receive_phone,
			String receive_memo) {

		this.order_num = order_num;
		this.receive_name = receive_name;
		this.receive_addr = receive_addr;
		this.receive_phone = receive_phone;
		this.receive_memo = receive_memo;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getReceive_name() {
		return receive_name;
	}

	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}

	public String getReceive_addr() {
		return receive_addr;
	}

	public void setReceive_addr(String receive_addr) {
		this.receive_addr = receive_addr;
	}

	public String getReceive_phone() {
		return receive_phone;
	}

	public void setReceive_phone(String receive_phone) {
		this.receive_phone = receive_phone;
	}

	public String getReceive_memo() {
		return receive_memo;
	}

	public void setReceive_memo(String receive_memo) {
		this.receive_memo = receive_memo;
	}

}
