package com.project.fp.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.fp.biz.AnimalBiz;
import com.project.fp.biz.AnimalBizImpl;
import com.project.fp.biz.BoardBiz;
import com.project.fp.biz.BoardBizImpl;
import com.project.fp.biz.ChatBiz;
import com.project.fp.biz.ChatBizImpl;
import com.project.fp.biz.Chat_ContentBiz;
import com.project.fp.biz.Chat_ContentBizImpl;
import com.project.fp.biz.File_TableBiz;
import com.project.fp.biz.File_TableBizImpl;
import com.project.fp.biz.MemberBiz;
import com.project.fp.biz.MemberBizImpl;
import com.project.fp.biz.Order_TableBiz;
import com.project.fp.biz.Order_TableBizImpl;
import com.project.fp.biz.ProductBiz;
import com.project.fp.biz.ProductBizImpl;
import com.project.fp.biz.ReceiveBiz;
import com.project.fp.biz.ReceiveBizImpl;
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

		AnimalBiz a_biz = new AnimalBizImpl();
		BoardBiz b_biz = new BoardBizImpl();
		Chat_ContentBiz c_c_biz = new Chat_ContentBizImpl();
		ChatBiz c_biz = new ChatBizImpl();
		File_TableBiz f_t_biz = new File_TableBizImpl();
		MemberBiz m_biz = new MemberBizImpl();
		Order_TableBiz o_t_biz = new Order_TableBizImpl();
		ProductBiz p_biz = new ProductBizImpl();
		ReceiveBiz r_biz = new ReceiveBizImpl();
		HttpSession session = request.getSession();

		if (command.equals("signup")) {
			response.sendRedirect("signup.jsp");
		} else if (command.equals("general_signup")) {
			response.sendRedirect("general_signup.jsp");
		} else if (command.equals("doctor_signup")) {
			response.sendRedirect("doctor_signup.jsp");
		} else if (command.equals("signupres")) {
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
			MemberDto m_dto = new MemberDto(member_id, member_password, member_name, member_nicname, member_email,
					member_phone, member_addr, member_grade, "Y", member_animal, 0, member_dr_info, member_notify);
			int m_res = m_biz.insert(m_dto);

			int a_res = 0;
			if (member_animal.equals("Y")) {
				String animal_name = request.getParameter("animal_name");
				String animal_gen = request.getParameter("animal_gen");
				String animal_type = request.getParameter("animal_type");
				int animal_age = Integer.parseInt(request.getParameter("animal_age"));
				double animal_weight = Double.parseDouble(request.getParameter("animal_weight"));
				String animal_unq = request.getParameter("animal_unq");
				AnimalDto a_dto = new AnimalDto();
				a_dto.setAnimal_name(animal_name);
				a_dto.setAnimal_gen(animal_gen);
				a_dto.setAnimal_type(animal_type);
				a_dto.setAnimal_age(animal_age);
				a_dto.setAnimal_weight(animal_weight);
				a_dto.setAnimal_unq(animal_unq);
				a_dto.setMember_id(member_id);
				a_res = a_biz.insert(a_dto);
			}

			int res = m_res + a_res;
			if (res > 0) {
				jsResponse(response, "회원가입 성공", "index.html");
			} else {
				jsResponse(response, "회원가입 실패", "#");
			}
		} else if (command.equals("login")) {
			response.sendRedirect("login.jsp");
		} else if (command.equals("loginres")) {
			String member_id = request.getParameter("member_id");
			String member_password = request.getParameter("member_password");
			MemberDto m_dto = new MemberDto();
			m_dto.setMember_id(member_id);
			m_dto.setMember_password(member_password);
			MemberDto dto = m_biz.selectOne(m_dto);
			session.setAttribute("dto", dto);
			dispatch(response, request, "#.jsp");
		} else if (command.equals("sns_signup")) {
			System.out.println("여기까지는 성공");
			String member_id = request.getParameter("member_id");
			MemberDto m_dto = new MemberDto();
			m_dto.setMember_id(member_id);
			MemberDto t_dto = null;
			t_dto = m_biz.selectSerch(m_dto);
			if (t_dto != null) {
				session.setAttribute("dto", t_dto);
				jsResponse(response, "로그인 성공(SNS)", "index.html");
			} else {
				request.setAttribute("dto", m_dto);
				dispatch(response, request, "sns_signup.jsp");
			}

		} else if (command.equals("sns_signupres")) {
			String member_id = request.getParameter("member_id");
			String member_password = getRandomPassword(10);
			String member_name = request.getParameter("member_name");
			String member_nicname = request.getParameter("member_nicname");
			String member_email = request.getParameter("member_email");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr");
			String member_grade = request.getParameter("member_grade");
			String member_animal = request.getParameter("member_animal");
			String member_dr_info = request.getParameter("member_dr_info");
			String member_notify = request.getParameter("member_notify");
			MemberDto m_dto = new MemberDto(member_id, member_password, member_name, member_nicname, member_email,
					member_phone, member_addr, member_grade, "Y", member_animal, 0, member_dr_info, member_notify);
			int m_res = m_biz.insert(m_dto);

			int a_res = 0;
			if (member_animal.equals("Y")) {
				String animal_name = request.getParameter("animal_name");
				String animal_gen = request.getParameter("animal_gen");
				String animal_type = request.getParameter("animal_type");
				int animal_age = Integer.parseInt(request.getParameter("animal_age"));
				double animal_weight = Double.parseDouble(request.getParameter("animal_weight"));
				String animal_unq = request.getParameter("animal_unq");
				AnimalDto a_dto = new AnimalDto();
				a_dto.setAnimal_name(animal_name);
				a_dto.setAnimal_gen(animal_gen);
				a_dto.setAnimal_type(animal_type);
				a_dto.setAnimal_age(animal_age);
				a_dto.setAnimal_weight(animal_weight);
				a_dto.setAnimal_unq(animal_unq);
				a_dto.setMember_id(member_id);
				a_res = a_biz.insert(a_dto);
			}

			int res = m_res + a_res;
			if (res > 0) {
				jsResponse(response, "회원가입 성공", "index.html");
			} else {
				jsResponse(response, "회원가입 실패", "#");
			}
		} else {
			System.out.println("command 확인");

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

	private static String getRandomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
}
