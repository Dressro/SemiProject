<%@page import="com.project.fp.dto.File_TableDto"%>
<%@page import="com.project.fp.dto.BoardDto"%>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.semiproject_board{
	width:1000px;
	margin: 0 auto;
	min-height: 800px;
}
.board_main{
	min-height: 500px;
	padding-right: 70px;
}
.board_category, .board_date{
	margin-left : 10px;
	display: block;
	height: 15px;
}
.board_category_input{
	position : relative;
	padding : 0px;
	height:15px;
	font-size: 10px;
	font-weight: bolder;
	display: block;
	border: none;
	color: green;
}
.board_info_date{
	position : relative;
	padding : 0px;
	height:15px;
	font-size: 10px;
	font-weight: bolder;
	display: block;
	border: none;
	color: #adadad;
}
.board_title{
	display: block;
}
.board_title_input{
	border: none;
	font-weight: bold;
	font-size: 30px;
}
.board_content{
	min-height: 400px;
}
.board_button_div{
	float: right;
}
#down {
	cursor: pointer;
	width: 270px;
}

#down:hover {
	color: red;
}

#text {
	pointer-events: none;
}

.replyListParent {
	margin-left: 20px;
	border: 1px solid black;
	width: 350px;
	padding: 2px 12px 2px 12px;
}

.replyListChild {
	margin-left: 60px;
	border: 1px solid black;
	width: 500px;
	padding: 2px 12px 2px 12px;
}

#replyWrite {
	height: 30px;
}

#reply_nickname {
	float: left;
	width: 7%;
	height: 30px;
	text-align: center;
}

#reply_span {
	display: inline-block;
	text-align: center;
	height: 30px;
}

#reply_regist {
	height: 30px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<%BoardDto b_dto = (BoardDto) request.getAttribute("b_dto");
File_TableDto f_dto = (File_TableDto) request.getAttribute("f_dto");%>		
<%if (f_dto != null) {%>
	function filedown(){
		var url = "semi.do?command=filedown&file_path=<%=f_dto.getFile_path()%>&file_new_name=<%=f_dto.getFile_new_name()%>";
		$(location).attr('href',encodeURI(url));
	}
	
<%}%>
	$(function(){
		var text_html = $("textarea").html();
		var find_html_1 = "&lt;img";
		var find_html_2 = "&gt;"
		if(text_html!=null){
			if(text_html.indexOf(find_html_1)!=-1){
			var i = text_html.split(find_html_1);
			var j = i[1].split(find_html_2);
			var res =  "<img"+j[0] + ">";
			$("text").append(res);
			}
		}
		$('input[name=board_category]').val("자유게시판");
		
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="semiproject_board">
		<div class="board_main">
		<form action="semi.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="board_updateres" />
		
				<div>
					<div class="board_category">
						<span class="board_category">
							<input class="board_category_input" type="text" name="board_category" value="" readonly="readonly">
						</span>
						
					</div>
					<div class="board_info">
						<div>
							<span class="board_title">
								<input class="board_title_input" type="text" name="board_title" size="100" value="게시판 제목 테스트중" readonly="readonly">
							</span>
						</div>
						<div>
							<span>
								작&nbsp;성&nbsp;자&nbsp; :
							</span>
							<span>
								<input style="border:none" type="text" name="member_id" value="dress" readonly="readonly">
							</span>
						</div>
						<div class="board_date">
							<span class="board_date">
								<input class="board_info_date" type="text" name="member_id" value="2021.04.30 03:32" readonly="readonly">
							</span>
						</div>
					</div>
					<div >
						<div align="right">
							<%
							if (f_dto != null) {
							%>
							<div id="down" onclick="filedown();"><%=f_dto.getFile_ori_name()%>(<%=f_dto.getFile_size()%>)
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
				<hr>
				<div class="board_content">
						<p>test</p>
						<p>지금이 나은가?</p>
						<p>모르겠다.</p>
			
				</div>
				<hr>
				<div>
					<div class="board_button_div">
						<div>
							<c:if test="${b_dto.member_id == dto.member_nicname || dto.member_grade eq '관리자' }">
								<button type="button" class="btn btn-outline-secondary" style="float: right; font-weight: bold" onclick="location.href='semi.do?command=deleteres'">삭 제</button>
							</c:if>
							<c:if test="${b_dto.member_id == dto.member_nicname }">
								<button type="button" class="btn btn-outline-secondary" style="float: right; margin-right:5px; font-weight: bold" onclick="location.href='semi.do?command=board_updateform'">수 정</button>
							</c:if>
						</div>
					</div>
				</div>
		</form>
		</div>




		<br /> <br /> <br /> <br />


		<div>
			<c:choose>
				<c:when test="${empty b_r_list }">
					<p>--------작성된 댓글이 없습니다.----------</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="replyList" items="${b_r_list }">
						<c:if test="${replyList.reply_groupseq eq 1}">
							<div class="replyListParent">
								<div>${replyList.reply_nicname }</div>
								<div>
									<fmt:formatDate value="${replyList.reply_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
								<hr />
								<div>
									<c:if test="${replyList.reply_delflag eq 'Y' }">
									----삭제된 댓글입니다----
								</c:if>
								</div>

								<c:if test="${replyList.reply_delflag eq 'N' }">
									<div>
										<textarea rows="4" cols="35" disabled="disabled" name="${replyList.reply_no }" class="reply_content${replyList.reply_no }">${replyList.reply_content }</textarea>
									</div>
									<div>
										<c:if test="${replyList.reply_nicname == dto.member_nicname }">
											<input type="button" value="수정" class="replyUpdate" name="${replyList.reply_no }">
										</c:if>
										<c:if test="${replyList.reply_nicname == dto.member_nicname || dto.member_grade eq '관리자' }">
											<input type="button" value="삭제" class="replyDelete" name="${replyList.reply_no }">
										</c:if>
										<c:if test="${dto ne null }">
											<input type="button" value="답글달기" class="r_replyUpload" name="${dto.member_nicname }">
										</c:if>
									</div>
								</c:if>


							</div>
							<br />
						</c:if>
						<c:if test="${replyList.reply_groupseq ne 1}">
							<div class="replyListChild">
								<div>ㄴ${replyList.reply_nicname }</div>
								<div>
									<fmt:formatDate value="${replyList.reply_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
								<hr />
								<div>
									<c:if test="${replyList.reply_delflag eq 'Y' }">
									----삭제된 댓글입니다----
								</c:if>
								</div>

								<c:if test="${replyList.reply_delflag eq 'N' }">
									<div>
										<textarea rows="4" cols="35" disabled="disabled" name="${replyList.reply_no }" class="reply_content${replyList.reply_no }">${replyList.reply_content }</textarea>
									</div>
									<div>
										<c:if test="${replyList.reply_nicname == dto.member_nicname }">
											<input type="button" value="수정" class="replyUpdate" name="${replyList.reply_no }">
										</c:if>
										<c:if test="${replyList.reply_nicname == dto.member_nicname || dto.member_grade eq '관리자' }">
											<input type="button" value="삭제" class="replyDelete" name="${replyList.reply_no }">
										</c:if>
										<c:if test="${dto ne null }">
											<input type="button" value="답글달기" class="r_replyUpload" name="${dto.member_nicname }">
										</c:if>
									</div>
								</c:if>
							</div>
							<br />
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>


		<br /> <br />


		<!-- 댓글 작성 -->
		<div id="replyWrite">

			<c:choose>
				<c:when test="${dto ne null }">
					<div id=reply_nickname>${dto.member_nicname }</div>
					<div id=reply_regist>
						<span id=reply_span>
							<textarea rows="1" cols="80" name="reply_content" class="reply_content"></textarea>

							<input type="button" value="등록" class="replyUpload" name="${dto.member_nicname }">
						</span>
					</div>

				</c:when>
				<c:otherwise>
					<tr>
						<td>
							<textarea rows="2" cols="60" disabled="disabled" placeholder="로그인한 사용자만 댓글을 입력할 수 있습니다."></textarea>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



	<script type="text/javascript">
		
		$(document).ready(function(){

			// 등록 버튼 눌렀을 때
			$(".replyUpload").click(function(){

				var member_nicname = $(this).attr("name");
				var reply_content = $(".reply_content").val();
				var board_no = "${b_dto.board_no}";
				
				if(reply_content == "") {
					alert("댓글을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url: "semi.do?command=replyUpload",
					data: {
						member_nicname : member_nicname,
						reply_content : reply_content,
						board_no : board_no
					},
					success: function(){
						alert("댓글 등록 성공");
						location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
					}
					
					
				});
				
			});
			
			// 수정 버튼 눌렀을 때
			$(".replyUpdate").click(function(){
				var reply_no = $(this).attr("name");
				$(this).attr("value", "수정완료");
				$(this).parent().prev().children().attr("disabled",false);
				
				$(this).siblings().hide();
				
				$(this).attr("value", "수정완료").click(function(){
					var reply_content = $(this).parent().prev().children().val();
					
					$.ajax({
						type:"post",
						url:"semi.do?command=replyUpdate",
						data: {
							reply_no : reply_no,
							reply_content : reply_content
						},
						success: function(){
							alert("댓글 수정 완료");
							location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
						}
					});
				});

			});
			
			// 삭제 버튼 눌렀을때
			$(".replyDelete").click(function(){
				var reply_no = $(this).attr("name");
				
				$.ajax({
					type:"post",
					url: "semi.do?command=replyDelete",
					data: {
						reply_no : reply_no
					},
					success: function(){
						alert("댓글 삭제 성공");
						location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
					}
				});
			});
			
			// 답변 버튼 눌렀을때
			$(".r_replyUpload").click(function(){
				var member_nicname = $(this).attr("name");
				var reply_no = $(this).parent().prev().children().attr("name");
				$(this).siblings().hide();
				var replyEditor = '<div style="margin-left: 90px; width:350px; padding: 2px 12px 2px 12px;">'
								+ '<div>'
								+ '<textarea rows="4" cols="35" class="r_reply_content"></textarea>'
								+ '<div>'
								+ '<div>'
								+ '<input type="button" value="답글등록" class="r_reply_regist">'
								+ '</div>'
								+ '</div>';
				$(this).after(replyEditor);
				
				$(".r_reply_regist").click(function(){
					var r_reply_content = $(".r_reply_content").val();
					$.ajax({
						type:"post",
						url: "semi.do?command=r_reply_upload",
						data: {
							member_nicname : member_nicname,
							r_reply_content : r_reply_content,
							reply_no : reply_no
						},
						success: function(){
							alert("답변 작성 성공");
							location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
						}
					});
				})
			});
			
			
		});
	
	</script>


	<jsp:include page="bottom.jsp" />
</body>
</html>