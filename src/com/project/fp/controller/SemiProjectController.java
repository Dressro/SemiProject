package com.project.fp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.fp.biz.MemberBiz;
import com.project.fp.biz.MemberBizImpl;
import com.project.fp.dto.AnimalDto;
import com.project.fp.dto.MemberDto;

@WebServlet("/SemiProjectController")
public class SemiProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		
		MemberBiz m_biz = new MemberBizImpl();
		
		if (command.equals("general_signup")) {
			response.sendRedirect("general_signup.jsp");
		} else if(command.equals("doctor_signup")) {
			response.sendRedirect("doctor_signup.jsp");
		} else if (command.equals("signupres")) {
			String animal_name = request.getParameter("animal_name");
			String animal_gen = request.getParameter("aniaml_gen");
			String animal_type = request.getParameter("animal_type");
			int animal_age = Integer.parseInt(request.getParameter("animal_age"));
			double animal_weight = Double.parseDouble(request.getParameter("animal_weight"));
			String animal_unq = request.getParameter("animal_unq");
			String member_id = request.getParameter("member_id");
			String member_password = request.getParameter("member_password");
			String member_name = request.getParameter("member_name");
			String member_nicname = request.getParameter("member_nicname");
			String member_email = request.getParameter("member_email");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr");
			String member_grade = request.getParameter("member_grade");
			String member_animal = request.getParameter("member_animal");
			String member_dr_info = request.getParameter("member_dr_info");
			String member_notify = request.getParameter("member_notify");
			AnimalDto a_dto = new AnimalDto();
			a_dto.setAnimal_name(animal_name);
			a_dto.setAnimal_gen(animal_gen);
			a_dto.setAnimal_type(animal_type);
			a_dto.setAnimal_age(animal_age);
			a_dto.setAnimal_weight(animal_weight);
			a_dto.setAnimal_unq(animal_unq);
			a_dto.setMember_id(member_id);
			int a_res = 0;
			MemberDto m_dto = new MemberDto(member_id, member_password, member_name, member_nicname, member_email,
					member_phone, member_addr, member_grade, "Y", member_animal, 0, member_dr_info, member_notify);
			int res = m_biz.insert(m_dto);
			if (res > 0) {
				jsResponse(response, "회원가입 성공", "index.html");
			} else {
				jsResponse(response, "회원가입 실패", "#");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void dispatch(HttpServletResponse response, HttpServletRequest request, String path)
			throws ServletException, IOException {
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void jsResponse(HttpServletResponse response, String msg, String url) throws IOException {
		String responseText = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url
				+ "';" + "</script>";
		response.getWriter().print(responseText);
	}
}
