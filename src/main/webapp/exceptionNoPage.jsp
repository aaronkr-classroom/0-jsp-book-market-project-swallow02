<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
  <jsp:include page="menu.jsp" />
  <div class="jumbotron">
    <div class="container">
      <h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
    </div>
  </div>
  <div class="container">
  <p><%=request.getRequestURL() %>
  <p><a href="book.jsp" class="btn btn-secondary"> 도서목록&raquo;</a>
  </div>
</body>
</html>