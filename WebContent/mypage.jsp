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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>Insert title here</title>

<style type="text/css">

.animal {
	display: none;

}

.orderIng ol li {
    left: 61px;
    padding-right: 45px;
}


</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
		$('.mymenus li').click(function(){
		$('.mymenus li').find('a').removeClass('active');
	    $(this).find('a').addClass('active');
	    $('.mypage').hide();		   
		var i = $(this).index();
		$('.mypage').eq(i).show();
	});
		$('.mymenus li').eq(0).trigger('click');
});
</script>


<link href="resources/css/head.css" rel=stylesheet type="text/css" />
<style type="text/css">
	.mymenus li {
	float: left;
	}

	.mymenu {
	display: block;
	color: black;
	text-align: center;
	padding: 15px 20px;
	text-decoration: none;
	}

	.mymenus {
	list-style-type: none;
	margin: 0;
	overflow: hidden;
	list-style: none;
	}
</style>

</head>
<body>


	<jsp:include page="header.jsp" />
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	function chk(value){
		$('.animal').trigger('click');
		if(value == "Y"){
			$(".animal").show();
			$("input[id=animal_gen_chk]").attr("checked","checked");
			$("input[name=animal_name]").attr("required","true");
		}else if(value == "N"){
			$("input[name=animal_name]").attr("required","false");
			$("input[id=animal_gen_chk]").attr("checked","unchecked");
			$(".animal").hide();
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
		var member_addr = $('input[name=member_addr_1]').val() + " "
				+ $('input[name=member_addr_2]').val();
		$('input[name=member_addr]').attr('value', member_addr);
	}
	
	$(function() {

		$('input[name=member_password]').keyup(function() {
			$('#chkNotice').html('');
		});

		$('input[name=member_password_chk]').keyup(
				function() {
					if ($('input[name=member_password]').val() != $(
							'input[name=member_password_chk').val()) {
						$('#chkNotice').html('비밀번호 일치하지 않음');
						$('#chkNotice').attr('color', '#f82a2aa3');
					} else {
						$('#chkNotice').html('비밀번호 일치함');
						$('#chkNotice').attr('color', '#199894b3');
					}

				});

	});
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
	
	
</script>
<%

MemberDto dto = (MemberDto) session.getAttribute("dto");
if (dto == null) {
	pageContext.forward("index.jsp");
}
%>
	
<form action="semi.do" method="post" >




		<section>
			<nav>
				<ul class="mymenus">
					<li><a class="mymenu" href="#">마이페이지</a></li>
					<li><a class="mymenu" href="#">캘린더</a></li>
					<li><a class="mymenu" href="#">주문내역</a></li>
					<li><a class="mymenu" href="#">취소/반품/교환/환불내역</a></li>
					<li><a class="mymenu" href="#">회원정보수정</a></li>
					<li><a class="mymenu" href="#">회원탈퇴</a></li>
				</ul>
			</nav>

		</section>

		<div class="mypage-body">
			<section class="mypage">
				<table border="1">

					<col width="400" />
					<col width="100" />

					<tr>

						<th rowspan="2"><%=dto.getMember_name() %>님의 회원등급은 <%=dto.getMember_grade() %>입니다.</th>
						<th>적립금</th>
					</tr>

					<tr>
						<td><%=dto.getMember_point() %> point</td>
					</tr>
					</table>
					
					<!-- <div class="orderIng">
					<ol style="padding: 25px">
						<li class="step1">
			             	입금대기중
						</li>
						<li class="step2">
							결제완료
						</li>
						<li class="step3">
			                배송준비중
						</li>
						<li class="step4">
			                배송중
						</li>
						<li class="step5">
			                배송완료
						</li>
					</ol>
				<br> -->
				
				<table border="1">
					<colgroup>
		            <col width="100">
		            <col width="20%">
		            <col width="20%">
		            <col width="20%">
		            <col width="20%">
		            
					</colgroup>
					<tr>
						<th colspan="5">최근 본 상품</th>
					</tr>
					<tr>
						<td>최근 본 상품</td>
						<td>최근 본 상품</td>
						<td>최근 본 상품</td>
						<td>최근 본 상품</td>
						<td>최근 본 상품</td>
					</tr>
					
					</table>
					
					
				<table border="1">
					<colgroup>
		            <col width="100">
		            <col width="20%">
		            <col width="20%">
		            <col width="20%">
		            <col width="20%">
		            
					</colgroup>
					<tr>
						<th colspan="5">주문내역</th>
					</tr>
					<tr>
						<th>주문번호</th>
						<th>주문일</th>
						<th>상품명</th>
						<th>결제금액</th>
						<th>주문상태</th>
						
					</tr>
					<tr>
						<td>no</td>
						<td>date</td>
						<td>상품명</td>
						<td>금액</td>
						<td>상태</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
					</table>
				
				
			</section>
			
			<section class="mypage">
			<h1>캘린더</h1>
			
				
			
			
			</section>
			
			<section class="mypage">
							
				<%
					Order_TableBiz obiz = new Order_TableBizImpl();
					List<Order_TableDto> orderlist = obiz.selectList();
				%>

			<h1>전체주문조회</h1>
			<table border="1">
				<col width="60"/>
				<col width="60"/>
				<col width="200"/>
				<col width="40"/>
				<col width="100"/>
				<col width="100"/>
				<col width="200"/>
				
				<tr>
					<th>주문번호</th>
					<th>주문일</th>
					<th>상품명</th>
					<th>수량</th>
					<th>결제금액</th>
					<th>주문상태</th>
					<th>배송지</th>
				</tr>
								
				
			<%
				for (Order_TableDto odto : orderlist ) {
			%>
			
				<tr>
					<td><%=odto.getOrder_num() %></td>
					<td><%=odto.getOrder_date() %></td>
					<td></td>
					<td><%=odto.getOrder_quantity() %></td>
					<td><%=odto.getOrder_price() %></td>
					<td><%=odto.getOrder_step() %></td>
					<td></td>
				</tr>
			
			<%
				}
			%> 
				
				
			</table>
			</section>

			<section class="mypage">
			<h1>취소/반품/교환/환불내역</h1>
			<table border="1">
				<col width="60"/>
				<col width="60"/>
				<col width="200"/>
				<col width="40"/>
				<col width="100"/>
				<col width="100"/>
				<col width="200"/>
				
				<tr>
					<th>주문번호</th>
					<th>주문일</th>
					<th>상품명</th>
					<th>수량</th>
					<th>결제금액</th>
					<th>주문상태</th>
					<th>배송지</th>
				</tr>
			</table>
			</section>

			<section class="mypage">
				
			
			
					<table border="1">
					
						<tr>
							<th>회원정보 수정</th>
						</tr>

						<tr>
							<th>아이디 *</th>
							<td><input type="text" name="member_id"
								value="<%=dto.getMember_id() %>" readonly="readonly"></td>
						</tr>
						<tr>
							<th>비밀번호 *</th>
							<td><input type="password" name="member_password"
								onclick="idCheckConfirm();"></td>
						</tr>
						<tr>
							<th>비밀번호확인 *</th>
							<td><input type="password" name="member_password_chk"
								onclick="idCheckConfirm();"></td>
						</tr>
						<tr>
							<th>이름 *</th>
							<td><input type="text" name="member_name"
								value="<%=dto.getMember_name() %>" readonly="readonly"></td>
						</tr>
						<tr>
							<th>닉네임 *</th>
							<td><input type="text" name="member_nicname" maxlength="5"
								onclick="idCheckConfirm();"
								value="<%=dto.getMember_nicname()%>"></td>
						</tr>
						<tr>
							<th>이메일 *</th>
							<td><input type="text" id="general_signup_email" name="member_email_1" maxlength="30" onclick="idCheckConfirm();">
										@
										<select id="select_mail" name="member_email_2">
											<option>naver.com</option>
											<option>daum.net</option>
											<option>gmail.com</option>
											<option>nate.com</option>
										</select>
										<input type="button" name="email_send" value="인증번호 전송" onclick="sendmailkey();" />
							</td>
						</tr>
						<tr>
							<th>휴대폰 *</th>
							<td><input type="hidden" name="member_phone" value="">
											<input class="general_signup_phone" type="text" name="member_phone_1" maxlength="3" size="3">
											-
											<input class="general_signup_phone" type="text" name="member_phone_2" maxlength="4" size="3">
											-
											<input class="general_signup_phone" type="text" name="member_phone_3" maxlength="4" size="3">
											<input type="button" value="문자 전송" onclick="sendsms();" />
							</td>
						</tr>
						<tr>
							<th>주소 *</th>
							<td><input type="hidden" name="member_addr" value="">
								<input type="text" id="postcode" placeholder="우편번호"> <input
								type="button" onclick="address();" value="우편번호 찾기"><br>
								<input type="text" name="member_addr_1" id="addr_1"
								placeholder="기본주소" value="<%=dto.getMember_addr()%>"readonly="readonly">
								<input class="general_signup_addr" type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" required="required">
							</td>
						</tr>
						<tr>
							<th>반려동물여부</th>
							<td>
								<%
								if (dto.getMember_animal().equals("Y")) {
								%> 
								<input type="radio" name="member_animal" value="N"
								onclick="chk(this.value);">없음 <input type="radio"
								name="member_animal" value="Y" onclick="chk(this.value);"
								checked>있음
								 <%
								 } else if (dto.getMember_animal().equals("N")) {
								 %> 
								 <input type="radio" name="member_animal" value="N"
								onclick="chk(this.value);" checked>없음 <input
								type="radio" name="member_animal" value="Y"
								onclick="chk(this.value);">있음 
								<%
								 }
								 %>

							</td>
						</tr>
						</table>
						
						<%
						 if (dto.getMember_animal().equals("Y")) {
							 AnimalDto a_dto = (AnimalDto)request.getAttribute("a_dto");
						 %>
							 
						
						<div id="animal">
						<input type="hidden" name="animal_no" value="<%=a_dto.getAnimal_no()%>">
						<table border="1">
						<tr class="animal">
							<th>반려동물 정보</th>
						</tr>
						<tr class="animal">
							<th>이름 *</th>
							<td><input type="text" name="animal_name" value="<%=a_dto.getAnimal_name()%>" /></td>
						</tr>
						<tr class="animal">
							<th>성별 *</th>
							<td>
								<%
								if (a_dto.getAnimal_gen().equals("M")) {
								%> 
								<input type="radio" id="animal_gen_chk" name="animal_gen"
								value="M" checked><img src="resources/images/male.svg"
								style="width: 20px; height: 20px;"> <input type="radio"
								name="animal_gen" value="F"><img
								src="resources/images/female.svg"
								style="width: 20px; height: 20px;"> 
								<%
								 } else if (a_dto.getAnimal_gen().equals("F")) {
								 %> 
								 <input type="radio" id="animal_gen_chk" name="animal_gen"
								value="M"><img src="resources/images/male.svg"
								style="width: 20px; height: 20px;"> <input type="radio"
								name="animal_gen" value="F" checked><img
								src="resources/images/female.svg"
								style="width: 20px; height: 20px;"> 
								<%
								 } else {
								 %> 
								 <input type="radio" id="animal_gen_chk" name="animal_gen"
								value="M"><img src="resources/images/male.svg"
								style="width: 20px; height: 20px;"> <input type="radio"
								name="animal_gen" value="F"><img
								src="resources/images/female.svg"
								style="width: 20px; height: 20px;"> 
								<%
								 }
								 %>
							</td>
						</tr>
						<tr class="animal">
							<th>품종</th>
							<td><input type="text" name="animal_type" maxlength="20"
								value="<%=a_dto.getAnimal_type() %>" /></td>
						</tr>
						<tr class="animal">
							<th>나이</th>
							<td><select id="select_age" name="animal_age">
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
							</select></td>
						</tr>
						<tr class="animal">
							<th>체중</th>
							<td><select id="select_weight" name="animal_weight">
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
							</select></td>
						</tr>
						<tr class="animal">
							<th>특이사항(질병,기타사항)</th>
							<td><textarea rows="10" cols="30" name="animal_unq"><%=a_dto.getAnimal_unq() %></textarea>
							</td>
						</tr>
						</table>
						
						<script type="text/javascript">
								$(function(){
									$('#select_age').val(<%=a_dto.getAnimal_age()%>).prop("selected",true);
									$('#select_weight').val(<%=a_dto.getAnimal_weight()%>).prop("selected",true);
								});
						</script>
						
						<%
						 } else {
						%> 
							 <table border="1">
								<tr class="animal">
									<th>반려동물 정보</th>
								</tr>
								<tr class="animal">
									<th>이름 *</th>
									<td><input type="text" name="animal_name" value="" /></td>
								</tr>
								<tr class="animal">
									<th>성별 *</th>
									<td>
										 <input type="radio" id="animal_gen_chk" name="animal_gen"
										value="M"><img src="resources/images/male.svg"
										style="width: 20px; height: 20px;"> <input type="radio"
										name="animal_gen" value="F"><img
										src="resources/images/female.svg"
										style="width: 20px; height: 20px;"> 
									</td>
								</tr>
								<tr class="animal">
									<th>품종</th>
									<td><input type="text" name="animal_type" maxlength="20"
										value="" /></td>
								</tr>
								<tr class="animal">
									<th>나이</th>
									<td><select name="animal_age">
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
									</select></td>
								</tr>
								<tr class="animal">
									<th>체중</th>
									<td><select name="animal_weight">
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
									</select></td>
								</tr>
								<tr class="animal">
									<th>특이사항(질병,기타사항)</th>
									<td><textarea rows="10" cols="30" name="animal_unq"></textarea>
									</td>
								</tr>
								</table>
								</div>
								
					<%
						 }
					%>
						<table border="1">
						<tr>
							<td colspan="9" align="right">
							<input type="button"
								value="회원정보수정" onclick="#"/>
								<input type="button" value="취소"
								onclick="location.href='index.jsp'" /></td>
						</tr>
					</table>
			</section>
			
	<script type="text/javascript">
		var phone = "<%=dto.getMember_phone()%>";
		var phonesplit = phone.split('-');
		var phonenum = document.getElementsByClassName("general_signup_phone");
		for(var i = 0 ; i < phonesplit.length; i++) {
		    phonenum[i].value = phonesplit[i];
		}
		$(function(){
		var email = "<%=dto.getMember_email()%>";
		var emailsplit = email.split('@');
			document.getElementById("general_signup_email").value = emailsplit[0];
			$('#select_email').val(emailsplit[1]).prop("selected",true);
		});
		
		
		
	</script>
			
	

			<section class="mypage">

				<h1>회원탈퇴</h1>
					<table border="1">
						<col width="200" />
						<tr>
							<th>회원정보</th>
						</tr>

						<tr>
							<th>아이디</th>
							<td><input type="text" name="member_id" title="n"
								readonly="readonly" value="<%=dto.getMember_id() %>" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="member_password"
								onclick="idCheckConfirm();"></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password" name="member_password_chk"
								onclick="idCheckConfirm();"> 
								<font id="chkNotice" size="2"></font></td>
						</tr>
						<tr>
							<td colspan="5" align="center">
							<input type="button" value="회원탈퇴" onclick="semi.do?command=memberdel&member_id=${dto.member_id }"/></td>
						</tr>
					</table>
			</section>
		</div>
		</form>
		
		
	
	
	<jsp:include page="bottom.jsp" />
</body>
</html>