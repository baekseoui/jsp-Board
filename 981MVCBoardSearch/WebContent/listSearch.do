<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border='1' width='500'>
		<tr>
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
				<td><c:forEach begin='1' end='${dto.bIndent}'>--</c:forEach> 
				<a href="content_view.do?bId=${dto.bId}&page=${bPageDto.currentPageNum}&pageDataCount=${bPageDto.pageDataCount}">${dto.bTitle}</a></td>
				<!-- 실제 사용할 bId -->
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="5"><a href="write_view.do">글쓰기</a>
		</tr>
	</table>
	<div>
		<ul>
			<li> <a href="listpage.do?page=${bPageDto.firstPageNum}&pageDataCount=${bPageDto.pageDataCount}">맨앞으로 </a></li>
			<li> <a href="listpage.do?page=${bPageDto.prevPageNum}&pageDataCount=${bPageDto.pageDataCount}">앞으로 </a> </li>
			
			<c:forEach var="i" begin="${bPageDto.startPageNum }" end="${bPageDto.endPageNum }" step="1">
				
				<c:choose>
				<c:when test="${i eq bPageDto.currentPageNum }">
					<li style="list-style:square"> <a href="listpage.do?page=${i}&pageDataCount=${bPageDto.pageDataCount}">${i}</a> </li>
				</c:when>
				<c:otherwise>
					<li> <a href="listpage.do?page=${i}&pageDataCount=${bPageDto.pageDataCount}">${i}</a> </li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<li> <a href="listpage.do?page=${bPageDto.nextPageNum}&pageDataCount=${bPageDto.pageDataCount}">뒤로 </a> </li>
			<li> <a href="listpage.do?page=${bPageDto.lastPageNum}&pageDataCount=${bPageDto.pageDataCount}">맨뒤로 </a> </li>
		</ul>
	</div>
</body>
</html>