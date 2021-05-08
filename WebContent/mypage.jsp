<%@page import="com.project.fp.dto.MycalDto"%>
<%@page import="com.project.fp.dao.MycalDaoImpl"%>
<%@page import="com.project.fp.dao.MycalDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.project.fp.controller.Util"%>
<%@page import="com.project.fp.biz.AnimalBizImpl"%>
<%@page import="com.project.fp.biz.AnimalBiz"%>
<%@page import="com.project.fp.dto.AnimalDto"%>
<%@page import="com.project.fp.dao.MemberDaoImpl"%>
<%@page import="com.project.fp.dto.Order_TableDto"%>
<%@page import="com.project.fp.biz.Order_TableBizImpl"%>
<%@page import="com.project.fp.biz.Order_TableBiz"%>
<%@page import="com.project.fp.biz.ProductBizImpl"%>
<%@page import="com.project.fp.biz.ProductBiz"%>
<%@page import="com.project.fp.dto.ProductDto"%>
<%@page import="com.project.fp.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="com.project.fp.biz.MemberBizImpl"%>
<%@page import="com.project.fp.biz.MemberBiz"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<link href="resources/css/mypage.css" rel="stylesheet" type="text/css" />
<link href="resources/css/calendar.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function chk(value){
		$('.animal').trigger('click');
			if(value == "N"){
				$("input[name=animal_name]").attr("required","false");
				$("input[id=animal_gen_chk]").attr("checked","unchecked");
				$(".animal").hide();
			}else{
				$(".animal").show();
				$("input[id=animal_gen_chk]").attr("checked","checked");
				$("input[name=animal_name]").attr("required","true");
			}
	}
	function check() {
		var member_email = $('input[name=member_email_1]').val() + "@"
				+ $('select[name=member_email_2]').val();
		$('input[name=member_email]').attr('value', member_email);
		var member_phone = $('input[name=member_phone_1]').val() + "-"
				+ $('input[name=member_phone_2]').val() + "-"
				+ $('input[name=member_phone_3]').val();
		$('input[name=member_phone]').attr('value', member_phone);
		var member_addr = $('input[name=member_addr_1]').val() + ","
				+ $('input[name=member_addr_2]').val();
		$('input[name=member_addr]').attr('value', member_addr);
	}
	
	function sendmailkey() {
		var member_email = $('input[name=member_email_1]').val() + "@"
				+ $('select[name=member_email_2]').val();
		if ($('input[name=member_email_1]').val().trim() == ""
				|| $('input[name=member_email_1]').val() == null) {
			alert("이메일을 입력해 주세요");
		} else {
			open("semi.do?command=mailsend&member_email=" + member_email, "",
					"width=200 , height= 200");
		}
	}
	function sendsms() {
		var member_phone = $('input[name=member_phone_1]').val()
				+ $('input[name=member_phone_2]').val()
				+ $('input[name=member_phone_3]').val();
		if ($('input[name=member_phone_1]').val().trim() == ""
				|| $('input[name=member_phone_1]').val() == null) {
			alert("전화번호를 입력해 주세요");
		} else {
			open("semi.do?command=smssend&member_phone=" + member_phone, "",
					"width=200 , height= 200");
		}
	}
	function sendmailkey() {
		var member_email = $('input[name=member_email_1]').val() + "@"
				+ $('select[name=member_email_2]').val();
		if ($('input[name=member_email_1]').val().trim() == ""
				|| $('input[name=member_email_1]').val() == null) {
			alert("이메일을 입력해 주세요");
		} else {
			open("semi.do?command=mailsend&member_email=" + member_email, "",
					"width=200 , height= 200");
		}
	}
	function sendsms() {
		var member_phone = $('input[name=member_phone_1]').val()
				+ $('input[name=member_phone_2]').val()
				+ $('input[name=member_phone_3]').val();
		if ($('input[name=member_phone_1]').val().trim() == ""
				|| $('input[name=member_phone_1]').val() == null) {
			alert("전화번호를 입력해 주세요");
		} else {
			open("semi.do?command=smssend&member_phone=" + member_phone, "",
					"width=200 , height= 200");
		}
	}
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("addr_1").value = roadAddr;
						document.getElementById("addr_1").value = data.jibunAddress;
						if (data.autoRoadAddress) {
							document.getElementById("addr_1").value = roadAddr;
						} else if (data.autoJibunAddress) {
							document.getElementById("addr_1").value = data.jibunAddress;
						} else {
						}
					}
				}).open();
	}
	$(function() {
		$('.mymenus li').click(function() {
			$('.mymenus li').find('a').removeClass('active');
			$(this).find('a').addClass('active');
			$('.mypage').hide();
			var i = $(this).index();
			$('.mypage').eq(i).show();
		});
		$('.mymenus li').eq(0).trigger('click');
		var $checkHead = $("#adminBoard tr th input[type='checkbox']");
		var $checkBody = $("#adminBoard tr td input[type='checkbox']");
		/* 전체선택 */
		$checkHead.click(function() {
			var $bodyPutCk = $checkHead.is(":checked");
			if ($bodyPutCk == true) {
				$checkBody.attr("checked", true);
				$checkBody.prop("checked", true);
			} else {
				$checkBody.attr("checked", false);
				$checkBody.prop("checked", false);
			}
		});
		/* 하위 전체 선택시 전체버튼 선택 */
		$checkBody
				.click(function() {
					var tdInput_Length = $checkBody.length;
					var tdInput_Check_Length = $("#adminBoard tr td input[type='checkbox']:checked").length;
					console.log(tdInput_Length);
					console.log(tdInput_Check_Length);
					if (tdInput_Length == tdInput_Check_Length) {
						$checkHead.attr("checked", true);
						$checkHead.prop("checked", true);
					} else {
						$checkHead.attr("checked", false);
						$checkHead.prop("checked", false);
					}
				});
	});
</script>
</head>
<body>
	<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	AnimalDto a_dto = (AnimalDto) request.getAttribute("a_dto");
	if (dto == null) {
		pageContext.forward("index.jsp");
	}
	%>
	<jsp:include page="header.jsp" />

	<div class="mypage-body">
		<div id="mypage_nav">
			<nav>
				<ul class="mymenus">
					<li><a class="mymenu">마이페이지</a></li>
					<li><a class="mymenu">캘린더</a></li>
					<li><a class="mymenu">주문내역</a></li>
					<li><a class="mymenu">회원정보수정</a></li>
					<li><a class="mymenu">회원탈퇴</a></li>
				</ul>
			</nav>

		</div>
		<div class="mypage">
			<h3>MY PAGE</h3>
			<br>
			<div class="mypage_info">
				<div class="mypage_info_id">
					<br>
					<h3 class="mypage_h3"><%=dto.getMember_id()%></h3>
				</div>
				<div>
					<span class="mypage_info_name">
						이름 :
						<%=dto.getMember_name()%></span>
					<span class="mypage_info_name">
						닉네임 :
						<%=dto.getMember_nicname()%></span>
					<span class="mypage_info_name">
						등급 :
						<%=dto.getMember_grade()%></span>
					<span class="mypage_info_name">
						적립금 :
						<%=dto.getMember_point()%>
						point
					</span>
				</div>
			</div>
		</div>

		<div class="mypage">
			<h2>캘린더</h2>
			<br>
			<div class="btn_R">
			<input type="button" class="reg_btn" value="정기검진 등록" onclick="popup_r_check();" />
			<input type="button" class="reg_btn" value="개인일정 등록" onclick="popup_private();" />
			</div>
				<script type="text/javascript">
					function popup_r_check() {window.open("semi.do?command=popup_r_check&member_id=${dto.member_id}", "정기검진 등록 팝업창", "width=800, height=300, left=500, top=250");}
					function popup_private() {window.open("semi.do?command=popup_private&member_id=${dto.member_id}", "개인일정 등록 팝업창", "width=600, height=400, left=500, top=250");}
				</script>

			
			<%
					Calendar cal = Calendar.getInstance();
					
					int year = cal.get(Calendar.YEAR);
					int month = cal.get(Calendar.MONTH) + 1;
					
					String paramYear = request.getParameter("year");
					String paramMonth = request.getParameter("month");
					
					if (paramYear != null) {
						year = Integer.parseInt(paramYear);
					}
					
					if (paramMonth != null) {
						month = Integer.parseInt(paramMonth);
					}
					
					if (month > 12) {
						year++;
						month = 1;
					}
					if (month < 1) {
						year--;
						month = 12;
					}	
					
					// 날짜 설정하기
					cal.set(year, month-1, 1);
					
					// 해당 년,월의 1일의 요일값
					int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
					// 해당 월의 마지막 날
					int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
					MycalDao dao = new MycalDaoImpl();
					String member_id = dto.getMember_id();
					String yyyyMM = year +"-"+ Util.isTwo(String.valueOf(month));
					MycalDto m_c_dto = new MycalDto(yyyyMM, member_id);
					List<MycalDto> m_c_list = dao.selectViewList(m_c_dto);
					
				%>

					<table id="myCalendar">
					
						<caption class="cpt">
							<a href="mypage.jsp?year=<%=year-1%>&month=<%=month%>">◁</a>
							<a href="mypage.jsp?year=<%=year %>&month=<%=month-1 %>">◀</a>
							
							<span class="y"><%=year %></span>년
							<span class="m"><%=month %></span>월
							
							<a href="mypage.jsp?year=<%=year %>&month=<%=month+1 %>">▶</a>
							<a href="mypage.jsp?year=<%=year+1%>&month=<%=month%>">▷</a>
						</caption>
						
						<tr>
							<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
						</tr>
						
						<tr>
						
						<%
							for (int i = 0; i < dayOfWeek-1; i++) {
								out.print("<td></td>");
							}
						
							for (int i = 1; i <= lastDay; i++) {
						%>
						
						<td>
							<a class="countview" href="semi.do?command=popup_calList&member_id=${dto.member_id}&year=<%=year %>&month=<%=month %>&date=<%=i %>" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;" style="color: <%=Util.fontColor(i, dayOfWeek) %>"><%=i %></a>
							
							<div class="list">
								<%=Util.getCalView(i, m_c_list) %>
							</div>
							
						</td>
						
					<%
								if ((dayOfWeek-1+i)%7 == 0) {
									out.print("</tr><tr>");
								}
							}
							
							for (int i = 0; i < (7-(dayOfWeek-1 + lastDay)%7)%7 ; i++) {
								out.print("<td></td>");
							}
					%>
							</tr>
					</table>			
			
		</div>

		<div class="mypage">
			<h2>전체 주문 조회</h2>
			<div>
				<c:choose>
					<c:when test="${empty list }">
						<span>----------주문내역이 존재하지 않습니다----------</span>
					</c:when>
					<c:otherwise>
						<c:set var="tempname" value="" />
						<ul>
							<c:forEach items="${list }" var="dto">
								<li class="order_list">
									<div class="order_img_div">
										<img class="order_img" src="fileupload/${dto.file_new_name }" alt="shopimage">
									</div>
									<div class="order_info">
										<span class="order_info_num">${dto.order_num }</span>
										<span class="order_info_name">${dto.prod_name }</span>
										<span class="order_info_count">${dto.order_quantity }개</span>
										<span class="order_info_money">${dto.order_price }원</span>
										<span class="order_info_date">
											<fmt:formatDate value="${dto.order_date }" pattern="yyyy-MM-dd" />
										</span>
									</div>
									<div class="order_status">${dto.order_step}</div>
								</li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="mypage">
			<h2>회원 정보수정</h2>
			<div class="join_table">
				<div id="member_join">
					<form action="semi.do" method="POST">
						<input type="hidden" name="command" value="membermod">
						<div id="general_signup_idpw">
							<div class="general_signup_row">
								<h4 class="general_signup_title">아이디</h4>
								<div class="general_signup_id">
									<span class="general_signup_span">
										<input class="general_signup_text" name="member_id" value="<%=dto.getMember_id()%>" readonly="readonly" />
									</span>
								</div>
							</div>
							<div class="general_signup_row">
								<h4 class="general_signup_title">비밀번호</h4>
								<div class="general_signup_pw">
									<span class="general_signup_span">
										<input class="general_signup_text" type="password" name="member_password" value="<%=dto.getMember_password()%>">
									</span>
								</div>
							</div>
							<div class="general_signup_row">
								<h4 class="general_signup_title">비밀번호 확인</h4>
								<div class="general_signup_pw">
									<span class="general_signup_span">
										<input class="general_signup_text" type="password" name="member_password_chk" value="<%=dto.getMember_password()%>">
									</span>
								</div>
								<font id="chkNotice" size="2"></font>
							</div>
						</div>
						<div id="general_signup_info">
							<div class="general_signup_row">
								<h4 class="general_signup_title">이름</h4>
								<div class="general_signup_name">
									<span class="general_signup_span">
										<input class="general_signup_text" type="text" name="member_name" value="<%=dto.getMember_name()%>" readonly="readonly">
									</span>
								</div>
							</div>

							<div class="general_signup_row">
								<h4 class="general_signup_title">닉네임</h4>
								<div class="general_signup_nickname">
									<span class="general_signup_span">
										<input class="general_signup_text" type="text" name="member_nicname" maxlength="10" value="<%=dto.getMember_nicname()%>">
									</span>
								</div>
							</div>
							<%
							String[] email = dto.getMember_email().split("@");
							String email_name = email[0];
							String email_addr = email[1];
							%>
							<div class="general_signup_row">
								<h4 class="general_signup_title">이메일</h4>
								<div class="general_signup_email">
									<input type="hidden" name="member_email" value="">
									<span class="general_signup_span">
										<input type="text" id="general_signup_email" name="member_email_1" maxlength="30" value="<%=email_name%>">
										@
										<select id="addr" name="member_email_2">
											<option>naver.com</option>
											<option>daum.net</option>
											<option>gmail.com</option>
											<option>nate.com</option>
										</select>
									</span>
								</div>
							</div>
							<%-- email_2 결정 --%>
							<script type="text/javascript">
					
								if("<%=email_addr%>" == "naver.com"){
									$('#addr option:eq(0)').prop("selected",true);
								}
								else if("<%=email_addr%>" == "daum.net"){
									$('#addr option:eq(1)').prop("selected",true);
								}
								else if("<%=email_addr%>" == "gmail.com"){
									$('#addr option:eq(2)').prop("selected",true);
								}
								else if("<%=email_addr%>" == "nate.com"){
									$('#addr option:eq(3)').prop("selected",true);
								}
						</script>
							<%
							String[] phone_num = dto.getMember_phone().split("-");
							%>
							<div class="general_signup_row">
								<h4 class="general_signup_title">휴대폰</h4>
								<div class="general_signup_moblie_phone">
									<span class="general_signup_span">
										<input type="hidden" name="member_phone" value="">
										<input class="general_signup_phone" type="text" name="member_phone_1" maxlength="3" size="3" value="<%=phone_num[0]%>">
										-
										<input class="general_signup_phone" type="text" name="member_phone_2" maxlength="4" size="3" value="<%=phone_num[1]%>">
										-
										<input class="general_signup_phone" type="text" name="member_phone_3" maxlength="4" size="3" value="<%=phone_num[2]%>">
									</span>
								</div>
							</div>
							<%
							String[] addr = dto.getMember_addr().split(",");
							%>
							<div class="general_signup_row">
								<h4 class="general_signup_title">주소</h4>
								<div class="general_signup_home_addr">
									<span class="general_signup_span_home_addr">
										<input type="hidden" name="member_addr" value="">
										<input class="general_signup_addr" type="text" id="postcode" placeholder="우편번호" readonly="readonly">
										<input type="button" onclick="address();" value="우편번호 찾기">
										<br>
										<input class="general_signup_addr" type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" readonly="readonly">
										<input class="general_signup_addr" type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" required="required">
									</span>
								</div>
							</div>
							<%--
						<script type="text/javascript">
							$("#addr_1").val("<%=addr[0]%>");
							$("#addr_2").val("<%=addr[1]%>");
						</script>
						 --%>
							<div class="general_signup_row">
								<h4 class="general_signup_animal_yn">반려동물 여부</h4>
								<div class="general_signup_animal_yn">
									<span class="general_signup_animal_yn">
										<input type="radio" name="member_animal" value="N" onclick="chk(this.value);" checked>
										없음
										<%
										if (dto.getMember_animal().equals("Y")) {
										%>
										<input type="radio" name="member_animal" value="Y" onclick="chk(this.value);">
										반려동물 수정
										<%
										} else {
										%>
										<input type="radio" name="member_animal" value="Y" onclick="chk(this.value);">
										신규 등록
										<input type="hidden" name="animalN_Y" value="N_Y">
										<%
										}
										%>
									</span>
								</div>
							</div>
						</div>
						<div class="animal">
							<hr>
							<div class="general_signup_animal_info">
								<h4 class="general_signup_title">반려동물 정보</h4>
							</div>
							<div class="general_signup_animal_info">
								<h4 class="general_signup_title">반려동물 이름*</h4>
								<div class="general_signup_animalname">
									<span class="general_signup_span">
										<input class="general_signup_text" type="text" name="animal_name" />
									</span>
								</div>
							</div>
							<div class="general_signup_animal_info">

								<h4 class="general_signup_animal_gender">성별*</h4>
								<div class="general_signup_animal_gender">
									<span class="general_signup_animal_gender">
										<input type="radio" name="animal_gen" value="M">
										<img src="resources/images/male.svg" style="width: 20px; height: 20px;">
										<input type="radio" name="animal_gen" value="F">
										<img src="resources/images/female.svg" style="width: 20px; height: 20px;">
									</span>
								</div>
							</div>
							<div class="general_signup_animal_info">
								<h4 class="general_signup_title">품종</h4>
								<div class="general_signup_animal_type">
									<span class="general_signup_span">
										<input class="general_signup_text" type="text" name="animal_type" maxlength="20" />
									</span>
								</div>
							</div>

							<div class="general_signup_animal_info">
								<h4 class="general_signup_age">나이</h4>
								<select id="select_age" name="animal_age">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
								</select>
							</div>

							<div class="general_signup_animal_info">
								<h4 class="general_signup_weight">몸무게</h4>
								<select id="select_weight" name="animal_weight">
									<option value="1">1kg</option>
									<option value="2">2kg</option>
									<option value="3">3kg</option>
									<option value="4">4kg</option>
									<option value="5">5kg</option>
									<option value="6">6kg</option>
									<option value="7">7kg</option>
									<option value="8">8kg</option>
									<option value="9">9kg</option>
									<option value="10">10kg</option>
									<option value="11">11kg</option>
									<option value="12">12kg</option>
									<option value="13">13kg</option>
									<option value="14">14kg</option>
									<option value="15">15kg</option>
									<option value="16">16kg</option>
									<option value="17">17kg</option>
									<option value="18">18kg</option>
									<option value="19">19kg</option>
									<option value="20">20kg</option>
									<option value="21">21kg</option>
									<option value="22">22kg</option>
									<option value="23">23kg</option>
									<option value="24">24kg</option>
									<option value="25">25kg</option>
									<option value="26">26kg</option>
									<option value="27">27kg</option>
									<option value="28">28kg</option>
									<option value="29">29kg</option>
									<option value="30">30kg</option>
								</select>
							</div>

							<div class="general_signup_animal_info">
								<h4 class="general_signup_weight">특이사항(질병,기타사항)</h4>
								<div class="general_signup_animal_special_note">
									<span class="general_signup_span">
										<textarea class="general_signup_text" rows="10" cols="30" name="animal_unq"></textarea>
									</span>
								</div>
							</div>
						</div>
						<%
						if (a_dto != null) {
						%>
						<script type="text/javascript">
						
						$('input[name=animal_name]').val('<%=a_dto.getAnimal_name()%>');
						$('input[name=animal_type]').val('<%=a_dto.getAnimal_type()%>');
						$('input[name="animal_gen"]:radio[value="<%=a_dto.getAnimal_gen()%>"]').prop('checked', true);
						$('#select_age').val('<%=a_dto.getAnimal_age()%>').prop("selected",true);
						$('#select_weight').val('<%=(int) a_dto.getAnimal_weight()%>
							').prop(
									"selected", true);
						</script>
						<%
						}
						%>
						<div id="general_signup_btn">
							<input type="submit" value="회원정보수정" class="btn btn-outline-secondary" style="font-weight: bold" onclick="check();" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="mypage">
			<form action="semi.do" method="post">
				<input type="hidden" name="command" value="memberdel">
				<h3>회원탈퇴</h3>
				<div id="general_signup_idpw">
					<div class="general_signup_row">
						<h4 class="general_signup_title">아이디</h4>
						<div class="general_signup_id">
							<span class="general_signup_span">
								<input class="general_signup_text" type="text" value="<%=dto.getMember_id()%>" readonly="readonly" />
							</span>
						</div>
					</div>
					<div class="general_signup_row">
						<h4 class="general_signup_title">비밀번호</h4>
						<div class="general_signup_pw">
							<span class="general_signup_span">
								<input class="general_signup_text" type="password" name="member_password" onclick="idCheckConfirm();">
							</span>
						</div>
					</div>
					<div class="general_signup_row">
						<h4 class="general_signup_title">비밀번호 확인</h4>
						<div class="general_signup_pw">
							<span class="general_signup_span">
								<input class="general_signup_text" type="password" name="member_password_chk" onclick="idCheckConfirm();">
							</span>
						</div>
					</div>
				</div>
				<div id="general_signup_btn">
					<button type="submit" class="btn btn-outline-secondary" style="font-weight: bold">회원 탈퇴</button>
				</div>
			</form>
		</div>
	</div>


	<jsp:include page="bottom.jsp" />
</body>
</html>