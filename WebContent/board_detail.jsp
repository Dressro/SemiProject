<%@page import="com.project.fp.dto.File_TableDto"%>
<%@page import="com.project.fp.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
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
	<jsp:include page="header.jsp" />
	<h3>Detail</h3>
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
	<jsp:include page="bottom.jsp" />
</body>
</html>