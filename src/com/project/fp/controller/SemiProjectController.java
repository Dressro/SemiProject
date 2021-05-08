package com.project.fp.controller;

import java.io.BufferedReader;
import java.io.File;

import java.io.FileReader;

import java.io.FileInputStream;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import org.apache.commons.collections.map.HashedMap;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.project.fp.alarm.Cal_alarm;
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
import com.project.fp.biz.MycalBiz;
import com.project.fp.biz.MycalBizImpl;
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
import com.project.fp.dto.MycalDto;
import com.project.fp.dto.Order_TableDto;
import com.project.fp.dto.PagingDto;
import com.project.fp.dto.ProductDto;
import com.project.fp.gmail.MailSend;
import com.project.fp.papago.papago;
import com.project.fp.sms.SMS;

import oracle.net.aso.b;
import oracle.net.aso.l;

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
		MycalBiz m_c_biz = new MycalBizImpl();
		HttpSession session = request.getSession();
		List<MycalDto> cal_list = m_c_biz.selectAllList();
		String check_date = null;
		for (MycalDto cal_dto : cal_list) {
			check_date = cal_dto.getCal_mdate();
			if (Cal_alarm.day_compare(check_date)) {
				if (cal_dto.getCal_chk().equals("N")) {
					String member_id = cal_dto.getMember_id();
					MemberDto m_dto = m_biz.selectDetail(member_id);
					if (m_dto.getMember_notify().equals("Y")) {
						String member_phone = m_dto.getMember_phone();
						member_phone = member_phone.replace("-", "");
						String content = "FamilyPet 입니다.\n" + "내일 " + cal_dto.getCal_title() + " 일정이 있습니다.";
						SMS.sendSMS(member_phone, content);
						int res = m_c_biz.updateCalChk(cal_dto.getCal_no());
						if (res > 0) {
							System.out.println("알람 전송 후 체크성공");
						} else {
							System.out.println("알람 전송 후 체크실패");
						}
					}
				}
			}
		}
		if (command.equals("signup")) {
			response.sendRedirect("signup.jsp");
		} else if (command.equals("index")) {
			List<BoardDto> f_list = b_biz.index_free();
			List<BoardDto> n_list = b_biz.index_notice();
			List<BoardDto> l_list = b_biz.index_dec();
			List<HospitalDto> h_list = h_biz.selectList();
			request.setAttribute("f_list", f_list);
			request.setAttribute("n_list", n_list);
			request.setAttribute("l_list", l_list);
			request.setAttribute("h_list", h_list);
			dispatch(response, request, "index.jsp");
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
			if (member_grade.equals("전문의")) {
				String file_path = request.getSession().getServletContext().getRealPath("fileupload");

				File Folder = new File(file_path);
				if (!Folder.exists()) {
					Folder.mkdir();
				}

				String contentType = request.getContentType();

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
								int f_res = f_t_biz.member_insert(f_dto);
							}
						}
					}
				}
			}
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
			session.setMaxInactiveInterval(3600);
			jsResponse(response, "로그인 성공", "index.html");
		} else if (command.equals("sns_signup")) {
			String member_id = request.getParameter("member_id");
			MemberDto m_dto = new MemberDto();
			m_dto.setMember_id(member_id);
			MemberDto t_dto = null;
			t_dto = m_biz.selectSerch(m_dto);
			if (t_dto != null) {
				session.setAttribute("dto", t_dto);
				session.setMaxInactiveInterval(3600);
				jsResponse(response, "로그인 성공(SNS)", "index.html");
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
				jsResponse(response, "회원가입 성공", "index.html");
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
			if (request.getParameter("animalN_Y") != null && member_animal.equals("Y")) {
				m_res += m_biz.myanimalupdate(dto);
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
				System.out.println("animal insert 성공");
			} else if (request.getParameter("animalN_Y") == null && member_animal.equals("Y")) {
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

				a_res = a_biz.update(a_dto);
				System.out.println("animal update 성공");
			}
			System.out.println(m_res);
			MemberDto m_dto = m_biz.selectOne(dto);
			session.setAttribute("dto", m_dto);
			session.setMaxInactiveInterval(3600);
			int res = m_res + a_res;
			if (res > 0) {
				jsResponse(response, "수정 성공", "semi.do?command=mypage&member_id=" + member_id);
			} else {
				jsResponse(response, "수정 실패", "semi.do?command=mypage&member_id=" + member_id);
			}
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
			int res = m_biz.delete(member_id);
			if (res > 0) {
				jsResponse(response, "회원탈퇴", "index.html");
			} else {
				jsResponse(response, "회원탈퇴실패", "semi.do?command=mypage&member_id=" + member_id);
			}
			session.invalidate();
			response.sendRedirect("index.html");

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
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", Pdto);
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
			AnimalDto a_dto = null;
			a_dto = a_biz.selectoneDetail(member_id);
			List<Order_TableDto> list = o_t_biz.mypageList(member_id);
			request.setAttribute("a_dto", a_dto);
			request.setAttribute("list", list);
			dispatch(response, request, "mypage.jsp");
		} else if (command.equals("boardlist")) {
			List<BoardDto> boardlist = b_biz.board_List();
			request.setAttribute("boardlist", boardlist);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("shopping")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String s_t = request.getParameter("s_t");
			if (s_t == null) {
				int count = p_biz.count();
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.prod_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			} else {
				ProductDto p_dto = new ProductDto();
				p_dto.setProd_name(s_t);
				List<ProductDto> slist = p_biz.prod_search(p_dto);
				int count = slist.size();
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage, s_t);
				list = p_biz.product_all_search(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			}
		} else if (command.equals("category")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String prod_category = request.getParameter("prod_category");

			if (prod_category.equals("feed")) {

				int count = p_biz.category_count(prod_category);
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.feed_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			} else if (prod_category.equals("care")) {

				int count = p_biz.category_count(prod_category);
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.care_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			} else if (prod_category.equals("living")) {

				int count = p_biz.category_count(prod_category);
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.living_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			} else if (prod_category.equals("outing")) {

				int count = p_biz.category_count(prod_category);
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.outing_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			} else if (prod_category.equals("toy")) {

				int count = p_biz.category_count(prod_category);
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.toy_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			} else if (prod_category.equals("fashion")) {

				int count = p_biz.category_count(prod_category);
				List<ProductDto> list = new ArrayList<ProductDto>();
				PagingDto pdto = new PagingDto(count, nowPage);
				list = p_biz.fashion_selectList(pdto);
				request.setAttribute("BoardCommand", command);
				request.setAttribute("list", list);
				request.setAttribute("Pdto", pdto);
				dispatch(response, request, "shopping.jsp");
			}

		} else if (command.equals("shopping_detail")) {
			int prod_num = Integer.parseInt(request.getParameter("prod_num"));
			ProductDto p_dto = p_biz.selectOne(prod_num);
			request.setAttribute("p_dto", p_dto);
			dispatch(response, request, "shopping_detail.jsp");
		} else if (command.equals("basket_add")) {
			String member_id = request.getParameter("member_id");
			if (member_id.equals("")) {
				jsResponse(response, "로그인 후 이용가능합니다.", "login.jsp");
			} else {
				int prod_num = Integer.parseInt(request.getParameter("prod_num"));
				int prod_price = Integer.parseInt(request.getParameter("prod_price"));
				int prod_stock = Integer.parseInt(request.getParameter("prod_stock"));
				int order_quantity = Integer.parseInt(request.getParameter("order_quantity"));
				MemberDto m_dto = m_biz.selectDetail(member_id);
				if (order_quantity > prod_stock) {
					session.setAttribute("dto", m_dto);
					jsResponse(response, "남은 수량은 초과하였습니다.",
							"semi.do?command=shopping_detail" + "&prod_num=" + prod_num);
				} else {
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
					int res = o_t_biz.basket_insert(o_dto);
					if (res > 0) {
						session.setAttribute("dto", m_dto);
						jsResponse(response, "장바구니에 추가되었습니다.", "semi.do?command=shopping");
					} else {
						session.setAttribute("dto", m_dto);
						jsResponse(response, "다시 시도해주십시오.",
								"semi.do?command=shopping_detail" + "&prod_num=" + prod_num);
					}
				}
			}
		} else if (command.equals("adminpage")) {
			List<MemberDto> list = m_biz.selectList();
			List<ProductDto> prodlist = p_biz.selectList();
			List<Order_TableDto> orderlist = o_t_biz.selectList();
			List<BoardDto> boardlist = b_biz.board_List();

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
			int count = b_biz.qna_allCount();
			PagingDto Pdto = new PagingDto(count, nowPage);
			request.setAttribute("BoardCommand", command);
			List<BoardDto> list = b_biz.qna_selectList(Pdto);
			request.setAttribute("Pdto", Pdto);
			request.setAttribute("list", list);
			dispatch(response, request, "board_qna.jsp");
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
				System.out.println("여기?");
				res = b_biz.dec_update(b_dto);
				System.out.println(res);
				double lost_latitude = Double.parseDouble(request.getParameter("lost_latitude"));
				double lost_longitude = Double.parseDouble(request.getParameter("lost_longitude"));
				if (res > 0) {

					Lost_AnimalDto l_dto = new Lost_AnimalDto();
					l_dto.setLost_lat(lost_latitude);
					l_dto.setLost_lng(lost_longitude);
					l_dto.setBoard_no(board_no);
					int l_res = l_biz.update(l_dto);
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
			String where = request.getParameter("where");
			String[] board_no = request.getParameterValues("board_no");
			String userNicname = request.getParameter("userNicname");
			String userGrade = request.getParameter("userGrade");
			for (int i = 0; i < board_no.length; i++) {

				BoardDto b_dto = b_biz.board_selectOne(Integer.parseInt(board_no[i]));

				if (board_no[i] == null || board_no[i].length() == 0) {
				} else if (b_dto.getMember_id().equals(userNicname) || userGrade.equals("관리자")) {
					f_t_biz.board_delete(Integer.parseInt(board_no[i]));
					b_r_biz.board_delete(Integer.parseInt(board_no[i]));
					l_biz.delete(Integer.parseInt(board_no[i]));
					int b_res = b_biz.delete(Integer.parseInt(board_no[i]));
					if (b_res > 0) {
						System.out.println("삭제 성공");
					} else {
						jsResponse(response, "선택된 글들이 삭제되지 않았습니다.", "semi.do?command=" + where);
						return;
					}
				} else {
					jsResponse(response, "다른 사용자의 게시물은 삭제되지 않았습니다.", "semi.do?command=" + where);
				}
			}

			jsResponse(response, "선택된 글들이 모두 삭제되었습니다.", "semi.do?command=" + where);
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
			response.sendRedirect("index.html");
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
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String member_grade = request.getParameter("member_grade");
			List<MemberDto> m_list = m_biz.selectDoctorList();
			int count = m_list.size();
			PagingDto pdto = new PagingDto(count, nowPage);
			m_list = m_biz.selectDoctorListPaging(pdto);
			request.setAttribute("Chat_Command", command);
			request.setAttribute("m_list", m_list);
			request.setAttribute("Pdto", pdto);
			request.setAttribute("member_grade", member_grade);
			dispatch(response, request, "chatlist.jsp");
		} else if (command.equals("chat_insert")) {
			int ch_num = Integer.parseInt(request.getParameter("ch_num"));
			String member_nicname = request.getParameter("member_nickname");
			String ch_content = request.getParameter("ch_content");
			System.out.println(ch_content);
			System.out.println(member_nicname);

			Chat_ContentDto c_c_dto = new Chat_ContentDto();
			c_c_dto.setCh_num(ch_num);
			c_c_dto.setCh_content(ch_content);
			c_c_dto.setMember_nicname(member_nicname);
			int res = c_c_biz.insert(c_c_dto);
			if (res > 0) {
				response.getWriter().append("통신 성공");
			}
		} else if (command.equals("chatboard")) {
			int ch_num = Integer.parseInt(request.getParameter("ch_num"));
			List<Chat_ContentDto> list = new ArrayList<Chat_ContentDto>();
			list = c_c_biz.selectOne(ch_num);
			request.setAttribute("list", list);
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
				session.setAttribute("content", content);
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
		} else if (command.equals("mailcheck")) {
			String AuthenticationKey = request.getParameter("AuthenticationKey");
			String AuthenticationUser = request.getParameter("AuthenticationUser");
			if (AuthenticationKey.equals(AuthenticationUser)) {
				System.out.println("메일 인증 성공");
				String mail_chk = "ok";
				request.setAttribute("mail_chk", mail_chk);
				dispatch(response, request, "general_signup.jsp");
			} else {
				System.out.println("메일 인증 실패");
				dispatch(response, request, "general_signup.jsp");
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
		} else if (command.equals("paypage")) {
			String member_id = request.getParameter("member_id");
			if (member_id.equals("")) {
				jsResponse(response, "로그인 후 이용가능합니다.", "login.jsp");
			} else {
				String purch = request.getParameter("purch");
				if (purch.equals("one")) {
					// 단일 물품 결제
					int prod_price = Integer.parseInt(request.getParameter("prod_price"));
					int prod_num = Integer.parseInt(request.getParameter("prod_num"));
					int order_quantity = Integer.parseInt(request.getParameter("order_quantity"));
					ProductDto p_dto = p_biz.selectOne(prod_num);
					String product_name = p_dto.getProd_name();
					product_name += " 등 1종";
					int total_price = prod_price * order_quantity;
					int pur = 1;

					request.setAttribute("product_num", prod_num);
					request.setAttribute("total_price", total_price);
					request.setAttribute("pur", pur);
					request.setAttribute("product_name", product_name);

					Order_TableDto o_dto = new Order_TableDto();
					o_dto.setOrder_quantity(order_quantity);
					o_dto.setOrder_price(total_price);
					o_dto.setProd_num(prod_num);
					o_dto.setMember_id(member_id);
					session.setAttribute("o_dto", o_dto);
					
					MemberDto dto = (MemberDto)session.getAttribute("dto");
					System.out.println(dto);

					dispatch(response, request, "paypage.jsp");
				} else {
					// 다중 물품 결제
					List<Order_TableDto> o_list = (List<Order_TableDto>) request.getAttribute("list");
					int count = Integer.parseInt(purch);
					int total_price = 0;
					int p_n = 0;
					for (Order_TableDto dto : o_list) {
						p_n = dto.getProd_num();
						total_price += dto.getOrder_price();
					}

					ProductDto p_dto = p_biz.selectOne(p_n);
					String product_name = p_dto.getProd_name();
					product_name += " 등 " + count + "종";
					session.setAttribute("o_list", o_list);
					request.setAttribute("total_price", total_price);
					request.setAttribute("pur", count);
					request.setAttribute("product_name", product_name);
					request.setAttribute("product_num", p_n);
					dispatch(response, request, "paypage.jsp");
				}
			}
		} else if (command.equals("payment")) {
			String pay_method = request.getParameter("pay_method");
			String product = request.getParameter("product");
			int pur = Integer.parseInt(request.getParameter("pur"));
			int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));

			request.setAttribute("pay_method", pay_method);
			request.setAttribute("product", product);
			request.setAttribute("pur", pur);
			request.setAttribute("totalPrice", totalPrice);
			dispatch(response, request, "payment.jsp");
		} else if (command.equals("paysuccess")) {
			int pur = Integer.parseInt(request.getParameter("pur"));
			if (pur == 1) {
				Order_TableDto o_dto = (Order_TableDto) session.getAttribute("o_dto");

				int prod_num = o_dto.getProd_num();
				int order_quantity = o_dto.getOrder_quantity();
				ProductDto p_dto = p_biz.selectOne(prod_num);
				int prod_stock = p_dto.getProd_stock();
				prod_stock -= order_quantity;
				int prod_out = p_dto.getProd_out();
				prod_out += order_quantity;
				p_dto.setProd_stock(prod_stock);
				p_dto.setProd_out(prod_out);

				int pr_res = p_biz.pay_update(p_dto);
				if (pr_res > 0) {
					System.out.println("재고량 수정 성공");
				} else {
					System.out.println("재고량 수정 실패");
				}

				int o_res = o_t_biz.direct_pay_insert(o_dto);
				if (o_res > 0) {
					System.out.println("결제 후 주문 기록 성공");
				} else {
					System.out.println("결제 후 주문 기록 실패");
				}
				
				
				int o_g = o_t_biz.selectMaxGroup() + 1;
				o_dto.setOrder_group(o_g);
				int g_res = o_t_biz.update_group_pay(o_dto);
				if (g_res > 0) {
					System.out.println("주문 그룹 변경 성공");
				} else {
					System.out.println("주문 그룹 변경 실패");
				}
				
				response.sendRedirect("semi.do?command=shopping_detail&prod_num=" + prod_num);
			} else {
				List<Order_TableDto> o_list = (List<Order_TableDto>) session.getAttribute("o_list");
				int prod_num = 0;
				int order_quantity = 0;
				int prod_out = 0;
				int prod_stock = 0;
				int order_num = 0;
				int pr_res = 0;
				int o_res = 0;
				int pr_count = 0;
				int o_count = 0;
				int o_g = o_t_biz.selectMaxGroup() + 1;
				int g_res = 0;
				int g_count = 0;
				
				for (Order_TableDto o_dto : o_list) {
					pr_res = 0;
					o_res = 0;

					prod_num = o_dto.getProd_num();
					order_quantity = o_dto.getOrder_quantity();
					ProductDto p_dto = p_biz.selectOne(prod_num);
					prod_out = p_dto.getProd_out();
					prod_out += order_quantity;
					prod_stock = p_dto.getProd_stock();
					prod_stock -= order_quantity;
					p_dto.setProd_stock(prod_stock);
					p_dto.setProd_out(prod_out);

					pr_res = p_biz.pay_update(p_dto);
					if (pr_res > 0) {
						System.out.println("재고량 수정 성공 - " + pr_count);
					} else {
						System.out.println("재고량 수정 실패 - " + pr_count);
					}
					pr_count++;

					order_num = o_dto.getOrder_num();
					o_res = o_t_biz.update_pay(order_num);
					if (o_res > 0) {
						System.out.println("주문 기록 수정 성공 - " + o_count);
					} else {
						System.out.println("주문 기록 수정 실패 - " + o_count);
					}
					o_count++;
					
					o_dto.setOrder_group(o_g);
					g_res = o_t_biz.update_group_pay(o_dto);
					if (g_res > 0) {
						System.out.println("주문 그룹 변경 성공 - "  + g_count);
					} else {
						System.out.println("주문 그룹 변경 실패 - "  + g_count);
					}
					g_count++;
				}

				MemberDto m_dto = (MemberDto) session.getAttribute("dto");
				String member_id = m_dto.getMember_id();
				response.sendRedirect("semi.do?command=basket_list&member_id=" + member_id);
			}
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
			;
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
			String[] order_group_str = request.getParameterValues("order_group");
			String[] order_step = request.getParameterValues("order_step");
			int res = 0;
			int[] order_group = null;
			if (order_group_str != null) {
				order_group = new int[order_group_str.length];
				for (int i = 0; i < order_group_str.length; i++) {
					order_group[i] = Integer.parseInt(order_group_str[i]);
				}
			}
			for (int i = 0; i < order_step.length; i++) {
				Order_TableDto dto = new Order_TableDto();
				dto.setOrder_group(order_group[i]);
				dto.setOrder_step(order_step[i]);
				res = o_t_biz.update(dto);
				res++;
			}
			if (res > 0) {
				jsResponse(response, "수정 성공", "semi.do?command=adminpage");
			} else {
				jsResponse(response, "수정 실패", "semi.do?command=adminpage");
			}
		} else if (command.equals("order_delete")) {
			String[] order_group_str = request.getParameterValues("order_group");
			int[] order_group = null;
			int res = 0;
			if (order_group_str != null) {
				order_group = new int[order_group_str.length];
				for (int i = 0; i < order_group_str.length; i++) {
					order_group[i] = Integer.parseInt(order_group_str[i]);
					res = o_t_biz.delete(order_group[i]);
					res++;
				}
				if (res > 0) {
					jsResponse(response, "삭제 성공", "semi.do?command=adminpage");
				} else {
					jsResponse(response, "삭제 실패", "semi.do?command=adminpage");
				}
			}
		} else if (command.equals("order_my_delete")) {
			String[] order_num_str = request.getParameterValues("order_num");
			int[] order_num = null;
			if (order_num_str != null) {
				order_num = new int[order_num_str.length];
				for (int i = 0; i < order_num_str.length; i++) {
					order_num[i] = Integer.parseInt(order_num_str[i]);
				}
			}

			int res = o_t_biz.mulDelete(order_num);
			if (res > 0) {
				jsResponse(response, "삭제 성공", "index.html");
			} else {
				jsResponse(response, "삭제 실패", "");
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
		} else if (command.equals("order_delete")) {

			String[] order_group_str = request.getParameterValues("order_group");
			int[] order_group = null;
			int res = 0;
			if (order_group_str != null) {
				order_group = new int[order_group_str.length];
				for (int i = 0; i < order_group_str.length; i++) {
					order_group[i] = Integer.parseInt(order_group_str[i]);
					res = o_t_biz.delete(order_group[i]);
					res++;
				}
				if (res > 0) {
					jsResponse(response, "삭제 성공", "semi.do?command=adminpage");
				} else {
					jsResponse(response, "삭제 실패", "semi.do?command=adminpage");
				}
			}
		} else if (command.equals("basket_list")) {
			String member_id = request.getParameter("member_id");
			List<Order_TableDto> list = o_t_biz.basketList(member_id);
			List<Order_TableDto> s_list = o_t_biz.mypageList(member_id);
			request.setAttribute("list", list);
			request.setAttribute("s_list", s_list);
			dispatch(response, request, "basket_list.jsp");
		} else if (command.equals("order_my_update")) {
			String[] order_group_str = request.getParameterValues("order_group");

			int res = 0;
			int[] order_group = null;
			String[] order_step = null;
			if (order_group_str != null) {
				order_group = new int[order_group_str.length];
				for (int i = 0; i < order_group_str.length; i++) {
					order_group[i] = Integer.parseInt(order_group_str[i]);
				}
			}
			for (int j = 0; j < order_group.length; j++) {
				order_step = new String[order_group.length];
				order_step[j] = "취소요청";
			}
			for (int k = 0; k < order_group.length; k++) {
				Order_TableDto dto = new Order_TableDto();
				dto.setOrder_group(order_group[k]);
				dto.setOrder_step(order_step[k]);
				res = o_t_biz.update(dto);
				res++;
			}
			if (res > 0) {
				jsResponse(response, "수정 성공", "index.html");
			} else {
				jsResponse(response, "수정 실패", "index.html");
			}
		} else if (command.equals("paylist")) {
			MemberDto m_dto = (MemberDto) session.getAttribute("dto");
			String member_id = m_dto.getMember_id();
			String[] order_num_str = request.getParameterValues("order_num");
			int[] order_num = null;
			List<Order_TableDto> list = new ArrayList<Order_TableDto>();
			if (order_num_str != null) {
				order_num = new int[order_num_str.length];
				for (int i = 0; i < order_num_str.length; i++) {
					order_num[i] = Integer.parseInt(order_num_str[i]);
				}
			}
			for (int j = 0; j < order_num.length; j++) {
				Order_TableDto dto = o_t_biz.selectOne(order_num[j]);
				list.add(dto);
			}
			int purch = order_num.length;
			request.setAttribute("list", list);
			dispatch(response, request, "semi.do?command=paypage&member_id=" + member_id + "&purch=" + purch);
		} else if (command.equals("popup_r_check")) {
			String member_id = request.getParameter("member_id");
			request.setAttribute("member_id", member_id);
			dispatch(response, request, "popup_r_check.jsp");
		} else if (command.equals("popup_private")) {
			String member_id = request.getParameter("member_id");
			request.setAttribute("member_id", member_id);
			dispatch(response, request, "popup_private.jsp");
		} else if (command.equals("popup_calList")) {
			String member_id = request.getParameter("member_id");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
			System.out.println(yyyyMMdd);
			MycalDto m_dto = new MycalDto();
			m_dto.setMember_id(member_id);
			m_dto.setCal_mdate(yyyyMMdd);
			List<MycalDto> list = m_c_biz.selectList(m_dto);
			request.setAttribute("list", list);

			dispatch(response, request, "popup_calList.jsp");
		} else if (command.equals("private_insertres")) {
			String member_id = request.getParameter("member_id");
			String cal_title = request.getParameter("cal_title");
			String cal_mdate = request.getParameter("cal_date");
			// System.out.println(cal_mdate);
			// String cal_mdate = cal_date.substring(0, 10);
			String cal_content = request.getParameter("cal_content");
			MycalDto m_dto = new MycalDto();
			m_dto.setMember_id(member_id);
			m_dto.setCal_title(cal_title);
			m_dto.setCal_content(cal_content);
			m_dto.setCal_mdate(cal_mdate);
			m_c_biz.insertCal(m_dto);
		} else if (command.equals("checkup_insertres")) {
			String member_id = request.getParameter("member_id");
			String cal_date = request.getParameter("cal_date");
			int r_cycle = Integer.parseInt(request.getParameter("r_cycle"));
			String next_check = null;
			try {
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
				Date chekup = fm.parse(cal_date);
				Calendar cal = Calendar.getInstance();
				cal.setTime(chekup);
				cal.add(Calendar.DATE, r_cycle);
				next_check = fm.format(cal.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			MycalDto m_dto = new MycalDto();
			m_dto.setMember_id(member_id);
			m_dto.setCal_mdate(cal_date);
			m_c_biz.insertCheck(m_dto);

			MycalDto m_c_dto = new MycalDto();
			m_c_dto.setMember_id(member_id);
			m_c_dto.setCal_mdate(next_check);
			m_c_biz.insertNextCheck(m_c_dto);
		} else if (command.equals("calDetail")) {
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			System.out.println(cal_no);
			MycalDto m_dto = new MycalDto();
			m_dto.setCal_no(cal_no);
			MycalDto m_c_dto = m_c_biz.selectOne(cal_no);
			request.setAttribute("m_c_dto", m_c_dto);
			dispatch(response, request, "popup_calDetail.jsp");
		} else if (command.equals("calUpdate")) {
			String member_id = request.getParameter("member_id");
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			request.setAttribute("cal_no", cal_no);
			dispatch(response, request, "popup_calUpdate.jsp");
		} else if (command.equals("calDelete")) {
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			MycalDto m_dto = new MycalDto();
			m_dto.setCal_no(cal_no);
			m_c_biz.deleteCal(cal_no);
		} else if (command.equals("calUpdateRes")) {
			int cal_no = Integer.parseInt(request.getParameter("cal_no"));
			String cal_title = request.getParameter("cal_title");
			String cal_date = request.getParameter("cal_date");
			String cal_content = request.getParameter("cal_content");
			String cal_mdate = cal_date.substring(0, 10);
			MycalDto m_dto = new MycalDto();
			m_dto.setCal_no(cal_no);
			m_dto.setCal_title(cal_title);
			m_dto.setCal_mdate(cal_mdate);
			m_dto.setCal_content(cal_content);
			m_c_biz.updateCal(m_dto);
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