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

		} else if (command.equals("memberdetail")) {
			String member_id = request.getParameter("member_id");
			MemberDto dto = m_biz.selectDetail(member_id);
			AnimalDto a_dto = a_biz.selectoneDetail(member_id);
			request.setAttribute("dto", dto);
			request.setAttribute("a_dto", a_dto);
			dispatch(response, request, "memberdetail.jsp");
		} else if(command.equals("membermod")) {
			String member_nicname = request.getParameter("member_nicname");
			String member_email = request.getParameter("member_email_1");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr_1");
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
				jsResponse(response, "수정성공", "mypage.jsp");
			} else {
				jsResponse(response, "수정실패", "#");
			} 
		} else if (command.equals("memberdetail")) {
			String member_id = request.getParameter("member_id");
			MemberDto dto = m_biz.selectDetail(member_id);
			AnimalDto a_dto = a_biz.selectoneDetail(member_id);
			request.setAttribute("dto", dto);
			request.setAttribute("a_dto", a_dto);
			dispatch(response, request, "memberdetail.jsp");
		} else if(command.equals("memberupdate")) {
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
				jsResponse(response, "수정성공", "adminpage.jsp");
			} else {
				jsResponse(response, "수정실패", "#");
			} 
		
		}else if (command.equals("memberdel")) {
			String member_id = request.getParameter("member_id");
			int md_res = 0;
			md_res = m_biz.delete(member_id);
			if (md_res > 0) {
				jsResponse(response, "회원탈퇴", "index.jsp");
			} else {
				jsResponse(response, "회원탈퇴실패", "semi.do?command=mypage");
			}

		} else if (command.equals("board_notice")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			int count = b_biz.notice_allCount();
			System.out.println(nowPage);
			System.out.println(count);
			PagingDto Pdto = new PagingDto(count, nowPage);

			List<BoardDto> list = b_biz.notice_selectList(Pdto);
			request.setAttribute("BoardCommand", command);
			request.setAttribute("list", list);
			request.setAttribute("Pdto", Pdto);
			dispatch(response, request, "board_notice.jsp");
		} else if (command.equals("board_free")) {
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			String s_c = request.getParameter("s_c");
			String s_t = request.getParameter("s_t");
			if(s_c == null){
			int count = b_biz.free_allCount();
			PagingDto Pdto = new PagingDto(count, nowPage);
			List<BoardDto> list = b_biz.free_selectList(Pdto);
			request.setAttribute("BoardCommand", command);
			request.setAttribute("list", list);
			request.setAttribute("Pdto", Pdto);
			dispatch(response, request, "board_free.jsp");
			}else{
				if(s_c.equals("W")) {
					BoardDto dto = new BoardDto();
					dto.setMember_id(s_t);
					List<BoardDto> slist = b_biz.board_M_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage,s_c,s_t);
					List<BoardDto> list = b_biz.free_M_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_free.jsp");
				}else if(s_c.equals("T")) {
					BoardDto dto = new BoardDto();
					dto.setBoard_content(s_t);
					List<BoardDto> slist = b_biz.board_C_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage,s_c,s_t);
					List<BoardDto> list = b_biz.free_C_search(Pdto);
					request.setAttribute("BoardCommand", command);
					request.setAttribute("list", list);
					request.setAttribute("Pdto", Pdto);
					dispatch(response, request, "board_free.jsp");
				}else if(s_c.equals("T_C")){
					BoardDto dto = new BoardDto();
					dto.setMember_id(s_t);
					dto.setBoard_content(s_t);
					List<BoardDto> slist = b_biz.board_MC_search(dto);
					int count = slist.size();
					PagingDto Pdto = new PagingDto(count, nowPage,s_c,s_t);
					List<BoardDto> list = b_biz.free_MC_search(Pdto);
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
			int count = b_biz.free_allCount();
			PagingDto Pdto = new PagingDto(count, nowPage);

			List<BoardDto> list = b_biz.dec_selectList(Pdto);
			request.setAttribute("list", list);
			dispatch(response, request, "board_dec.jsp");
		} else if (command.equals("mypage")) {
			response.sendRedirect("mypage.jsp");
		} else if (command.equals("boardlist")) {
			BoardDto b_dto = new BoardDto();
			List<BoardDto> list = b_biz.board_selectList(b_dto);
			request.setAttribute("list", list);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("shopping")) {
			List<ProductDto> list = p_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "shopping.jsp");
		} else if (command.equals("memberlist")) {
			List<MemberDto> list = m_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("prodlist")) {
			List<ProductDto> list = p_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "adminpage.jsp");
		} else if (command.equals("orderlist")) {
			List<Order_TableDto> list = o_t_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "adminpage.jsp");
		}
		else if (command.equals("shop_insertform")) {
			response.sendRedirect("shop_insertform.jsp");
		} else if (command.equals("shop_insertres")) {

			String prod_category = request.getParameter("prod_category");
			String prod_name = request.getParameter("prod_name");
			String prod_mfr = request.getParameter("prod_mfr");
			String prod_explain = request.getParameter("prod_explain");
			String prod_client = request.getParameter("prod_client");
			int prod_price = Integer.parseInt(request.getParameter("prod_price"));
			int prod_sale = Integer.parseInt(request.getParameter("prod_sale"));
			int prod_in = Integer.parseInt(request.getParameter("prod_in"));
			
			ProductDto p_dto = new ProductDto();
			p_dto.setProd_category(prod_category);
			p_dto.setProd_name(prod_name);
			p_dto.setProd_mfr(prod_mfr);
			p_dto.setProd_explain(prod_explain);
			p_dto.setProd_client(prod_client);
			p_dto.setProd_price(prod_price);
			p_dto.setProd_sale(prod_sale);
			p_dto.setProd_in(prod_in);
			
			int res = 0;
			res = p_biz.insert(p_dto);
			if (res > 0) {
				jsResponse(response, "등록 성공", "semi.do?command=shopping");
			} else {
				jsResponse(response, "등록 실패", "semi.do?command=shop_insertform");
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
			response.sendRedirect("board_insertform.jsp");
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
			int b_res = b_biz.delete(board_no);
			if (b_res > 0) {
				jsResponse(response, "삭제 성공", "semi.do?command=board_free");
			} else {
				jsResponse(response, "삭제 실패", "semi.do?command=board_detail&board_no=" + board_no);
			}
		} else if (command.equals("board_delete")) {
			String[] board_no = request.getParameterValues("board_no");
			String userID = request.getParameter("userID");
			String userGrade = request.getParameter("userGrade");
			
			for(int i = 0; i < board_no.length; i++) {
				
				BoardDto b_dto = b_biz.board_selectOne(Integer.parseInt(board_no[i]));
				
				if(board_no[i] == null || board_no[i].length() == 0) {
				
				} else if (b_dto.getMember_id().equals(userID) || userGrade.equals("관리자")) {
						f_t_biz.board_delete(Integer.parseInt(board_no[i]));
						b_r_biz.board_delete(Integer.parseInt(board_no[i]));
						int b_res = b_biz.delete(Integer.parseInt(board_no[i]));
						if (b_res > 0) {
							System.out.println("삭제 성공");
						} else {
							jsResponse(response, "선택된 글들이 삭제되지 않았습니다.", "semi.do?command=board_free");
							return;
						}

				} else {
					jsResponse(response, "다른 사용자의 게시물은 삭제되지 않았습니다.", "semi.do?command=board_free");
				}
			}
			
			jsResponse(response, "선택된 글들이 모두 삭제되었습니다.", "semi.do?command=board_free");
			
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
			}else if(member_grade.equals("전문의")) {
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
			String subject = "PetCare 회원가입 이메일 인증번호 입니다.";
			String content = getRandomPassword(10);
			try {
				MailSend ms = new MailSend();
				ms.sendEmail(from, member_email, cc, subject, content);
				System.out.println("전송 성공");
				request.setAttribute("content", content);
				dispatch(response, request, "signup_emailchk.jsp");
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
				System.out.println("인증 성공");
			} else {
				System.out.println("인증 실패");
			}
		} else if (command.equals("smssend")) {
			String member_phone = request.getParameter("member_phone");
			String content = "문자 내용 작성";
			SMS.sendSMS(member_phone, content);
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
		} else if(command.equals("replyUpdate")) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));
			String reply_content = request.getParameter("reply_content");
			System.out.println(reply_content);
			Board_ReplyDto b_r_dto = new Board_ReplyDto();
			b_r_dto.setReply_no(reply_no);
			b_r_dto.setReply_content(reply_content);
			
			b_r_biz.reply_update(b_r_dto);
		} else if(command.equals("r_reply_upload")) {
			int reply_no = Integer.parseInt(request.getParameter("reply_no"));
			String r_reply_content = request.getParameter("r_reply_content");
			String reply_nicname = request.getParameter("member_nicname");
			
			Board_ReplyDto b_r_dto = new Board_ReplyDto();
			b_r_dto.setReply_no(reply_no);
			b_r_dto.setReply_content(r_reply_content);
			b_r_dto.setReply_nicname(reply_nicname);
			
			b_r_biz.replyProc(b_r_dto);
		} else if(command.equals("chatlist_chat")) {
			String member_grade = request.getParameter("member_grade");
			String member_id = request.getParameter("member_id");
			ChatDto c_dto = new ChatDto();
			c_dto.setMember_id(member_id);
			List<ChatDto> c_list = new ArrayList<ChatDto>();
			if (member_grade.equals("개인")) {
				c_list = c_biz.selectUserList(c_dto);
			}else if(member_grade.equals("전문의")) {
				c_list = c_biz.selectDoctorList(c_dto);
			}
			JsonArray resultArray = new JsonArray();
			for(ChatDto dto : c_list) {
				Gson gson = new Gson();
				String jsonString = gson.toJson(dto);
				resultArray.add(JsonParser.parseString(jsonString));
			}
			JsonObject result = new JsonObject();
			result.add("result", resultArray);
			response.getWriter().append(result.toString());
		} else if (command.equals("chat_del")) {
			int ch_num = Integer.parseInt(request.getParameter("ch_num"));
			int res = c_biz.delete(ch_num);
			if(res > 0) {
				response.getWriter().append("삭제 성공");
			}else {
				response.getWriter().append("삭제 실패");
			}
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