
<%@page import="com.project.fp.dto.AnimalDto"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script type="text/javascript">
</script>
</head>
<jsp:include page="header.jsp" />
<body>

<%
MemberDto dto = (MemberDto)request.getAttribute("dto");
%>

					<form action="semi.do" method="post">
					<input type="hidden" name="command" value="memberupdate">
					
					 
					<table border="1">
						<tr>
							<th>회원정보 조회</th>
						</tr>

						<tr>
							<th>아이디 *</th>
							<td><input type="text" name="member_id"
								value="<%=dto.getMember_id() %>" readonly="readonly"></td>
						</tr>
						<tr>
							<th>이름 *</th>
							<td><input type="text" name="member_name"
								value="<%=dto.getMember_name() %>" readonly="readonly"></td>
						</tr>
						<tr>
							<th>닉네임 *</th>
							<td><input type="text" name="member_nicname" maxlength="5"
								value="<%=dto.getMember_nicname()%>"></td>
						</tr>
						<tr>
							<th>이메일 *</th>
							<td><input type="hidden" name="member_email" value="">
								<input type="text" name="member_email_1" maxlength="30"
								onclick="idCheckConfirm();" value="<%=dto.getMember_email()%>">
							</td>
						</tr>
						<tr>
							<th>휴대폰 *</th>
							<td><input type="text" name="member_phone"
								readonly="readonly" value="<%=dto.getMember_phone()%>" >
							</td>
						</tr>
						<tr>
							<th>주소 *</th>
							<td><input type="hidden" name="member_addr" value="">
								<input type="text" id="postcode" placeholder="우편번호"> <input
								type="button" onclick="address();" value="우편번호 찾기"><br>
								<input type="text" name="member_addr_1" id="addr_1"
								placeholder="기본주소" value="<%=dto.getMember_addr()%>">
							</td>
						</tr>
						<tr>
							<th>반려동물여부</th>
							<td>
								<%
								if (dto.getMember_animal().equals("Y")) {
									
								%> 
								<input type="radio" name="member_animal" value="N">없음 
								<input type="radio" name="member_animal" value="Y" checked >있음
								 <%
								 } else if (dto.getMember_animal().equals("N")) {
								 %> 
								 <input type="radio" name="member_animal" value="N" checked >없음 
								 <input type="radio" name="member_animal" value="Y">있음 
								<%
								 }
								 %>

							</td>
						</tr>
						</table>
						
						<%
						 if (dto.getMember_animal().equals("Y")){
							 AnimalDto a_dto = (AnimalDto)request.getAttribute("a_dto");
							
						%>
						<input type="hidden" name="animal_no" value="<%=a_dto.getAnimal_no()%>">
						<table border="1">
						<tr class="animal">
							<th><h3>반려동물 정보</h3></th>
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
							<td><input type="text" name="animal_age" value="<%=a_dto.getAnimal_age() %>"></td>
						</tr>
						<tr class="animal">
							<th>체중</th>
							<td><input type="text" name="animal_weight" value="<%=a_dto.getAnimal_weight() %>"></td>
						</tr>
						<tr class="animal">
							<th>특이사항(질병,기타사항)</th>
							<td><textarea rows="10" cols="30" name="animal_unq"><%=a_dto.getAnimal_unq() %></textarea>
							</td>
						</tr>
						
						<%
						 }
						%>
						
						<tr>
							<td colspan="9" align="right">
								<input type="submit" value="회원정보수정"/> 
								<input type="button" value="취소" onclick="#" /></td>
						</tr>
					</table>
				</form>
	<jsp:include page="bottom.jsp" />
	
	
</body>
</html>