<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	
	function goback(){
		window.history.back();
	}
	
</script>
</head>
<body>
<h1> BOARD_INSERTFORM</h1>
<form action="semi.do?command=board_insertform">
<div class="container">
    <div class="content" style="width: 70%">
        <div class="row justify-content-md-center">
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <input type="text" class="form-control" name="board_title" size="100" placeholder="제목을 입력해주세요.">              
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="inputGroupSelect03" name="board_category" >
                    <option selected>게시판을 선택해 주세요.</option>
                    <option value="F">공지사항</option>
                    <option value="N">자유게시판</option>
                    <option value="Q">상품문의</option>
                    <option value="D">실종신고</option>
                  </select>  
                </div>
            </div>
                        
      </div>
      
      <hr>
      
      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="p_content" name="board_content"></textarea>
                  <script type="text/javascript">
                  CKEDITOR.replace('p_content'
                                                  , {height: 500                                                  
                                                  });
                  </script>
                </div>
            </div> 
      </div>
      
      <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="custom-file">
                  &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1"> 
                  <button type="button" class="btn btn-outline-secondary" style="float:right; width: 10%; font-weight: bold" onclick="goback();">취   소</button>
                   <button type="submit" class="btn btn-outline-secondary" style="float:right; width: 10%; font-weight: bold;margin-right: 10px;">등   록</button>
              </div>
            </div>
      </div>
  </div>
</div>
</form>
</body>
</html>