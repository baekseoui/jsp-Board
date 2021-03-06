<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.pageNum {
	float: left;
	list-style-type: none;
}

input[type="text"] {
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

.button td{
	text-align: center;
	padding: 0px 10px 10px 10px;
}

.button input[type="submit"] {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 10px 20px;
}

.button input[type="submit"]:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}

.button a {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 10px 20px;
}

.button a:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
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
	<form action="reply.do" method='post'>
		<input type="hidden" name='bId' value="${dto.bId}"> <input
			type="hidden" name='bGroup' value="${dto.bGroup}"> <input
			type="hidden" name='bStep' value="${dto.bStep}"> <input
			type="hidden" name='bIndent' value="${dto.bIndent}">
		<div class="container">
			<table class="table">
				<tr class="title">
					<td>이름</td>
					<td><input type="text" name=bName value=""></td>
				</tr>
				<tr class="title">
					<td>제목</td>
					<td><input type="text" name=bTitle value=""></td>
				</tr>
				<tr class="title">
					<td>내용</td>
					<td><textarea rows='10' name='bContent'>
				
				----------------------------------------
				${dto.bContent}
				</textarea>
				</td>
				</tr>
				<tr class="button">
					<td colspan='2'><input type='submit' value='답글달기'>&nbsp;&nbsp;&nbsp;
						<a href='list.do'>목록보기</a></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>