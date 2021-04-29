<%@page import="com.project.fp.dto.ChatDto"%>
<%@page import="java.util.List"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/head.css" rel=stylesheet type="text/css" />
<link href="resources/css/footer.css" rel=stylesheet type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.mymenus li').click(function() {
			$('.mymenus li').find('a').removeClass('active');
			$(this).find('a').addClass('active');
			$('.mypage').hide();
			var i = $(this).index();
			$('.mypage').eq(i).show();
		});
		$('.mymenus li').eq(0).trigger('click');
		
		$('.mymenu').eq(1).click(function () {
			refresh();
		});
	});
	function refresh() {
		var member_grade = $('#member_grade').val();
		var member_id = $('#member_id').val();
		if(member_grade == '개인'){
			$.ajax({
				url:"semi.do",
				method:"post",
				data:{command:"chatlist_chat",member_grade:member_grade,member_id:member_id},
				dataType:"json",
				success:function(msg){
					$('.chat_ul').empty();
					var list = msg.result;
					console.log(list);
					for(var i = 0; i < list.length; i++){
						var $li = $("<li class='Doctor_list' ondblclick='chat_go("+list[i].ch_num+");'>");
						$li.append($("<div class='Doctor_list_info'><span>"+list[i].doctor_id+" 님과의 채팅방 </span></div>"));
						$li.append($("<div class='Doctor_list_info'><span>"+list[i].ch_date+"</span></div>"));
						$li.append($("<button type='button' onclick='chat_delete("+list[i].ch_num+");'>채팅방 삭제</button>"));
						$('.chat_ul').append($li);
					}
				},
				error(){
					alert("통신 실패");
				}		
			});
		} else if(member_grade == '전문의'){
			$.ajax({
				url:"semi.do",
				method:"post",
				data:{command:"chatlist_chat",member_grade:member_grade,member_id:member_id},
				dataType:"json",
				success:function(msg){
					$('.chat_ul').empty();
					var list = msg.result;
					console.log(list);
					for(var i = 0; i < list.length; i++){
						var $li = $("<li class='Doctor_list' ondblclick='chat_go("+list[i].ch_num+");'>");
						$li.append($("<div class='Doctor_list_info'><span>"+list[i].member_id+" 님과의 채팅방 </span></div>"));
						$li.append($("<div class='Doctor_list_info'><span>"+list[i].ch_date+"</span></div>"));
						$li.append($("<button type='button'>채팅방 삭제</button>"));
						$('.chat_ul').append($li);
					}
				},
				error(){
					alert("통신 실패");
				}		
			});
		}
	}
</script>
<style type="text/css">
#chat_mid{
	width: 1200px;
	margin: 0 auto;
	min-height: 1000px;
}

.Doctor_list {
	height: 100px;
	width: 100%;
	border-top: 1px solid #dadada;
}
.Doctor_list:last-child{
	border-bottom: 1px solid #dadada;
}
.Doctor_list:hover{
	background: #e2e2e2;
}

.Doctor_list_div {
	float: left;
	line-height: 35px;
	text-align: center;
	width: 100px;
	height: 100%;
}

.Doctor_list_info {
	padding: 5px;
	font-size: 14px;
	font-weight: bolder;
}
</style>
</head>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");
String member_grade = (String) request.getAttribute("member_grade");
%>
<body>
	<jsp:include page="header.jsp" />
	<div id="semipage">
		<input type="hidden" id="member_grade" value="<%=member_grade %>"/>
		<!-- 전문의 회원이 아닌 아이디 -->
		<input type="hidden" id="member_id" value="<%=dto.getMember_id()%>"/>
		<div id ="chat_mid">
			<section>
				<nav>
					<ul class="mymenus">
						<li><a class="mymenu" href="#">전문의</a></li>
						<li><a class="mymenu" href="#">채팅방</a></li>
					</ul>
				</nav>

			</section>
			<div>
				<section class="mypage">
						<c:choose>
							<c:when test="${empty m_list }">
								<span>현재 회원중에 전문의가 없습니다.</span>
							</c:when>
							<c:otherwise>
								<ul class = "Doctor_ul">
								<c:forEach items="${m_list }" var="m_dto">
									<li class="Doctor_list"  ondblclick="chat_create('${m_dto.member_id}');">
										<div class = "Doctor_list_div">
											img
										</div>
										<div class="Doctor_list_info">
											<span>${m_dto.member_name }</span>	
										</div>
										<div class="Doctor_list_info">
											<span>${m_dto.member_dr_info}</span>	
										</div>
									</li>
								</c:forEach>
								</ul>
							</c:otherwise>
						</c:choose>
				</section>
			</div>
			<script type="text/javascript">
			function chat_create(id) {
				var doctor_id = id;
				var member_id = $('#member_id').val();
				$.ajax({
					url:"semi.do",
					method:"post",
					data:{command:"chat_board_insert",member_id:member_id,doctor_id:doctor_id},
					dataType:"text",
					success: function(data){
						alert(data);
					},
					error(){
						alert("통신 실패");
					}
				});
			}
			</script>
			<div>
				<section class="mypage">
						<c:choose>
							<c:when test="${empty m_list }">
								<span>현재 채팅방이 없습니다.</span>
							</c:when>
							<c:otherwise>
								<ul class = "chat_ul">
								</ul>
							</c:otherwise>
						</c:choose>
				</section>
			</div>
		</div>
		<script type="text/javascript">
			function chat_go(num) {
				var ch_num = num;
				open("semi.do?command=chatboard&ch_num="+ch_num,"",
				"width=800 , height=800");
			}
			function chat_delete(num) {
				var ch_num = num;
				var del = confirm('채팅방 삭제 하겠습니까?');
				if(del){
					$.ajax({
						url:"semi.do",
						method:"post",
						data:{command:"chat_del",ch_num:ch_num},
						dataType:"text",
						success:function(msg){
							alert(msg);
							refresh();
						},
						error(){
							alert("통신 실패");
						}
						
					});
				}else{
					alert("취소");
				}
			}
		</script>

		<jsp:include page="bottom.jsp" />
	</div>
</body>
</html>