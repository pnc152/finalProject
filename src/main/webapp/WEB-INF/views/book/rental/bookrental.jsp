<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>리스트</title>

<style type="text/css">
.rental td{text-align: center}
</style>
</head>
<%@include file="/header.jsp"%>
<body>

<div class="orange_box" style="padding-left: 300px; padding-top: 20px; padding-bottom: 20px">
<img src="images/booklist.png" alt="도서목록 설명" style="margin-left: 0px; margin-bottom: 30px;"/>
<table border="1" class="rental">
	 
	<tr>
		<td>도서 이미지</td><td>서명</td><td>출판사</td><td>저자</td><td>ISBN</td><td>입고날짜</td>
	</tr>
	<c:forEach items="${list}" var="dto" varStatus="status">
	<tr  onmousemove="this.style.background='orange'"
		 onmouseout="this.style.background='white'"	>
		
		<td>도서이미지</td>
		<td><a href="bookinfo?book_num=${dto.book_num}">${dto.book_title}</td>
		<td>${dto.book_label}</td>
		<td>${dto.book_author}</td>
		<td>${dto.book_isbn}</td>
		<td>${dto.book_imdate }</td>
	</tr>
	</c:forEach>
</table>

<br/><br/>
<input type="button" value="메인" onclick="location.href='main'"/>
<!-- <input type="button" value="도서추가" onclick="location.href='bookinput'"/> -->

</div>
</body>
</html>
<%@include file="/footer.jsp"%>
bookrental.jsp