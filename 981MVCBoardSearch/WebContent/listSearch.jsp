<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<
style>* {
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

input[type="text"] {
	/* 	height: auto; /* 높이값 초기화 */ */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	border-radius: 0; /* iSO 둥근모서리 제거 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
	-moz-appearance: none;
	appearance: none;
}

textarea {
	width: 100%; /* 원하는 너비 설정 */
	height: auto; /* 높이값 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	border-radius: 0; /* iSO 둥근모서리 제거 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
	-moz-appearance: none;
	appearance: none;
}

.no {
	font-size: 18px;
	color: #5d6a75;
}

.no a:link {
	color: red;
	text-decoration: none;
}

.no a:visited {
	color: black;
	text-decoration: none;
}

.no a:hover {
	color: blue;
	text-decoration: underline;
}

.pageNum {
	float: left;
	list-style-type: none;
}

a:link {
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.title td{
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
				<td colspan="5">
					<form action="listSearch.do" method='post'>
						검색 컬럼: <input type='text' name='searchCol'
							value="${bSearchDto.searchCol }"> 검색 값: <input
							type='text' name='searchVal' value="${bSearchDto.searchVal }">
						<input type='submit' value='검색'>
					</form>
				</td>
			</tr>
			<tr class="title">
				<td>번호</td>
				<td>이름</td>
				<td>제목</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${dtos}" var='dto'>
				<tr>
					<td>${dto.bId}</td>
					<td>${dto.bName}</td>
					<!-- 들여쓰기 -->
					<td><c:forEach begin='1' end='${dto.bIndent}'>--</c:forEach> <a
						href="content_view.do?bId=${dto.bId}&page=${bSearchDto.currentPageNum}
				&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }				
				&pageDataCount=${bSearchDto.pageDataCount}">${dto.bTitle}</a></td>
					<!-- 실제 사용할 bId -->
					<td>${dto.bDate}</td>
					<td>${dto.bHit}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5"><a href="write_view.do">글쓰기</a>
			</tr>
		</table>
		<div class="no">
			<ul>
				<li class='pageNum'><a
					href="listSearch.do?page=${bSearchDto.firstPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">[맨앞으로]
				</a></li>
				<li class='pageNum'><a
					href="listSearch.do?page=${bSearchDto.prevPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">[앞으로]
				</a></li>

				<c:forEach var="i" begin="${bSearchDto.startPageNum }"
					end="${bSearchDto.endPageNum }" step="1">

					<c:choose>
						<c:when test="${i eq bSearchDto.currentPageNum }">
							<li class='pageNum'><a
								href="listSearch.do?page=${i}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">${i}&nbsp;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class='pageNum'><a
								href="listSearch.do?page=${i}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">${i}&nbsp;</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class='pageNum'><a
					href="listSearch.do?page=${bSearchDto.nextPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">[뒤로]
				</a></li>
				<li class='pageNum'><a
					href="listSearch.do?page=${bSearchDto.lastPageNum}&pageDataCount=${bSearchDto.pageDataCount}&searchCol=${bSearchDto.searchCol }&searchVal=${bSearchDto.searchVal }">[맨뒤로]
				</a></li>
			</ul>
		</div>
	</div>
</body>
</html>