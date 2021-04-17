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
import com.project.fp.dto.MemberDto;


@WebServlet("/SemiProjectController")
public class SemiProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		MemberBiz biz = new MemberBizImpl();
		
		if (command.equals("member_list")) {
			List<MemberDto> list = biz.selectList();
			request.setAttribute("list", list);
			dispatch(response, request, "memberlist.jsp");
		} else if (command.equals("member_select")) {
			String member_id = request.getParameter("member_id");
			MemberDto dto = biz.selectOne(member_id);
			request.setAttribute("dto", dto);
			dispatch(response, request, "memberselect.jsp");
		} else if (command.equals("signup")) {
			response.sendRedirect("memberinsert.jsp");
		} else if (command.equals("singupres")) {
			String member_id = request.getParameter("member_id");
			String member_password = request.getParameter("member_password");
			String member_name = request.getParameter("member_name");
			String member_nickname = request.getParameter("member_nickname");
			String member_email = request.getParameter("member_email");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr");
			String member_grade = request.getParameter("member_grade");
			String member_animal = request.getParameter("member_animal");
			String member_dr_info = request.getParameter("member_dr_info");
			String member_notify = request.getParameter("member_notify");
			MemberDto dto = new MemberDto(member_id, member_password, member_name, member_nickname,
										  member_email, member_phone, member_addr, member_grade, null,
										  member_animal, 0, member_dr_info, member_notify);
			int res = biz.insert(dto);
			if (res > 0) {
				jsResponse(response, "회원가입 성공", "board.do?command=list");
			} else {
				jsResponse(response, "회원가입 실패", "board.do?command=insert");
			}
		} 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void dispatch(HttpServletResponse response, HttpServletRequest request, String path) throws ServletException, IOException {
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	private void jsResponse(HttpServletResponse response, String msg, String url) throws IOException {
		String responseText = "<script type='text/javascript'>"
							+ "alert('"+msg+"');"
							+ "location.href='"+url+"';"
							+"</script>";
		response.getWriter().print(responseText);
	}
}
