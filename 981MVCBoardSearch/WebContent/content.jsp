<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body, html {
	height: 100%;
	font-family: sans-serif;
	background: -webkit-linear-gradient(bottom, #c471f5, #fa71cd);
}

/* ------------------------------------ */
a {
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
}

a:focus {
	outline: none !important;
}

a:hover {
	text-decoration: none;
}

/* ------------------------------------ */
h1, h2, h3, h4, h5, h6 {
	margin: 0px;
}

p {
	margin: 0px;
}

ul, li {
	margin: 0px;
	list-style-type: none;
}

.container {
	max-width: 1366px;
	margin: 0 auto;
	min-height: 100vh;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: center;
	padding: 33px 100px;
}

table {
	border-collapse: collapse;
	background-color: #ffffff;
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.pageNum {
	float: left;
	list-style-type: none;
}

.title{
    color: #444444;
	font-size: 17px;
    padding: 5px;
	font-weight:600;
	text-align: center;
}
</style>

</head>
<body>
		<div class="container">
			<table class="table">
		<tr>
			<td  class="title">이름</td>
			<td>${dto.bName}</td>
		</tr>
		<tr>
			<td  class="title">번호</td>
			<td>${dto.bId}</td>
		</tr>
		<tr>
			<td  class="title">날짜</td>
			<td>${dto.bDate}</td>
		</tr>
		<tr>
			<td  class="title">조회수</td>
			<td>${dto.bHit}</td>
		</tr>
		<tr>
			<td  class="title">제목</td>
			<td>${dto.bTitle}</td>
		</tr>
		<tr>
			<td  class="title">내용</td>
			<td>${dto.bContent}</td>
		</tr>
		<tr>
			<td colspan='2'>
				<!-- 상세보기에서 할 수 있는 작업 1.삭제 2.수정 3.목록보기 --> 
				<a href="reply_view.do?bId=${dto.bId}&page=${bSearchDto.currentPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol}&searchVal=${bSearchDto.searchVal}">답글</a>
				<a href="delete.do?bId=${dto.bId}&page=${bSearchDto.currentPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">삭제</a>
				<a href="modify_view.do?bId=${dto.bId}&page=${bSearchDto.currentPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">수정</a>
				<a href="listSearch.do?page=${bSearchDto.currentPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">목록보기</a>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>