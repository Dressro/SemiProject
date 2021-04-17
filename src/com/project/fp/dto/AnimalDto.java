package com.project.fp.dto;

public class AnimalDto {

	private int animal_no;
	private String animal_name;
	private String animal_gen;
	private String animal_type;
	private int animal_age;
	private double animal_weight;
	private String animal_unq;
	private String member_id;
	public AnimalDto() {
	}
	public AnimalDto(int animal_no, String animal_name, String animal_gen, String animal_type, int animal_age,
			double animal_weight, String animal_unq, String member_id) {
		this.animal_no = animal_no;
		this.animal_name = animal_name;
		this.animal_gen = animal_gen;
		this.animal_type = animal_type;
		this.animal_age = animal_age;
		this.animal_weight = animal_weight;
		this.animal_unq = animal_unq;
		this.member_id = member_id;
	}
	public int getAnimal_no() {
		return animal_no;
	}
	public void setAnimal_no(int animal_no) {
		this.animal_no = animal_no;
	}
	public String getAnimal_name() {
		return animal_name;
	}
	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}
	public String getAnimal_gen() {
		return animal_gen;
	}
	public void setAnimal_gen(String animal_gen) {
		this.animal_gen = animal_gen;
	}
	public String getAnimal_type() {
		return animal_type;
	}
	public void setAnimal_type(String animal_type) {
		this.animal_type = animal_type;
	}
	public int getAnimal_age() {
		return animal_age;
	}
	public void setAnimal_age(int animal_age) {
		this.animal_age = animal_age;
	}
	public double getAnimal_weight() {
		return animal_weight;
	}
	public void setAnimal_weight(double animal_weight) {
		this.animal_weight = animal_weight;
	}
	public String getAnimal_unq() {
		return animal_unq;
	}
	public void setAnimal_unq(String animal_unq) {
		this.animal_unq = animal_unq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
