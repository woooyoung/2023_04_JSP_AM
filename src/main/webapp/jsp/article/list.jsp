<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int cPage = (int) request.getAttribute("page");
int totalPage = (int) request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<div>
		<a href="../home/main">메인페이지로 이동</a>
	</div>
	<div>
		<a href="write">글쓰기</a>
	</div>

	<h1>게시물 리스트</h1>

	<table style="border-collapse: collapse; border-color: green" border="2px">

		<tr>
			<th>번호</th>
			<th>작성날짜</th>
			<th>제목</th>
			<th>삭제</th>
		</tr>
		<%
		for (Map<String, Object> articleRow : articleRows) {
		%>
		<tr style="text-align: center;">
			<td><%=articleRow.get("id")%></td>
			<td><%=articleRow.get("regDate")%></td>
			<td><a href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a></td>
			<td><a href="doDelete?id=<%=articleRow.get("id")%>">del</a></td>
		</tr>
		<%
		}
		%>

	</table>

	<style type="text/css">
.page {
	background-color: gold;
}

.page>a {
	color: black;
}

.page>a.red {
	color: red;
}
</style>

	<div class="page">
		<%
		for (int i = 1; i <= totalPage; i++) {
		%>
		<a class="<%=cPage == i ? "red" : ""%>" href="list?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
	</div>

</body>
</html>