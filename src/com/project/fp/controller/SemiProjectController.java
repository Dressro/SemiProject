package com.project.fp.controller;

import java.io.BufferedReader;
import java.io.File;

import java.io.FileReader;

import java.io.FileInputStream;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.project.fp.biz.AnimalBiz;
import com.project.fp.biz.AnimalBizImpl;
import com.project.fp.biz.BoardBiz;
import com.project.fp.biz.BoardBizImpl;
import com.project.fp.biz.Board_ReplyBiz;
import com.project.fp.biz.Board_ReplyBizImpl;
import com.project.fp.biz.ChatBiz;
import com.project.fp.biz.ChatBizImpl;
import com.project.fp.biz.Chat_ContentBiz;
import com.project.fp.biz.Chat_ContentBizImpl;
import com.project.fp.biz.File_TableBiz;
import com.project.fp.biz.File_TableBizImpl;
import com.project.fp.biz.HospitalBiz;
import com.project.fp.biz.HospitalBizImpl;
import com.project.fp.biz.Lost_AnimalBiz;
import com.project.fp.biz.Lost_AnimalBizImpl;
import com.project.fp.biz.MemberBiz;
import com.project.fp.biz.MemberBizImpl;
import com.project.fp.biz.Order_TableBiz;
import com.project.fp.biz.Order_TableBizImpl;
import com.project.fp.biz.ProductBiz;
import com.project.fp.biz.ProductBizImpl;
import com.project.fp.biz.ReceiveBiz;
import com.project.fp.biz.ReceiveBizImpl;
import com.project.fp.dto.AnimalDto;
import com.project.fp.dto.BoardDto;
import com.project.fp.dto.Board_ReplyDto;
import com.project.fp.dto.ChatDto;
import com.project.fp.dto.Chat_ContentDto;
import com.project.fp.dto.File_TableDto;
import com.project.fp.dto.HospitalDto;
import com.project.fp.dto.Lost_AnimalDto;
import com.project.fp.dto.MemberDto;
import com.project.fp.dto.Order_TableDto;
import com.project.fp.dto.PagingDto;
import com.project.fp.dto.ProductDto;
import com.project.fp.gmail.MailSend;
import com.project.fp.papago.papago;
import com.project.fp.sms.SMS;

import oracle.net.aso.b;

@WebServlet("/SemiProjectController")
@MultipartConfig(location = "", maxFileSize = -1, maxRequestSize = -1, fileSizeThreshold = 1024)
public class SemiProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String file_new_name = "";

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
		HospitalBiz h_biz = new HospitalBizImpl();
		Board_ReplyBiz b_r_biz = new Board_ReplyBizImpl();
		Lost_AnimalBiz l_biz = new Lost_AnimalBizImpl();
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
				jsResponse(response, "회원가입 성공", "index.jsp");
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
			session.setMaxInactiveInterval(3600);
			jsResponse(response, "로그인 성공", "index.jsp");
		} else if (command.equals("sns_signup")) {
			String member_id = request.getParameter("member_id");
			MemberDto m_dto = new MemberDto();
			m_dto.setMember_id(member_id);
			MemberDto t_dto = null;
			t_dto = m_biz.selectSerch(m_dto);
			if (t_dto != null) {
				session.setAttribute("dto", t_dto);
				session.setMaxInactiveInterval(3600);
				jsResponse(response, "로그인 성공(SNS)", "index.jsp");
			} else {
				request.setAttribute("dto", m_dto);
				dispatch(response, request, "sns_signup.jsp");
			}
		} else if (command.equals("sns_general_signup")) {
			String member_id = request.getParameter("member_id");
			request.setAttribute("member_id", member_id);
			dispatch(response, request, "sns_general_signup.jsp");
		} else if (command.equals("sns_doctor_signup")) {
			String member_id = request.getParameter("member_id");
			request.setAttribute("member_id", member_id);
			dispatch(response, request, "sns_doctor_signup.jsp");
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
				session.setAttribute("dto", m_dto);
				session.setMaxInactiveInterval(3600);
				jsResponse(response, "회원가입 성공", "index.jsp");
			} else {
				jsResponse(response, "회원가입 실패", "#");
			}

		} else if (command.equals("findidpw")) {
			response.sendRedirect("findidpw.jsp");
		} else if (command.equals("findidres")) {
			String member_name = request.getParameter("member_name");
			String member_email = request.getParameter("member_email");
			System.out.println(member_name);
			System.out.println(member_email);
			MemberDto m_dto = new MemberDto();
			m_dto.setMember_name(member_name);
			m_dto.setMember_email(member_email);
			MemberDto t_dto = null;
			t_dto = m_biz.selectIdSerch(m_dto);
			request.setAttribute("dto", t_dto);
			dispatch(response, request, "findidres.jsp");
		} else if (command.equals("idchk")) {
			String member_id = request.getParameter("member_id");
			MemberDto m_dto = new MemberDto();
			m_dto.setMember_id(member_id);
			MemberDto t_dto = null;
			t_dto = m_biz.selectSerch(m_dto);
			if (t_dto != null) {
				request.setAttribute("dto", t_dto);
				dispatch(response, request, "signup_idchk.jsp");
			} else {
				dispatch(response, request, "signup_idchk.jsp");
			}

		} else if (command.equals("member_grade")) {
			String[] member_id = request.getParameterValues("member_id");
			String[] member_grade = request.getParameterValues("member_grade");
			int res = 0;

			for (int i = 0; i < member_id.length; i++) {
				MemberDto dto = new MemberDto();
				dto.setMember_id(member_id[i]);
				dto.setMember_grade(member_grade[i]);
				res = m_biz.grade_update(dto);
				res++;
			}
			if (res > 0) {
				jsResponse(response, "회원 등급수정 성공", "semi.do?command=adminpage");
			} else {
				jsResponse(response, "회원 등급수정 실패", "semi.do?command=adminpage");
			}
		} else if (command.equals("memberdetail")) {

			String member_id = request.getParameter("member_id");
			MemberDto dto = m_biz.selectDetail(member_id);
			AnimalDto a_dto = a_biz.selectoneDetail(member_id);
			request.setAttribute("dto", dto);
			request.setAttribute("a_dto", a_dto);
			dispatch(response, request, "memberdetail.jsp");
		} else if (command.equals("membermod")) {
			String member_nicname = request.getParameter("member_nicname");
			String member_email = request.getParameter("member_email");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr");
			String member_animal = request.getParameter("member_animal");
			String member_id = request.getParameter("member_id");
			String member_password = request.getParameter("member_password");

			MemberDto dto = new MemberDto();
			dto.setMember_nicname(member_nicname);
			dto.setMember_email(member_email);
			dto.setMember_phone(member_phone);
			dto.setMember_addr(member_addr);
			dto.setMember_animal(member_animal);
			dto.setMember_id(member_id);
			dto.setMember_password(member_password);

			int m_res = m_biz.mypagemod(dto);
			int a_res = 0;
			if (member_animal.equals("Y")) {

				String a_member_id = request.getParameter("member_id");
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
				a_dto.setMember_id(a_member_id);

				if (a_dto.getAnimal_no() < 0) {
					a_res = a_biz.insert(a_dto);
				} else if (a_dto.getAnimal_no() > 0)
					a_res = a_biz.update(a_dto);
			}

			int res = m_res + a_res;
			if (res > 0) {
				jsResponse(response, "수정 성공", "semi.do?command=mypage&member_id=" + member_id);
			} else {
				jsResponse(response, "수정 실패", "semi.do?command=mypage&member_id=" + member_id);
			}

		} else if (command.equals("memberdetail")) {
			String member_id = request.getParameter("member_id");
			MemberDto dto = m_biz.selectDetail(member_id);
			AnimalDto a_dto = a_biz.selectoneDetail(member_id);
			request.setAttribute("dto", dto);
			request.setAttribute("a_dto", a_dto);
			dispatch(response, request, "memberdetail.jsp");
		} else if (command.equals("memberupdate")) {
			String member_nicname = request.getParameter("member_nicname");
			String member_email = request.getParameter("member_email");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr");
			String member_animal = request.getParameter("member_animal");
			String member_id = request.getParameter("member_id");

			MemberDto dto = new MemberDto();
			dto.setMember_nicname(member_nicname);
			dto.setMember_email(member_email);
			dto.setMember_phone(member_phone);
			dto.setMember_addr(member_addr);
			dto.setMember_animal(member_animal);
			dto.setMember_id(member_id);

			int m_res = m_biz.mypageupdate(dto);
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
				a_res = a_biz.update(a_dto);
			}

			int res = m_res + a_res;
			if (res > 0) {
				jsResponse(response, "수정 성공", "semi.do?command=adminpage");
			} else {
				jsResponse(response, "수정 실패", "semi.do?command=adminpage");
			}

		} else if (command.equals("memberdel")) {
			String member_id = request.getParameter("member_id");
			int md_res = 0;
			md_res = m_biz.delete(member_id);
			if (md_res > 0) {
				jsResponse(response, "회원탈퇴", "index.jsp");
			} else {
				jsResponse(response, "회원탈퇴실패", "semi.do?command=mypage&member_id=" + member_id);
			}
			session.invalidate();
			response.sendRedirect("index.jsp");

		} else if (command.equals("board_notice")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String category = request.getParameter("category");
			String s_c = request.getParameter("s_c");
			String s_t = request.getParameter("s_t");
			if (s_c == null) {
				int count = b_biz.notice_allCount();
				PagingDto Pdto = new PagingDto(count, nowPage);
				List<BoardDto> list = b_biz.notice_selectList(Pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", Pdto);
				dispatch(response, request, "board_notice.jsp");
			} else {
				BoardDto dto = new BoardDto();
				dto.setBoard_title(s_t);
				dto.setBoard_category(category);
				List<BoardDto> slist = b_biz.board_C_search(dto);
				int count = slist.size();
				PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
				List<BoardDto> list = b_biz.Board_All_C_search(Pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", Pdto);
				dispatch(response, request, "board_notice.jsp");
			}
		} else if (command.equals("board_free")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String category = request.getParameter("category");
			String s_c = request.getParameter("s_c");
			String s_t = request.getParameter("s_t");
			if (s_c == null) {
				int count = b_biz.free_allCount();
				PagingDto Pdto = new PagingDto(count, nowPage);
				List<BoardDto> list = b_biz.free_selectList(Pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", Pdto);
				dispatch(response, request, "board_free.jsp");
			} else {
				if (s_c.equals("W")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_category(category);
					dto.setMember_id(s_t);
					List<BoardDto> slist = b_biz.board_M_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_M_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_free.jsp");
				} else if (s_c.equals("T")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_title(s_t);
					dto.setBoard_category(category);
					System.out.println(category);
					List<BoardDto> slist = b_biz.board_C_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_C_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_free.jsp");
				} else if (s_c.equals("T_C")) {
					BoardDto dto = new BoardDto();

					dto.setBoard_category(category);
					dto.setBoard_title(s_t);
					dto.setBoard_content(s_t);
					List<BoardDto> slist = b_biz.board_MC_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_MC_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_free.jsp");
				}

			}
		} else if (command.equals("board_dec")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String category = request.getParameter("category");
			String s_c = request.getParameter("s_c");
			String s_t = request.getParameter("s_t");
			List<Lost_AnimalDto> l_list = l_biz.selectList();
			request.setAttribute("l_list", l_list);
			if (s_c == null) {
				int count = b_biz.dec_allCount();
				PagingDto Pdto = new PagingDto(count, nowPage);
				List<BoardDto> list = b_biz.dec_selectList(Pdto);
				request.setAttribute("list", list);
				dispatch(response, request, "board_dec.jsp");
			} else {
				if (s_c.equals("W")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_category(category);
					dto.setMember_id(s_t);
					List<BoardDto> slist = b_biz.board_M_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_M_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_dec.jsp");
				} else if (s_c.equals("T")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_title(s_t);
					dto.setBoard_category(category);
					System.out.println(category);
					List<BoardDto> slist = b_biz.board_C_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_C_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_dec.jsp");
				}
			}
		} else if (command.equals("mypage")) {
			String member_id = request.getParameter("member_id");
			MemberDto dto = m_biz.selectDetail(member_id);
			AnimalDto a_dto = a_biz.selectoneDetail(member_id);
			session.setAttribute("dto", dto);
			request.setAttribute("a_dto", a_dto);
			dispatch(response, request, "mypage.jsp");
		} else if (command.equals("boardlist")) {
			List<BoardDto> boardlist = b_biz.board_List();
			request.setAttribute("boardlist", boardlist);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("shopping")) {
			List<ProductDto> list = p_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "shopping.jsp");
		} else if (command.equals("category")) {
			String prod_category = request.getParameter("prod_category");
			List<ProductDto> list = p_biz.selectcategory(prod_category);
			System.out.println(prod_category);
			request.setAttribute("list", list);
			dispatch(response, request, "shopping.jsp");
		} else if (command.equals("shopping_detail")) {
			int prod_num = Integer.parseInt(request.getParameter("prod_num"));
			System.out.println(prod_num);
			ProductDto p_dto = p_biz.selectOne(prod_num);
			request.setAttribute("p_dto", p_dto);
			dispatch(response, request, "shopping_detail.jsp");
		} else if (command.equals("adminpage")) {
			System.out.println("여기왔다.");
			List<MemberDto> list = m_biz.selectList();
			System.out.println("여기왔다2.");
			List<ProductDto> prodlist = p_biz.selectList();
			System.out.println("여기왔다3.");
			List<Order_TableDto> orderlist = o_t_biz.selectList();
			System.out.println("여기왔다4.");
			List<BoardDto> boardlist = b_biz.board_List();
			System.out.println("여기왔다5.");

			request.setAttribute("list", list);
			request.setAttribute("prodlist", prodlist);
			request.setAttribute("orderlist", orderlist);
			request.setAttribute("boardlist", boardlist);

			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("memberlist")) {
			List<MemberDto> list = m_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("prodlist")) {
			List<ProductDto> prodlist = p_biz.selectList();
			request.setAttribute("prodlist", prodlist);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("orderlist")) {
			List<Order_TableDto> list = o_t_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("shop_insertform")) {
			response.sendRedirect("shop_insertform.jsp");
		} else if (command.equals("shop_insertres")) {
			String file_path = request.getSession().getServletContext().getRealPath("fileupload");

			File Folder = new File(file_path);
			if (!Folder.exists()) {
				Folder.mkdir();
			}
			String contentType = request.getContentType();

			String member_id = request.getParameter("member_id");
			String prod_name = request.getParameter("prod_name");
			String prod_explain = request.getParameter("prod_explain");
			String prod_category = request.getParameter("prod_category");
			String prod_mfr = request.getParameter("prod_mfr");
			String prod_client = request.getParameter("prod_client");
			int prod_price = Integer.parseInt(request.getParameter("prod_price"));
			int prod_sale = Integer.parseInt(request.getParameter("prod_sale"));
			int prod_stock = Integer.parseInt(request.getParameter("prod_stock"));
			int prod_in = prod_stock;

			ProductDto pdto = new ProductDto(0, prod_name, prod_explain, prod_sale, prod_price, 0, prod_stock,
					prod_category, prod_in, 0, null, null, prod_mfr, prod_client);

			int res = p_biz.insert(pdto);

			if (res > 0) {
				jsResponse(response, "성공", "semi.do?command=adminpage");
			} else {
				jsResponse(response, "실패", "semi.do?command=adminpage");
			}

			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				Collection<Part> parts = request.getParts();
				File_TableDto f_dto = new File_TableDto();

				for (Part part : parts) {
					if (part.getHeader("Content-Disposition").contains("filename=")) {
						String file_ori_name = extractFileName(part.getHeader("Content-Disposition"));
						if (part.getSize() > 0) {
							String file_type = file_ori_name.substring(file_ori_name.lastIndexOf("."));
							String file_size = Long.toString(part.getSize());
							file_new_name = getRandomFileName(5) + file_ori_name;
							part.write(file_path + File.separator + file_new_name);
							part.delete();
							for (int i = 0; i < 50; i++) {
								System.out.println("DB에 넣는중...");
							}
							f_dto.setFile_path(file_path);
							f_dto.setFile_ori_name(file_ori_name);
							f_dto.setFile_new_name(file_new_name);
							f_dto.setFile_type(file_type);
							f_dto.setFile_size(file_size);
							f_dto.setMember_id(member_id);
							ProductDto pdto_2 = p_biz.prod_selectone(prod_name);
							f_dto.setProd_num(pdto_2.getProd_num());
							int f_res = f_t_biz.prod_insert(f_dto);
						}
					}
				}
			}

		} else if (command.equals("board_qna")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String category = request.getParameter("category");
			String s_c = request.getParameter("s_c");
			String s_t = request.getParameter("s_t");
			if (s_c == null) {
				int count = b_biz.qna_allCount();
				PagingDto Pdto = new PagingDto(count, nowPage);
				request.setAttribute("BoardCommand", command);
				List<BoardDto> list = b_biz.qna_selectList(Pdto);
				request.setAttribute("Pdto", Pdto);
				request.setAttribute("list", list);
				dispatch(response, request, "board_qna.jsp");
			} else {
				if (s_c.equals("W")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_category(category);
					dto.setMember_id(s_t);
					List<BoardDto> slist = b_biz.board_M_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_M_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_qna.jsp");
				} else if (s_c.equals("T")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_title(s_t);
					dto.setBoard_category(category);
					System.out.println(category);
					List<BoardDto> slist = b_biz.board_C_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_C_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_qna.jsp");
				} else if (s_c.equals("T_C")) {
					BoardDto dto = new BoardDto();

					dto.setBoard_category(category);
					dto.setBoard_title(s_t);
					dto.setBoard_content(s_t);
					List<BoardDto> slist = b_biz.board_MC_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage, s_c, s_t, category);
					List<BoardDto> list = b_biz.Board_All_MC_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_qna.jsp");
				}
			}
		} else if (command.equals("board_updateform")) {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			BoardDto b_dto = b_biz.board_selectOne(board_no);
			File_TableDto f_dto = f_t_biz.board_selectOne(board_no);
			request.setAttribute("b_dto", b_dto);
			request.setAttribute("f_dto", f_dto);
			dispatch(response, request, "board_updateform.jsp");
		} else if (command.equals("board_updateres")) {
			String file_path = request.getSession().getServletContext().getRealPath("fileupload");

			File Folder = new File(file_path);
			if (!Folder.exists()) {
				Folder.mkdir();
			}
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			String contentType = request.getContentType();
			String member_id = request.getParameter("member_id");
			String board_title = request.getParameter("board_title");
			String board_content = request.getParameter("board_content");
			String board_category = request.getParameter("board_category");
			BoardDto b_dto = new BoardDto();
			b_dto.setBoard_no(board_no);
			b_dto.setBoard_title(board_title);
			b_dto.setBoard_content(board_content);
			b_dto.setBoard_category(board_category);
			b_dto.setMember_id(member_id);
			int res = 0;
			if (board_category.equals("F")) {
				res = b_biz.board_update(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_free");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_free");
				}
			} else if (board_category.equals("N")) {
				res = b_biz.notice_update(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_notice");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_notice");
				}
			} else if (board_category.equals("Q")) {
				res = b_biz.qna_update(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_qna");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_qna");
				}
			} else if (board_category.equals("D")) {
				res = b_biz.dec_update(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_dec");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_dec");
				}
			}
			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				Collection<Part> parts = request.getParts();
				File_TableDto f_dto = new File_TableDto();

				for (Part part : parts) {
					if (part.getHeader("Content-Disposition").contains("filename=")) {
						String file_ori_name = extractFileName(part.getHeader("Content-Disposition"));
						if (part.getSize() > 0) {
							String file_type = file_ori_name.substring(file_ori_name.lastIndexOf("."));
							String file_size = Long.toString(part.getSize());
							file_new_name = getRandomFileName(5) + file_ori_name;
							part.write(file_path + File.separator + file_new_name);
							part.delete();
							f_dto.setFile_path(file_path);
							f_dto.setFile_ori_name(file_ori_name);
							f_dto.setFile_new_name(file_new_name);
							f_dto.setFile_type(file_type);
							f_dto.setFile_size(file_size);
							f_dto.setMember_id(member_id);
							f_dto.setBoard_no(board_no);
							int f_d_res = f_t_biz.board_delete(board_no);
							int f_res = f_t_biz.board_insert(f_dto);
						}
					}
				}
			}
		} else if (command.equals("board_insertform")) {
			String category = request.getParameter("category");
			request.setAttribute("category", category);
			dispatch(response, request, "board_insertform.jsp");
		} else if (command.equals("board_insertres")) {

			String file_path = request.getSession().getServletContext().getRealPath("fileupload");

			File Folder = new File(file_path);
			if (!Folder.exists()) {
				Folder.mkdir();
			}

			String contentType = request.getContentType();

			String member_id = request.getParameter("member_id");
			String board_title = request.getParameter("board_title");
			String board_content = request.getParameter("board_content");
			String board_category = request.getParameter("board_category");
			BoardDto b_dto = new BoardDto();
			b_dto.setBoard_title(board_title);
			b_dto.setBoard_content(board_content);
			b_dto.setBoard_category(board_category);
			b_dto.setMember_id(member_id);
			int res = 0;
			if (board_category.equals("F")) {
				res = b_biz.free_insert(b_dto);
				System.out.println(res);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_free");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_free");
				}
			} else if (board_category.equals("N")) {
				res = b_biz.notice_insert(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_notice");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_notice");
				}
			} else if (board_category.equals("Q")) {
				res = b_biz.qna_insert(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_qna");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_qna");
				}
			} else if (board_category.equals("D")) {
				res = b_biz.dec_insert(b_dto);
				double lost_latitude = Double.parseDouble(request.getParameter("lost_latitude"));
				double lost_longitude = Double.parseDouble(request.getParameter("lost_longitude"));
				if (res > 0) {
					List<BoardDto> b_list = b_biz.board_selectList(b_dto);
					int board_no = b_list.get(0).getBoard_no();
					Lost_AnimalDto l_dto = new Lost_AnimalDto();
					l_dto.setLost_lat(lost_latitude);
					l_dto.setLost_lng(lost_longitude);
					l_dto.setBoard_no(board_no);
					int l_res = l_biz.insert(l_dto);
					if (l_res > 0) {
						jsResponse(response, "등록 성공", "semi.do?command=board_dec");
					}
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_dec");
				}
			}
			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				Collection<Part> parts = request.getParts();
				File_TableDto f_dto = new File_TableDto();

				for (Part part : parts) {
					if (part.getHeader("Content-Disposition").contains("filename=")) {
						String file_ori_name = extractFileName(part.getHeader("Content-Disposition"));
						if (part.getSize() > 0) {
							String file_type = file_ori_name.substring(file_ori_name.lastIndexOf("."));
							String file_size = Long.toString(part.getSize());
							file_new_name = getRandomFileName(5) + file_ori_name;
							part.write(file_path + File.separator + file_new_name);
							part.delete();
							f_dto.setFile_path(file_path);
							f_dto.setFile_ori_name(file_ori_name);
							f_dto.setFile_new_name(file_new_name);
							f_dto.setFile_type(file_type);
							f_dto.setFile_size(file_size);
							f_dto.setMember_id(member_id);
							List<BoardDto> b_list = b_biz.board_selectList(b_dto);
							int board_no = b_list.get(0).getBoard_no();
							f_dto.setBoard_no(board_no);
							int f_res = f_t_biz.board_insert(f_dto);
						}
					}
				}
			}
		} else if (command.equals("deleteres")) {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			int f_res = f_t_biz.board_delete(board_no);
			int b_r_res = b_r_biz.board_delete(board_no);
			int l_res = l_biz.delete(board_no);
			int b_res = b_biz.delete(board_no);
			if (b_res > 0) {
				jsResponse(response, "삭제 성공", "semi.do?command=board_free");
			} else {
				jsResponse(response, "삭제 실패", "semi.do?command=board_detail&board_no=" + board_no);
			}
		} else if (command.equals("board_All_delete")) {
			String where = request.getParameter("where");
			String[] board_no = request.getParameterValues("board_no");
			if (board_no == null || board_no.length == 0) {
			} else {
				int f_res = f_t_biz.multiDelete(board_no);
				int b_res = b_biz.multiDelete(board_no);
				if (b_res == board_no.length) {
					jsResponse(response, "선택된 글들이 모두 삭제되었습니다.", "semi.do?command=" + where);
				} else {
					jsResponse(response, "다른 사용자의 게시물은 삭제되지 않았습니다.", "semi.do?command=" + where);
				}
			}
		} else if (command.equals("board_delete")) {
			String[] board_no = request.getParameterValues("board_no");
			if (board_no == null || board_no.length == 0) {
			} else {
				int f_res = f_t_biz.multiDelete(board_no);
				int b_res = b_biz.multiDelete(board_no);
				if (b_res == board_no.length) {
					jsResponse(response, "선택된 글들이 모두 삭제되었습니다.", "semi.do?command=boardlist");
				} else {
					jsResponse(response, "선택된 글들이 삭제되지 않았습니다.", "semi.do?command=adminpage");
				}
			}
		} else if (command.equals("board_detail")) {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			BoardDto b_dto = b_biz.board_selectOne(board_no);
			List<Board_ReplyDto> b_r_list = b_r_biz.reply_selectList(board_no);
			request.setAttribute("b_r_list", b_r_list);
			int res = b_biz.board_read(b_dto);
			if (res < 0) {
				jsResponse(response, "조회수 실패", "index.html");
			}
			File_TableDto f_dto = f_t_biz.board_selectOne(board_no);
			request.setAttribute("b_dto", b_dto);
			request.setAttribute("f_dto", f_dto);
			dispatch(response, request, "board_detail.jsp");
		} else if (command.equals("filedown")) {
			String file_path = request.getSession().getServletContext().getRealPath("fileupload");
			String file_new_name = request.getParameter("file_new_name");

			String filePath = file_path + File.separator + file_new_name;
			byte[] b = new byte[4096];
			FileInputStream fileInputStream = new FileInputStream(filePath);

			String mimeType = getServletContext().getMimeType(filePath);
			if (mimeType == null) {
				mimeType = "application/octet-stream";
			}
			response.setContentType(mimeType);

			String sEncoding = new String(file_new_name.getBytes("UTF-8"));
			response.setHeader("Content-Disposition", "attachment; fileName= " + sEncoding);
			ServletOutputStream servletOutStream = response.getOutputStream();

			int read;
			while ((read = fileInputStream.read(b, 0, b.length)) != -1) {
				servletOutStream.write(b, 0, read);
			}

			servletOutStream.flush();
			servletOutStream.close();
			fileInputStream.close();

		} else if (command.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else if (command.equals("animal_hospital")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			int count = h_biz.count();
			PagingDto pdto = new PagingDto(count, nowPage);
			List<HospitalDto> list = new ArrayList<HospitalDto>();
			list = h_biz.selectList(pdto);
			request.setAttribute("Animal_hospital_Command", command);
			request.setAttribute("list", list);
			request.setAttribute("Pdto", pdto);
			dispatch(response, request, "animal_hospital.jsp");
		} else if (command.equals("test")) {
			response.sendRedirect("test.html");
		} else if (command.equals("animal_hospital_search")) {
			String hospital_name = request.getParameter("hospitial_name");
			System.out.println(hospital_name);
			HospitalDto h_dto = new HospitalDto();
			h_dto.setHospital_name(hospital_name);
			List<HospitalDto> list = new ArrayList<HospitalDto>();
			list = h_biz.selectSearchList(h_dto);
			request.setAttribute("list", list);
			dispatch(response, request, "animal_hospital.jsp");
		} else if (command.equals("chatlist")) {
			String member_id = request.getParameter("member_id");
			String member_grade = request.getParameter("member_grade");
			ChatDto c_dto = new ChatDto();
			c_dto.setMember_id(member_id);
			List<ChatDto> c_list = new ArrayList<ChatDto>();
			if (member_grade.equals("개인")) {
				c_list = c_biz.selectUserList(c_dto);
			} else if (member_grade.equals("전문의")) {
				c_list = c_biz.selectDoctorList(c_dto);
			}
			List<MemberDto> m_list = m_biz.selectDoctorList();
			request.setAttribute("c_list", c_list);
			request.setAttribute("m_list", m_list);
			request.setAttribute("member_grade", member_grade);
			dispatch(response, request, "chatlist.jsp");
		} else if (command.equals("chat_insert")) {
			String member_nickname = request.getParameter("member_nickname");
			String ch_content = request.getParameter("ch_content");
			System.out.println(ch_content);
			System.out.println(member_nickname);

			Chat_ContentDto c_c_dto = new Chat_ContentDto();
			c_c_dto.setCh_content(ch_content);
			c_c_dto.setMember_nickname(member_nickname);
			int res = c_c_biz.insert(c_c_dto);
			if (res > 0) {
				response.getWriter().append("통신 성공");
			}
		} else if (command.equals("chatboard")) {
			int ch_num = Integer.parseInt(request.getParameter("ch_num"));
			request.setAttribute("ch_num", ch_num);
			dispatch(response, request, "ChatBoard.jsp");
		} else if (command.equals("mailsend")) {
			String member_email = request.getParameter("member_email"); // 수신자
			String from = "ejsdnlcl@gmail.com"; // 발신자
			String cc = "scientist-1002@hanmail.net"; // 참조
			String subject = "FamilyPet 회원가입 이메일 인증번호 입니다.";
			String content = request.getParameter("email_key");
			try {
				MailSend ms = new MailSend();
				ms.sendEmail(from, member_email, cc, subject, content);
				System.out.println("전송 성공");
				response.sendRedirect("signup_cert_num.jsp");
			} catch (MessagingException me) {
				System.out.println("메일 전송에 실패하였습니다.");
				System.out.println("실패 이유 : " + me.getMessage());
				me.printStackTrace();
			} catch (Exception e) {
				System.out.println("메일 전송에 실패하였습니다.");
				System.out.println("실패 이유 : " + e.getMessage());
				e.printStackTrace();
			}
		} else if (command.equals("smssend")) {
			String member_phone = request.getParameter("member_phone");
			String content = request.getParameter("phone_key");
			SMS.sendSMS(member_phone, content);
			response.sendRedirect("signup_cert_num.jsp");
		} else if (command.equals("translation")) {
			String text = request.getParameter("msg");
			String source = request.getParameter("source");
			String target = request.getParameter("target");
			String result = papago.getTransSentence(text, source, target);
			System.out.println(text + " : " + result);
			response.getWriter().append(result);
		} else if (command.equals("payment")) {
			String pay_method = request.getParameter("pay_method");
			String product = request.getParameter("product");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			request.setAttribute("pay_method", pay_method);
			request.setAttribute("product", product);
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("address", address);
			request.setAttribute("totalPrice", totalPrice);
			dispatch(response, request, "payment_test.jsp");
		} else if (command.equals("chat_board_insert")) {
			String member_id = request.getParameter("member_id");
			String doctor_id = request.getParameter("doctor_id");
			System.out.println(member_id);
			System.out.println(doctor_id);
			ChatDto dto = new ChatDto();
			dto.setDoctor_id(doctor_id);
			dto.setMember_id(member_id);
			int res = c_biz.insert(dto);
			if (res > 0) {
				response.getWriter().append("채팅방 생성");
			} else {
				response.getWriter().append("채팅방이 존재합니다.");
			}

		} else if (command.equals("replyUpload")) {
			String reply_nicname = request.getParameter("member_nicname");
			String reply_content = request.getParameter("reply_content");
			int board_no = Integer.parseInt(request.getParameter("board_no"));

			System.out.println(reply_nicname);

			Board_ReplyDto b_r_dto = new Board_ReplyDto();
			b_r_dto.setReply_nicname(reply_nicname);
			b_r_dto.setReply_content(reply_content);
			b_r_dto.setBoard_no(board_no);

			b_r_biz.reply_insert(b_r_dto);
		} else if (command.equals("replyDelete")) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));

			b_r_biz.reply_delete(reply_no);
		} else if (command.equals("replyUpdate")) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));
			String reply_content = request.getParameter("reply_content");
			System.out.println(reply_content);
			Board_ReplyDto b_r_dto = new Board_ReplyDto();
			b_r_dto.setReply_no(reply_no);
			b_r_dto.setReply_content(reply_content);

			b_r_biz.reply_update(b_r_dto);
		} else if (command.equals("r_reply_upload")) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));
			String r_reply_content = request.getParameter("r_reply_content");
			String reply_nicname = request.getParameter("member_nicname");

			Board_ReplyDto b_r_dto = new Board_ReplyDto();
			b_r_dto.setReply_no(reply_no);
			b_r_dto.setReply_content(r_reply_content);
			b_r_dto.setReply_nicname(reply_nicname);

			b_r_biz.replyProc(b_r_dto);
		} else if (command.equals("chatlist_chat")) {
			String member_grade = request.getParameter("member_grade");
			String member_id = request.getParameter("member_id");
			ChatDto c_dto = new ChatDto();
			c_dto.setMember_id(member_id);
			List<ChatDto> c_list = new ArrayList<ChatDto>();
			if (member_grade.equals("개인")) {
				c_list = c_biz.selectUserList(c_dto);
			} else if (member_grade.equals("전문의")) {
				c_list = c_biz.selectDoctorList(c_dto);
			}
			JsonArray resultArray = new JsonArray();
			for (ChatDto dto : c_list) {
				Gson gson = new Gson();
				String jsonString = gson.toJson(dto);
				resultArray.add(JsonParser.parseString(jsonString));
			}
			JsonObject result = new JsonObject();
			result.add("result", resultArray);
			response.getWriter().append(result.toString());
		} else if (command.equals("chat_del")) {
			int ch_num = Integer.parseInt(request.getParameter("ch_num"));
			int c_c_res = c_c_biz.delete(ch_num);
			int c_res = c_biz.delete(ch_num);
			int res = c_res + c_c_res;
			if (res > 0) {
				response.getWriter().append("삭제 성공");
			} else {
				response.getWriter().append("삭제 실패");
			}
		} else if (command.equals("prod_delete")) {
			String[] prod_num = request.getParameterValues("prod_num");
			if (prod_num == null || prod_num.length == 0) {
			} else {
				int res = p_biz.multiDelete(prod_num);
				if (res == prod_num.length) {
					jsResponse(response, "선택된 상품들이 모두 삭제되었습니다.", "semi.do?command=adminpage");
				} else {
					jsResponse(response, "선택된 상품들이 삭제되지 않았습니다.", "semi.do?command=adminpage");
				}
			}
		} else if (command.equals("order_step")) {
			String[] order_num_str = request.getParameterValues("order_num");
			String[] order_step = request.getParameterValues("order_step");
			int res = 0;
			int[] order_num = null;
			if (order_num_str != null) {
				order_num = new int[order_num_str.length];
				for (int i = 0; i < order_num_str.length; i++) {
					order_num[i] = Integer.parseInt(order_num_str[i]);
				}
			}
			for (int i = 0; i < order_step.length; i++) {
				Order_TableDto dto = new Order_TableDto();
				dto.setOrder_num(order_num[i]);
				dto.setOrder_step(order_step[i]);
				res = o_t_biz.update(dto);
				res++;
			}
			List<Order_TableDto> list = o_t_biz.groupList();
			for (int j = 0; j < list.size() - 1; j++) {
				if (list.get(j).getOrder_group() == list.get(j + 1).getOrder_group()) {
					Order_TableDto dto = new Order_TableDto();
					int group = list.get(j).getOrder_group();
					String step = list.get(j).getOrder_step();
					dto.setOrder_step(step);
					dto.setOrder_group(group);
					res = o_t_biz.update_group(dto);
				}
			}
			if (res > 0) {
				jsResponse(response, "수정 성공", "semi.do?command=adminpage");
			} else {
				jsResponse(response, "수정 실패", "semi.do?command=adminpage");
			}
		} else if (command.equals("dec_insert")) {
			String category = request.getParameter("category");
			request.setAttribute("category", category);
			dispatch(response, request, "dec_insertform.jsp");
		} else if (command.equals("dec_detail")) {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			BoardDto b_dto = b_biz.board_selectOne(board_no);
			List<Board_ReplyDto> b_r_list = b_r_biz.reply_selectList(board_no);
			request.setAttribute("b_r_list", b_r_list);
			int res = b_biz.board_read(b_dto);
			if (res < 0) {
				jsResponse(response, "조회수 실패", "index.html");
			}
			File_TableDto f_dto = f_t_biz.board_selectOne(board_no);
			Lost_AnimalDto l_dto = l_biz.selectOne(board_no);
			request.setAttribute("b_dto", b_dto);
			request.setAttribute("f_dto", f_dto);
			request.setAttribute("l_dto", l_dto);
			dispatch(response, request, "dec_detail.jsp");
		} else if (command.equals("dec_updateform")) {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			BoardDto b_dto = b_biz.board_selectOne(board_no);
			File_TableDto f_dto = f_t_biz.board_selectOne(board_no);
			Lost_AnimalDto l_dto = l_biz.selectOne(board_no);
			request.setAttribute("b_dto", b_dto);
			request.setAttribute("f_dto", f_dto);
			request.setAttribute("l_dto", l_dto);
			dispatch(response, request, "dec_updateform.jsp");
		}

		if (command.equals("test")) {
			File fi = new File("C://Users//alahx/test123123123678678678.csv");
			BufferedReader br = new BufferedReader(new BufferedReader(new FileReader(fi)));
			String line = "";
			String[] str = new String[3];
			HospitalDto h_dto = null;
			int res = 0;
			while ((line = br.readLine()) != null) { // 한 라인씩 읽어오기.
				h_dto = new HospitalDto();
				System.out.println(line);
				str = line.split(",");
				System.out.println(str[0]);
				System.out.println(str[1]);
				System.out.println(str[2]);

				h_dto.setHospital_name(str[0]);
				h_dto.setHospital_addr(str[1]);
				h_dto.setHospital_phone(str[2]);

				res = h_biz.insert(h_dto);
				if (res > 0) {
					break;
				}

			}
		}

		if (command.equals("basket_insert")) {
			String member_id = request.getParameter("member_id");
			int prod_num = Integer.parseInt(request.getParameter("prod_num"));
			ProductDto p_dto = p_biz.selectOne(prod_num);
			request.setAttribute("member_id", member_id);
			request.setAttribute("p_dto", p_dto);
			dispatch(response, request, "basket_insertform.jsp");
		} else if (command.equals("basket_insertres")) {
			String member_id = request.getParameter("member_id");
			int prod_num = Integer.parseInt(request.getParameter("prod_num"));
			int prod_price = Integer.parseInt(request.getParameter("prod_price"));
			int order_quantity = Integer.parseInt(request.getParameter("order_quantity"));
			int order_price = prod_price * order_quantity;
			Order_TableDto o_dto = new Order_TableDto();
			o_dto.setOrder_quantity(order_quantity);
			o_dto.setOrder_price(order_price);
			o_dto.setProd_num(prod_num);
			o_dto.setMember_id(member_id);
			System.out.println(order_quantity);
			System.out.println(order_price);
			System.out.println(prod_num);
			System.out.println(member_id);
			int res = o_t_biz.insert(o_dto);
			if (res > 0) {
				jsResponse(response, "장바구니에 추가되었습니다.", "semi.do?command=shopping");
			} else {
				jsResponse(response, "다시 시도해주십시오.",
						"semi.do?command=basket_insert&member_id=" + member_id + "&prod_num=" + prod_num);
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

	private static String getRandomFileName(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

	private String extractFileName(String partHeader) {
		for (String cd : partHeader.split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
				;
				int index = fileName.lastIndexOf(File.separator);
				return fileName.substring(index + 1);
			}
		}
		return null;
	}
}
