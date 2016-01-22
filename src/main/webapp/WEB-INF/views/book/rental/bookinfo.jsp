<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function Rental(num){
		alert("aaa")
		location.href="rental.book?book_num="+num;
	}
	
</script>
</head>
<%@include file="/header.jsp"%>
<body>
<div class="orange_box" style="padding-left: 260px; padding-top: 20px; padding-bottom: 20px">

		<div class="container" style="float: left;" >
			도서 이미지 출력위치
			${dto.getBook_img()}
		</div>
		<div style="float: left; margin-left: 40px;">
			<!-- 출력 테이블 -->
			<link href="/data/201012/IJ12937886903109/product.css"
				rel="stylesheet" type="text/css" />
			<div class="container">
				<div class="wrap">
					<table cellspacing="0" cellpadding="0" border="0" width="600">
						<tbody>
							
							<tr>
								<td colspan="2" class="r_name no_line">도서명 : ${dto.getBook_title()}</td>
							</tr>
							
							<tr>
								<td colspan="2">출판사 : ${dto.getBook_label()}</td>
							</tr>
							
							<tr>
								<td colspan="2" class="r_name">저자 : ${dto.getBook_author()}</td>
							</tr>
							
							<tr>
								<td colspan="2">장르 : ${dto.getBook_genre()}</td>
							</tr>
							
							<tr>
								<td colspan="2" class="r_name">ISBN : ${dto.getBook_isbn()}</td>
							</tr>
																					
							<tr>
								<td colspan="2" >청구기호 : ${dto.getBook_chunggu()}</td>
							</tr>
							
							<tr>
								<td colspan="2" class="r_name">소장위치 : ${dto.getBook_loc()}</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<br/><br/><br/><br/><br/>
		<form action="res.book" method="get">
		<table border="1">
		<tr>
		<td>순번</td><td>등록번호</td><td>제목</td>
		<td>출판사</td><td>저자</td>
		<td>ISBN</td><td>대여상태</td><td>예약상태</td>
		</tr>
		<c:forEach items="${list}" var="dto" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.book_num }</td>
				<td>${dto.book_title}</td>
				<td>${dto.book_label}</td>
				<td>${dto.book_author}</td>
				<td>${dto.book_isbn}</td>
				<input type="hidden" value="${name}" name="member_email"/>
				<input type="hidden" value="${dto.book_num}" name="book_num"/>
				<c:choose>
				<c:when test="${dto.book_status eq true}">
					<td>대여중</td>
				</c:when>
				<c:when test="${name!=null && dto.book_status eq false && dto.book_res eq false}">
				<td><input type="button" value="대여" onclick="Rental(${dto.book_num})"/></td>
				</c:when>
				<c:when test="${dto.book_status eq false && dto.book_res eq true}">
				<td>예약으로 인한 대출불가</td>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${dto.book_res eq true}">
					<td>예약중</td>
				</c:when>
				<c:when test="${name!=null && dto.book_res eq false }">
				<td><input type="submit" value="예약"/></td>
				</c:when>
				</c:choose>
			</tr>
		</c:forEach>
		</table>
		</form>
		</div>
</body>
<%@include file="/footer.jsp"%>

</html>
bookinfo.jsp
