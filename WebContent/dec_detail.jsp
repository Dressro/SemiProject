<%@page import="com.project.fp.dto.Lost_AnimalDto"%>
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
<title>Family|Pet</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56&libraries=services,clusterer,drawing"></script>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<style type="text/css">
.semiproject_board {
	width: 1000px;
	margin: 0 auto;
	min-height: 800px;
}

.board_main {
	min-height: 500px;
	padding-right: 70px;
}

.board_category, .board_date {
	margin-left: 10px;
	display: block;
	height: 15px;
}

.board_category_input {
	position: relative;
	padding: 0px;
	height: 15px;
	font-size: 10px;
	font-weight: bolder;
	display: block;
	border: none;
	color: green;
}

.board_info_date {
	position: relative;
	padding: 0px;
	height: 15px;
	font-size: 10px;
	font-weight: bolder;
	display: block;
	border: none;
	color: #adadad;
}

.board_title {
	display: block;
}

.board_title_input {
	border: none;
	font-weight: bold;
	font-size: 30px;
}

.board_file {
	position: relative;
	width: 100%;
	padding-right: 15px;
	padding-left: 0px;
	margin-top: 10px;
}

.board_content {
	min-height: 400px;
}

.board_button_div {
	float: right;
}

#down {
	color: blue;
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
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	width: 100%;
	padding-right: 70px;
	padding-bottom: 10px;
}

.replyListChild {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	width: 100%;
	padding-right: 70px;
	padding-bottom: 10px;
	padding-top: 5px;
}

.replyListChild_child {
	margin-left: 30px;
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

.comment {
	width: 100%;
	height: 40px;
	padding-right: 70px;
}

.comment_btn {
	float: right;
}

.comment_nicname {
	float: left;
	width: 65px;
}

.comment_text {
	width: 85%;
}

.comment_watch {
	min-height: 50px;
}

.reply_content {
	width: 100%;
}

.board_comment_date {
	position: relative;
	padding: 0px;
	height: 15px;
	font-size: 10px;
	font-weight: bolder;
	display: inline-block;
	border: none;
	color: #adadad;
}

.replyUpdate, .replyDelete, .r_replyUpload {
	background-color: transparent;
	border: 0px transparent solid;
	padding: 0px;
	height: 15px;
	font-size: 10px;
	font-weight: bolder;
	display: inline-block;
	border: none;
	color: #adadad;
}

#map {
	width: 100%;
	height: 400px;
	margin-bottom: 15px;
	margin-top: 25px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<%BoardDto b_dto = (BoardDto) request.getAttribute("b_dto");
File_TableDto f_dto = (File_TableDto) request.getAttribute("f_dto");
Lost_AnimalDto l_dto = (Lost_AnimalDto) request.getAttribute("l_dto");
%>		
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
		if("<%=b_dto.getBoard_category()%>"=="F"){
			$('input[name=board_category]').val("???????????????");
		}else if("<%=b_dto.getBoard_category()%>"=="N"){
			$('input[name=board_category]').val("????????????");
		}else if("<%=b_dto.getBoard_category()%>"=="Q"){
			$('input[name=board_category]').val("????????????");
		}else if("<%=b_dto.getBoard_category()%>"=="D"){
			$('input[name=board_category]').val("????????????");
		}
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="semiproject_board">
		<div class="board_main">
			<form action="semi.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="member_id" value="<%=b_dto.getMember_id()%>" />
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
								<input class="board_title_input" type="text" name="board_title" size="100" value="<%=b_dto.getBoard_title()%>" readonly="readonly">
							</span>
						</div>
						<div>
							<span> ???&nbsp;???&nbsp;???&nbsp; : </span>
							<span>
								<input style="border: none" type="text" name="member_id" value="<%=b_dto.getMember_id()%>" readonly="readonly">
							</span>
						</div>
						<div class="board_date">
							<span class="board_date">
								<span class="board_info_date">
									<fmt:formatDate value="<%=b_dto.getBoard_regdate()%>" pattern="yyyy.MM.dd hh:mm" />
								</span>
							</span>
						</div>
					</div>
					<div class="board_file">
						<div>
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
				
				<h5 style="font-weight: bold;">??????</h5>
				<div id="map"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56"></script>
				<script>
					var lost_lat = '${l_dto.lost_lat}';
					var lost_lng = '${l_dto.lost_lng}';
					var mapContainer = document.getElementById('map'), // ????????? ????????? div 
					
				    mapOption = { 
				            center: new kakao.maps.LatLng(lost_lat, lost_lng), // ????????? ????????????
				            level: 3 // ????????? ?????? ??????
				        };
					
				    var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????
				    
				 	// ????????? ????????? ??????????????? 
				 	var markerPosition  = new kakao.maps.LatLng(lost_lat, lost_lng); 
				 
					// ????????? ???????????????
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					
					// ????????? ?????? ?????? ??????????????? ???????????????
					marker.setMap(map);
					
				</script>
				
				<hr>
				<div class="board_content">
					<%=b_dto.getBoard_content()%>
				</div>
				<hr>
				<div class="board_button_div">
					<div>
						<c:if test="${b_dto.member_id == dto.member_nicname || dto.member_grade eq '?????????' }">
							<button type="button" class="btn btn-outline-secondary" style="float: right; font-weight: bold" onclick="location.href='semi.do?command=deleteres&board_no=<%=b_dto.getBoard_no()%>'">??? ???</button>
						</c:if>
						<c:if test="${b_dto.member_id == dto.member_nicname }">
							<button type="button" class="btn btn-outline-secondary" style="float: right; font-weight: bold; margin-right: 10px;" onclick="location.href='semi.do?command=dec_updateform&board_no=<%=b_dto.getBoard_no()%>'">??? ???</button>
						</c:if>

					</div>
				</div>

			</form>
		</div>



		<br /> <br /> <br /> <br />


		<div class="comment_watch">
			<c:choose>
				<c:when test="${empty b_r_list }">
					<p>--------????????? ????????? ????????????.----------</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="replyList" items="${b_r_list }">
						<c:if test="${replyList.reply_groupseq eq 1}">
							<div class="replyListParent">
								<div>
									<div>${replyList.reply_nicname }</div>
								</div>
								<div>
									<c:if test="${replyList.reply_delflag eq 'Y' }">
									----????????? ???????????????----
								</c:if>
								</div>

								<c:if test="${replyList.reply_delflag eq 'N' }">
									<div>
										<div>
											<textarea rows="1" cols="80" disabled="disabled" name="${replyList.reply_no }" class="reply_content">${replyList.reply_content }</textarea>
										</div>
										<div>
											<span class="board_comment_date">
												<fmt:formatDate value="${replyList.reply_regdate}" pattern="yyyy-MM-dd HH:mm" />
											</span>
											<c:if test="${replyList.reply_nicname == dto.member_nicname }">
												<input type="button" value="??????" class="replyUpdate" name="${replyList.reply_no }">
											</c:if>
											<c:if test="${replyList.reply_nicname == dto.member_nicname || dto.member_grade eq '?????????' }">
												<input type="button" value="??????" class="replyDelete" name="${replyList.reply_no }">
											</c:if>
											<c:if test="${dto ne null }">
												<input type="button" value="????????????" class="r_replyUpload" name="${dto.member_nicname }">
											</c:if>
										</div>

									</div>
								</c:if>
							</div>
						</c:if>
						<c:if test="${replyList.reply_groupseq ne 1}">
							<div class="replyListChild">
								<div class="replyListChild_child">
									<div>
										<div>???${replyList.reply_nicname }</div>
									</div>
									<div>
										<c:if test="${replyList.reply_delflag eq 'Y' }">
									----????????? ???????????????----
										</c:if>
									</div>

									<c:if test="${replyList.reply_delflag eq 'N' }">
										<div>
											<div>
												<textarea rows="1" cols="80" disabled="disabled" name="${replyList.reply_no }" class="reply_content">${replyList.reply_content }</textarea>
											</div>
											<div>

												<span class="board_comment_date">
													<fmt:formatDate value="${replyList.reply_regdate}" pattern="yyyy-MM-dd HH:mm" />
												</span>

												<c:if test="${replyList.reply_nicname == dto.member_nicname }">
													<input type="button" value="??????" class="replyUpdate" name="${replyList.reply_no }">
												</c:if>
												<c:if test="${replyList.reply_nicname == dto.member_nicname || dto.member_grade eq '?????????' }">
													<input type="button" value="??????" class="replyDelete" name="${replyList.reply_no }">
												</c:if>
												<c:if test="${dto ne null }">
													<input type="button" value="????????????" class="r_replyUpload" name="${dto.member_nicname }">
												</c:if>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>


		<br /> <br /> <br /> <br />


		<!-- ?????? ?????? -->
		<div class="comment">
			<c:choose>
				<c:when test="${dto ne null }">
					<div class="comment_nicname">
						<span> ${dto.member_nicname } </span>
					</div>
					<textarea class="comment_text" rows="1" cols="80" name="reply_content"></textarea>

					<div class="comment_btn">
						<span class="comment_input">
							<input type="button" value="??????" class="replyUpload" name="${dto.member_nicname }">
						</span>
					</div>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
		</div>
	</div>



	<script type="text/javascript">
		
		$(document).ready(function(){

			// ?????? ?????? ????????? ???
			$(".replyUpload").click(function(){

				var member_nicname = $(this).attr("name");
				var reply_content = $(".comment_text").val();
				var board_no = "${b_dto.board_no}";
				
				if(reply_content == "") {
					alert("????????? ??????????????????.");
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
						alert("?????? ?????? ??????");
						location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
					}
					
					
				});
				
			});
			
			// ?????? ?????? ????????? ???
			$(".replyUpdate").click(function(){
				var reply_no = $(this).attr("name");
				$(this).attr("value", "????????????");
				$(this).parent().prev().children().attr("disabled",false);
				
				$(this).siblings().hide();
				
				$(this).attr("value", "????????????").click(function(){
					var reply_content = $(this).parent().prev().children().val();
					
					$.ajax({
						type:"post",
						url:"semi.do?command=replyUpdate",
						data: {
							reply_no : reply_no,
							reply_content : reply_content
						},
						success: function(){
							alert("?????? ?????? ??????");
							location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
						}
					});
				});

			});
			
			// ?????? ?????? ????????????
			$(".replyDelete").click(function(){
				var reply_no = $(this).attr("name");
				
				$.ajax({
					type:"post",
					url: "semi.do?command=replyDelete",
					data: {
						reply_no : reply_no
					},
					success: function(){
						alert("?????? ?????? ??????");
						location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
					}
				});
			});
			
			// ?????? ?????? ????????????
			$(".r_replyUpload").click(function(){
				var member_nicname = $(this).attr("name");
				var reply_no = $(this).parent().prev().children().attr("name");
				$(this).siblings().hide();
				var replyEditor = '<div class="comment">'
								+ '<textarea rows="1" cols="80" class="r_reply_content"></textarea>'
								+ '<div class="comment_btn">'
								+ '<span class="comment_input">'
								+ '<input type="button" value="????????????" class="r_reply_regist">'
								+ '</span>'
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
							alert("?????? ?????? ??????");
							location.href="semi.do?command=board_detail&board_no="+${b_dto.board_no};
						}
					});
				});
			});
			
			
			
			
		});
	
	</script>


	<jsp:include page="bottom.jsp" />
</body>
</html>