package com.project.fp.dto;

public class HospitalDto {

	private int hospital_num;
	private String hospital_name;
	private String hospital_addr;
	private String hospital_phone;

	public HospitalDto() {

	}

	public HospitalDto(int hospital_num, String hospital_name, String hospital_addr, String hospital_phone) {

		this.hospital_num = hospital_num;
		this.hospital_name = hospital_name;
		this.hospital_addr = hospital_addr;
		this.hospital_phone = hospital_phone;
	}

	public int getHospital_num() {
		return hospital_num;
	}

	public void setHospital_num(int hospital_num) {
		this.hospital_num = hospital_num;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getHospital_addr() {
		return hospital_addr;
	}

	public void setHospital_addr(String hospital_addr) {
		this.hospital_addr = hospital_addr;
	}

	public String getHospital_phone() {
		return hospital_phone;
	}

	public void setHospital_phone(String hospital_phone) {
		this.hospital_phone = hospital_phone;
	}

	@Override
	public String toString() {
		return "HospitalDto [hospital_num=" + hospital_num + ", hospital_name=" + hospital_name + ", hospital_addr="
				+ hospital_addr + ", hospital_phone=" + hospital_phone + "]";
	}

	
}
