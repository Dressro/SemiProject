<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>

</head>

<body>

		<form action="semi.do" method="post">
					<input type="hidden" name="command" value="memberdetail">
					<table border="1">
						<tr>
							<th>회원정보 수정</th>
						</tr>

						<tr>
							<th>아이디 *</th>
							<td>${member_id}</td>
						</tr>
						<tr>
							<th>이름 *</th>
							<td><input type="text" name="member_name"
								onclick="idCheckConfirm();" 
								value="${member_name}"></td>
						</tr>
						<tr>
							<th>닉네임 *</th>
							<td><input type="text" name="member_nicname" maxlength="5"
								onclick="idCheckConfirm();"
								value="${member_nicname}"></td>
						</tr>
						<tr>
							<th>이메일 *</th>
							<td><input type="hidden" name="member_email" value="">
								<input type="text" name="member_email_1" maxlength="30"
								onclick="idCheckConfirm();" value="${member_email}">
							</td>
						</tr>
						<tr>
							<th>휴대폰 *</th>
							<td><input type="text" name="member_phone"
								readonly="readonly" value="${member_phone}" >
							</td>
						</tr>
						<tr>
							<th>주소 *</th>
							<td><input type="hidden" name="member_addr" value="">
								<input type="text" id="postcode" placeholder="우편번호"> <input
								type="button" onclick="address();" value="우편번호 찾기"><br>
								<input type="text" name="member_addr_1" id="addr_1"
								placeholder="기본주소" value="${member_addr}">
							</td>
						</tr>
						<tr>
							<th>반려동물여부</th>
							<td>
								<%
								if (("${member_animal}").equals("Y")) {
								%> 
								<input type="radio" name="member_animal" value="N">없음 
								<input type="radio" name="member_animal" value="Y">있음
								 <%
								 } else if (("${member_animal}").equals("N")) {
								 %> 
								 <input type="radio" name="member_animal" value="N">없음 
								 <input type="radio" name="member_animal" value="Y">있음 
								<%
								 }
								 %>

							</td>
						</tr>

						<tr class="animal">
							<th><h1>반려동물 정보</h1></th>
						</tr>
						<tr class="animal">
							<th>이름 *</th>
							<td><input type="text" name="animal_name" value="${animal_name}" /></td>
						</tr>
						<tr class="animal">
							<th>성별 *</th>
							<td>
								<%
								if (("${animal_gen}").equals("M")) {
								%> 
								<input type="radio" id="animal_gen_chk" name="animal_gen"
								value="M" checked><img src="resources/images/male.svg"
								style="width: 20px; height: 20px;"> <input type="radio"
								name="animal_gen" value="F"><img
								src="resources/images/female.svg"
								style="width: 20px; height: 20px;"> 
								<%
								 } else if (("${animal_gen}").equals("F")) {
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
								value="${animal_type}" /></td>
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
						<tr>
							<td colspan="9" align="right">
								<input type="submit" value="회원정보수정" /> 
								<input type="button" value="취소" onclick="#" /></td>
						</tr>
					</table>
				</form>

</body>
</html>