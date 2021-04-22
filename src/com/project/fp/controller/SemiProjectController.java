package com.project.fp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import com.project.fp.dto.File_TableDto;
import com.project.fp.dto.HospitalDto;
import com.project.fp.dto.MemberDto;
import com.project.fp.dto.PagingDto;
import com.project.fp.gmail.MailSend;

@WebServlet("/SemiProjectController")
@MultipartConfig(location = "", maxFileSize = -1, maxRequestSize = -1, fileSizeThreshold = 1024)
public class SemiProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int file_new_name_int = 1;

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
		}else if (command.equals("sns_general_signup")) {
			String member_id = request.getParameter("member_id");
			request.setAttribute("member_id", member_id);
			dispatch(response, request, "sns_general_signup.jsp");
		} else if (command.equals("sns_doctor_signup")) {
			String member_id = request.getParameter("member_id");
			request.setAttribute("member_id", member_id);
			dispatch(response, request, "sns_doctor_signup.jsp"); 
		}else if (command.equals("sns_signupres")) {
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
		} else if (command.equals("board_notice")) {
			
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int count = b_biz.notice_allCount();
			System.out.println(nowPage);
			System.out.println(count);
			PagingDto Pdto = new PagingDto(count, nowPage);
			
			List<BoardDto> list = b_biz.notice_selectList(Pdto);
			request.setAttribute("list", list);
			request.setAttribute("Pdto", Pdto);
			dispatch(response, request, "board_notice.jsp");
		} else if (command.equals("board_free")) {
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int count = b_biz.free_allCount();
			PagingDto Pdto = new PagingDto(count, nowPage);
			System.out.println("나왔다");
			System.out.println(nowPage);
			System.out.println(count);
			List<BoardDto> list = b_biz.free_selectList(Pdto);
			request.setAttribute("list", list);
			request.setAttribute("Pdto", Pdto);
			dispatch(response, request, "board_free.jsp");
		} else if (command.equals("board_dec")) {
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int count = b_biz.free_allCount();
			PagingDto Pdto = new PagingDto(count, nowPage);
			
			List<BoardDto> list = b_biz.dec_selectList(Pdto);
			request.setAttribute("list", list);
			dispatch(response, request, "board_dec.jsp");
		} else if (command.equals("mypage")) {
			response.sendRedirect("mypage.jsp");
		} else if (command.equals("shopping")) {
			response.sendRedirect("shopping.jsp");
		} else if (command.equals("board_qna")) {
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			int count = b_biz.free_allCount();
			PagingDto Pdto = new PagingDto(count, nowPage);
			
			List<BoardDto> list = b_biz.qna_selectList(Pdto);
			request.setAttribute("list", list);
			dispatch(response, request, "board_qna.jsp");
		} else if (command.equals("board_insertform")) {
			response.sendRedirect("board_insertform.jsp");
		} else if (command.equals("board_insertres")) {
			String file_path = request.getSession().getServletContext().getRealPath("fileupload");
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
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_free&nowPage=1");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_free&nowPage=1");
				}
			} else if (board_category.equals("N")) {
				res = b_biz.notice_insert(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_notice&nowPage=1");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_notice&nowPage=1");
				}
			} else if (board_category.equals("Q")) {
				res = b_biz.qna_insert(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_qna&nowPage=1");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_qna&nowPage=1");
				}
			} else if (board_category.equals("D")) {
				res = b_biz.dec_insert(b_dto);
				if (res > 0) {
					jsResponse(response, "등록 성공", "semi.do?command=board_dec&nowPage=1");
				} else {
					jsResponse(response, "등록 실패", "semi.do?command=board_dec&nowPage=1");
				}
			}
			List<BoardDto> b_list = b_biz.board_selectList(b_dto);
			int board_no = b_list.get(0).getBoard_no();

			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				Collection<Part> parts = request.getParts();
				File_TableDto f_dto = new File_TableDto();

				for (Part part : parts) {
					if (part.getHeader("Content-Disposition").contains("filename=")) {
						String file_name = extractFileName(part.getHeader("Content-Disposition"));
						if (part.getSize() > 0) {
							String file_type = file_name.substring(file_name.lastIndexOf("."));
							String file_size = Long.toString(part.getSize());
							part.write(file_path + File.separator + file_name);
							part.delete();
							f_dto.setFile_path(file_path);
							f_dto.setFile_ori_name(file_name);
							String file_new_name_str = String.valueOf(file_new_name_int);
							f_dto.setFile_new_name(file_new_name_str);
							f_dto.setFile_type(file_type);
							f_dto.setFile_size(file_size);
							f_dto.setMember_id(member_id);
							f_dto.setBoard_no(board_no);
							int f_res = f_t_biz.board_insert(f_dto);
							
						}
					}
				}
			}

			file_new_name_int++;
		}else if(command.equals("board_dec_detail")){
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			BoardDto b_dto = b_biz.board_selectOne(board_no);
			request.setAttribute("dto", b_dto);
			dispatch(response, request, "board_detail.jsp");
		}else if (command.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else if (command.equals("animal_hospital")) {
			List<HospitalDto> list = new ArrayList<HospitalDto>();
			list = h_biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "animal_hospital.jsp");
		} else if (command.equals("test")) {
			response.sendRedirect("test.html");
		}

		if (command.equals("mailsend")) {
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
		}

		if (command.equals("mailcheck")) {
			String AuthenticationKey = request.getParameter("AuthenticationKey");
			String AuthenticationUser = request.getParameter("AuthenticationUser");
			if (AuthenticationKey.equals(AuthenticationUser)) {
				System.out.println("인증 성공");
			} else {
				System.out.println("인증 실패");
			}
		}

		
		if(command.equals("test")) {
			File fi = new File("C://Users//alahx/test123123123123123.csv");
			BufferedReader br = new BufferedReader(new BufferedReader(new FileReader(fi)));
			String line = "";
			String[] str = new String[3];
			HospitalDto h_dto = null;
			int res = 0;
			while ((line = br.readLine()) != null) { //한 라인씩 읽어오기.
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
				if(res > 0) {
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
