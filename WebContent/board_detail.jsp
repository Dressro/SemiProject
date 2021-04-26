<%@page import="com.project.fp.dto.File_TableDto"%>
<%@page import="com.project.fp.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#down{
	cursor: pointer;
	width:270px;
	}
	#down:hover{color:red;}
	#text{
		pointer-events: none;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<% BoardDto b_dto = (BoardDto)request.getAttribute("b_dto");
File_TableDto f_dto = (File_TableDto)request.getAttribute("f_dto");
%>		
<%if(f_dto!=null){ %>
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
		if("<%=b_dto.getBoard_category()%>"=="F"){
			$('input[name=board_category]').val("자유게시판");
		}else if("<%=b_dto.getBoard_category()%>"=="N"){
			$('input[name=board_category]').val("공지사항");
		}else if("<%=b_dto.getBoard_category()%>"=="Q"){
			$('input[name=board_category]').val("상품문의");
		}else if("<%=b_dto.getBoard_category()%>"=="D"){
			$('input[name=board_category]').val("실종신고");
		}
	});
</script>
</head>
<body>

	<h1>Detail</h1>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="<%=b_dto.getMember_id()%>" />
		<input type="hidden" name="command" value="board_updateres" />
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						닉&nbsp;네&nbsp;임&nbsp; : <input type="text" name="member_id" value="<%=b_dto.getMember_id() %>" readonly="readonly">
						<div class="input-group mb-3">
							
							제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : <input type="text" class="form-control" name="board_title" size="100" value="<%=b_dto.getBoard_title()%>" readonly="readonly">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							카테고리 : <input type="text" name="board_category" value="" readonly="readonly">
						</div>
						<div align="right">
							<%if(f_dto!=null){ %>
							<div id="down" onclick="filedown();"><%=f_dto.getFile_ori_name() %>(<%=f_dto.getFile_size() %>)</div>
							<%} %>
						</div>
					</div>
				</div>
				<hr>
				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<div contentEditable="true" id="text">
 					 			<%=b_dto.getBoard_content() %>
							</div>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="custom-file">
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="location.href='semi.do?command=deleteres&board_no=<%=b_dto.getBoard_no()%>'">삭  제</button>
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;" onclick="location.href='semi.do?command=board_updateform&board_no=<%=b_dto.getBoard_no()%>'">수  정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<br/>
	<br/>
	<br/>
	<br/>

	
	<!-- 댓글 목록 (작성자닉네임, 작성자/로그인상태 확인) -->
	<div id="replyList">
		<table id="replyListTable">
			<c:choose>
				<c:when test="${empty b_r_list }">
					<tr>
						<td>--------작성된 댓글이 없습니다.-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="replyList" items="${b_r_list }">
					
						<c:if test="${replyList.reply_delflag eq 'Y' }">
							
							<tr>
								<td>
									<textarea rows="2" cols="60" disabled="disabled">----삭제된 댓글입니다----</textarea>
								</td>
							</tr>
							
						</c:if>
						
						<c:if test="${replyList.reply_delflag eq 'N' }">
							<tr>
								<td>${replyList.reply_nicname }
								<fmt:formatDate value="${replyList.reply_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
							<tr>
								<td><textarea rows="4" cols="60" disabled="disabled" name="${replyList.reply_no }" class="reply_content${replyList.reply_no }">${replyList.reply_content }</textarea></td>
							</tr>
							<tr>
								<td>
									<c:if test="${replyList.reply_nicname == dto.member_nicname }">
										<input type="button" value="수정" class="replyUpdate" id="replyUpdate${replyList.reply_no }" name="${replyList.reply_no }">
									</c:if>
							
									<c:if test="${replyList.reply_nicname == dto.member_nicname }">
										<input type="button" value="삭제" class="replyDelete" name="${replyList.reply_no }">
									</c:if>							 
								
									<c:if test="${dto ne null }">
										<input type="button" value="답글달기" class="r_replyUpload" name="${dto.member_nicname }">
									</c:if>								
								</td>
							</tr>
						</c:if>
						
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<br/>
	<br/>
	<br/>
	
	<!-- 댓글 작성 -->
	<div id="replyWrite">
		<table id="replyWriteTable">
			
			<c:choose>
				<c:when test="${dto ne null }">
					<tr>
						<th>${dto.member_nicname }</th>
						<td><textarea rows="3" cols="80" name="reply_content" class="reply_content"></textarea></td>
					</tr>
					<tr>
						<td><input type="button" value="등록" class="replyUpload" name="${dto.member_nicname }"></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td><textarea rows="2" cols="60" disabled="disabled" placeholder="로그인한 사용자만 댓글을 입력할 수 있습니다."></textarea></td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</table>
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
			$(".reply_content"+reply_no).attr("disabled",false);

			
			$(".replyDelete").hide();
			$(".r_replyUpload").hide();

			$(this).attr("value", "수정완료").click(function(){
				var reply_content = $(".reply_content"+reply_no).val();
				
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
		
		// 삭제 버튼 눌렀을 때
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
		
		// 답글달기 버튼 눌렀을 때
		$(".r_replyUpload").click(function(){
			var member_nicname = $(this).attr("name");
			var reply_no = $(this).parent().parent().prev().children().children().attr("name");
			alert(reply_no);
			$(".replyDelete").hide();
			$(".r_replyUpload").hide();
			$(".replyUpdate").hide();
			
			var replyEditor = '<tr>'
							+ '<th><i class="fas fa-comment-dots"></i></th>'
							+ '</tr>'
							+ '<tr>'
							+ '<td style="padding-left:10px">'
							+ '<td><textarea rows="3" cols="80" name="reply_content" class="r_reply_content"></textarea><input type="button" value="답글등록" class="r_reply_test"></td>'
							+ '</tr>';					
			$(this).after(replyEditor);
			
			$(".r_reply_test").click(function(){
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
			});
		});
		
	});
		
	</script>
	
</body>
</html>